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
	ldr r1, =0x94537
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =0x00000000	
	cbz	r3, lab1
	ldr	r0, =0x0000ebbd	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	ldr r1, =0x3cb01
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
	ldr	r0, =0x0000ec98	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	ldr r1, =0x04b59
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
	ldr	r0, =0x0000ec98	
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
	ldr	r2, =0x0001f138	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	ldr r1, =0x984db
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
	ldr	r0, =0x0000ebb1	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x0000ebbd	
push {r1, r2}
	ldr r1, =0x055f6
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	atexit
lab7:	push {r1, r2}
	ldr r1, =0x055f6
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	bl	__libc_init_array
	push {r1, r2}
	ldr r1, =0xa172c
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, r4
	movs	r1, r5
	bl	main
	push {r1, r2}
	ldr r1, =0x3cc7a
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	exit
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
	bl	benchmark_body
	str	r0, [r7, #12]
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0xa5259
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movw	r0, #1231	
	bl	benchmark_body
	mov	r3, r0
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x1ea6e
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
benchmark_body:
	push	{r7}
	subw	sp, sp, #1532	
	add	r7, sp, #0
	add	r3, r7, #1528	
	subw	r3, r3, #1524	
	str	r0, [r3, #0]
	movs	r3, #0
	str	r3, [r7, #1524]	
	b	lab8
lab173: 	movs	r2, #3
	str	r2, [r3, #0]
	ldr	r3, =P2_is_marked	
	movs	r2, #5
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #2
	ble	lab9
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab9
	ldr	r3, =P1_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab9
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1520]	
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1516]	
	ldr	r2, [r7, #1520]	
	ldr	r3, [r7, #1516]	
	cmp	r2, r3
	bge	lab9
	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #3
	ldr	r2, =P1_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1520]	
	ldr	r3, [r7, #1516]	
	subs	r3, r2, r3
	str	r3, [r7, #1512]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1520]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1516]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1512]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab9: 	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #2
	ble	lab10
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab10
	ldr	r3, =P1_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab10
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1508]	
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #8]
	str	r3, [r7, #1504]	
	ldr	r2, [r7, #1508]	
	ldr	r3, [r7, #1504]	
	cmp	r2, r3
	bge	lab10
	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #3
	ldr	r2, =P1_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1508]	
	ldr	r3, [r7, #1504]	
	subs	r3, r2, r3
	str	r3, [r7, #1500]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1508]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1504]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1500]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab10: 	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #2
	ble	lab11
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab11
	ldr	r3, =P1_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab11
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1496]	
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1492]	
	ldr	r2, [r7, #1496]	
	ldr	r3, [r7, #1492]	
	cmp	r2, r3
	bge	lab11
	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #3
	ldr	r2, =P1_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1496]	
	ldr	r3, [r7, #1492]	
	subs	r3, r2, r3
	str	r3, [r7, #1488]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1496]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1492]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1488]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab11: 	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #2
	ble	lab12
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab12
	ldr	r3, =P1_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab12
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1484]	
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #8]
	str	r3, [r7, #1480]	
	ldr	r2, [r7, #1484]	
	ldr	r3, [r7, #1480]	
	cmp	r2, r3
	bge	lab12
	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #3
	ldr	r2, =P1_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1484]	
	ldr	r3, [r7, #1480]	
	subs	r3, r2, r3
	str	r3, [r7, #1476]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1484]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1480]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1476]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab12: 	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #2
	ble	lab13
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab13
	ldr	r3, =P1_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab13
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #8]
	str	r3, [r7, #1472]	
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1468]	
	ldr	r2, [r7, #1472]	
	ldr	r3, [r7, #1468]	
	cmp	r2, r3
	bge	lab13
	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #3
	ldr	r2, =P1_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1472]	
	ldr	r3, [r7, #1468]	
	subs	r3, r2, r3
	str	r3, [r7, #1464]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1472]	
	b	lab14
	nop
	.ltorg
lab14: 	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1468]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1464]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab13: 	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #2
	ble	lab15
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab15
	ldr	r3, =P1_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab15
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #8]
	str	r3, [r7, #1460]	
	ldr	r3, =P1_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1456]	
	ldr	r2, [r7, #1460]	
	ldr	r3, [r7, #1456]	
	cmp	r2, r3
	bge	lab15
	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #3
	ldr	r2, =P1_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1460]	
	ldr	r3, [r7, #1456]	
	subs	r3, r2, r3
	str	r3, [r7, #1452]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1460]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1456]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1452]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab15: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab16
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab16
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab16
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab16
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1448]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1444]	
	ldr	r2, [r7, #1444]	
	ldr	r3, [r7, #1448]	
	cmp	r2, r3
	ble	lab16
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1448]	
	ldr	r3, [r7, #1444]	
	add	r3, r2
	str	r3, [r7, #1440]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1448]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1444]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1440]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab16: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab17
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab17
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab17
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab17
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1436]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1432]	
	ldr	r2, [r7, #1432]	
	ldr	r3, [r7, #1436]	
	cmp	r2, r3
	ble	lab17
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1436]	
	ldr	r3, [r7, #1432]	
	add	r3, r2
	str	r3, [r7, #1428]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1436]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1432]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1428]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab17: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab18
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab18
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab18
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab18
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1424]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	str	r3, [r7, #1420]	
	ldr	r2, [r7, #1420]	
	ldr	r3, [r7, #1424]	
	cmp	r2, r3
	ble	lab18
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1424]	
	ldr	r3, [r7, #1420]	
	add	r3, r2
	str	r3, [r7, #1416]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1424]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1420]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1416]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab18: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab19
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab19
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	b	lab20
	.ltorg
lab20: 	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab19
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab19
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1412]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	str	r3, [r7, #1408]	
	ldr	r2, [r7, #1408]	
	ldr	r3, [r7, #1412]	
	cmp	r2, r3
	ble	lab19
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1412]	
	ldr	r3, [r7, #1408]	
	add	r3, r2
	str	r3, [r7, #1404]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1412]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1408]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1404]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab19: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab21
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab21
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab21
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab21
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1400]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	str	r3, [r7, #1396]	
	ldr	r2, [r7, #1396]	
	ldr	r3, [r7, #1400]	
	cmp	r2, r3
	ble	lab21
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1400]	
	ldr	r3, [r7, #1396]	
	add	r3, r2
	str	r3, [r7, #1392]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1400]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1396]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1392]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab21: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab22
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab22
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab22
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab22
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1388]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	str	r3, [r7, #1384]	
	ldr	r2, [r7, #1384]	
	ldr	r3, [r7, #1388]	
	cmp	r2, r3
	ble	lab22
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1388]	
	ldr	r3, [r7, #1384]	
	add	r3, r2
	str	r3, [r7, #1380]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1388]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1384]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1380]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab22: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab23
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab23
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab23
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab23
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1376]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1372]	
	ldr	r2, [r7, #1372]	
	ldr	r3, [r7, #1376]	
	cmp	r2, r3
	ble	lab23
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1376]	
	ldr	r3, [r7, #1372]	
	add	r3, r2
	str	r3, [r7, #1368]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1376]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1372]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1368]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab23: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab24
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab24
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab24
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab24
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1364]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1360]	
	ldr	r2, [r7, #1360]	
	ldr	r3, [r7, #1364]	
	cmp	r2, r3
	ble	lab24
	b	lab25
	nop
	.ltorg
lab25: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1364]	
	ldr	r3, [r7, #1360]	
	add	r3, r2
	str	r3, [r7, #1356]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1364]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1360]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1356]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab24: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab26
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab26
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab26
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab26
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1352]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	str	r3, [r7, #1348]	
	ldr	r2, [r7, #1348]	
	ldr	r3, [r7, #1352]	
	cmp	r2, r3
	ble	lab26
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1352]	
	ldr	r3, [r7, #1348]	
	add	r3, r2
	str	r3, [r7, #1344]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1352]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1348]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1344]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab26: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab27
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab27
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab27
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab27
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1340]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	str	r3, [r7, #1336]	
	ldr	r2, [r7, #1336]	
	ldr	r3, [r7, #1340]	
	cmp	r2, r3
	ble	lab27
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1340]	
	ldr	r3, [r7, #1336]	
	add	r3, r2
	str	r3, [r7, #1332]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1340]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1336]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1332]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab27: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab28
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab28
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab28
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab28
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1328]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	str	r3, [r7, #1324]	
	ldr	r2, [r7, #1324]	
	ldr	r3, [r7, #1328]	
	cmp	r2, r3
	ble	lab28
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1328]	
	ldr	r3, [r7, #1324]	
	add	r3, r2
	str	r3, [r7, #1320]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1328]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1324]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1320]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab28: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab29
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab29
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab29
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab29
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1316]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	str	r3, [r7, #1312]	
	ldr	r2, [r7, #1312]	
	ldr	r3, [r7, #1316]	
	cmp	r2, r3
	ble	lab29
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1316]	
	ldr	r3, [r7, #1312]	
	add	r3, r2
	str	r3, [r7, #1308]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1316]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1312]	
	str	r2, [r1, r3, lsl #2]
	b	lab30
	.ltorg
lab30: 	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1308]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab29: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab31
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab31
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab31
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab31
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	str	r3, [r7, #1304]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1300]	
	ldr	r2, [r7, #1300]	
	ldr	r3, [r7, #1304]	
	cmp	r2, r3
	ble	lab31
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1304]	
	ldr	r3, [r7, #1300]	
	add	r3, r2
	str	r3, [r7, #1296]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1304]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1300]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1296]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab31: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab32
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab32
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab32
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab32
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	str	r3, [r7, #1292]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	str	r3, [r7, #1288]	
	ldr	r2, [r7, #1288]	
	ldr	r3, [r7, #1292]	
	cmp	r2, r3
	ble	lab32
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	ldr	r2, [r7, #1292]	
	ldr	r3, [r7, #1288]	
	add	r3, r2
	str	r3, [r7, #1284]	
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1292]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1288]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1284]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab32: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab33
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab33
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab33
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab33
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	str	r3, [r7, #1280]	
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	str	r3, [r7, #1276]	
	ldr	r2, [r7, #1276]	
	ldr	r3, [r7, #1280]	
	cmp	r2, r3
	ble	lab33
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #256	
	ldr	r1, [r7, #1280]	
	ldr	r2, [r7, #1276]	
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1280]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	ldr	r2, [r7, #1276]	
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #256	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab33: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab34
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab34
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab34
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab34
	add	r3, r7, #1528	
	sub	r3, r3, #260	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #264	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #264	
	add	r3, r7, #1528	
	sub	r3, r3, #260	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab34
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #268	
	add	r2, r7, #1528	
	sub	r1, r2, #260	
	add	r2, r7, #1528	
	sub	r2, r2, #264	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #260	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #264	
	b	lab35
	nop
	.ltorg
lab35: 	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #268	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab34: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab36
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab36
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab36
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab36
	add	r3, r7, #1528	
	sub	r3, r3, #272	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #276	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #276	
	add	r3, r7, #1528	
	sub	r3, r3, #272	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab36
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #280	
	add	r2, r7, #1528	
	sub	r1, r2, #272	
	add	r2, r7, #1528	
	sub	r2, r2, #276	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #272	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #276	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #280	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab36: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab37
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab37
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab37
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab37
	add	r3, r7, #1528	
	sub	r3, r3, #284	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #288	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #288	
	add	r3, r7, #1528	
	sub	r3, r3, #284	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab37
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #292	
	add	r2, r7, #1528	
	sub	r1, r2, #284	
	add	r2, r7, #1528	
	sub	r2, r2, #288	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #284	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #288	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #292	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab37: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab38
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab38
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab38
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab38
	add	r3, r7, #1528	
	sub	r3, r3, #296	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #300	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #300	
	add	r3, r7, #1528	
	sub	r3, r3, #296	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab38
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #304	
	add	r2, r7, #1528	
	sub	r1, r2, #296	
	add	r2, r7, #1528	
	sub	r2, r2, #300	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #296	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #300	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #304	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab38: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab39
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	b	lab40
	nop
	.ltorg
lab40: 	bgt	lab39
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab39
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab39
	add	r3, r7, #1528	
	sub	r3, r3, #308	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #312	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #312	
	add	r3, r7, #1528	
	sub	r3, r3, #308	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab39
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #316	
	add	r2, r7, #1528	
	sub	r1, r2, #308	
	add	r2, r7, #1528	
	sub	r2, r2, #312	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #308	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #312	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #316	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab39: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab41
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab41
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab41
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab41
	add	r3, r7, #1528	
	sub	r3, r3, #320	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #324	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #324	
	add	r3, r7, #1528	
	sub	r3, r3, #320	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab41
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #328	
	add	r2, r7, #1528	
	sub	r1, r2, #320	
	add	r2, r7, #1528	
	sub	r2, r2, #324	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #320	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #324	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #328	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab41: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab42
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab42
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab42
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab42
	add	r3, r7, #1528	
	sub	r3, r3, #332	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #336	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #336	
	add	r3, r7, #1528	
	sub	r3, r3, #332	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab42
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #340	
	add	r2, r7, #1528	
	sub	r1, r2, #332	
	add	r2, r7, #1528	
	sub	r2, r2, #336	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #332	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #336	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #340	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab42: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab43
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab43
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab43
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab43
	add	r3, r7, #1528	
	sub	r3, r3, #344	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	b	lab44
	nop
	.ltorg
lab44: 	sub	r3, r3, #348	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #348	
	add	r3, r7, #1528	
	sub	r3, r3, #344	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab43
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #352	
	add	r2, r7, #1528	
	sub	r1, r2, #344	
	add	r2, r7, #1528	
	sub	r2, r2, #348	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #344	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #348	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #352	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab43: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ble	lab45
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab45
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab45
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab45
	add	r3, r7, #1528	
	sub	r3, r3, #356	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #360	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #360	
	add	r3, r7, #1528	
	sub	r3, r3, #356	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab45
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #364	
	add	r2, r7, #1528	
	sub	r1, r2, #356	
	add	r2, r7, #1528	
	sub	r2, r2, #360	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #356	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #360	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #364	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab45: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab46
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab46
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab46
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab46
	add	r3, r7, #1528	
	sub	r3, r3, #368	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #372	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #372	
	add	r3, r7, #1528	
	sub	r3, r3, #368	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab46
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #376	
	add	r2, r7, #1528	
	sub	r1, r2, #368	
	add	r2, r7, #1528	
	sub	r2, r2, #372	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #368	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #372	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #376	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab46: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab47
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab47
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab47
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab47
	add	r3, r7, #1528	
	sub	r3, r3, #380	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #384	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #384	
	add	r3, r7, #1528	
	sub	r3, r3, #380	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab47
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	b	lab48
	.ltorg
lab48: 	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #388	
	add	r2, r7, #1528	
	sub	r1, r2, #380	
	add	r2, r7, #1528	
	sub	r2, r2, #384	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #380	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #384	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #388	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab47: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab49
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab49
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab49
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab49
	add	r3, r7, #1528	
	sub	r3, r3, #392	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #396	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #396	
	add	r3, r7, #1528	
	sub	r3, r3, #392	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab49
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #400	
	add	r2, r7, #1528	
	sub	r1, r2, #392	
	add	r2, r7, #1528	
	sub	r2, r2, #396	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #392	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #396	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #400	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab49: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab50
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab50
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab50
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab50
	add	r3, r7, #1528	
	sub	r3, r3, #404	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #408	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #408	
	add	r3, r7, #1528	
	sub	r3, r3, #404	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab50
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #412	
	add	r2, r7, #1528	
	sub	r1, r2, #404	
	add	r2, r7, #1528	
	sub	r2, r2, #408	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #404	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #408	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #412	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab50: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab51
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab51
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab51
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab51
	add	r3, r7, #1528	
	sub	r3, r3, #416	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #420	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #420	
	add	r3, r7, #1528	
	sub	r3, r3, #416	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab51
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	b	lab52
	.ltorg
lab52: 	add	r3, r7, #1528	
	sub	r3, r3, #424	
	add	r2, r7, #1528	
	sub	r1, r2, #416	
	add	r2, r7, #1528	
	sub	r2, r2, #420	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #416	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #420	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #424	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab51: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab53
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab53
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab53
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab53
	add	r3, r7, #1528	
	sub	r3, r3, #428	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #432	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #432	
	add	r3, r7, #1528	
	sub	r3, r3, #428	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab53
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #436	
	add	r2, r7, #1528	
	sub	r1, r2, #428	
	add	r2, r7, #1528	
	sub	r2, r2, #432	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #428	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #432	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #436	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab53: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab54
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab54
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab54
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab54
	add	r3, r7, #1528	
	sub	r3, r3, #440	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #444	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #444	
	add	r3, r7, #1528	
	sub	r3, r3, #440	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab54
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #448	
	add	r2, r7, #1528	
	sub	r1, r2, #440	
	add	r2, r7, #1528	
	sub	r2, r2, #444	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #440	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #444	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #448	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab54: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab55
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab55
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab55
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab55
	add	r3, r7, #1528	
	sub	r3, r3, #452	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #456	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #456	
	add	r3, r7, #1528	
	sub	r3, r3, #452	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab55
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #460	
	add	r2, r7, #1528	
	sub	r1, r2, #452	
	add	r2, r7, #1528	
	sub	r2, r2, #456	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #452	
	ldr	r2, [r2, #0]
	b	lab56
	nop
	.ltorg
lab56: 	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #456	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #460	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab55: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab57
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab57
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab57
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab57
	add	r3, r7, #1528	
	sub	r3, r3, #464	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #468	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #468	
	add	r3, r7, #1528	
	sub	r3, r3, #464	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab57
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #472	
	add	r2, r7, #1528	
	sub	r1, r2, #464	
	add	r2, r7, #1528	
	sub	r2, r2, #468	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #464	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #468	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #472	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab57: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab58
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab58
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab58
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab58
	add	r3, r7, #1528	
	sub	r3, r3, #476	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #480	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #480	
	add	r3, r7, #1528	
	sub	r3, r3, #476	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab58
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #484	
	add	r2, r7, #1528	
	sub	r1, r2, #476	
	add	r2, r7, #1528	
	sub	r2, r2, #480	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #476	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #480	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #484	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab58: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab59
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab59
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab59
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab59
	add	r3, r7, #1528	
	sub	r3, r3, #488	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #492	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #492	
	add	r3, r7, #1528	
	sub	r3, r3, #488	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab59
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #496	
	add	r2, r7, #1528	
	sub	r1, r2, #488	
	add	r2, r7, #1528	
	sub	r2, r2, #492	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #488	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #492	
	ldr	r2, [r2, #0]
	b	lab60
	.ltorg
lab60: 	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #496	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab59: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab61
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab61
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab61
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab61
	add	r3, r7, #1528	
	sub	r3, r3, #500	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #504	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #504	
	add	r3, r7, #1528	
	sub	r3, r3, #500	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab61
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #508	
	add	r2, r7, #1528	
	sub	r1, r2, #500	
	add	r2, r7, #1528	
	sub	r2, r2, #504	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #500	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #504	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #508	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab61: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab62
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab62
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab62
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab62
	add	r3, r7, #1528	
	sub	r3, r3, #512	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #516	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #516	
	add	r3, r7, #1528	
	sub	r3, r3, #512	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab62
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #520	
	add	r2, r7, #1528	
	sub	r1, r2, #512	
	add	r2, r7, #1528	
	sub	r2, r2, #516	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #512	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #516	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #520	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab62: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab63
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab63
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab63
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab63
	add	r3, r7, #1528	
	sub	r3, r3, #524	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #528	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #528	
	add	r3, r7, #1528	
	sub	r3, r3, #524	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab63
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #532	
	add	r2, r7, #1528	
	sub	r1, r2, #524	
	add	r2, r7, #1528	
	sub	r2, r2, #528	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #524	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #528	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #532	
	ldr	r2, [r2, #0]
	b	lab64
	.ltorg
lab64: 	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab63: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab65
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab65
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab65
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab65
	add	r3, r7, #1528	
	sub	r3, r3, #536	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #540	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #540	
	add	r3, r7, #1528	
	sub	r3, r3, #536	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab65
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #544	
	add	r2, r7, #1528	
	sub	r1, r2, #536	
	add	r2, r7, #1528	
	sub	r2, r2, #540	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #536	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #540	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #544	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab65: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab66
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab66
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab66
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab66
	add	r3, r7, #1528	
	sub	r3, r3, #548	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #552	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #552	
	add	r3, r7, #1528	
	sub	r3, r3, #548	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab66
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #556	
	add	r2, r7, #1528	
	sub	r1, r2, #548	
	add	r2, r7, #1528	
	sub	r2, r2, #552	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #548	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #552	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #556	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab66: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab67
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab67
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab67
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab67
	add	r3, r7, #1528	
	sub	r3, r3, #560	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #564	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #564	
	add	r3, r7, #1528	
	sub	r3, r3, #560	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab67
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #568	
	add	r2, r7, #1528	
	sub	r1, r2, #560	
	add	r2, r7, #1528	
	sub	r2, r2, #564	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #560	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #564	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #568	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab67: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	b	lab68
	.ltorg
lab68: 	cmp	r3, #4
	ble	lab69
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab69
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab69
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab69
	add	r3, r7, #1528	
	sub	r3, r3, #572	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #576	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #576	
	add	r3, r7, #1528	
	sub	r3, r3, #572	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab69
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #580	
	add	r2, r7, #1528	
	sub	r1, r2, #572	
	add	r2, r7, #1528	
	sub	r2, r2, #576	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #572	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #576	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #580	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab69: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab70
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab70
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab70
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab70
	add	r3, r7, #1528	
	sub	r3, r3, #584	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #588	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #588	
	add	r3, r7, #1528	
	sub	r3, r3, #584	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab70
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #592	
	add	r2, r7, #1528	
	sub	r1, r2, #584	
	add	r2, r7, #1528	
	sub	r2, r2, #588	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #584	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #588	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #592	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab70: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab71
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab71
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab71
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab71
	add	r3, r7, #1528	
	sub	r3, r3, #596	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #600	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #600	
	add	r3, r7, #1528	
	sub	r3, r3, #596	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab71
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #604	
	add	r2, r7, #1528	
	sub	r1, r2, #596	
	add	r2, r7, #1528	
	sub	r2, r2, #600	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #596	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #600	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #604	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab71: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab72
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab72
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	b	lab73
	nop
	.ltorg
lab73: 	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab72
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab72
	add	r3, r7, #1528	
	sub	r3, r3, #608	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #612	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #612	
	add	r3, r7, #1528	
	sub	r3, r3, #608	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab72
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #616	
	add	r2, r7, #1528	
	sub	r1, r2, #608	
	add	r2, r7, #1528	
	sub	r2, r2, #612	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #608	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #612	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #616	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab72: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab74
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab74
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab74
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab74
	add	r3, r7, #1528	
	sub	r3, r3, #620	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #624	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #624	
	add	r3, r7, #1528	
	sub	r3, r3, #620	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab74
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #628	
	add	r2, r7, #1528	
	sub	r1, r2, #620	
	add	r2, r7, #1528	
	sub	r2, r2, #624	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #620	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #624	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #628	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab74: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab75
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab75
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab75
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab75
	add	r3, r7, #1528	
	sub	r3, r3, #632	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #636	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #636	
	add	r3, r7, #1528	
	sub	r3, r3, #632	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab75
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #640	
	add	r2, r7, #1528	
	sub	r1, r2, #632	
	add	r2, r7, #1528	
	sub	r2, r2, #636	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #632	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #636	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #640	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab75: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab76
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab76
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab76
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	b	lab77
	nop
	.ltorg
lab77: 	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab76
	add	r3, r7, #1528	
	sub	r3, r3, #644	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #648	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #648	
	add	r3, r7, #1528	
	sub	r3, r3, #644	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab76
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #652	
	add	r2, r7, #1528	
	sub	r1, r2, #644	
	add	r2, r7, #1528	
	sub	r2, r2, #648	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #644	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #648	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #652	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab76: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab78
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab78
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab78
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab78
	add	r3, r7, #1528	
	sub	r3, r3, #656	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #660	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #660	
	add	r3, r7, #1528	
	sub	r3, r3, #656	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab78
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #664	
	add	r2, r7, #1528	
	sub	r1, r2, #656	
	add	r2, r7, #1528	
	sub	r2, r2, #660	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #656	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #660	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #664	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab78: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab79
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab79
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab79
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab79
	add	r3, r7, #1528	
	sub	r3, r3, #668	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #672	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #672	
	add	r3, r7, #1528	
	sub	r3, r3, #668	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab79
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #676	
	add	r2, r7, #1528	
	sub	r1, r2, #668	
	add	r2, r7, #1528	
	sub	r2, r2, #672	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #668	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #672	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #676	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab79: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab80
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab80
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab80
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab80
	add	r3, r7, #1528	
	sub	r3, r3, #680	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #684	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	b	lab81
	nop
	.ltorg
lab81: 	add	r3, r7, #1528	
	sub	r2, r3, #684	
	add	r3, r7, #1528	
	sub	r3, r3, #680	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab80
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #688	
	add	r2, r7, #1528	
	sub	r1, r2, #680	
	add	r2, r7, #1528	
	sub	r2, r2, #684	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #680	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #684	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #688	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab80: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab82
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab82
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab82
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab82
	add	r3, r7, #1528	
	sub	r3, r3, #692	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #696	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #696	
	add	r3, r7, #1528	
	sub	r3, r3, #692	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab82
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #700	
	add	r2, r7, #1528	
	sub	r1, r2, #692	
	add	r2, r7, #1528	
	sub	r2, r2, #696	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #692	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #696	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #700	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab82: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab83
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab83
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab83
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab83
	add	r3, r7, #1528	
	sub	r3, r3, #704	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #708	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #708	
	add	r3, r7, #1528	
	sub	r3, r3, #704	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab83
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #712	
	add	r2, r7, #1528	
	sub	r1, r2, #704	
	add	r2, r7, #1528	
	sub	r2, r2, #708	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #704	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #708	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #712	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab83: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab84
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab84
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab84
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab84
	add	r3, r7, #1528	
	sub	r3, r3, #716	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #720	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #720	
	add	r3, r7, #1528	
	sub	r3, r3, #716	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab84
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #724	
	add	r2, r7, #1528	
	sub	r1, r2, #716	
	add	r2, r7, #1528	
	sub	r2, r2, #720	
	b	lab85
	.ltorg
lab85: 	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #716	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #720	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #724	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab84: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab86
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab86
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab86
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab86
	add	r3, r7, #1528	
	sub	r3, r3, #728	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #732	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #732	
	add	r3, r7, #1528	
	sub	r3, r3, #728	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab86
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #736	
	add	r2, r7, #1528	
	sub	r1, r2, #728	
	add	r2, r7, #1528	
	sub	r2, r2, #732	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #728	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #732	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #736	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab86: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab87
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab87
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab87
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab87
	add	r3, r7, #1528	
	sub	r3, r3, #740	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #744	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #744	
	add	r3, r7, #1528	
	sub	r3, r3, #740	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab87
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #748	
	add	r2, r7, #1528	
	sub	r1, r2, #740	
	add	r2, r7, #1528	
	sub	r2, r2, #744	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #740	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #744	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #748	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab87: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab88
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab88
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab88
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab88
	add	r3, r7, #1528	
	sub	r3, r3, #752	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #756	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #756	
	add	r3, r7, #1528	
	sub	r3, r3, #752	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab88
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #760	
	add	r2, r7, #1528	
	sub	r1, r2, #752	
	add	r2, r7, #1528	
	sub	r2, r2, #756	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #752	
	ldr	r2, [r2, #0]
	b	lab89
	nop
	.ltorg
lab89: 	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #756	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #760	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab88: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab90
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab90
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab90
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab90
	add	r3, r7, #1528	
	sub	r3, r3, #764	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #768	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #768	
	add	r3, r7, #1528	
	sub	r3, r3, #764	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab90
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #772	
	add	r2, r7, #1528	
	sub	r1, r2, #764	
	add	r2, r7, #1528	
	sub	r2, r2, #768	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #764	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #768	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #772	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab90: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab91
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab91
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab91
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab91
	add	r3, r7, #1528	
	sub	r3, r3, #776	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #780	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #780	
	add	r3, r7, #1528	
	sub	r3, r3, #776	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab91
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #784	
	add	r2, r7, #1528	
	sub	r1, r2, #776	
	add	r2, r7, #1528	
	sub	r2, r2, #780	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #776	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #780	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #784	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab91: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab92
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab92
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab92
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab92
	add	r3, r7, #1528	
	sub	r3, r3, #788	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #792	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #792	
	add	r3, r7, #1528	
	sub	r3, r3, #788	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab92
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #796	
	add	r2, r7, #1528	
	sub	r1, r2, #788	
	add	r2, r7, #1528	
	sub	r2, r2, #792	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #788	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #792	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #796	
	ldr	r2, [r2, #0]
	b	lab93
	nop
	.ltorg
lab93: 	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab92: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab94
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab94
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab94
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab94
	add	r3, r7, #1528	
	sub	r3, r3, #800	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #804	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #804	
	add	r3, r7, #1528	
	sub	r3, r3, #800	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab94
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #808	
	add	r2, r7, #1528	
	sub	r1, r2, #800	
	add	r2, r7, #1528	
	sub	r2, r2, #804	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #800	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #804	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #808	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab94: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab95
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab95
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab95
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab95
	add	r3, r7, #1528	
	sub	r3, r3, #812	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #816	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #816	
	add	r3, r7, #1528	
	sub	r3, r3, #812	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab95
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #820	
	add	r2, r7, #1528	
	sub	r1, r2, #812	
	add	r2, r7, #1528	
	sub	r2, r2, #816	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #812	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #816	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #820	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab95: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab96
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab96
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab96
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab96
	add	r3, r7, #1528	
	sub	r3, r3, #824	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #828	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #828	
	add	r3, r7, #1528	
	sub	r3, r3, #824	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab96
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #832	
	add	r2, r7, #1528	
	sub	r1, r2, #824	
	add	r2, r7, #1528	
	sub	r2, r2, #828	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #824	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #828	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #832	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab96: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	b	lab97
	.ltorg
lab97: 	cmp	r3, #4
	ble	lab98
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab98
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab98
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab98
	add	r3, r7, #1528	
	sub	r3, r3, #836	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #840	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #840	
	add	r3, r7, #1528	
	sub	r3, r3, #836	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab98
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #844	
	add	r2, r7, #1528	
	sub	r1, r2, #836	
	add	r2, r7, #1528	
	sub	r2, r2, #840	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #836	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #840	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #844	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab98: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab99
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab99
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab99
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab99
	add	r3, r7, #1528	
	sub	r3, r3, #848	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #852	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #852	
	add	r3, r7, #1528	
	sub	r3, r3, #848	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab99
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #856	
	add	r2, r7, #1528	
	sub	r1, r2, #848	
	add	r2, r7, #1528	
	sub	r2, r2, #852	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #848	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #852	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #856	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab99: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab100
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab100
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab100
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab100
	add	r3, r7, #1528	
	sub	r3, r3, #860	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #864	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #864	
	add	r3, r7, #1528	
	sub	r3, r3, #860	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab100
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #868	
	add	r2, r7, #1528	
	sub	r1, r2, #860	
	add	r2, r7, #1528	
	sub	r2, r2, #864	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #860	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #864	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #868	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab100: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab101
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab101
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab101
	b	lab102
	nop
	.ltorg
lab102: 	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab101
	add	r3, r7, #1528	
	sub	r3, r3, #872	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #876	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #876	
	add	r3, r7, #1528	
	sub	r3, r3, #872	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab101
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #880	
	add	r2, r7, #1528	
	sub	r1, r2, #872	
	add	r2, r7, #1528	
	sub	r2, r2, #876	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #872	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #876	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #880	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab101: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab103
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab103
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab103
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab103
	add	r3, r7, #1528	
	sub	r3, r3, #884	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #888	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #888	
	add	r3, r7, #1528	
	sub	r3, r3, #884	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab103
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #892	
	add	r2, r7, #1528	
	sub	r1, r2, #884	
	add	r2, r7, #1528	
	sub	r2, r2, #888	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #884	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #888	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #892	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab103: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab104
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab104
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab104
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab104
	add	r3, r7, #1528	
	sub	r3, r3, #896	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #900	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #900	
	add	r3, r7, #1528	
	sub	r3, r3, #896	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab104
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #904	
	add	r2, r7, #1528	
	sub	r1, r2, #896	
	add	r2, r7, #1528	
	sub	r2, r2, #900	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #896	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #900	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #904	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab104: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab105
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab105
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab105
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab105
	add	r3, r7, #1528	
	sub	r3, r3, #908	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	b	lab106
	nop
	.ltorg
lab106: 	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #912	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #912	
	add	r3, r7, #1528	
	sub	r3, r3, #908	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab105
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #916	
	add	r2, r7, #1528	
	sub	r1, r2, #908	
	add	r2, r7, #1528	
	sub	r2, r2, #912	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #908	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #912	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #916	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab105: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab107
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab107
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab107
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab107
	add	r3, r7, #1528	
	sub	r3, r3, #920	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #924	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #924	
	add	r3, r7, #1528	
	sub	r3, r3, #920	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab107
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #928	
	add	r2, r7, #1528	
	sub	r1, r2, #920	
	add	r2, r7, #1528	
	sub	r2, r2, #924	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #920	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #924	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #928	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab107: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab108
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab108
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab108
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab108
	add	r3, r7, #1528	
	sub	r3, r3, #932	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #936	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #936	
	add	r3, r7, #1528	
	sub	r3, r3, #932	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab108
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #940	
	add	r2, r7, #1528	
	sub	r1, r2, #932	
	add	r2, r7, #1528	
	sub	r2, r2, #936	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #932	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #936	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #940	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab108: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab109
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab109
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab109
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab109
	add	r3, r7, #1528	
	sub	r3, r3, #944	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #948	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #948	
	add	r3, r7, #1528	
	sub	r3, r3, #944	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab109
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	b	lab110
	nop
	.ltorg
lab110: 	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #952	
	add	r2, r7, #1528	
	sub	r1, r2, #944	
	add	r2, r7, #1528	
	sub	r2, r2, #948	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #944	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #948	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #952	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab109: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab111
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab111
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab111
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab111
	add	r3, r7, #1528	
	sub	r3, r3, #956	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #960	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #960	
	add	r3, r7, #1528	
	sub	r3, r3, #956	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab111
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #964	
	add	r2, r7, #1528	
	sub	r1, r2, #956	
	add	r2, r7, #1528	
	sub	r2, r2, #960	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #956	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #960	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #964	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab111: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab112
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab112
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab112
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab112
	add	r3, r7, #1528	
	sub	r3, r3, #968	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #972	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #972	
	add	r3, r7, #1528	
	sub	r3, r3, #968	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab112
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #976	
	add	r2, r7, #1528	
	sub	r1, r2, #968	
	add	r2, r7, #1528	
	sub	r2, r2, #972	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #968	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #972	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #976	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab112: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab113
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab113
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab113
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab113
	add	r3, r7, #1528	
	sub	r3, r3, #980	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #984	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #984	
	add	r3, r7, #1528	
	sub	r3, r3, #980	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab113
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #988	
	add	r2, r7, #1528	
	sub	r1, r2, #980	
	b	lab114
	.ltorg
lab114: 	add	r2, r7, #1528	
	sub	r2, r2, #984	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #980	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #984	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #988	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab113: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab115
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab115
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab115
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab115
	add	r3, r7, #1528	
	sub	r3, r3, #992	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #996	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #996	
	add	r3, r7, #1528	
	sub	r3, r3, #992	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab115
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1000	
	add	r2, r7, #1528	
	sub	r1, r2, #992	
	add	r2, r7, #1528	
	sub	r2, r2, #996	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #992	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #996	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1000	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab115: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab116
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab116
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab116
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab116
	add	r3, r7, #1528	
	sub	r3, r3, #1004	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1008	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1008	
	add	r3, r7, #1528	
	sub	r3, r3, #1004	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab116
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1012	
	add	r2, r7, #1528	
	sub	r1, r2, #1004	
	add	r2, r7, #1528	
	sub	r2, r2, #1008	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1004	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1008	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1012	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab116: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab117
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab117
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab117
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab117
	add	r3, r7, #1528	
	sub	r3, r3, #1016	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1020	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1020	
	add	r3, r7, #1528	
	sub	r3, r3, #1016	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab117
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1024	
	add	r2, r7, #1528	
	sub	r1, r2, #1016	
	add	r2, r7, #1528	
	sub	r2, r2, #1020	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1016	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	b	lab118
	.ltorg
lab118: 	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1020	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1024	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab117: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab119
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab119
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab119
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab119
	add	r3, r7, #1528	
	subw	r3, r3, #1028	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1032	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1032	
	add	r3, r7, #1528	
	subw	r3, r3, #1028	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab119
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1036	
	add	r2, r7, #1528	
	subw	r1, r2, #1028	
	add	r2, r7, #1528	
	sub	r2, r2, #1032	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1028	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1032	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1036	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab119: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab120
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab120
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab120
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab120
	add	r3, r7, #1528	
	sub	r3, r3, #1040	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1044	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1044	
	add	r3, r7, #1528	
	sub	r3, r3, #1040	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab120
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1048	
	add	r2, r7, #1528	
	sub	r1, r2, #1040	
	add	r2, r7, #1528	
	subw	r2, r2, #1044	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1040	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1044	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1048	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab120: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab121
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab121
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab121
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab121
	add	r3, r7, #1528	
	subw	r3, r3, #1052	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1056	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1056	
	add	r3, r7, #1528	
	subw	r3, r3, #1052	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab121
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1060	
	add	r2, r7, #1528	
	subw	r1, r2, #1052	
	add	r2, r7, #1528	
	sub	r2, r2, #1056	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1052	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1056	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	b	lab122
	nop
	.ltorg
lab122: 	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1060	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab121: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab123
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab123
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab123
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab123
	add	r3, r7, #1528	
	sub	r3, r3, #1064	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1068	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1068	
	add	r3, r7, #1528	
	sub	r3, r3, #1064	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab123
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1072	
	add	r2, r7, #1528	
	sub	r1, r2, #1064	
	add	r2, r7, #1528	
	subw	r2, r2, #1068	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1064	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1068	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1072	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab123: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab124
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab124
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab124
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab124
	add	r3, r7, #1528	
	subw	r3, r3, #1076	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1080	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1080	
	add	r3, r7, #1528	
	subw	r3, r3, #1076	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab124
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1084	
	add	r2, r7, #1528	
	subw	r1, r2, #1076	
	add	r2, r7, #1528	
	sub	r2, r2, #1080	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1076	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1080	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1084	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab124: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab125
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab125
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab125
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab125
	add	r3, r7, #1528	
	sub	r3, r3, #1088	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1092	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1092	
	add	r3, r7, #1528	
	sub	r3, r3, #1088	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab125
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1096	
	add	r2, r7, #1528	
	sub	r1, r2, #1088	
	add	r2, r7, #1528	
	subw	r2, r2, #1092	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1088	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1092	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1096	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	b	lab126
	nop
	.ltorg
lab126: 	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab125: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab127
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab127
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab127
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab127
	add	r3, r7, #1528	
	subw	r3, r3, #1100	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1104	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1104	
	add	r3, r7, #1528	
	subw	r3, r3, #1100	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab127
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1108	
	add	r2, r7, #1528	
	subw	r1, r2, #1100	
	add	r2, r7, #1528	
	sub	r2, r2, #1104	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1100	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1104	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1108	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab127: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab128
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab128
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab128
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab128
	add	r3, r7, #1528	
	sub	r3, r3, #1112	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1116	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1116	
	add	r3, r7, #1528	
	sub	r3, r3, #1112	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab128
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1120	
	add	r2, r7, #1528	
	sub	r1, r2, #1112	
	add	r2, r7, #1528	
	subw	r2, r2, #1116	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1112	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1116	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1120	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab128: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab129
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab129
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab129
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab129
	add	r3, r7, #1528	
	subw	r3, r3, #1124	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1128	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1128	
	add	r3, r7, #1528	
	subw	r3, r3, #1124	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab129
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1132	
	add	r2, r7, #1528	
	subw	r1, r2, #1124	
	add	r2, r7, #1528	
	sub	r2, r2, #1128	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1124	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1128	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1132	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab129: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab130
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab130
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	b	lab131
	.ltorg
lab131: 	bne	lab130
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab130
	add	r3, r7, #1528	
	sub	r3, r3, #1136	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1140	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1140	
	add	r3, r7, #1528	
	sub	r3, r3, #1136	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab130
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1144	
	add	r2, r7, #1528	
	sub	r1, r2, #1136	
	add	r2, r7, #1528	
	subw	r2, r2, #1140	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1136	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1140	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1144	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab130: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab132
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab132
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	lab132
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab132
	add	r3, r7, #1528	
	subw	r3, r3, #1148	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1152	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1152	
	add	r3, r7, #1528	
	subw	r3, r3, #1148	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab132
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1156	
	add	r2, r7, #1528	
	subw	r1, r2, #1148	
	add	r2, r7, #1528	
	sub	r2, r2, #1152	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1148	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1152	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1156	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab132: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab133
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab133
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab133
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab133
	add	r3, r7, #1528	
	sub	r3, r3, #1160	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1164	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1164	
	add	r3, r7, #1528	
	sub	r3, r3, #1160	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab133
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1168	
	add	r2, r7, #1528	
	sub	r1, r2, #1160	
	add	r2, r7, #1528	
	subw	r2, r2, #1164	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1160	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1164	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1168	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab133: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab134
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab134
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab134
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab134
	add	r3, r7, #1528	
	subw	r3, r3, #1172	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	b	lab135
	.ltorg
lab135: 	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1176	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1176	
	add	r3, r7, #1528	
	subw	r3, r3, #1172	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab134
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1180	
	add	r2, r7, #1528	
	subw	r1, r2, #1172	
	add	r2, r7, #1528	
	sub	r2, r2, #1176	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1172	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1176	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1180	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab134: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab136
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab136
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab136
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab136
	add	r3, r7, #1528	
	sub	r3, r3, #1184	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1188	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1188	
	add	r3, r7, #1528	
	sub	r3, r3, #1184	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab136
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1192	
	add	r2, r7, #1528	
	sub	r1, r2, #1184	
	add	r2, r7, #1528	
	subw	r2, r2, #1188	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1184	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1188	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1192	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab136: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab137
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab137
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab137
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab137
	add	r3, r7, #1528	
	subw	r3, r3, #1196	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1200	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1200	
	add	r3, r7, #1528	
	subw	r3, r3, #1196	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab137
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1204	
	add	r2, r7, #1528	
	subw	r1, r2, #1196	
	add	r2, r7, #1528	
	sub	r2, r2, #1200	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1196	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1200	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1204	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab137: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab138
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab138
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab138
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab138
	add	r3, r7, #1528	
	sub	r3, r3, #1208	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1212	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1212	
	add	r3, r7, #1528	
	sub	r3, r3, #1208	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	b	lab139
	.ltorg
lab139: 	ble	lab138
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1216	
	add	r2, r7, #1528	
	sub	r1, r2, #1208	
	add	r2, r7, #1528	
	subw	r2, r2, #1212	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1208	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1212	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1216	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab138: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab140
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab140
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab140
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #16]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab140
	add	r3, r7, #1528	
	subw	r3, r3, #1220	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1224	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1224	
	add	r3, r7, #1528	
	subw	r3, r3, #1220	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab140
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1228	
	add	r2, r7, #1528	
	subw	r1, r2, #1220	
	add	r2, r7, #1528	
	sub	r2, r2, #1224	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1220	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1224	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1228	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab140: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab141
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab141
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab141
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab141
	add	r3, r7, #1528	
	sub	r3, r3, #1232	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1236	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1236	
	add	r3, r7, #1528	
	sub	r3, r3, #1232	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab141
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1240	
	add	r2, r7, #1528	
	sub	r1, r2, #1232	
	add	r2, r7, #1528	
	subw	r2, r2, #1236	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1232	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1236	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1240	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab141: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab142
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab142
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab142
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab142
	add	r3, r7, #1528	
	subw	r3, r3, #1244	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1248	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1248	
	add	r3, r7, #1528	
	subw	r3, r3, #1244	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab142
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1252	
	b	lab143
	nop
	.ltorg
lab143: 	add	r2, r7, #1528	
	subw	r1, r2, #1244	
	add	r2, r7, #1528	
	sub	r2, r2, #1248	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1244	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1248	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1252	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab142: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab144
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab144
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab144
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab144
	add	r3, r7, #1528	
	sub	r3, r3, #1256	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1260	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1260	
	add	r3, r7, #1528	
	sub	r3, r3, #1256	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab144
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1264	
	add	r2, r7, #1528	
	sub	r1, r2, #1256	
	add	r2, r7, #1528	
	subw	r2, r2, #1260	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1256	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1260	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1264	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab144: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab145
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab145
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab145
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab145
	add	r3, r7, #1528	
	subw	r3, r3, #1268	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1272	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1272	
	add	r3, r7, #1528	
	subw	r3, r3, #1268	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab145
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1276	
	add	r2, r7, #1528	
	subw	r1, r2, #1268	
	add	r2, r7, #1528	
	sub	r2, r2, #1272	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1268	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1272	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1276	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab145: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab146
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab146
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab146
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab146
	add	r3, r7, #1528	
	sub	r3, r3, #1280	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1284	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1284	
	add	r3, r7, #1528	
	sub	r3, r3, #1280	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab146
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1288	
	add	r2, r7, #1528	
	sub	r1, r2, #1280	
	add	r2, r7, #1528	
	subw	r2, r2, #1284	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1280	
	ldr	r2, [r2, #0]
	b	lab147
	nop
	.ltorg
lab147: 	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1284	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1288	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab146: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab148
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab148
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab148
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #0]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab148
	add	r3, r7, #1528	
	subw	r3, r3, #1292	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1296	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1296	
	add	r3, r7, #1528	
	subw	r3, r3, #1292	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab148
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1300	
	add	r2, r7, #1528	
	subw	r1, r2, #1292	
	add	r2, r7, #1528	
	sub	r2, r2, #1296	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1292	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1296	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1300	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab148: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab149
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab149
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab149
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab149
	add	r3, r7, #1528	
	sub	r3, r3, #1304	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1308	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1308	
	add	r3, r7, #1528	
	sub	r3, r3, #1304	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab149
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1312	
	add	r2, r7, #1528	
	sub	r1, r2, #1304	
	add	r2, r7, #1528	
	subw	r2, r2, #1308	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1304	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1308	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1312	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab149: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab150
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab150
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab150
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab150
	add	r3, r7, #1528	
	subw	r3, r3, #1316	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1320	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1320	
	add	r3, r7, #1528	
	subw	r3, r3, #1316	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab150
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1324	
	add	r2, r7, #1528	
	subw	r1, r2, #1316	
	add	r2, r7, #1528	
	sub	r2, r2, #1320	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1316	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1320	
	ldr	r2, [r2, #0]
	b	lab151
	.ltorg
lab151: 	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1324	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab150: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab152
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab152
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab152
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab152
	add	r3, r7, #1528	
	sub	r3, r3, #1328	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1332	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1332	
	add	r3, r7, #1528	
	sub	r3, r3, #1328	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab152
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1336	
	add	r2, r7, #1528	
	sub	r1, r2, #1328	
	add	r2, r7, #1528	
	subw	r2, r2, #1332	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1328	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1332	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1336	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab152: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab153
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab153
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab153
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab153
	add	r3, r7, #1528	
	subw	r3, r3, #1340	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1344	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1344	
	add	r3, r7, #1528	
	subw	r3, r3, #1340	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab153
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1348	
	add	r2, r7, #1528	
	subw	r1, r2, #1340	
	add	r2, r7, #1528	
	sub	r2, r2, #1344	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1340	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1344	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1348	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab153: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab154
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab154
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab154
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab154
	add	r3, r7, #1528	
	sub	r3, r3, #1352	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1356	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1356	
	add	r3, r7, #1528	
	sub	r3, r3, #1352	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab154
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1360	
	add	r2, r7, #1528	
	sub	r1, r2, #1352	
	add	r2, r7, #1528	
	subw	r2, r2, #1356	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1352	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1356	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1360	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	b	lab155
	nop
	.ltorg
lab155: 	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab154: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab156
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab156
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab156
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #4]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab156
	add	r3, r7, #1528	
	subw	r3, r3, #1364	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1368	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #4]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1368	
	add	r3, r7, #1528	
	subw	r3, r3, #1364	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab156
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1372	
	add	r2, r7, #1528	
	subw	r1, r2, #1364	
	add	r2, r7, #1528	
	sub	r2, r2, #1368	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1364	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1368	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1372	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab156: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab157
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab157
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab157
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab157
	add	r3, r7, #1528	
	sub	r3, r3, #1376	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1380	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1380	
	add	r3, r7, #1528	
	sub	r3, r3, #1376	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab157
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1384	
	add	r2, r7, #1528	
	sub	r1, r2, #1376	
	add	r2, r7, #1528	
	subw	r2, r2, #1380	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1376	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1380	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1384	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab157: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab158
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab158
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab158
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab158
	add	r3, r7, #1528	
	subw	r3, r3, #1388	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1392	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1392	
	add	r3, r7, #1528	
	subw	r3, r3, #1388	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab158
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1396	
	add	r2, r7, #1528	
	subw	r1, r2, #1388	
	add	r2, r7, #1528	
	sub	r2, r2, #1392	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1388	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1392	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1396	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab158: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab159
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab159
	b	lab160
	nop
	.ltorg
lab160: 	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab159
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab159
	add	r3, r7, #1528	
	sub	r3, r3, #1400	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1404	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1404	
	add	r3, r7, #1528	
	sub	r3, r3, #1400	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab159
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1408	
	add	r2, r7, #1528	
	sub	r1, r2, #1400	
	add	r2, r7, #1528	
	subw	r2, r2, #1404	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1400	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1404	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1408	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab159: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab161
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab161
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab161
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab161
	add	r3, r7, #1528	
	subw	r3, r3, #1412	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1416	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1416	
	add	r3, r7, #1528	
	subw	r3, r3, #1412	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab161
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1420	
	add	r2, r7, #1528	
	subw	r1, r2, #1412	
	add	r2, r7, #1528	
	sub	r2, r2, #1416	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1412	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1416	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1420	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab161: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab162
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab162
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab162
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab162
	add	r3, r7, #1528	
	sub	r3, r3, #1424	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1428	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1428	
	add	r3, r7, #1528	
	sub	r3, r3, #1424	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab162
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1432	
	add	r2, r7, #1528	
	sub	r1, r2, #1424	
	add	r2, r7, #1528	
	subw	r2, r2, #1428	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1424	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1428	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1432	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab162: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab163
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab163
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	lab163
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #8]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	b	lab164
	.ltorg
lab164: 	bne	lab163
	add	r3, r7, #1528	
	subw	r3, r3, #1436	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1440	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #8]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1440	
	add	r3, r7, #1528	
	subw	r3, r3, #1436	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab163
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1444	
	add	r2, r7, #1528	
	subw	r1, r2, #1436	
	add	r2, r7, #1528	
	sub	r2, r2, #1440	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1436	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1440	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1444	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab163: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab165
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab165
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab165
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab165
	add	r3, r7, #1528	
	sub	r3, r3, #1448	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1452	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1452	
	add	r3, r7, #1528	
	sub	r3, r3, #1448	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab165
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1456	
	add	r2, r7, #1528	
	sub	r1, r2, #1448	
	add	r2, r7, #1528	
	subw	r2, r2, #1452	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1448	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1452	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1456	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab165: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab166
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab166
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab166
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab166
	add	r3, r7, #1528	
	subw	r3, r3, #1460	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1464	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1464	
	add	r3, r7, #1528	
	subw	r3, r3, #1460	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab166
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1468	
	add	r2, r7, #1528	
	subw	r1, r2, #1460	
	add	r2, r7, #1528	
	sub	r2, r2, #1464	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1460	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1464	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1468	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab166: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab167
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab167
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab167
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab167
	add	r3, r7, #1528	
	sub	r3, r3, #1472	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1476	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1476	
	b	lab168
	.ltorg
lab168: 	add	r3, r7, #1528	
	sub	r3, r3, #1472	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab167
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1480	
	add	r2, r7, #1528	
	sub	r1, r2, #1472	
	add	r2, r7, #1528	
	subw	r2, r2, #1476	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1472	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1476	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1480	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab167: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab169
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab169
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab169
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab169
	add	r3, r7, #1528	
	subw	r3, r3, #1484	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1488	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1488	
	add	r3, r7, #1528	
	subw	r3, r3, #1484	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab169
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1492	
	add	r2, r7, #1528	
	subw	r1, r2, #1484	
	add	r2, r7, #1528	
	sub	r2, r2, #1488	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1484	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1488	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1492	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab169: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab170
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab170
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab170
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	lab170
	add	r3, r7, #1528	
	sub	r3, r3, #1496	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1500	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	subw	r2, r3, #1500	
	add	r3, r7, #1528	
	sub	r3, r3, #1496	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab170
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	ldr	r2, =P2_marking_member_0	
	str	r3, [r2, #0]
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1504	
	add	r2, r7, #1528	
	sub	r1, r2, #1496	
	add	r2, r7, #1528	
	subw	r2, r2, #1500	
	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1496	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1500	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1504	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab170: 	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	lab171
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bgt	lab171
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	lab171
	ldr	r3, =P2_marking_member_0	
	ldr	r2, [r3, #12]
	ldr	r3, =P2_marking_member_0	
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	lab171
	add	r3, r7, #1528	
	subw	r3, r3, #1508	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #16]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r3, r3, #1512	
	ldr	r2, =P2_marking_member_0	
	ldr	r2, [r2, #12]
	str	r2, [r3, #0]
	add	r3, r7, #1528	
	sub	r2, r3, #1512	
	add	r3, r7, #1528	
	subw	r3, r3, #1508	
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	lab171
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	subs	r3, #4
	ldr	r2, =P2_is_marked	
	str	r3, [r2, #0]
	add	r3, r7, #1528	
	subw	r3, r3, #1516	
	add	r2, r7, #1528	
	subw	r1, r2, #1508	
	add	r2, r7, #1528	
	sub	r2, r2, #1512	
	b	lab172
	.ltorg
lab172: 	ldr	r1, [r1, #0]
	ldr	r2, [r2, #0]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1508	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	sub	r2, r2, #1512	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #2
	ldr	r1, =P3_marking_member_0	
	add	r2, r7, #1528	
	subw	r2, r2, #1516	
	ldr	r2, [r2, #0]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	adds	r3, #3
	ldr	r2, =P3_is_marked	
	str	r3, [r2, #0]
lab171: 	ldr	r3, [r7, #1524]	
	adds	r3, #1
	str	r3, [r7, #1524]	
lab8: 	add	r3, r7, #1528	
	subw	r3, r3, #1524	
	ldr	r2, [r7, #1524]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab173
	movs	r3, #0
	mov	r0, r3
	addw	r7, r7, #1532	
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
verify_benchmark:
	push	{r7}
	sub	sp, #84	
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #3
	str	r3, [r7, #72]	
	movs	r3, #0
	str	r3, [r7, #52]	
	movs	r3, #0
	str	r3, [r7, #56]	
	movs	r3, #0
	str	r3, [r7, #60]	
	movs	r3, #5
	str	r3, [r7, #68]	
	add	r3, r7, #32
	movs	r2, #0
	str	r2, [r3, #0]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	movs	r3, #0
	str	r3, [r7, #64]	
	add	r3, r7, #8
	movs	r2, #0
	str	r2, [r3, #0]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	r3, =P1_is_marked	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #72]	
	cmp	r2, r3
	bne	lab174
	ldr	r3, =P2_is_marked	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #68]	
	cmp	r2, r3
	bne	lab174
	ldr	r3, =P3_is_marked	
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #64]	
	cmp	r2, r3
	beq	lab175
lab174: 	movs	r3, #0
	b	lab176
lab175: 	movs	r3, #0
	str	r3, [r7, #76]	
	b	lab177
lab180: 	lsls	r3, r3, #2
	adds	r3, #80	
	add	r3, r7
	ldr	r2, [r3, #-28]
	ldr	r1, =P1_marking_member_0	
	ldr	r3, [r7, #76]	
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bne	lab178
	ldr	r3, [r7, #76]	
	lsls	r3, r3, #2
	adds	r3, #80	
	add	r3, r7
	ldr	r2, [r3, #-48]
	ldr	r1, =P2_marking_member_0	
	ldr	r3, [r7, #76]	
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bne	lab178
	ldr	r3, [r7, #76]	
	lsls	r3, r3, #2
	adds	r3, #80	
	add	r3, r7
	ldr	r2, [r3, #-72]
	ldr	r1, =P3_marking_member_0	
	ldr	r3, [r7, #76]	
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	beq	lab179
lab178: 	movs	r3, #0
	b	lab176
lab179: 	ldr	r3, [r7, #76]	
	adds	r3, #1
	str	r3, [r7, #76]	
lab177: 	ldr	r3, [r7, #76]	
	cmp	r3, #2
	ble	lab180
	movs	r3, #3
	str	r3, [r7, #76]	
	b	lab181
lab184: 	lsls	r3, r3, #2
	adds	r3, #80	
	add	r3, r7
	ldr	r2, [r3, #-48]
	ldr	r1, =P2_marking_member_0	
	ldr	r3, [r7, #76]	
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bne	lab182
	ldr	r3, [r7, #76]	
	lsls	r3, r3, #2
	adds	r3, #80	
	add	r3, r7
	ldr	r2, [r3, #-72]
	ldr	r1, =P3_marking_member_0	
	ldr	r3, [r7, #76]	
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	beq	lab183
lab182: 	movs	r3, #0
	b	lab176
lab183: 	ldr	r3, [r7, #76]	
	adds	r3, #1
	str	r3, [r7, #76]	
lab181: 	ldr	r3, [r7, #76]	
	cmp	r3, #4
	ble	lab184
	movs	r3, #5
	str	r3, [r7, #76]	
	b	lab185
lab187: 	lsls	r3, r3, #2
	adds	r3, #80	
	add	r3, r7
	ldr	r2, [r3, #-72]
	ldr	r1, =P3_marking_member_0	
	ldr	r3, [r7, #76]	
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	beq	lab186
	movs	r3, #0
	b	lab176
lab186: 	ldr	r3, [r7, #76]	
	adds	r3, #1
	str	r3, [r7, #76]	
lab185: 	ldr	r3, [r7, #76]	
	cmp	r3, #5
	ble	lab187
	movs	r3, #1
lab176: 	mov	r0, r3
	adds	r7, #84	
	mov	sp, r7
	pop	{r7}
	bx	lr
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
	ldr r1, =0x46797
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	start_trigger
	bl	benchmark
	push {r1, r2}
	ldr r1, =0x4f563
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
	ldr r1, =0x2ed76
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x0001ec9c	
	ldr	r5, =0x0001ec9c	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab188
	movs	r4, #0
lab189: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x41187
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x84a9d
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab189
lab188: 	ldr	r6, =0x0001eca4	
	ldr	r5, =0x0001ec9c	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab190
	movs	r4, #0
lab191: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x42a5e
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x04a9d
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab191
lab190:	cpsid f
	push {r1, r2}
	ldr r1, =0x40238
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, r6, pc}
	.ltorg
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab192
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab193
	uxtb	r2, r1
	mov	r3, r0
	b	lab194
lab195: 	bcc	lab193
lab194: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab195
lab203: 	bls	lab196
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab197
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab198: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab198
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab199
lab204: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab200: 	cmp	r3, r2
	bne	lab200
	and	r4, ip, #3
lab196: 	cbz	r4, lab193
lab202: 	add	r4, r3
lab201: 	cmp	r4, r3
	bne	lab201
lab193:	cpsid f
	push {r1, r2}
	ldr r1, =0x55af6
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, pc}
lab199: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab202
	b	lab193
lab192: 	mov	r3, r0
	mov	r4, r2
	b	lab203
lab197: 	mov	r2, r3
	mov	ip, r4
	b	lab204
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
	cbz	r6, lab205
	mov	r9, #1
	mov	sl, #0
lab211: 	subs	r5, r4, #1
	bmi	lab205
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab207: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab206
lab208: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab207
lab205: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab206: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab208
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab209
	blx	r2
lab214: 	cmp	r2, fp
	bne	lab210
lab213: 	cmp	r3, r6
	beq	lab208
	mov	r6, r3
	cmp	r6, #0
	bne	lab211
	b	lab205
lab209: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab212
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab213
lab210: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab211
	b	lab205
lab212: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab214
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =P1_is_marked	
	ldr	r5, =0x0001eca4	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab215
	subs	r3, #4
	add	r5, r3
lab216: 	ldr	r3, [r5], #-4
	cpsid f
	push {r1, r2}
	ldr r1, =0x37042
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r4, #0
	push {r1, r2}
	ldr r1, =0xf6c36
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab216
lab215: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab217
lab221: 	cmp	r5, #31
	bgt	lab218
	cbnz	r6, lab219
lab220: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab222:	cpsid f
	push {r1, r2}
	ldr r1, =0xee54d
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 lab219: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab220
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab220
lab217: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab221
lab218: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab222
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
	.word	0x0001ecb0


	.data

P1_is_marked:
	.word	0x00000003
P2_is_marked:
	.word	0x00000005
impure_data:
	.word	0x00000000
	.word	0x0001ef9c
	.word	0x0001f004
	.word	0x0001f06c
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
	.word	0x0001f134


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
P1_marking_member_0:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
P2_marking_member_0:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
P3_is_marked:
	.word	0x00000000
P3_marking_member_0:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
__lock___atexit_recursive_mutex:
	.word	0x00000000
