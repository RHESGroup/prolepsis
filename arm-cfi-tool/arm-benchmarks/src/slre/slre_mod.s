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
	ldr r1, =0x0024f
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =0x00000000	
	cbz	r3, lab1
	ldr	r0, =0x0000962d	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	ldr r1, =0x59141
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
	ldr	r0, =0x0000984c	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	ldr r1, =0x402b9
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
	ldr	r0, =0x0000984c	
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
	ldr	r2, =0x00019cf4	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	ldr r1, =0x99916
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
	ldr	r0, =0x00009621	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x0000962d	
push {r1, r2}
	ldr r1, =0x17524
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	atexit
lab7:	push {r1, r2}
	ldr r1, =0x17524
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	bl	__libc_init_array
	push {r1, r2}
	ldr r1, =0x51af3
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, r4
	movs	r1, r5
	bl	main
	push {r1, r2}
	ldr r1, =0x929d3
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	exit
	nop
	.ltorg
is_metacharacter:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, =metacharacters.0	
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	mov	r1, r3
	mov	r0, r2
	bl	strchr
	push {r1, r2}
	ldr r1, =0x185d9
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	ite	ne
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x15504
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	.ltorg
op_len:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	cmp	r3, #92	
	bne	lab8
	ldr	r3, [r7, #4]
	adds	r3, #1
	ldrb	r3, [r3, #0]
	cmp	r3, #120	
	beq	lab9
lab8: 	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	cmp	r3, #92	
	bne	lab10
	movs	r3, #2
	b	lab11
lab10: 	movs	r3, #1
	b	lab11
lab9: 	movs	r3, #4
lab11: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
set_len:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab12
lab14: 	ldr	r2, [r7, #4]
	add	r3, r2
	mov	r0, r3
	bl	op_len
	mov	r2, r0
	ldr	r3, [r7, #12]
	add	r3, r2
	str	r3, [r7, #12]
lab12: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #0]
	cmp	r2, r3
	bge	lab13
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #93	
	bne	lab14
lab13: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #0]
	cmp	r2, r3
	bgt	lab15
	ldr	r3, [r7, #12]
	adds	r3, #1
	b	lab16
lab15: 	mov	r3, #4294967295	
lab16: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x001c9
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
get_op_len:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	cmp	r3, #91	
	bne	lab17
	ldr	r3, [r7, #4]
	adds	r2, r3, #1
	ldr	r3, [r7, #0]
	subs	r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	set_len
	push {r1, r2}
	ldr r1, =0x78114
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	adds	r3, #1
	b	lab18
lab17: 	ldr	r0, [r7, #4]
	bl	op_len
	mov	r3, r0
lab18: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x460bf
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
is_quantifier:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	cmp	r3, #42	
	beq	lab19
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	cmp	r3, #43	
	beq	lab19
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	cmp	r3, #63	
	bne	lab20
lab19: 	movs	r3, #1
	b	lab21
lab20: 	movs	r3, #0
lab21: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
toi:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	adds	r3, #1
	ldr	r2, =_ctype_	
	add	r3, r2
	ldrb	r3, [r3, #0]
	and	r3, r3, #4
	cmp	r3, #0
	beq	lab22
	ldr	r3, [r7, #4]
	subs	r3, #48	
	b	lab23
lab22: 	ldr	r3, [r7, #4]
	subs	r3, #87	
lab23: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
hextoi:
	push	{r4, r7, lr}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]
	adds	r3, #1
	ldr	r2, =_ctype_	
	add	r3, r2
	ldrb	r3, [r3, #0]
	and	r3, r3, #3
	cmp	r3, #1
	bne	lab24
	ldrb	r3, [r7, #15]
	adds	r3, #32
	b	lab25
lab24: 	ldrb	r3, [r7, #15]
lab25: 	mov	r0, r3
	bl	toi
	mov	r3, r0
	lsls	r4, r3, #4
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #1]
	strb	r3, [r7, #14]
	ldrb	r3, [r7, #14]
	adds	r3, #1
	ldr	r2, =_ctype_	
	add	r3, r2
	ldrb	r3, [r3, #0]
	and	r3, r3, #3
	cmp	r3, #1
	bne	lab26
	ldrb	r3, [r7, #14]
	adds	r3, #32
	b	lab27
lab26: 	ldrb	r3, [r7, #14]
lab27: 	mov	r0, r3
	bl	toi
	mov	r3, r0
	orrs	r3, r4
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x19f22
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, r7, pc}
	.ltorg
match_op:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #0]
	cmp	r3, #124	
	beq	lab28
	cmp	r3, #124	
	bgt	lab29
	cmp	r3, #92	
	beq	lab30
	cmp	r3, #92	
	bgt	lab29
	cmp	r3, #36	
	beq	lab31
	cmp	r3, #46	
	beq	lab32
	b	lab29
lab30: 	ldr	r3, [r7, #12]
	adds	r3, #1
	ldrb	r3, [r3, #0]
	cmp	r3, #120	
	beq	lab33
	cmp	r3, #120	
	bgt	lab34
	cmp	r3, #115	
	beq	lab35
	cmp	r3, #115	
	bgt	lab34
	cmp	r3, #83	
	beq	lab36
	cmp	r3, #100	
	beq	lab37
	b	lab34
lab36: 	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #0]
	adds	r3, #1
	ldr	r2, =_ctype_	
	add	r3, r2
	ldrb	r3, [r3, #0]
	and	r3, r3, #8
	cmp	r3, #0
	beq	lab38
	mov	r3, #4294967295	
	b	lab39
lab38: 	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
	b	lab40
lab35: 	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #0]
	adds	r3, #1
	ldr	r2, =_ctype_	
	add	r3, r2
	ldrb	r3, [r3, #0]
	and	r3, r3, #8
	cmp	r3, #0
	bne	lab41
	mov	r3, #4294967295	
	b	lab39
lab41: 	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
	b	lab40
lab37: 	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #0]
	adds	r3, #1
	ldr	r2, =_ctype_	
	add	r3, r2
	ldrb	r3, [r3, #0]
	and	r3, r3, #4
	cmp	r3, #0
	bne	lab42
	mov	r3, #4294967295	
	b	lab39
lab42: 	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
	b	lab40
lab33: 	ldr	r3, [r7, #12]
	adds	r3, #2
	mov	r0, r3
	bl	hextoi
	push {r1, r2}
	ldr r1, =0x251ba
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab43
	mov	r3, #4294967295	
	b	lab39
lab43: 	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
	b	lab40
lab34: 	ldr	r3, [r7, #12]
	adds	r3, #1
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab44
	mov	r3, #4294967295	
	b	lab39
lab44: 	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
	nop
lab40: 	b	lab45
lab28: 	mvn	r3, #3
	b	lab39
lab31: 	mov	r3, #4294967295	
	b	lab39
lab32: 	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
	b	lab45
lab29: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #2416]	
	and	r3, r3, #1
	cmp	r3, #0
	beq	lab46
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #0]
	strb	r3, [r7, #19]
	ldrb	r3, [r7, #19]
	adds	r3, #1
	ldr	r2, =_ctype_	
	add	r3, r2
	ldrb	r3, [r3, #0]
	and	r3, r3, #3
	cmp	r3, #1
	bne	lab47
	ldrb	r3, [r7, #19]
	add	r2, r3, #32
	b	lab48
lab47: 	ldrb	r2, [r7, #19]
lab48: 	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #0]
	strb	r3, [r7, #18]
	ldrb	r3, [r7, #18]
	adds	r3, #1
	ldr	r1, =_ctype_	
	add	r3, r1
	ldrb	r3, [r3, #0]
	and	r3, r3, #3
	cmp	r3, #1
	bne	lab49
	ldrb	r3, [r7, #18]
	adds	r3, #32
	b	lab50
lab49: 	ldrb	r3, [r7, #18]
lab50: 	cmp	r2, r3
	beq	lab51
	mov	r3, #4294967295	
	b	lab39
lab46: 	ldr	r3, [r7, #12]
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab51
	mov	r3, #4294967295	
	b	lab39
lab51: 	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
	nop
lab45: 	ldr	r3, [r7, #20]
lab39: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x789fd
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.ltorg
match_set:
	push	{r7, lr}
	sub	sp, #48	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #44]	
	mov	r3, #4294967295	
	str	r3, [r7, #40]	
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #0]
	cmp	r3, #94	
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #36]	
	ldr	r3, [r7, #36]	
	cmp	r3, #0
	beq	lab52
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	subs	r3, #1
	str	r3, [r7, #8]
	b	lab52
lab67: 	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #45	
	beq	lab53
	ldr	r3, [r7, #44]	
	adds	r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #45	
	bne	lab53
	ldr	r3, [r7, #44]	
	adds	r3, #2
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #93	
	beq	lab53
	ldr	r3, [r7, #44]	
	adds	r3, #2
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab53
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #2416]	
	cmp	r3, #0
	beq	lab54
	ldr	r3, [r7, #4]
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #44]	
	ldr	r1, [r7, #12]
	add	r3, r1
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	bcc	lab55
	ldr	r3, [r7, #4]
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #44]	
	adds	r3, #2
	ldr	r1, [r7, #12]
	add	r3, r1
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	bhi	lab55
	movs	r3, #1
	b	lab56
lab55: 	movs	r3, #0
	b	lab56
lab54: 	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	str	r3, [r7, #32]
	ldr	r3, [r7, #32]
	adds	r3, #1
	ldr	r2, =_ctype_	
	add	r3, r2
	ldrb	r3, [r3, #0]
	and	r3, r3, #3
	cmp	r3, #1
	bne	lab57
	ldr	r3, [r7, #32]
	add	r2, r3, #32
	b	lab58
lab57: 	ldr	r2, [r7, #32]
lab58: 	ldr	r3, [r7, #44]	
	ldr	r1, [r7, #12]
	add	r3, r1
	ldrb	r3, [r3, #0]
	str	r3, [r7, #28]
	ldr	r3, [r7, #28]
	adds	r3, #1
	ldr	r1, =_ctype_	
	add	r3, r1
	ldrb	r3, [r3, #0]
	and	r3, r3, #3
	cmp	r3, #1
	bne	lab59
	ldr	r3, [r7, #28]
	adds	r3, #32
	b	lab60
lab59: 	ldr	r3, [r7, #28]
lab60: 	cmp	r2, r3
	blt	lab61
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	str	r3, [r7, #24]
	ldr	r3, [r7, #24]
	adds	r3, #1
	ldr	r2, =_ctype_	
	add	r3, r2
	ldrb	r3, [r3, #0]
	and	r3, r3, #3
	cmp	r3, #1
	bne	lab62
	ldr	r3, [r7, #24]
	add	r2, r3, #32
	b	lab63
lab62: 	ldr	r2, [r7, #24]
lab63: 	ldr	r3, [r7, #44]	
	adds	r3, #2
	ldr	r1, [r7, #12]
	add	r3, r1
	ldrb	r3, [r3, #0]
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	adds	r3, #1
	ldr	r1, =_ctype_	
	add	r3, r1
	ldrb	r3, [r3, #0]
	and	r3, r3, #3
	cmp	r3, #1
	bne	lab64
	ldr	r3, [r7, #20]
	adds	r3, #32
	b	lab65
lab64: 	ldr	r3, [r7, #20]
lab65: 	cmp	r2, r3
	bgt	lab61
	movs	r3, #1
	b	lab56
lab61: 	movs	r3, #0
lab56: 	str	r3, [r7, #40]	
	ldr	r3, [r7, #44]	
	adds	r3, #3
	str	r3, [r7, #44]	
	b	lab52
lab53: 	ldr	r3, [r7, #44]	
	ldr	r2, [r7, #12]
	add	r3, r2
	ldr	r2, [r7, #0]
	ldr	r1, [r7, #4]
	mov	r0, r3
push {r1, r2}
	ldr r1, =0x066df
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	match_op
	push {r1, r2}
	ldr r1, =0x066df
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #40]	
	ldr	r3, [r7, #44]	
	ldr	r2, [r7, #12]
	add	r3, r2
	mov	r0, r3
	bl	op_len
	mov	r2, r0
	ldr	r3, [r7, #44]	
	add	r3, r2
	str	r3, [r7, #44]	
lab52: 	ldr	r2, [r7, #44]	
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bgt	lab66
	ldr	r3, [r7, #44]	
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #93	
	beq	lab66
	ldr	r3, [r7, #40]	
	cmp	r3, #0
	ble	lab67
lab66: 	ldr	r3, [r7, #36]	
	cmp	r3, #0
	bne	lab68
	ldr	r3, [r7, #40]	
	cmp	r3, #0
	bgt	lab69
lab68: 	ldr	r3, [r7, #36]	
	cmp	r3, #0
	beq	lab70
	ldr	r3, [r7, #40]	
	cmp	r3, #0
	bgt	lab70
lab69: 	movs	r3, #1
	b	lab71
lab70: 	mov	r3, #4294967295	
lab71: 	mov	r0, r3
	adds	r7, #48	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0xc8512
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.ltorg
bar:
	push	{r4, r7, lr}
	sub	sp, #76	
	add	r7, sp, #8
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #56]	
	ldr	r3, [r7, #56]	
	str	r3, [r7, #60]	
	b	lab72
lab112: 	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #40	
	bne	lab73
	ldr	r3, [r7, #84]	
	adds	r3, #1
	ldr	r2, [r7, #80]	
	lsls	r3, r3, #4
	add	r3, r2
	adds	r3, #4
	ldr	r3, [r3, #0]
	adds	r3, #2
	b	lab74
lab73: 	ldr	r3, [r7, #60]	
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #60]	
	subs	r3, r2, r3
	mov	r1, r3
push {r1, r2}
	ldr r1, =0x7221e
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	get_op_len
	push {r1, r2}
	ldr r1, =0x7221e
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
lab74: 	str	r3, [r7, #24]
	ldr	r3, [r7, #60]	
	ldr	r2, [r7, #12]
	add	r3, r2
	mov	r0, r3
	bl	is_quantifier
	mov	r3, r0
	cmp	r3, #0
	beq	lab75
	mvn	r3, #1
	b	lab76
lab75: 	ldr	r3, [r7, #24]
	cmp	r3, #0
	bgt	lab77
	mvn	r3, #4
	b	lab76
lab77: 	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	ldr	r2, [r7, #8]
	cmp	r2, r3
	ble	lab78
	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	ldr	r2, [r7, #12]
	add	r3, r2
	mov	r0, r3
	bl	is_quantifier
	mov	r3, r0
	cmp	r3, #0
	beq	lab78
	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #63	
	bne	lab79
	ldr	r3, [r7, #60]	
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r3, [r7, #56]	
	ldr	r2, [r7, #4]
	adds	r1, r2, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #56]	
	subs	r2, r2, r3
	ldr	r3, [r7, #84]	
	str	r3, [sp, #4]
	ldr	r3, [r7, #80]	
	str	r3, [sp, #0]
	mov	r3, r2
	mov	r2, r1
	ldr	r1, [r7, #24]
push {r1, r2}
	ldr r1, =0x3675c
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	bar
	push {r1, r2}
	ldr r1, =0x3675c
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #16]
	ldr	r3, [r7, #16]
	bic	r3, r3, r3, asr #31
	ldr	r2, [r7, #56]	
	add	r3, r2
	str	r3, [r7, #56]	
	ldr	r3, [r7, #60]	
	adds	r3, #1
	str	r3, [r7, #60]	
	b	lab80
lab79: 	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #43	
	beq	lab81
	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #42	
	bne	lab80
lab81: 	ldr	r3, [r7, #56]	
	str	r3, [r7, #48]	
	ldr	r3, [r7, #56]	
	str	r3, [r7, #44]	
	mov	r3, #4294967295	
	str	r3, [r7, #40]	
	movs	r3, #0
	str	r3, [r7, #32]
	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	adds	r3, #1
	str	r3, [r7, #36]	
	ldr	r2, [r7, #36]	
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bge	lab82
	ldr	r3, [r7, #36]	
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #63	
	bne	lab82
	movs	r3, #1
	str	r3, [r7, #32]
	ldr	r3, [r7, #36]	
	adds	r3, #1
	str	r3, [r7, #36]	
lab82: 	ldr	r3, [r7, #60]	
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r3, [r7, #48]	
	ldr	r2, [r7, #4]
	adds	r1, r2, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #48]	
	subs	r2, r2, r3
	ldr	r3, [r7, #84]	
	str	r3, [sp, #4]
	ldr	r3, [r7, #80]	
	str	r3, [sp, #0]
	mov	r3, r2
	mov	r2, r1
	ldr	r1, [r7, #24]
push {r1, r2}
	ldr r1, =0x7675c
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	bar
	push {r1, r2}
	ldr r1, =0x7675c
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	ble	lab83
	ldr	r2, [r7, #48]	
	ldr	r3, [r7, #20]
	add	r3, r2
	str	r3, [r7, #48]	
lab83: 	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #43	
	bne	lab84
	ldr	r3, [r7, #20]
	cmp	r3, #0
	blt	lab85
lab84: 	ldr	r2, [r7, #36]	
	ldr	r3, [r7, #8]
	cmp	r2, r3
	blt	lab86
	ldr	r3, [r7, #48]	
	str	r3, [r7, #44]	
	b	lab87
lab86: 	ldr	r3, [r7, #36]	
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #36]	
	subs	r1, r2, r3
	ldr	r3, [r7, #48]	
	ldr	r2, [r7, #4]
	adds	r4, r2, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #48]	
	subs	r2, r2, r3
	ldr	r3, [r7, #84]	
	str	r3, [sp, #4]
	ldr	r3, [r7, #80]	
	str	r3, [sp, #0]
	mov	r3, r2
	mov	r2, r4
push {r1, r2}
	ldr r1, =0xb675c
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	bar
	push {r1, r2}
	ldr r1, =0xb675c
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #40]	
	ldr	r3, [r7, #40]	
	cmp	r3, #0
	blt	lab87
	ldr	r2, [r7, #48]	
	ldr	r3, [r7, #40]	
	add	r3, r2
	str	r3, [r7, #44]	
lab87: 	ldr	r2, [r7, #44]	
	ldr	r3, [r7, #56]	
	cmp	r2, r3
	ble	lab88
	ldr	r3, [r7, #32]
	cmp	r3, #0
	bne	lab89
lab88: 	ldr	r3, [r7, #20]
	cmp	r3, #0
	bgt	lab82
	b	lab90
lab85: 	nop
	b	lab90
lab89: 	nop
lab90: 	ldr	r3, [r7, #20]
	cmp	r3, #0
	bge	lab91
	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #42	
	bne	lab91
	ldr	r3, [r7, #36]	
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #36]	
	subs	r1, r2, r3
	ldr	r3, [r7, #56]	
	ldr	r2, [r7, #4]
	adds	r4, r2, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #56]	
	subs	r2, r2, r3
	ldr	r3, [r7, #84]	
	str	r3, [sp, #4]
	ldr	r3, [r7, #80]	
	str	r3, [sp, #0]
	mov	r3, r2
	mov	r2, r4
push {r1, r2}
	ldr r1, =0xf675c
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	bar
	push {r1, r2}
	ldr r1, =0xf675c
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #40]	
	ldr	r3, [r7, #40]	
	cmp	r3, #0
	ble	lab91
	ldr	r2, [r7, #56]	
	ldr	r3, [r7, #40]	
	add	r3, r2
	str	r3, [r7, #44]	
lab91: 	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #43	
	bne	lab92
	ldr	r2, [r7, #44]	
	ldr	r3, [r7, #56]	
	cmp	r2, r3
	bne	lab92
	mov	r3, #4294967295	
	b	lab76
lab92: 	ldr	r2, [r7, #44]	
	ldr	r3, [r7, #56]	
	cmp	r2, r3
	bne	lab93
	ldr	r2, [r7, #36]	
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bge	lab93
	ldr	r3, [r7, #40]	
	cmp	r3, #0
	bge	lab93
	mov	r3, #4294967295	
	b	lab76
lab93: 	ldr	r3, [r7, #44]	
	b	lab76
lab78: 	ldr	r3, [r7, #60]	
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #91	
	bne	lab94
	ldr	r3, [r7, #60]	
	adds	r3, #1
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r3, [r7, #60]	
	adds	r3, #2
	ldr	r2, [r7, #8]
	subs	r1, r2, r3
	ldr	r3, [r7, #56]	
	ldr	r2, [r7, #4]
	add	r2, r3
	ldr	r3, [r7, #80]	
	bl	match_set
	push {r1, r2}
	ldr r1, =0x36bca
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #52]	
	ldr	r3, [r7, #52]	
	cmp	r3, #0
	bgt	lab95
	mov	r3, #4294967295	
	b	lab76
lab95: 	ldr	r2, [r7, #56]	
	ldr	r3, [r7, #52]	
	add	r3, r2
	str	r3, [r7, #56]	
	b	lab96
lab94: 	ldr	r3, [r7, #60]	
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #40	
	bne	lab97
	mov	r3, #4294967295	
	str	r3, [r7, #52]	
	ldr	r3, [r7, #84]	
	adds	r3, #1
	str	r3, [r7, #84]	
	ldr	r3, [r7, #80]	
	ldr	r3, [r3, #1600]	
	ldr	r2, [r7, #84]	
	cmp	r2, r3
	blt	lab98
	mvn	r3, #3
	b	lab76
lab98: 	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	ldr	r2, [r7, #8]
	subs	r3, r2, r3
	cmp	r3, #0
	bgt	lab99
	ldr	r3, [r7, #56]	
	ldr	r2, [r7, #4]
	adds	r0, r2, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #56]	
	subs	r1, r2, r3
	ldr	r3, [r7, #84]	
	ldr	r2, [r7, #80]	
push {r1, r2}
	ldr r1, =0x19040
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	doh
	push {r1, r2}
	ldr r1, =0x19040
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #52]	
	b	lab100
lab99: 	movs	r3, #0
	str	r3, [r7, #28]
	b	lab101
lab104: 	ldr	r2, [r7, #4]
	adds	r0, r2, r3
	ldr	r2, [r7, #56]	
	ldr	r3, [r7, #28]
	add	r3, r2
	ldr	r2, [r7, #0]
	subs	r1, r2, r3
	ldr	r3, [r7, #84]	
	ldr	r2, [r7, #80]	
push {r1, r2}
	ldr r1, =0x39040
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	doh
	push {r1, r2}
	ldr r1, =0x39040
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #52]	
	ldr	r3, [r7, #52]	
	cmp	r3, #0
	blt	lab102
	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	ldr	r2, [r7, #8]
	subs	r1, r2, r3
	ldr	r2, [r7, #56]	
	ldr	r3, [r7, #52]	
	add	r3, r2
	ldr	r2, [r7, #4]
	adds	r4, r2, r3
	ldr	r2, [r7, #56]	
	ldr	r3, [r7, #52]	
	add	r3, r2
	ldr	r2, [r7, #0]
	subs	r2, r2, r3
	ldr	r3, [r7, #84]	
	str	r3, [sp, #4]
	ldr	r3, [r7, #80]	
	str	r3, [sp, #0]
	mov	r3, r2
	mov	r2, r4
push {r1, r2}
	ldr r1, =0x19d93
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	bar
	push {r1, r2}
	ldr r1, =0x19d93
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	bge	lab103
lab102: 	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab101: 	ldr	r2, [r7, #0]
	ldr	r3, [r7, #56]	
	subs	r3, r2, r3
	ldr	r2, [r7, #28]
	cmp	r2, r3
	ble	lab104
	b	lab100
lab103: 	nop
lab100: 	ldr	r3, [r7, #52]	
	cmp	r3, #0
	bge	lab105
	ldr	r3, [r7, #52]	
	b	lab76
lab105: 	ldr	r3, [r7, #80]	
	ldr	r3, [r3, #2408]	
	cmp	r3, #0
	beq	lab106
	ldr	r2, [r7, #56]	
	ldr	r3, [r7, #80]	
	ldr	r1, [r3, #2408]	
	ldr	r3, [r7, #84]	
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r3, r1
	ldr	r1, [r7, #4]
	add	r2, r1
	str	r2, [r3, #0]
	ldr	r3, [r7, #80]	
	ldr	r2, [r3, #2408]	
	ldr	r3, [r7, #84]	
	add	r3, r3, #536870912	
	subs	r3, #1
	lsls	r3, r3, #3
	add	r3, r2
	ldr	r2, [r7, #52]	
	str	r2, [r3, #4]
lab106: 	ldr	r2, [r7, #56]	
	ldr	r3, [r7, #52]	
	add	r3, r2
	str	r3, [r7, #56]	
	b	lab96
lab97: 	ldr	r3, [r7, #60]	
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #94	
	bne	lab107
	ldr	r3, [r7, #56]	
	cmp	r3, #0
	beq	lab96
	mov	r3, #4294967295	
	b	lab76
lab107: 	ldr	r3, [r7, #60]	
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #36	
	bne	lab108
	ldr	r2, [r7, #56]	
	ldr	r3, [r7, #0]
	cmp	r2, r3
	beq	lab96
	mov	r3, #4294967295	
	b	lab76
lab108: 	ldr	r2, [r7, #56]	
	ldr	r3, [r7, #0]
	cmp	r2, r3
	blt	lab109
	mov	r3, #4294967295	
	b	lab76
lab109: 	ldr	r3, [r7, #60]	
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r3, [r7, #56]	
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r2, [r7, #80]	
	mov	r1, r3
push {r1, r2}
	ldr r1, =0x466df
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	match_op
	push {r1, r2}
	ldr r1, =0x466df
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #52]	
	ldr	r3, [r7, #52]	
	cmp	r3, #0
	bgt	lab110
	ldr	r3, [r7, #52]	
	b	lab76
lab110: 	ldr	r2, [r7, #56]	
	ldr	r3, [r7, #52]	
	add	r3, r2
	str	r3, [r7, #56]	
	b	lab96
lab80: 	nop
lab96: 	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #24]
	add	r3, r2
	str	r3, [r7, #60]	
lab72: 	ldr	r2, [r7, #60]	
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bge	lab111
	ldr	r2, [r7, #56]	
	ldr	r3, [r7, #0]
	cmp	r2, r3
	ble	lab112
lab111: 	ldr	r3, [r7, #56]	
lab76: 	mov	r0, r3
	adds	r7, #68	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x02eef
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, r7, pc}
doh:
	push	{r7, lr}
	sub	sp, #48	
	add	r7, sp, #8
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #0]
	lsls	r3, r3, #4
	ldr	r2, [r7, #4]
	add	r3, r2
	str	r3, [r7, #32]
	movs	r3, #0
	str	r3, [r7, #36]	
lab119: 	cmp	r3, #0
	bne	lab113
	ldr	r3, [r7, #32]
	ldr	r3, [r3, #0]
	b	lab114
lab113: 	ldr	r3, [r7, #32]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #36]	
	add	r3, r2
	subs	r3, #1
	ldr	r2, [r7, #4]
	adds	r3, #200	
	lsls	r3, r3, #3
	add	r3, r2
	ldr	r3, [r3, #8]
	adds	r3, #1
lab114: 	str	r3, [r7, #28]
	ldr	r3, [r7, #32]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	lab115
	ldr	r3, [r7, #32]
	ldr	r3, [r3, #4]
	b	lab116
lab115: 	ldr	r3, [r7, #32]
	ldr	r3, [r3, #12]
	ldr	r2, [r7, #36]	
	cmp	r2, r3
	bne	lab117
	ldr	r3, [r7, #32]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #32]
	ldr	r2, [r2, #4]
	add	r2, r3
	ldr	r3, [r7, #28]
	subs	r3, r2, r3
	b	lab116
lab117: 	ldr	r3, [r7, #32]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #36]	
	add	r3, r2
	ldr	r2, [r7, #4]
	adds	r3, #200	
	lsls	r3, r3, #3
	add	r3, r2
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #28]
	subs	r3, r2, r3
lab116: 	str	r3, [r7, #24]
	ldr	r3, [r7, #0]
	str	r3, [sp, #4]
	ldr	r3, [r7, #4]
	str	r3, [sp, #0]
	ldr	r3, [r7, #8]
	ldr	r2, [r7, #12]
	ldr	r1, [r7, #24]
	ldr	r0, [r7, #28]
push {r1, r2}
	ldr r1, =0x39d93
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	bar
	push {r1, r2}
	ldr r1, =0x39d93
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bgt	lab118
	ldr	r3, [r7, #36]	
	adds	r2, r3, #1
	str	r2, [r7, #36]	
	ldr	r2, [r7, #32]
	ldr	r2, [r2, #12]
	cmp	r3, r2
	blt	lab119
lab118: 	ldr	r3, [r7, #20]
	mov	r0, r3
	adds	r7, #40	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x43c42
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
baz:
	push	{r7, lr}
	sub	sp, #32
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	mov	r3, #4294967295	
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldrb	r3, [r3, #0]
	cmp	r3, #94	
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #28]
	b	lab120
lab124: 	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #28]
	subs	r1, r2, r3
	movs	r3, #0
	ldr	r2, [r7, #4]
push {r1, r2}
	ldr r1, =0x59040
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	doh
	push {r1, r2}
	ldr r1, =0x59040
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #24]
	ldr	r3, [r7, #24]
	cmp	r3, #0
	blt	lab121
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #28]
	add	r3, r2
	str	r3, [r7, #24]
	b	lab122
lab121: 	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	lab123
	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab120: 	ldr	r2, [r7, #28]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	ble	lab124
	b	lab122
lab123: 	nop
lab122: 	ldr	r3, [r7, #24]
	mov	r0, r3
	adds	r7, #32
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x6d332
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
setup_branch_points:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #20]
	b	lab125
lab129: 	adds	r3, #1
	str	r3, [r7, #16]
	b	lab126
lab128: 	ldr	r3, [r7, #20]
	adds	r3, #200	
	lsls	r3, r3, #3
	add	r3, r2
	ldr	r2, [r3, #4]
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #16]
	adds	r3, #200	
	lsls	r3, r3, #3
	add	r3, r1
	ldr	r3, [r3, #4]
	cmp	r2, r3
	ble	lab127
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #20]
	adds	r3, #200	
	lsls	r3, r3, #3
	add	r3, r2
	add	r2, r7, #8
	adds	r3, #4
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #20]
	adds	r2, #200	
	lsls	r2, r2, #3
	add	r2, r3
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #16]
	adds	r3, #200	
	lsls	r3, r3, #3
	add	r3, r1
	adds	r2, #4
	adds	r3, #4
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #16]
	adds	r3, #200	
	lsls	r3, r3, #3
	add	r3, r2
	adds	r3, #4
	add	r2, r7, #8
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
lab127: 	ldr	r3, [r7, #16]
	adds	r3, #1
	str	r3, [r7, #16]
lab126: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #2404]	
	ldr	r2, [r7, #16]
	cmp	r2, r3
	blt	lab128
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab125: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #2404]	
	ldr	r2, [r7, #20]
	cmp	r2, r3
	blt	lab129
	movs	r3, #0
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	str	r3, [r7, #20]
	b	lab130
lab134: 	ldr	r3, [r7, #20]
	lsls	r3, r3, #4
	add	r3, r2
	adds	r3, #12
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #4
	add	r3, r2
	adds	r3, #8
	ldr	r2, [r7, #16]
	str	r2, [r3, #0]
	b	lab131
lab133: 	ldr	r3, [r7, #20]
	lsls	r3, r3, #4
	add	r3, r2
	adds	r3, #12
	ldr	r3, [r3, #0]
	adds	r2, r3, #1
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #4
	add	r3, r1
	adds	r3, #12
	str	r2, [r3, #0]
	ldr	r3, [r7, #16]
	adds	r3, #1
	str	r3, [r7, #16]
lab131: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #2404]	
	ldr	r2, [r7, #16]
	cmp	r2, r3
	bge	lab132
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #16]
	adds	r3, #200	
	lsls	r3, r3, #3
	add	r3, r2
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #20]
	cmp	r2, r3
	beq	lab133
lab132: 	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab130: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #1600]	
	ldr	r2, [r7, #20]
	cmp	r2, r3
	blt	lab134
	nop
	nop
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
	movs	r0, r0
foo:
	push	{r7, lr}
	sub	sp, #32
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #24]
	ldr	r3, [r7, #40]	
	ldr	r2, [r7, #12]
	str	r2, [r3, #0]
	ldr	r3, [r7, #40]	
	ldr	r2, [r7, #8]
	str	r2, [r3, #4]
	ldr	r3, [r7, #40]	
	movs	r2, #1
	str	r2, [r3, #1600]	
	movs	r3, #0
	str	r3, [r7, #28]
	b	lab135
lab152: 	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #28]
	subs	r3, r2, r3
	mov	r1, r3
push {r1, r2}
	ldr r1, =0xb221e
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	get_op_len
	push {r1, r2}
	ldr r1, =0xb221e
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #20]
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #124	
	bne	lab136
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #2404]	
	cmp	r3, #99	
	ble	lab137
	mvn	r3, #7
	b	lab138
lab137: 	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #1600]	
	subs	r3, #1
	ldr	r2, [r7, #40]	
	lsls	r3, r3, #4
	add	r3, r2
	adds	r3, #4
	ldr	r3, [r3, #0]
	cmp	r3, #4294967295	
	bne	lab139
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #1600]	
	subs	r2, r3, #1
	b	lab140
lab139: 	ldr	r2, [r7, #24]
lab140: 	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #2404]	
	ldr	r1, [r7, #40]	
	adds	r3, #200	
	lsls	r3, r3, #3
	add	r3, r1
	str	r2, [r3, #4]
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #2404]	
	ldr	r1, [r7, #12]
	add	r2, r1
	ldr	r1, [r7, #40]	
	adds	r3, #200	
	lsls	r3, r3, #3
	add	r3, r1
	str	r2, [r3, #8]
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #2404]	
	adds	r2, r3, #1
	ldr	r3, [r7, #40]	
	str	r2, [r3, #2404]	
	b	lab141
lab136: 	ldr	r3, [r7, #28]
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #92	
	bne	lab142
	ldr	r3, [r7, #8]
	subs	r3, #1
	ldr	r2, [r7, #28]
	cmp	r2, r3
	blt	lab143
	mvn	r3, #5
	b	lab138
lab143: 	ldr	r3, [r7, #28]
	adds	r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #120	
	bne	lab144
	ldr	r3, [r7, #28]
	adds	r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #120	
	bne	lab145
	ldr	r3, [r7, #8]
	subs	r3, #3
	ldr	r2, [r7, #28]
	cmp	r2, r3
	blt	lab145
	mvn	r3, #5
	b	lab138
lab145: 	ldr	r3, [r7, #28]
	adds	r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #120	
	bne	lab141
	ldr	r3, [r7, #28]
	adds	r3, #2
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	adds	r3, #1
	ldr	r2, =_ctype_	
	add	r3, r2
	ldrb	r3, [r3, #0]
	and	r3, r3, #68	
	cmp	r3, #0
	beq	lab146
	ldr	r3, [r7, #28]
	adds	r3, #3
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	adds	r3, #1
	ldr	r2, =_ctype_	
	add	r3, r2
	ldrb	r3, [r3, #0]
	and	r3, r3, #68	
	cmp	r3, #0
	bne	lab141
lab146: 	mvn	r3, #5
	b	lab138
lab144: 	ldr	r3, [r7, #28]
	adds	r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	mov	r0, r3
	bl	is_metacharacter
	push {r1, r2}
	ldr r1, =0xcdb33
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	bne	lab141
	mvn	r3, #5
	b	lab138
lab142: 	ldr	r3, [r7, #28]
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #40	
	bne	lab147
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #1600]	
	cmp	r3, #99	
	ble	lab148
	mvn	r3, #8
	b	lab138
lab148: 	ldr	r3, [r7, #24]
	adds	r3, #1
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	adds	r2, r3, #1
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #1600]	
	ldr	r1, [r7, #12]
	add	r2, r1
	ldr	r1, [r7, #40]	
	lsls	r3, r3, #4
	add	r3, r1
	str	r2, [r3, #0]
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #1600]	
	ldr	r2, [r7, #40]	
	lsls	r3, r3, #4
	add	r3, r2
	adds	r3, #4
	mov	r2, #4294967295	
	str	r2, [r3, #0]
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #1600]	
	adds	r2, r3, #1
	ldr	r3, [r7, #40]	
	str	r2, [r3, #1600]	
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #2412]	
	cmp	r3, #0
	ble	lab141
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #1600]	
	subs	r2, r3, #1
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #2412]	
	cmp	r2, r3
	ble	lab141
	mvn	r3, #6
	b	lab138
lab147: 	ldr	r3, [r7, #28]
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #41	
	bne	lab141
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #1600]	
	subs	r3, #1
	ldr	r2, [r7, #40]	
	lsls	r3, r3, #4
	add	r3, r2
	adds	r3, #4
	ldr	r3, [r3, #0]
	cmp	r3, #4294967295	
	bne	lab149
	ldr	r3, [r7, #40]	
	ldr	r3, [r3, #1600]	
	subs	r3, #1
	b	lab150
lab149: 	ldr	r3, [r7, #24]
lab150: 	str	r3, [r7, #16]
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #12]
	add	r2, r3
	ldr	r1, [r7, #40]	
	ldr	r3, [r7, #16]
	lsls	r3, r3, #4
	add	r3, r1
	ldr	r3, [r3, #0]
	subs	r2, r2, r3
	ldr	r1, [r7, #40]	
	ldr	r3, [r7, #16]
	lsls	r3, r3, #4
	add	r3, r1
	adds	r3, #4
	str	r2, [r3, #0]
	ldr	r3, [r7, #24]
	subs	r3, #1
	str	r3, [r7, #24]
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bge	lab151
	mvn	r3, #2
	b	lab138
lab151: 	ldr	r3, [r7, #28]
	cmp	r3, #0
	ble	lab141
	ldr	r3, [r7, #28]
	subs	r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	cmp	r3, #40	
	bne	lab141
	mov	r3, #4294967295	
	b	lab138
lab141: 	ldr	r2, [r7, #28]
	ldr	r3, [r7, #20]
	add	r3, r2
	str	r3, [r7, #28]
lab135: 	ldr	r2, [r7, #28]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	blt	lab152
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	lab153
	mvn	r3, #2
	b	lab138
lab153: 	ldr	r0, [r7, #40]	
	bl	setup_branch_points
	ldr	r2, [r7, #40]	
	ldr	r1, [r7, #0]
	ldr	r0, [r7, #4]
	bl	baz
	push {r1, r2}
	ldr r1, =0x4f950
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
lab138: 	mov	r0, r3
	adds	r7, #32
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x4e59e
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	.ltorg
slre_match:
	push	{r4, r7, lr}
	subw	sp, sp, #2452	
	add	r7, sp, #8
	addw	r4, r7, #2440	
	subw	r4, r4, #2428	
	str	r0, [r4, #0]
	addw	r0, r7, #2440	
	sub	r0, r0, #2432	
	str	r1, [r0, #0]
	addw	r1, r7, #2440	
	subw	r1, r1, #2436	
	str	r2, [r1, #0]
	addw	r2, r7, #2440	
	subw	r2, r2, #2440	
	str	r3, [r2, #0]
	addw	r3, r7, #2440	
	subw	r3, r3, #2420	
	movs	r2, #0
	str	r2, [r3, #2404]	
	addw	r3, r7, #2440	
	subw	r3, r3, #2420	
	ldr	r2, [r3, #2404]	
	addw	r3, r7, #2440	
	subw	r3, r3, #2420	
	str	r2, [r3, #1600]	
	addw	r3, r7, #2440	
	subw	r3, r3, #2420	
	ldr	r2, [r3, #1600]	
	addw	r3, r7, #2440	
	subw	r3, r3, #2420	
	str	r2, [r3, #2416]	
	addw	r3, r7, #2440	
	subw	r3, r3, #2420	
	ldr	r2, [r7, #2456]	
	str	r2, [r3, #2412]	
	addw	r3, r7, #2440	
	subw	r3, r3, #2420	
	addw	r2, r7, #2440	
	subw	r2, r2, #2440	
	ldr	r2, [r2, #0]
	str	r2, [r3, #2408]	
	addw	r3, r7, #2440	
	subw	r3, r3, #2428	
	movs	r2, #4
	ldr	r1, =_ctype_2	
	ldr	r0, [r3, #0]
	bl	memcmp
	push {r1, r2}
	ldr r1, =0x271ae
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	bne	lab154
	addw	r3, r7, #2440	
	subw	r3, r3, #2420	
	ldr	r3, [r3, #2416]	
	orr	r2, r3, #1
	addw	r3, r7, #2440	
	subw	r3, r3, #2420	
	str	r2, [r3, #2416]	
	addw	r3, r7, #2440	
	subw	r3, r3, #2428	
	addw	r2, r7, #2440	
	subw	r2, r2, #2428	
	ldr	r2, [r2, #0]
	adds	r2, #4
	str	r2, [r3, #0]
lab154: 	addw	r3, r7, #2440	
	subw	r3, r3, #2428	
	ldr	r0, [r3, #0]
	bl	strlen
	mov	r3, r0
	mov	r4, r3
	addw	r3, r7, #2440	
	subw	r3, r3, #2436	
	addw	r2, r7, #2440	
	sub	r2, r2, #2432	
	addw	r1, r7, #2440	
	subw	r0, r1, #2428	
	add	r1, r7, #20
	str	r1, [sp, #0]
	ldr	r3, [r3, #0]
	ldr	r2, [r2, #0]
	mov	r1, r4
	ldr	r0, [r0, #0]
	bl	foo
	push {r1, r2}
	ldr r1, =0x8e6e4
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r0, r3
	addw	r7, r7, #2444	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x1c951
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, r7, pc}
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
	ldr r1, =0x3c59b
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x3c59b
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
	ldr r1, =0x84f4b
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #110	
push {r1, r2}
	ldr r1, =0x59e7a
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x59e7a
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x2a9d7
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark_body:
	push	{r7, lr}
	sub	sp, #40	
	add	r7, sp, #8
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #28]
	b	lab155
lab158: 	bl	strlen
	mov	r3, r0
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #24]
	b	lab156
lab157: 	ldr	r3, [r7, #24]
	ldr	r0, [r2, r3, lsl #2]
	add	r3, r7, #8
	movs	r2, #1
	str	r2, [sp, #0]
	ldr	r2, [r7, #20]
	ldr	r1, =text	
	bl	slre_match
	push {r1, r2}
	ldr r1, =0x9dc10
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	ldr	r3, [r7, #16]
	add	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #24]
	adds	r3, #1
	str	r3, [r7, #24]
lab156: 	ldr	r3, [r7, #24]
	cmp	r3, #3
	ble	lab157
	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab155: 	ldr	r2, [r7, #28]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab158
	ldr	r3, [r7, #16]
	mov	r0, r3
	adds	r7, #32
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0xc06e7
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.ltorg
verify_benchmark:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #102	
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
	ldr r1, =0x7879d
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	start_trigger
	bl	benchmark
	push {r1, r2}
	ldr r1, =0x72d11
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
	ldr r1, =0x4ad15
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x00019850	
	ldr	r5, =0x00019850	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab159
	movs	r4, #0
lab160: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x3a312
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x37524
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab160
lab159: 	ldr	r6, =0x00019858	
	ldr	r5, =0x00019850	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab161
	movs	r4, #0
lab162: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x5a312
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x57524
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab162
lab161:	cpsid f
	push {r1, r2}
	ldr r1, =0x28a6e
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, r6, pc}
	.ltorg
memcmp:
	cmp	r2, #3
	push	{r4, lr}
	bls	lab163
	orr	ip, r0, r1
	tst	ip, #3
	mov	r4, r0
	mov	r3, r1
	bne	lab164
lab165: 	mov	r0, r4
	ldr	lr, [r1]
	ldr	ip, [r0]
	cmp	ip, lr
	add	r4, r4, #4
	add	r3, r3, #4
	bne	lab164
	subs	r2, #4
	cmp	r2, #3
	mov	r0, r4
	mov	r1, r3
	bhi	lab165
lab163: 	subs	r4, r2, #1
	cbz	r2, lab166
lab170: 	subs	r1, #1
	b	lab167
lab169: 	beq	lab168
lab167: 	ldrb	lr, [ip, #1]!
	ldrb	r2, [r1, #1]!
	cmp	lr, r2
	sub	r3, r4, ip
	beq	lab169
	sub	r0, lr, r2
	cpsid f
	push {r1, r2}
	ldr r1, =0xb33b3
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, pc}
lab164: 	subs	r4, r2, #1
	b	lab170
lab168: 	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0xd33b3
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, pc}
lab166: 	mov	r0, r2
	cpsid f
	push {r1, r2}
	ldr r1, =0xf653a
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, pc}
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab171
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab172
	uxtb	r2, r1
	mov	r3, r0
	b	lab173
lab174: 	bcc	lab172
lab173: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab174
lab182: 	bls	lab175
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab176
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab177: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab177
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab178
lab183: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab179: 	cmp	r3, r2
	bne	lab179
	and	r4, ip, #3
lab175: 	cbz	r4, lab172
lab181: 	add	r4, r3
lab180: 	cmp	r4, r3
	bne	lab180
lab172:	cpsid f
	push {r1, r2}
	ldr r1, =0x23dd2
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, pc}
lab178: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab181
	b	lab172
lab171: 	mov	r3, r0
	mov	r4, r2
	b	lab182
lab176: 	mov	r2, r3
	mov	ip, r4
	b	lab183
strchr:
	ands	r1, r1, #255	
	mov	r3, r0
	beq	lab184
	lsls	r2, r0, #30
	bne	lab185
lab192: 	ldr	r4, [r0, #0]
	orr	lr, r1, r1, lsl #8
	orr	lr, lr, lr, lsl #16
	eor	r2, lr, r4
	sub	r3, r2, #16843009	
	bic	r3, r3, r2
	sub	r2, r4, #16843009	
	bic	r2, r2, r4
	orrs	r3, r2
	tst	r3, #2155905152	
	bne	lab186
lab187: 	eor	ip, r4, lr
	sub	r3, r4, #16843009	
	sub	r2, ip, #16843009	
	bic	r3, r3, r4
	bic	r2, r2, ip
	orrs	r3, r2
	tst	r3, #2155905152	
	beq	lab187
lab186: 	ldrb	r3, [r0, #0]
	cbnz	r3, lab188
	b	lab189
lab190: 	cmp	r3, #0
	beq	lab189
lab188: 	cmp	r1, r3
	bne	lab190
	cpsid f
	push {r1, r2}
	ldr r1, =0x2256d
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, pc}
lab193: 	beq	lab191
	lsls	r2, r3, #30
	mov	r0, r3
	beq	lab192
lab185: 	mov	r0, r3
	ldrb	r2, [r3], #1
	cmp	r2, #0
	bne	lab193
	mov	r0, r2
	cpsid f
	push {r1, r2}
	ldr r1, =0x6256d
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab195: 	mov	r0, r3
	beq	lab194
lab196: 	adds	r3, #1
	ldrb	r2, [r0, #0]
	cmp	r2, #0
	bne	lab195
lab191:	cpsid f
	push {r1, r2}
	ldr r1, =0xa256d
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	bx	lr
lab184: 	lsls	r2, r0, #30
	bne	lab196
lab194: 	ldr	r2, [r0, #0]
	sub	r3, r2, #16843009	
	bic	r3, r3, r2
	tst	r3, #2155905152	
	bne	lab197
lab198: 	sub	r3, r2, #16843009	
	bic	r3, r3, r2
	tst	r3, #2155905152	
	beq	lab198
lab197: 	ldrb	r3, [r0, #0]
	cmp	r3, #0
	beq	lab191
lab199: 	cmp	r3, #0
	bne	lab199
	cpsid f
	push {r1, r2}
	ldr r1, =0xe256d
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	bx	lr
lab189: 	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x1fd04
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, pc}
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
	movs	r0, r0
strlen:
	pld	[r0]
	strd	r4, r5, [sp, #-8]!
	bic	r1, r0, #7
	mvn	ip, #0
	ands	r4, r0, #7
	pld	[r1, #32]
	bne	lab200
	mov	r4, #0
	mvn	r0, #7
lab202: 	pld	[r1, #64]	
	add	r0, r0, #8
lab203: 	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab201
	ldrd	r2, r3, [r1, #8]
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab201
	ldrd	r2, r3, [r1, #16]
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cbnz	r3, lab201
	ldrd	r2, r3, [r1, #24]
	add	r1, r1, #32
	uadd8	r2, r2, ip
	add	r0, r0, #8
	sel	r2, r4, ip
	uadd8	r3, r3, ip
	sel	r3, r2, ip
	cmp	r3, #0
	beq	lab202
lab201: 	cmp	r2, #0
	itt	eq
	addeq	r0, #4
	moveq	r2, r3
	rev	r2, r2
	clz	r2, r2
	ldrd	r4, r5, [sp], #8
	add	r0, r0, r2, lsr #3
	bx	lr
lab200: 	ldrd	r2, r3, [r1]
	and	r5, r4, #3
	rsb	r0, r4, #0
	mov	r5, r5, lsl #3
	tst	r4, #4
	pld	[r1, #64]	
	lsl	r5, ip, r5
	orn	r2, r2, r5
	itt	ne
	ornne	r3, r3, r5
	movne	r2, ip
	mov	r4, #0
	b	lab203
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
	cbz	r6, lab204
	mov	r9, #1
	mov	sl, #0
lab210: 	subs	r5, r4, #1
	bmi	lab204
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab206: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab205
lab207: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab206
lab204: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab205: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab207
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab208
	blx	r2
lab213: 	cmp	r2, fp
	bne	lab209
lab212: 	cmp	r3, r6
	beq	lab207
	mov	r6, r3
	cmp	r6, #0
	bne	lab210
	b	lab204
lab208: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab211
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab212
lab209: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab210
	b	lab204
lab211: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab213
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =0x0001985c	
	ldr	r5, =0x00019858	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab214
	subs	r3, #4
	add	r5, r3
lab215: 	ldr	r3, [r5], #-4
	cpsid f
	push {r1, r2}
	ldr r1, =0x41420
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r4, #0
	push {r1, r2}
	ldr r1, =0x22d7e
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab215
lab214: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab216
lab220: 	cmp	r5, #31
	bgt	lab217
	cbnz	r6, lab218
lab219: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab221:	cpsid f
	push {r1, r2}
	ldr r1, =0x261c4
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 lab218: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab219
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab219
lab216: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab220
lab217: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab221
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

_ctype_2:
	.word	0x29693f28
	.word	0x00000000
	.word	0x29626128
	.word	0x0000002b
	.word	0x2b2e6228
	.word	0x00002b29
	.word	0x62615b61
	.word	0x00002a5d
	.word	0x62615b28
	.word	0x5b5d635e
	.word	0x635e6261
	.word	0x002b295d
	.word	0x2928245e
	.word	0x2a5d5b2e
	.word	0x5c7c3f2b
	.word	0x00647353
_ctype_:
	.word	0x20202000
	.word	0x20202020
	.word	0x28282020
	.word	0x20282828
	.word	0x20202020
	.word	0x20202020
	.word	0x20202020
	.word	0x20202020
	.word	0x10108820
	.word	0x10101010
	.word	0x10101010
	.word	0x10101010
	.word	0x04040410
	.word	0x04040404
	.word	0x10040404
	.word	0x10101010
	.word	0x41411010
	.word	0x41414141
	.word	0x01010101
	.word	0x01010101
	.word	0x01010101
	.word	0x01010101
	.word	0x01010101
	.word	0x10101010
	.word	0x42421010
	.word	0x42424242
	.word	0x02020202
	.word	0x02020202
	.word	0x02020202
	.word	0x02020202
	.word	0x02020202
	.word	0x10101010
	.word	0x00000020
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
_global_impure_ptr:
	.word	0x000198a8


	.data

text:
	.word	0x62626261
	.word	0x62616261
	.word	0x63626161
	.word	0x61626163
	.word	0x63616362
	.word	0x63626362
	.word	0x62626162
	.word	0x62636261
	.word	0x61636261
	.word	0x62626362
	.word	0x61626263
	.word	0x00000063
regexes:
	.word	0x00009704
	.word	0x0000970c
	.word	0x00009714
	.word	0x0000971c
metacharacters.0:
	.word	0x0000972c
	.word	0x00000000
impure_data:
	.word	0x00000000
	.word	0x00019b94
	.word	0x00019bfc
	.word	0x00019c64
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
	.word	0x00019cf0


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
__lock___atexit_recursive_mutex:
	.word	0x00000000
