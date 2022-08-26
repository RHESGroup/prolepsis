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
	ldr r1, =0xa1109
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =0x00000000	
	cbz	r3, lab1
	ldr	r0, =0x00009101	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	ldr r1, =0x65e85
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
	ldr	r0, =0x0000b7e8	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	ldr r1, =0xee89f
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
	ldr	r0, =0x0000b7e8	
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
	ldr	r2, =0x0001c24c	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	ldr r1, =0x02fff
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
	ldr	r0, =0x000090f5	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x00009101	
push {r1, r2}
	ldr r1, =0x14b0a
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	atexit
lab7:	push {r1, r2}
	ldr r1, =0x14b0a
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	bl	__libc_init_array
	push {r1, r2}
	ldr r1, =0x23534
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, r4
	movs	r1, r5
	bl	main
	push {r1, r2}
	ldr r1, =0x5c550
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	exit
	nop
	.ltorg
_aes_set_key:
	push	{r7, lr}
	sub	sp, #32
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	lab8
	movs	r0, #1
	bl	exit
lab8: 	ldr	r3, [r7, #12]
	adds	r3, #1
	lsls	r3, r3, #2
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #24]
	ldr	r3, =rcon.0	
	str	r3, [r7, #28]
	b	lab9
lab10: 	lsls	r3, r3, #2
	adds	r3, #3
	ldr	r2, [r7, #0]
	add	r3, r2
	ldrb	r3, [r3, #0]
	lsls	r2, r3, #24
	ldr	r3, [r7, #24]
	lsls	r3, r3, #2
	adds	r3, #2
	ldr	r1, [r7, #0]
	add	r3, r1
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #24]
	lsls	r3, r3, #2
	adds	r3, #1
	ldr	r1, [r7, #0]
	add	r3, r1
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #8
	orrs	r2, r3
	ldr	r3, [r7, #24]
	lsls	r3, r3, #2
	ldr	r1, [r7, #0]
	add	r3, r1
	ldrb	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, [r7, #24]
	lsls	r3, r3, #2
	ldr	r1, [r7, #4]
	add	r3, r1
	orrs	r2, r0
	str	r2, [r3, #0]
	ldr	r3, [r7, #24]
	adds	r3, #1
	str	r3, [r7, #24]
lab9: 	ldr	r2, [r7, #24]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bcc	lab10
	ldr	r3, [r7, #8]
	str	r3, [r7, #24]
	b	lab11
lab14: 	add	r3, r3, #1073741824	
	subs	r3, #1
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r3, [r3, #0]
	str	r3, [r7, #20]
	ldr	r3, [r7, #24]
	ldr	r2, [r7, #8]
	udiv	r2, r3, r2
	ldr	r1, [r7, #8]
	mul	r2, r1, r2
	subs	r3, r3, r2
	cmp	r3, #0
	bne	lab12
	ldr	r3, [r7, #20]
	mov	r3, r3, ror #8
	uxtb	r3, r3
	ldr	r2, =_aes_encrypt_table	
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r3, [r7, #20]
	mov	r3, r3, ror #8
	lsrs	r3, r3, #8
	uxtb	r3, r3
	ldr	r2, =_aes_encrypt_table	
	ldrb	r3, [r2, r3]
	lsls	r3, r3, #8
	orr	r2, r1, r3
	ldr	r3, [r7, #20]
	mov	r3, r3, ror #8
	lsrs	r3, r3, #16
	uxtb	r3, r3
	ldr	r1, =_aes_encrypt_table	
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #20]
	mov	r3, r3, ror #8
	lsrs	r3, r3, #24
	ldr	r1, =_aes_encrypt_table	
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #24
	orrs	r2, r3
	ldr	r3, [r7, #28]
	adds	r1, r3, #1
	str	r1, [r7, #28]
	ldrb	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #20]
	b	lab13
lab12: 	ldr	r3, [r7, #8]
	cmp	r3, #6
	bls	lab13
	ldr	r3, [r7, #24]
	ldr	r2, [r7, #8]
	udiv	r2, r3, r2
	ldr	r1, [r7, #8]
	mul	r2, r1, r2
	subs	r3, r3, r2
	cmp	r3, #4
	bne	lab13
	ldr	r3, [r7, #20]
	uxtb	r3, r3
	ldr	r2, =_aes_encrypt_table	
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #8
	uxtb	r3, r3
	ldr	r2, =_aes_encrypt_table	
	ldrb	r3, [r2, r3]
	lsls	r3, r3, #8
	orr	r2, r1, r3
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #16
	uxtb	r3, r3
	ldr	r1, =_aes_encrypt_table	
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #24
	ldr	r1, =_aes_encrypt_table	
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #24
	orrs	r3, r2
	str	r3, [r7, #20]
lab13: 	ldr	r2, [r7, #24]
	ldr	r3, [r7, #8]
	subs	r3, r2, r3
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #24]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r2, [r7, #20]
	eors	r2, r1
	str	r2, [r3, #0]
	ldr	r3, [r7, #24]
	adds	r3, #1
	str	r3, [r7, #24]
lab11: 	ldr	r2, [r7, #24]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	bcc	lab14
	nop
	nop
	adds	r7, #32
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x31fda
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.ltorg
aes_set_encrypt_key:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #8]
	cmp	r3, #15
	bhi	lab15
	movs	r0, #1
	bl	exit
lab15: 	ldr	r3, [r7, #8]
	cmp	r3, #32
	bls	lab16
	movs	r0, #1
	bl	exit
lab16: 	ldr	r3, [r7, #8]
	cmp	r3, #32
	bne	lab17
	movs	r3, #8
	str	r3, [r7, #20]
	movs	r3, #14
	str	r3, [r7, #16]
	b	lab18
lab17: 	ldr	r3, [r7, #8]
	cmp	r3, #23
	bls	lab19
	movs	r3, #6
	str	r3, [r7, #20]
	movs	r3, #12
	str	r3, [r7, #16]
	b	lab18
lab19: 	movs	r3, #4
	str	r3, [r7, #20]
	movs	r3, #10
	str	r3, [r7, #16]
lab18: 	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r2, r3, #4
	ldr	r3, [r7, #4]
	ldr	r1, [r7, #20]
	ldr	r0, [r7, #16]
	bl	_aes_set_key
	push {r1, r2}
	ldr r1, =0x3444b
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	nop
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x6c7b2
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
_nettle_aes_invert:
	push	{r7}
	sub	sp, #52	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bne	lab20
	movs	r3, #0
	str	r3, [r7, #44]	
	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	str	r3, [r7, #40]	
	b	lab21
lab24: 	str	r3, [r7, #36]	
	b	lab22
lab23: 	ldr	r3, [r7, #36]	
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #8]
	add	r3, r2
	ldr	r3, [r3, #0]
	str	r3, [r7, #28]
	ldr	r2, [r7, #40]	
	ldr	r3, [r7, #36]	
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #8]
	add	r2, r3
	ldr	r1, [r7, #44]	
	ldr	r3, [r7, #36]	
	add	r3, r1
	lsls	r3, r3, #2
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r2, [r7, #40]	
	ldr	r3, [r7, #36]	
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #8]
	add	r3, r2
	ldr	r2, [r7, #28]
	str	r2, [r3, #0]
	ldr	r3, [r7, #36]	
	adds	r3, #1
	str	r3, [r7, #36]	
lab22: 	ldr	r3, [r7, #36]	
	cmp	r3, #3
	bls	lab23
	ldr	r3, [r7, #44]	
	adds	r3, #4
	str	r3, [r7, #44]	
	ldr	r3, [r7, #40]	
	subs	r3, #4
	str	r3, [r7, #40]	
lab21: 	ldr	r2, [r7, #44]	
	ldr	r3, [r7, #40]	
	cmp	r2, r3
	bcc	lab24
	b	lab25
lab20: 	movs	r3, #0
	str	r3, [r7, #44]	
	b	lab26
lab29: 	str	r3, [r7, #32]
	b	lab27
lab28: 	lsls	r2, r3, #2
	ldr	r3, [r7, #44]	
	subs	r2, r2, r3
	ldr	r3, [r7, #32]
	add	r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r2, r3
	ldr	r1, [r7, #44]	
	ldr	r3, [r7, #32]
	add	r3, r1
	lsls	r3, r3, #2
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [r7, #32]
	adds	r3, #1
	str	r3, [r7, #32]
lab27: 	ldr	r3, [r7, #32]
	cmp	r3, #3
	bls	lab28
	ldr	r3, [r7, #44]	
	adds	r3, #4
	str	r3, [r7, #44]	
lab26: 	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	ldr	r2, [r7, #44]	
	cmp	r2, r3
	bls	lab29
lab25: 	movs	r3, #4
	str	r3, [r7, #44]	
	b	lab30
lab31: 	lsls	r3, r3, #2
	ldr	r2, [r7, #8]
	add	r3, r2
	ldr	r3, [r3, #0]
	str	r3, [r7, #24]
	ldr	r3, [r7, #24]
	uxtb	r3, r3
	ldr	r2, =mtable	
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r7, #20]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	str	r3, [r7, #24]
	ldr	r3, [r7, #24]
	uxtb	r3, r3
	ldr	r2, =mtable	
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	mov	r3, r3, ror #24
	ldr	r2, [r7, #20]
	eors	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	str	r3, [r7, #24]
	ldr	r3, [r7, #24]
	uxtb	r3, r3
	ldr	r2, =mtable	
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	mov	r3, r3, ror #16
	ldr	r2, [r7, #20]
	eors	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	str	r3, [r7, #24]
	ldr	r3, [r7, #24]
	uxtb	r3, r3
	ldr	r2, =mtable	
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	mov	r3, r3, ror #8
	ldr	r2, [r7, #20]
	eors	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #44]	
	lsls	r3, r3, #2
	ldr	r2, [r7, #8]
	add	r3, r2
	ldr	r2, [r7, #20]
	str	r2, [r3, #0]
	ldr	r3, [r7, #44]	
	adds	r3, #1
	str	r3, [r7, #44]	
lab30: 	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	ldr	r2, [r7, #44]	
	cmp	r2, r3
	bcc	lab31
	nop
	nop
	adds	r7, #52	
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
aes_invert_key:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r1, r3, #4
	ldr	r3, [r7, #0]
	adds	r3, #4
	mov	r2, r3
	bl	_nettle_aes_invert
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	str	r2, [r3, #0]
	nop
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x2f301
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
aes_set_decrypt_key:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
push {r1, r2}
	ldr r1, =0x0ae9a
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	aes_set_encrypt_key
	push {r1, r2}
	ldr r1, =0x0ae9a
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r1, [r7, #12]
	ldr	r0, [r7, #12]
	bl	aes_invert_key
	push {r1, r2}
	ldr r1, =0x0a48a
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x65961
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
_nettle_aes_encrypt:
	push	{r7, lr}
	sub	sp, #56	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #0]
	and	r3, r3, #15
	cmp	r3, #0
	beq	lab32
	movs	r0, #1
	bl	exit
lab35: 	adds	r3, #3
	ldrb	r3, [r3, #0]
	lsls	r2, r3, #24
	ldr	r3, [r7, #68]	
	adds	r3, #2
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #68]	
	adds	r3, #1
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #68]	
	ldrb	r2, [r2, #0]
	orrs	r2, r3
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #52]	
	ldr	r3, [r7, #68]	
	adds	r3, #7
	ldrb	r3, [r3, #0]
	lsls	r2, r3, #24
	ldr	r3, [r7, #68]	
	adds	r3, #6
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #68]	
	adds	r3, #5
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #68]	
	adds	r2, #4
	ldrb	r2, [r2, #0]
	orrs	r2, r3
	ldr	r3, [r7, #8]
	adds	r3, #4
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #48]	
	ldr	r3, [r7, #68]	
	adds	r3, #11
	ldrb	r3, [r3, #0]
	lsls	r2, r3, #24
	ldr	r3, [r7, #68]	
	adds	r3, #10
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #68]	
	adds	r3, #9
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #68]	
	adds	r2, #8
	ldrb	r2, [r2, #0]
	orrs	r2, r3
	ldr	r3, [r7, #8]
	adds	r3, #8
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #44]	
	ldr	r3, [r7, #68]	
	adds	r3, #15
	ldrb	r3, [r3, #0]
	lsls	r2, r3, #24
	ldr	r3, [r7, #68]	
	adds	r3, #14
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #68]	
	adds	r3, #13
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #68]	
	adds	r2, #12
	ldrb	r2, [r2, #0]
	orrs	r2, r3
	ldr	r3, [r7, #8]
	adds	r3, #12
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #40]	
	movs	r3, #1
	str	r3, [r7, #36]	
	b	lab33
lab34: 	uxtb	r2, r3
	ldr	r3, [r7, #4]
	adds	r2, #64	
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #8
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #320	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #16
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #576	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #40]	
	lsrs	r1, r3, #24
	ldr	r3, [r7, #4]
	add	r1, r1, #832	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #32]
	ldr	r3, [r7, #48]	
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	adds	r2, #64	
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #8
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #320	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #16
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #576	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #52]	
	lsrs	r1, r3, #24
	ldr	r3, [r7, #4]
	add	r1, r1, #832	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #4
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #28]
	ldr	r3, [r7, #44]	
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	adds	r2, #64	
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #8
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #320	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #16
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #576	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #48]	
	lsrs	r1, r3, #24
	ldr	r3, [r7, #4]
	add	r1, r1, #832	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #8
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #40]	
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	adds	r2, #64	
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #8
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #320	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #16
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #576	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #44]	
	lsrs	r1, r3, #24
	ldr	r3, [r7, #4]
	add	r1, r1, #832	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #12
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #32]
	str	r3, [r7, #52]	
	ldr	r3, [r7, #28]
	str	r3, [r7, #48]	
	ldr	r3, [r7, #24]
	str	r3, [r7, #44]	
	ldr	r3, [r7, #20]
	str	r3, [r7, #40]	
	ldr	r3, [r7, #36]	
	adds	r3, #1
	str	r3, [r7, #36]	
lab33: 	ldr	r2, [r7, #36]	
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bcc	lab34
	ldr	r3, [r7, #52]	
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #8
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	lsls	r3, r3, #8
	orr	r2, r1, r3
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #16
	uxtb	r3, r3
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #24
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #24
	orrs	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #32]
	ldr	r3, [r7, #48]	
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #8
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	lsls	r3, r3, #8
	orr	r2, r1, r3
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #16
	uxtb	r3, r3
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #24
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #24
	orrs	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #4
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #28]
	ldr	r3, [r7, #44]	
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #8
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	lsls	r3, r3, #8
	orr	r2, r1, r3
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #16
	uxtb	r3, r3
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #24
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #24
	orrs	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #8
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #40]	
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #8
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	lsls	r3, r3, #8
	orr	r2, r1, r3
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #16
	uxtb	r3, r3
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #24
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #24
	orrs	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #12
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #32]
	lsrs	r2, r3, #24
	ldr	r3, [r7, #64]	
	adds	r3, #3
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #32]
	lsrs	r2, r3, #16
	ldr	r3, [r7, #64]	
	adds	r3, #2
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #32]
	lsrs	r2, r3, #8
	ldr	r3, [r7, #64]	
	adds	r3, #1
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #32]
	uxtb	r2, r3
	ldr	r3, [r7, #64]	
	strb	r2, [r3, #0]
	ldr	r3, [r7, #28]
	lsrs	r2, r3, #24
	ldr	r3, [r7, #64]	
	adds	r3, #7
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #28]
	lsrs	r2, r3, #16
	ldr	r3, [r7, #64]	
	adds	r3, #6
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #28]
	lsrs	r2, r3, #8
	ldr	r3, [r7, #64]	
	adds	r3, #5
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #4
	ldr	r2, [r7, #28]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #24]
	lsrs	r2, r3, #24
	ldr	r3, [r7, #64]	
	adds	r3, #11
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #24]
	lsrs	r2, r3, #16
	ldr	r3, [r7, #64]	
	adds	r3, #10
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #24]
	lsrs	r2, r3, #8
	ldr	r3, [r7, #64]	
	adds	r3, #9
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #8
	ldr	r2, [r7, #24]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	lsrs	r2, r3, #24
	ldr	r3, [r7, #64]	
	adds	r3, #15
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	lsrs	r2, r3, #16
	ldr	r3, [r7, #64]	
	adds	r3, #14
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	lsrs	r2, r3, #8
	ldr	r3, [r7, #64]	
	adds	r3, #13
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #12
	ldr	r2, [r7, #20]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #0]
	subs	r3, #16
	str	r3, [r7, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #16
	str	r3, [r7, #64]	
	ldr	r3, [r7, #68]	
	adds	r3, #16
	str	r3, [r7, #68]	
lab32: 	ldr	r3, [r7, #0]
	cmp	r3, #0
	bne	lab35
	nop
	nop
	adds	r7, #56	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x8b994
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
_nettle_aes_decrypt:
	push	{r7, lr}
	sub	sp, #56	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #0]
	and	r3, r3, #15
	cmp	r3, #0
	beq	lab36
	movs	r0, #1
	bl	exit
lab39: 	adds	r3, #3
	ldrb	r3, [r3, #0]
	lsls	r2, r3, #24
	ldr	r3, [r7, #68]	
	adds	r3, #2
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #68]	
	adds	r3, #1
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #68]	
	ldrb	r2, [r2, #0]
	orrs	r2, r3
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #52]	
	ldr	r3, [r7, #68]	
	adds	r3, #7
	ldrb	r3, [r3, #0]
	lsls	r2, r3, #24
	ldr	r3, [r7, #68]	
	adds	r3, #6
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #68]	
	adds	r3, #5
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #68]	
	adds	r2, #4
	ldrb	r2, [r2, #0]
	orrs	r2, r3
	ldr	r3, [r7, #8]
	adds	r3, #4
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #48]	
	ldr	r3, [r7, #68]	
	adds	r3, #11
	ldrb	r3, [r3, #0]
	lsls	r2, r3, #24
	ldr	r3, [r7, #68]	
	adds	r3, #10
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #68]	
	adds	r3, #9
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #68]	
	adds	r2, #8
	ldrb	r2, [r2, #0]
	orrs	r2, r3
	ldr	r3, [r7, #8]
	adds	r3, #8
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #44]	
	ldr	r3, [r7, #68]	
	adds	r3, #15
	ldrb	r3, [r3, #0]
	lsls	r2, r3, #24
	ldr	r3, [r7, #68]	
	adds	r3, #14
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #68]	
	adds	r3, #13
	ldrb	r3, [r3, #0]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #68]	
	adds	r2, #12
	ldrb	r2, [r2, #0]
	orrs	r2, r3
	ldr	r3, [r7, #8]
	adds	r3, #12
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #40]	
	movs	r3, #1
	str	r3, [r7, #36]	
	b	lab37
lab38: 	uxtb	r2, r3
	ldr	r3, [r7, #4]
	adds	r2, #64	
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #8
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #320	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #16
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #576	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #48]	
	lsrs	r1, r3, #24
	ldr	r3, [r7, #4]
	add	r1, r1, #832	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #32]
	ldr	r3, [r7, #48]	
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	adds	r2, #64	
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #8
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #320	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #16
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #576	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #44]	
	lsrs	r1, r3, #24
	ldr	r3, [r7, #4]
	add	r1, r1, #832	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #4
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #28]
	ldr	r3, [r7, #44]	
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	adds	r2, #64	
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #8
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #320	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #16
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #576	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #40]	
	lsrs	r1, r3, #24
	ldr	r3, [r7, #4]
	add	r1, r1, #832	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #8
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #40]	
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	adds	r2, #64	
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #8
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #320	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #16
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	add	r1, r1, #576	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #52]	
	lsrs	r1, r3, #24
	ldr	r3, [r7, #4]
	add	r1, r1, #832	
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #12
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #32]
	str	r3, [r7, #52]	
	ldr	r3, [r7, #28]
	str	r3, [r7, #48]	
	ldr	r3, [r7, #24]
	str	r3, [r7, #44]	
	ldr	r3, [r7, #20]
	str	r3, [r7, #40]	
	ldr	r3, [r7, #36]	
	adds	r3, #1
	str	r3, [r7, #36]	
lab37: 	ldr	r2, [r7, #36]	
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bcc	lab38
	ldr	r3, [r7, #52]	
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #8
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	lsls	r3, r3, #8
	orr	r2, r1, r3
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #16
	uxtb	r3, r3
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #24
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #24
	orrs	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #32]
	ldr	r3, [r7, #48]	
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #8
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	lsls	r3, r3, #8
	orr	r2, r1, r3
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #16
	uxtb	r3, r3
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #24
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #24
	orrs	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #4
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #28]
	ldr	r3, [r7, #44]	
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #8
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	lsls	r3, r3, #8
	orr	r2, r1, r3
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #16
	uxtb	r3, r3
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #40]	
	lsrs	r3, r3, #24
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #24
	orrs	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #8
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #40]	
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r3, [r7, #44]	
	lsrs	r3, r3, #8
	uxtb	r3, r3
	ldr	r2, [r7, #4]
	ldrb	r3, [r2, r3]
	lsls	r3, r3, #8
	orr	r2, r1, r3
	ldr	r3, [r7, #48]	
	lsrs	r3, r3, #16
	uxtb	r3, r3
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #52]	
	lsrs	r3, r3, #24
	ldr	r1, [r7, #4]
	ldrb	r3, [r1, r3]
	lsls	r3, r3, #24
	orrs	r2, r3
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #4
	adds	r3, #12
	ldr	r1, [r7, #8]
	add	r3, r1
	ldr	r3, [r3, #0]
	eors	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #32]
	lsrs	r2, r3, #24
	ldr	r3, [r7, #64]	
	adds	r3, #3
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #32]
	lsrs	r2, r3, #16
	ldr	r3, [r7, #64]	
	adds	r3, #2
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #32]
	lsrs	r2, r3, #8
	ldr	r3, [r7, #64]	
	adds	r3, #1
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #32]
	uxtb	r2, r3
	ldr	r3, [r7, #64]	
	strb	r2, [r3, #0]
	ldr	r3, [r7, #28]
	lsrs	r2, r3, #24
	ldr	r3, [r7, #64]	
	adds	r3, #7
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #28]
	lsrs	r2, r3, #16
	ldr	r3, [r7, #64]	
	adds	r3, #6
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #28]
	lsrs	r2, r3, #8
	ldr	r3, [r7, #64]	
	adds	r3, #5
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #4
	ldr	r2, [r7, #28]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #24]
	lsrs	r2, r3, #24
	ldr	r3, [r7, #64]	
	adds	r3, #11
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #24]
	lsrs	r2, r3, #16
	ldr	r3, [r7, #64]	
	adds	r3, #10
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #24]
	lsrs	r2, r3, #8
	ldr	r3, [r7, #64]	
	adds	r3, #9
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #8
	ldr	r2, [r7, #24]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	lsrs	r2, r3, #24
	ldr	r3, [r7, #64]	
	adds	r3, #15
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	lsrs	r2, r3, #16
	ldr	r3, [r7, #64]	
	adds	r3, #14
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	lsrs	r2, r3, #8
	ldr	r3, [r7, #64]	
	adds	r3, #13
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #12
	ldr	r2, [r7, #20]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #0]
	subs	r3, #16
	str	r3, [r7, #0]
	ldr	r3, [r7, #64]	
	adds	r3, #16
	str	r3, [r7, #64]	
	ldr	r3, [r7, #68]	
	adds	r3, #16
	str	r3, [r7, #68]	
lab36: 	ldr	r3, [r7, #0]
	cmp	r3, #0
	bne	lab39
	nop
	nop
	adds	r7, #56	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x02d73
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
aes_encrypt:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #8
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #8]
	and	r3, r3, #15
	cmp	r3, #0
	beq	lab40
	movs	r0, #1
	bl	exit
lab40: 	ldr	r3, [r7, #12]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r1, r3, #4
	ldr	r3, [r7, #0]
	str	r3, [sp, #4]
	ldr	r3, [r7, #4]
	str	r3, [sp, #0]
	ldr	r3, [r7, #8]
	ldr	r2, =_aes_encrypt_table	
	bl	_nettle_aes_encrypt
	push {r1, r2}
	ldr r1, =0x64a0e
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0xeb2cd
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.ltorg
aes_decrypt:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #8
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #8]
	and	r3, r3, #15
	cmp	r3, #0
	beq	lab41
	movs	r0, #1
	bl	exit
lab41: 	ldr	r3, [r7, #12]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r1, r3, #4
	ldr	r3, [r7, #0]
	str	r3, [sp, #4]
	ldr	r3, [r7, #4]
	str	r3, [sp, #0]
	ldr	r3, [r7, #8]
	ldr	r2, =_aes_decrypt_table	
	bl	_nettle_aes_decrypt
	push {r1, r2}
	ldr r1, =0xb6a18
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x106af
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.ltorg
verify_benchmark:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #1
	strb	r3, [r7, #15]
	movs	r3, #0
	str	r3, [r7, #8]
	b	lab42
lab45: 	ldr	r3, [r7, #8]
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r1, =expected	
	ldr	r3, [r7, #8]
	add	r3, r1
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab43
	movs	r3, #0
	strb	r3, [r7, #15]
lab43: 	ldr	r2, =plaintext	
	ldr	r3, [r7, #8]
	add	r3, r2
	ldrb	r2, [r3, #0]
	ldr	r1, =decrypted	
	ldr	r3, [r7, #8]
	add	r3, r1
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab44
	movs	r3, #0
	strb	r3, [r7, #15]
lab44: 	ldr	r3, [r7, #8]
	adds	r3, #1
	str	r3, [r7, #8]
lab42: 	ldr	r3, [r7, #8]
	cmp	r3, #255	
	bls	lab45
	ldrb	r3, [r7, #15]
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
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
	ldr r1, =0x1a4c9
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x1a4c9
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
	ldr r1, =0x11561
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #78	
push {r1, r2}
	ldr r1, =0x9a4c9
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x9a4c9
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0xdcd66
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
	b	lab46
lab47: 	movs	r1, #32
	ldr	r0, =encctx	
push {r1, r2}
	ldr r1, =0x8ae9a
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	aes_set_encrypt_key
	push {r1, r2}
	ldr r1, =0x8ae9a
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =plaintext	
	ldr	r2, =encrypted	
	mov	r1, #256	
	ldr	r0, =encctx	
	bl	aes_encrypt
	push {r1, r2}
	ldr r1, =0x096bb
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r2, =key	
	movs	r1, #32
	ldr	r0, =decctx	
	bl	aes_set_decrypt_key
	push {r1, r2}
	ldr r1, =0x80ac4
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =encrypted	
	ldr	r2, =decrypted	
	mov	r1, #256	
	ldr	r0, =decctx	
	bl	aes_decrypt
	push {r1, r2}
	ldr r1, =0x690dc
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab46: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab47
	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x4a6b5
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
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
	ldr r1, =0xa3427
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	start_trigger
	bl	benchmark
	push {r1, r2}
	ldr r1, =0x14c93
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
	ldr r1, =0x18438
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x0001b7ec	
	ldr	r5, =0x0001b7ec	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab48
	movs	r4, #0
lab49: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x58682
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x54b0a
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab49
lab48: 	ldr	r6, =0x0001b7f4	
	ldr	r5, =0x0001b7ec	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab50
	movs	r4, #0
lab51: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x8f299
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x94b0a
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab51
lab50:	cpsid f
	push {r1, r2}
	ldr r1, =0x4ce6e
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, r6, pc}
	.ltorg
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab52
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab53
	uxtb	r2, r1
	mov	r3, r0
	b	lab54
lab55: 	bcc	lab53
lab54: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab55
lab63: 	bls	lab56
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab57
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab58: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab58
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab59
lab64: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab60: 	cmp	r3, r2
	bne	lab60
	and	r4, ip, #3
lab56: 	cbz	r4, lab53
lab62: 	add	r4, r3
lab61: 	cmp	r4, r3
	bne	lab61
lab53:	cpsid f
	push {r1, r2}
	ldr r1, =0x31989
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, pc}
lab59: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab62
	b	lab53
lab52: 	mov	r3, r0
	mov	r4, r2
	b	lab63
lab57: 	mov	r2, r3
	mov	ip, r4
	b	lab64
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
	cbz	r6, lab65
	mov	r9, #1
	mov	sl, #0
lab71: 	subs	r5, r4, #1
	bmi	lab65
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab67: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab66
lab68: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab67
lab65: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab66: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab68
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab69
	blx	r2
lab74: 	cmp	r2, fp
	bne	lab70
lab73: 	cmp	r3, r6
	beq	lab68
	mov	r6, r3
	cmp	r6, #0
	bne	lab71
	b	lab65
lab69: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab72
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab73
lab70: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab71
	b	lab65
lab72: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab74
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =key	
	ldr	r5, =0x0001b7f4	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab75
	subs	r3, #4
	add	r5, r3
lab76: 	ldr	r3, [r5], #-4
	cpsid f
	push {r1, r2}
	ldr r1, =0x4a51d
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r4, #0
	push {r1, r2}
	ldr r1, =0x078a8
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab76
lab75: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab77
lab81: 	cmp	r5, #31
	bgt	lab78
	cbnz	r6, lab79
lab80: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab82:	cpsid f
	push {r1, r2}
	ldr r1, =0x1ceef
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 lab79: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab80
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab80
lab77: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab81
lab78: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab82
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

_aes_encrypt_table:
	.word	0x7b777c63
	.word	0xc56f6bf2
	.word	0x2b670130
	.word	0x76abd7fe
	.word	0x7dc982ca
	.word	0xf04759fa
	.word	0xafa2d4ad
	.word	0xc072a49c
	.word	0x2693fdb7
	.word	0xccf73f36
	.word	0xf1e5a534
	.word	0x1531d871
	.word	0xc323c704
	.word	0x9a059618
	.word	0xe2801207
	.word	0x75b227eb
	.word	0x1a2c8309
	.word	0xa05a6e1b
	.word	0xb3d63b52
	.word	0x842fe329
	.word	0xed00d153
	.word	0x5bb1fc20
	.word	0x39becb6a
	.word	0xcf584c4a
	.word	0xfbaaefd0
	.word	0x85334d43
	.word	0x7f02f945
	.word	0xa89f3c50
	.word	0x8f40a351
	.word	0xf5389d92
	.word	0x21dab6bc
	.word	0xd2f3ff10
	.word	0xec130ccd
	.word	0x1744975f
	.word	0x3d7ea7c4
	.word	0x73195d64
	.word	0xdc4f8160
	.word	0x88902a22
	.word	0x14b8ee46
	.word	0xdb0b5ede
	.word	0x0a3a32e0
	.word	0x5c240649
	.word	0x62acd3c2
	.word	0x79e49591
	.word	0x6d37c8e7
	.word	0xa94ed58d
	.word	0xeaf4566c
	.word	0x08ae7a65
	.word	0x2e2578ba
	.word	0xc6b4a61c
	.word	0x1f74dde8
	.word	0x8a8bbd4b
	.word	0x66b53e70
	.word	0x0ef60348
	.word	0xb9573561
	.word	0x9e1dc186
	.word	0x1198f8e1
	.word	0x948ed969
	.word	0xe9871e9b
	.word	0xdf2855ce
	.word	0x0d89a18c
	.word	0x6842e6bf
	.word	0x0f2d9941
	.word	0x16bb54b0
	.word	0xa56363c6
	.word	0x847c7cf8
	.word	0x997777ee
	.word	0x8d7b7bf6
	.word	0x0df2f2ff
	.word	0xbd6b6bd6
	.word	0xb16f6fde
	.word	0x54c5c591
	.word	0x50303060
	.word	0x03010102
	.word	0xa96767ce
	.word	0x7d2b2b56
	.word	0x19fefee7
	.word	0x62d7d7b5
	.word	0xe6abab4d
	.word	0x9a7676ec
	.word	0x45caca8f
	.word	0x9d82821f
	.word	0x40c9c989
	.word	0x877d7dfa
	.word	0x15fafaef
	.word	0xeb5959b2
	.word	0xc947478e
	.word	0x0bf0f0fb
	.word	0xecadad41
	.word	0x67d4d4b3
	.word	0xfda2a25f
	.word	0xeaafaf45
	.word	0xbf9c9c23
	.word	0xf7a4a453
	.word	0x967272e4
	.word	0x5bc0c09b
	.word	0xc2b7b775
	.word	0x1cfdfde1
	.word	0xae93933d
	.word	0x6a26264c
	.word	0x5a36366c
	.word	0x413f3f7e
	.word	0x02f7f7f5
	.word	0x4fcccc83
	.word	0x5c343468
	.word	0xf4a5a551
	.word	0x34e5e5d1
	.word	0x08f1f1f9
	.word	0x937171e2
	.word	0x73d8d8ab
	.word	0x53313162
	.word	0x3f15152a
	.word	0x0c040408
	.word	0x52c7c795
	.word	0x65232346
	.word	0x5ec3c39d
	.word	0x28181830
	.word	0xa1969637
	.word	0x0f05050a
	.word	0xb59a9a2f
	.word	0x0907070e
	.word	0x36121224
	.word	0x9b80801b
	.word	0x3de2e2df
	.word	0x26ebebcd
	.word	0x6927274e
	.word	0xcdb2b27f
	.word	0x9f7575ea
	.word	0x1b090912
	.word	0x9e83831d
	.word	0x742c2c58
	.word	0x2e1a1a34
	.word	0x2d1b1b36
	.word	0xb26e6edc
	.word	0xee5a5ab4
	.word	0xfba0a05b
	.word	0xf65252a4
	.word	0x4d3b3b76
	.word	0x61d6d6b7
	.word	0xceb3b37d
	.word	0x7b292952
	.word	0x3ee3e3dd
	.word	0x712f2f5e
	.word	0x97848413
	.word	0xf55353a6
	.word	0x68d1d1b9
	.word	0x00000000
	.word	0x2cededc1
	.word	0x60202040
	.word	0x1ffcfce3
	.word	0xc8b1b179
	.word	0xed5b5bb6
	.word	0xbe6a6ad4
	.word	0x46cbcb8d
	.word	0xd9bebe67
	.word	0x4b393972
	.word	0xde4a4a94
	.word	0xd44c4c98
	.word	0xe85858b0
	.word	0x4acfcf85
	.word	0x6bd0d0bb
	.word	0x2aefefc5
	.word	0xe5aaaa4f
	.word	0x16fbfbed
	.word	0xc5434386
	.word	0xd74d4d9a
	.word	0x55333366
	.word	0x94858511
	.word	0xcf45458a
	.word	0x10f9f9e9
	.word	0x06020204
	.word	0x817f7ffe
	.word	0xf05050a0
	.word	0x443c3c78
	.word	0xba9f9f25
	.word	0xe3a8a84b
	.word	0xf35151a2
	.word	0xfea3a35d
	.word	0xc0404080
	.word	0x8a8f8f05
	.word	0xad92923f
	.word	0xbc9d9d21
	.word	0x48383870
	.word	0x04f5f5f1
	.word	0xdfbcbc63
	.word	0xc1b6b677
	.word	0x75dadaaf
	.word	0x63212142
	.word	0x30101020
	.word	0x1affffe5
	.word	0x0ef3f3fd
	.word	0x6dd2d2bf
	.word	0x4ccdcd81
	.word	0x140c0c18
	.word	0x35131326
	.word	0x2fececc3
	.word	0xe15f5fbe
	.word	0xa2979735
	.word	0xcc444488
	.word	0x3917172e
	.word	0x57c4c493
	.word	0xf2a7a755
	.word	0x827e7efc
	.word	0x473d3d7a
	.word	0xac6464c8
	.word	0xe75d5dba
	.word	0x2b191932
	.word	0x957373e6
	.word	0xa06060c0
	.word	0x98818119
	.word	0xd14f4f9e
	.word	0x7fdcdca3
	.word	0x66222244
	.word	0x7e2a2a54
	.word	0xab90903b
	.word	0x8388880b
	.word	0xca46468c
	.word	0x29eeeec7
	.word	0xd3b8b86b
	.word	0x3c141428
	.word	0x79dedea7
	.word	0xe25e5ebc
	.word	0x1d0b0b16
	.word	0x76dbdbad
	.word	0x3be0e0db
	.word	0x56323264
	.word	0x4e3a3a74
	.word	0x1e0a0a14
	.word	0xdb494992
	.word	0x0a06060c
	.word	0x6c242448
	.word	0xe45c5cb8
	.word	0x5dc2c29f
	.word	0x6ed3d3bd
	.word	0xefacac43
	.word	0xa66262c4
	.word	0xa8919139
	.word	0xa4959531
	.word	0x37e4e4d3
	.word	0x8b7979f2
	.word	0x32e7e7d5
	.word	0x43c8c88b
	.word	0x5937376e
	.word	0xb76d6dda
	.word	0x8c8d8d01
	.word	0x64d5d5b1
	.word	0xd24e4e9c
	.word	0xe0a9a949
	.word	0xb46c6cd8
	.word	0xfa5656ac
	.word	0x07f4f4f3
	.word	0x25eaeacf
	.word	0xaf6565ca
	.word	0x8e7a7af4
	.word	0xe9aeae47
	.word	0x18080810
	.word	0xd5baba6f
	.word	0x887878f0
	.word	0x6f25254a
	.word	0x722e2e5c
	.word	0x241c1c38
	.word	0xf1a6a657
	.word	0xc7b4b473
	.word	0x51c6c697
	.word	0x23e8e8cb
	.word	0x7cdddda1
	.word	0x9c7474e8
	.word	0x211f1f3e
	.word	0xdd4b4b96
	.word	0xdcbdbd61
	.word	0x868b8b0d
	.word	0x858a8a0f
	.word	0x907070e0
	.word	0x423e3e7c
	.word	0xc4b5b571
	.word	0xaa6666cc
	.word	0xd8484890
	.word	0x05030306
	.word	0x01f6f6f7
	.word	0x120e0e1c
	.word	0xa36161c2
	.word	0x5f35356a
	.word	0xf95757ae
	.word	0xd0b9b969
	.word	0x91868617
	.word	0x58c1c199
	.word	0x271d1d3a
	.word	0xb99e9e27
	.word	0x38e1e1d9
	.word	0x13f8f8eb
	.word	0xb398982b
	.word	0x33111122
	.word	0xbb6969d2
	.word	0x70d9d9a9
	.word	0x898e8e07
	.word	0xa7949433
	.word	0xb69b9b2d
	.word	0x221e1e3c
	.word	0x92878715
	.word	0x20e9e9c9
	.word	0x49cece87
	.word	0xff5555aa
	.word	0x78282850
	.word	0x7adfdfa5
	.word	0x8f8c8c03
	.word	0xf8a1a159
	.word	0x80898909
	.word	0x170d0d1a
	.word	0xdabfbf65
	.word	0x31e6e6d7
	.word	0xc6424284
	.word	0xb86868d0
	.word	0xc3414182
	.word	0xb0999929
	.word	0x772d2d5a
	.word	0x110f0f1e
	.word	0xcbb0b07b
	.word	0xfc5454a8
	.word	0xd6bbbb6d
	.word	0x3a16162c
	.word	0x6363c6a5
	.word	0x7c7cf884
	.word	0x7777ee99
	.word	0x7b7bf68d
	.word	0xf2f2ff0d
	.word	0x6b6bd6bd
	.word	0x6f6fdeb1
	.word	0xc5c59154
	.word	0x30306050
	.word	0x01010203
	.word	0x6767cea9
	.word	0x2b2b567d
	.word	0xfefee719
	.word	0xd7d7b562
	.word	0xabab4de6
	.word	0x7676ec9a
	.word	0xcaca8f45
	.word	0x82821f9d
	.word	0xc9c98940
	.word	0x7d7dfa87
	.word	0xfafaef15
	.word	0x5959b2eb
	.word	0x47478ec9
	.word	0xf0f0fb0b
	.word	0xadad41ec
	.word	0xd4d4b367
	.word	0xa2a25ffd
	.word	0xafaf45ea
	.word	0x9c9c23bf
	.word	0xa4a453f7
	.word	0x7272e496
	.word	0xc0c09b5b
	.word	0xb7b775c2
	.word	0xfdfde11c
	.word	0x93933dae
	.word	0x26264c6a
	.word	0x36366c5a
	.word	0x3f3f7e41
	.word	0xf7f7f502
	.word	0xcccc834f
	.word	0x3434685c
	.word	0xa5a551f4
	.word	0xe5e5d134
	.word	0xf1f1f908
	.word	0x7171e293
	.word	0xd8d8ab73
	.word	0x31316253
	.word	0x15152a3f
	.word	0x0404080c
	.word	0xc7c79552
	.word	0x23234665
	.word	0xc3c39d5e
	.word	0x18183028
	.word	0x969637a1
	.word	0x05050a0f
	.word	0x9a9a2fb5
	.word	0x07070e09
	.word	0x12122436
	.word	0x80801b9b
	.word	0xe2e2df3d
	.word	0xebebcd26
	.word	0x27274e69
	.word	0xb2b27fcd
	.word	0x7575ea9f
	.word	0x0909121b
	.word	0x83831d9e
	.word	0x2c2c5874
	.word	0x1a1a342e
	.word	0x1b1b362d
	.word	0x6e6edcb2
	.word	0x5a5ab4ee
	.word	0xa0a05bfb
	.word	0x5252a4f6
	.word	0x3b3b764d
	.word	0xd6d6b761
	.word	0xb3b37dce
	.word	0x2929527b
	.word	0xe3e3dd3e
	.word	0x2f2f5e71
	.word	0x84841397
	.word	0x5353a6f5
	.word	0xd1d1b968
	.word	0x00000000
	.word	0xededc12c
	.word	0x20204060
	.word	0xfcfce31f
	.word	0xb1b179c8
	.word	0x5b5bb6ed
	.word	0x6a6ad4be
	.word	0xcbcb8d46
	.word	0xbebe67d9
	.word	0x3939724b
	.word	0x4a4a94de
	.word	0x4c4c98d4
	.word	0x5858b0e8
	.word	0xcfcf854a
	.word	0xd0d0bb6b
	.word	0xefefc52a
	.word	0xaaaa4fe5
	.word	0xfbfbed16
	.word	0x434386c5
	.word	0x4d4d9ad7
	.word	0x33336655
	.word	0x85851194
	.word	0x45458acf
	.word	0xf9f9e910
	.word	0x02020406
	.word	0x7f7ffe81
	.word	0x5050a0f0
	.word	0x3c3c7844
	.word	0x9f9f25ba
	.word	0xa8a84be3
	.word	0x5151a2f3
	.word	0xa3a35dfe
	.word	0x404080c0
	.word	0x8f8f058a
	.word	0x92923fad
	.word	0x9d9d21bc
	.word	0x38387048
	.word	0xf5f5f104
	.word	0xbcbc63df
	.word	0xb6b677c1
	.word	0xdadaaf75
	.word	0x21214263
	.word	0x10102030
	.word	0xffffe51a
	.word	0xf3f3fd0e
	.word	0xd2d2bf6d
	.word	0xcdcd814c
	.word	0x0c0c1814
	.word	0x13132635
	.word	0xececc32f
	.word	0x5f5fbee1
	.word	0x979735a2
	.word	0x444488cc
	.word	0x17172e39
	.word	0xc4c49357
	.word	0xa7a755f2
	.word	0x7e7efc82
	.word	0x3d3d7a47
	.word	0x6464c8ac
	.word	0x5d5dbae7
	.word	0x1919322b
	.word	0x7373e695
	.word	0x6060c0a0
	.word	0x81811998
	.word	0x4f4f9ed1
	.word	0xdcdca37f
	.word	0x22224466
	.word	0x2a2a547e
	.word	0x90903bab
	.word	0x88880b83
	.word	0x46468cca
	.word	0xeeeec729
	.word	0xb8b86bd3
	.word	0x1414283c
	.word	0xdedea779
	.word	0x5e5ebce2
	.word	0x0b0b161d
	.word	0xdbdbad76
	.word	0xe0e0db3b
	.word	0x32326456
	.word	0x3a3a744e
	.word	0x0a0a141e
	.word	0x494992db
	.word	0x06060c0a
	.word	0x2424486c
	.word	0x5c5cb8e4
	.word	0xc2c29f5d
	.word	0xd3d3bd6e
	.word	0xacac43ef
	.word	0x6262c4a6
	.word	0x919139a8
	.word	0x959531a4
	.word	0xe4e4d337
	.word	0x7979f28b
	.word	0xe7e7d532
	.word	0xc8c88b43
	.word	0x37376e59
	.word	0x6d6ddab7
	.word	0x8d8d018c
	.word	0xd5d5b164
	.word	0x4e4e9cd2
	.word	0xa9a949e0
	.word	0x6c6cd8b4
	.word	0x5656acfa
	.word	0xf4f4f307
	.word	0xeaeacf25
	.word	0x6565caaf
	.word	0x7a7af48e
	.word	0xaeae47e9
	.word	0x08081018
	.word	0xbaba6fd5
	.word	0x7878f088
	.word	0x25254a6f
	.word	0x2e2e5c72
	.word	0x1c1c3824
	.word	0xa6a657f1
	.word	0xb4b473c7
	.word	0xc6c69751
	.word	0xe8e8cb23
	.word	0xdddda17c
	.word	0x7474e89c
	.word	0x1f1f3e21
	.word	0x4b4b96dd
	.word	0xbdbd61dc
	.word	0x8b8b0d86
	.word	0x8a8a0f85
	.word	0x7070e090
	.word	0x3e3e7c42
	.word	0xb5b571c4
	.word	0x6666ccaa
	.word	0x484890d8
	.word	0x03030605
	.word	0xf6f6f701
	.word	0x0e0e1c12
	.word	0x6161c2a3
	.word	0x35356a5f
	.word	0x5757aef9
	.word	0xb9b969d0
	.word	0x86861791
	.word	0xc1c19958
	.word	0x1d1d3a27
	.word	0x9e9e27b9
	.word	0xe1e1d938
	.word	0xf8f8eb13
	.word	0x98982bb3
	.word	0x11112233
	.word	0x6969d2bb
	.word	0xd9d9a970
	.word	0x8e8e0789
	.word	0x949433a7
	.word	0x9b9b2db6
	.word	0x1e1e3c22
	.word	0x87871592
	.word	0xe9e9c920
	.word	0xcece8749
	.word	0x5555aaff
	.word	0x28285078
	.word	0xdfdfa57a
	.word	0x8c8c038f
	.word	0xa1a159f8
	.word	0x89890980
	.word	0x0d0d1a17
	.word	0xbfbf65da
	.word	0xe6e6d731
	.word	0x424284c6
	.word	0x6868d0b8
	.word	0x414182c3
	.word	0x999929b0
	.word	0x2d2d5a77
	.word	0x0f0f1e11
	.word	0xb0b07bcb
	.word	0x5454a8fc
	.word	0xbbbb6dd6
	.word	0x16162c3a
	.word	0x63c6a563
	.word	0x7cf8847c
	.word	0x77ee9977
	.word	0x7bf68d7b
	.word	0xf2ff0df2
	.word	0x6bd6bd6b
	.word	0x6fdeb16f
	.word	0xc59154c5
	.word	0x30605030
	.word	0x01020301
	.word	0x67cea967
	.word	0x2b567d2b
	.word	0xfee719fe
	.word	0xd7b562d7
	.word	0xab4de6ab
	.word	0x76ec9a76
	.word	0xca8f45ca
	.word	0x821f9d82
	.word	0xc98940c9
	.word	0x7dfa877d
	.word	0xfaef15fa
	.word	0x59b2eb59
	.word	0x478ec947
	.word	0xf0fb0bf0
	.word	0xad41ecad
	.word	0xd4b367d4
	.word	0xa25ffda2
	.word	0xaf45eaaf
	.word	0x9c23bf9c
	.word	0xa453f7a4
	.word	0x72e49672
	.word	0xc09b5bc0
	.word	0xb775c2b7
	.word	0xfde11cfd
	.word	0x933dae93
	.word	0x264c6a26
	.word	0x366c5a36
	.word	0x3f7e413f
	.word	0xf7f502f7
	.word	0xcc834fcc
	.word	0x34685c34
	.word	0xa551f4a5
	.word	0xe5d134e5
	.word	0xf1f908f1
	.word	0x71e29371
	.word	0xd8ab73d8
	.word	0x31625331
	.word	0x152a3f15
	.word	0x04080c04
	.word	0xc79552c7
	.word	0x23466523
	.word	0xc39d5ec3
	.word	0x18302818
	.word	0x9637a196
	.word	0x050a0f05
	.word	0x9a2fb59a
	.word	0x070e0907
	.word	0x12243612
	.word	0x801b9b80
	.word	0xe2df3de2
	.word	0xebcd26eb
	.word	0x274e6927
	.word	0xb27fcdb2
	.word	0x75ea9f75
	.word	0x09121b09
	.word	0x831d9e83
	.word	0x2c58742c
	.word	0x1a342e1a
	.word	0x1b362d1b
	.word	0x6edcb26e
	.word	0x5ab4ee5a
	.word	0xa05bfba0
	.word	0x52a4f652
	.word	0x3b764d3b
	.word	0xd6b761d6
	.word	0xb37dceb3
	.word	0x29527b29
	.word	0xe3dd3ee3
	.word	0x2f5e712f
	.word	0x84139784
	.word	0x53a6f553
	.word	0xd1b968d1
	.word	0x00000000
	.word	0xedc12ced
	.word	0x20406020
	.word	0xfce31ffc
	.word	0xb179c8b1
	.word	0x5bb6ed5b
	.word	0x6ad4be6a
	.word	0xcb8d46cb
	.word	0xbe67d9be
	.word	0x39724b39
	.word	0x4a94de4a
	.word	0x4c98d44c
	.word	0x58b0e858
	.word	0xcf854acf
	.word	0xd0bb6bd0
	.word	0xefc52aef
	.word	0xaa4fe5aa
	.word	0xfbed16fb
	.word	0x4386c543
	.word	0x4d9ad74d
	.word	0x33665533
	.word	0x85119485
	.word	0x458acf45
	.word	0xf9e910f9
	.word	0x02040602
	.word	0x7ffe817f
	.word	0x50a0f050
	.word	0x3c78443c
	.word	0x9f25ba9f
	.word	0xa84be3a8
	.word	0x51a2f351
	.word	0xa35dfea3
	.word	0x4080c040
	.word	0x8f058a8f
	.word	0x923fad92
	.word	0x9d21bc9d
	.word	0x38704838
	.word	0xf5f104f5
	.word	0xbc63dfbc
	.word	0xb677c1b6
	.word	0xdaaf75da
	.word	0x21426321
	.word	0x10203010
	.word	0xffe51aff
	.word	0xf3fd0ef3
	.word	0xd2bf6dd2
	.word	0xcd814ccd
	.word	0x0c18140c
	.word	0x13263513
	.word	0xecc32fec
	.word	0x5fbee15f
	.word	0x9735a297
	.word	0x4488cc44
	.word	0x172e3917
	.word	0xc49357c4
	.word	0xa755f2a7
	.word	0x7efc827e
	.word	0x3d7a473d
	.word	0x64c8ac64
	.word	0x5dbae75d
	.word	0x19322b19
	.word	0x73e69573
	.word	0x60c0a060
	.word	0x81199881
	.word	0x4f9ed14f
	.word	0xdca37fdc
	.word	0x22446622
	.word	0x2a547e2a
	.word	0x903bab90
	.word	0x880b8388
	.word	0x468cca46
	.word	0xeec729ee
	.word	0xb86bd3b8
	.word	0x14283c14
	.word	0xdea779de
	.word	0x5ebce25e
	.word	0x0b161d0b
	.word	0xdbad76db
	.word	0xe0db3be0
	.word	0x32645632
	.word	0x3a744e3a
	.word	0x0a141e0a
	.word	0x4992db49
	.word	0x060c0a06
	.word	0x24486c24
	.word	0x5cb8e45c
	.word	0xc29f5dc2
	.word	0xd3bd6ed3
	.word	0xac43efac
	.word	0x62c4a662
	.word	0x9139a891
	.word	0x9531a495
	.word	0xe4d337e4
	.word	0x79f28b79
	.word	0xe7d532e7
	.word	0xc88b43c8
	.word	0x376e5937
	.word	0x6ddab76d
	.word	0x8d018c8d
	.word	0xd5b164d5
	.word	0x4e9cd24e
	.word	0xa949e0a9
	.word	0x6cd8b46c
	.word	0x56acfa56
	.word	0xf4f307f4
	.word	0xeacf25ea
	.word	0x65caaf65
	.word	0x7af48e7a
	.word	0xae47e9ae
	.word	0x08101808
	.word	0xba6fd5ba
	.word	0x78f08878
	.word	0x254a6f25
	.word	0x2e5c722e
	.word	0x1c38241c
	.word	0xa657f1a6
	.word	0xb473c7b4
	.word	0xc69751c6
	.word	0xe8cb23e8
	.word	0xdda17cdd
	.word	0x74e89c74
	.word	0x1f3e211f
	.word	0x4b96dd4b
	.word	0xbd61dcbd
	.word	0x8b0d868b
	.word	0x8a0f858a
	.word	0x70e09070
	.word	0x3e7c423e
	.word	0xb571c4b5
	.word	0x66ccaa66
	.word	0x4890d848
	.word	0x03060503
	.word	0xf6f701f6
	.word	0x0e1c120e
	.word	0x61c2a361
	.word	0x356a5f35
	.word	0x57aef957
	.word	0xb969d0b9
	.word	0x86179186
	.word	0xc19958c1
	.word	0x1d3a271d
	.word	0x9e27b99e
	.word	0xe1d938e1
	.word	0xf8eb13f8
	.word	0x982bb398
	.word	0x11223311
	.word	0x69d2bb69
	.word	0xd9a970d9
	.word	0x8e07898e
	.word	0x9433a794
	.word	0x9b2db69b
	.word	0x1e3c221e
	.word	0x87159287
	.word	0xe9c920e9
	.word	0xce8749ce
	.word	0x55aaff55
	.word	0x28507828
	.word	0xdfa57adf
	.word	0x8c038f8c
	.word	0xa159f8a1
	.word	0x89098089
	.word	0x0d1a170d
	.word	0xbf65dabf
	.word	0xe6d731e6
	.word	0x4284c642
	.word	0x68d0b868
	.word	0x4182c341
	.word	0x9929b099
	.word	0x2d5a772d
	.word	0x0f1e110f
	.word	0xb07bcbb0
	.word	0x54a8fc54
	.word	0xbb6dd6bb
	.word	0x162c3a16
	.word	0xc6a56363
	.word	0xf8847c7c
	.word	0xee997777
	.word	0xf68d7b7b
	.word	0xff0df2f2
	.word	0xd6bd6b6b
	.word	0xdeb16f6f
	.word	0x9154c5c5
	.word	0x60503030
	.word	0x02030101
	.word	0xcea96767
	.word	0x567d2b2b
	.word	0xe719fefe
	.word	0xb562d7d7
	.word	0x4de6abab
	.word	0xec9a7676
	.word	0x8f45caca
	.word	0x1f9d8282
	.word	0x8940c9c9
	.word	0xfa877d7d
	.word	0xef15fafa
	.word	0xb2eb5959
	.word	0x8ec94747
	.word	0xfb0bf0f0
	.word	0x41ecadad
	.word	0xb367d4d4
	.word	0x5ffda2a2
	.word	0x45eaafaf
	.word	0x23bf9c9c
	.word	0x53f7a4a4
	.word	0xe4967272
	.word	0x9b5bc0c0
	.word	0x75c2b7b7
	.word	0xe11cfdfd
	.word	0x3dae9393
	.word	0x4c6a2626
	.word	0x6c5a3636
	.word	0x7e413f3f
	.word	0xf502f7f7
	.word	0x834fcccc
	.word	0x685c3434
	.word	0x51f4a5a5
	.word	0xd134e5e5
	.word	0xf908f1f1
	.word	0xe2937171
	.word	0xab73d8d8
	.word	0x62533131
	.word	0x2a3f1515
	.word	0x080c0404
	.word	0x9552c7c7
	.word	0x46652323
	.word	0x9d5ec3c3
	.word	0x30281818
	.word	0x37a19696
	.word	0x0a0f0505
	.word	0x2fb59a9a
	.word	0x0e090707
	.word	0x24361212
	.word	0x1b9b8080
	.word	0xdf3de2e2
	.word	0xcd26ebeb
	.word	0x4e692727
	.word	0x7fcdb2b2
	.word	0xea9f7575
	.word	0x121b0909
	.word	0x1d9e8383
	.word	0x58742c2c
	.word	0x342e1a1a
	.word	0x362d1b1b
	.word	0xdcb26e6e
	.word	0xb4ee5a5a
	.word	0x5bfba0a0
	.word	0xa4f65252
	.word	0x764d3b3b
	.word	0xb761d6d6
	.word	0x7dceb3b3
	.word	0x527b2929
	.word	0xdd3ee3e3
	.word	0x5e712f2f
	.word	0x13978484
	.word	0xa6f55353
	.word	0xb968d1d1
	.word	0x00000000
	.word	0xc12ceded
	.word	0x40602020
	.word	0xe31ffcfc
	.word	0x79c8b1b1
	.word	0xb6ed5b5b
	.word	0xd4be6a6a
	.word	0x8d46cbcb
	.word	0x67d9bebe
	.word	0x724b3939
	.word	0x94de4a4a
	.word	0x98d44c4c
	.word	0xb0e85858
	.word	0x854acfcf
	.word	0xbb6bd0d0
	.word	0xc52aefef
	.word	0x4fe5aaaa
	.word	0xed16fbfb
	.word	0x86c54343
	.word	0x9ad74d4d
	.word	0x66553333
	.word	0x11948585
	.word	0x8acf4545
	.word	0xe910f9f9
	.word	0x04060202
	.word	0xfe817f7f
	.word	0xa0f05050
	.word	0x78443c3c
	.word	0x25ba9f9f
	.word	0x4be3a8a8
	.word	0xa2f35151
	.word	0x5dfea3a3
	.word	0x80c04040
	.word	0x058a8f8f
	.word	0x3fad9292
	.word	0x21bc9d9d
	.word	0x70483838
	.word	0xf104f5f5
	.word	0x63dfbcbc
	.word	0x77c1b6b6
	.word	0xaf75dada
	.word	0x42632121
	.word	0x20301010
	.word	0xe51affff
	.word	0xfd0ef3f3
	.word	0xbf6dd2d2
	.word	0x814ccdcd
	.word	0x18140c0c
	.word	0x26351313
	.word	0xc32fecec
	.word	0xbee15f5f
	.word	0x35a29797
	.word	0x88cc4444
	.word	0x2e391717
	.word	0x9357c4c4
	.word	0x55f2a7a7
	.word	0xfc827e7e
	.word	0x7a473d3d
	.word	0xc8ac6464
	.word	0xbae75d5d
	.word	0x322b1919
	.word	0xe6957373
	.word	0xc0a06060
	.word	0x19988181
	.word	0x9ed14f4f
	.word	0xa37fdcdc
	.word	0x44662222
	.word	0x547e2a2a
	.word	0x3bab9090
	.word	0x0b838888
	.word	0x8cca4646
	.word	0xc729eeee
	.word	0x6bd3b8b8
	.word	0x283c1414
	.word	0xa779dede
	.word	0xbce25e5e
	.word	0x161d0b0b
	.word	0xad76dbdb
	.word	0xdb3be0e0
	.word	0x64563232
	.word	0x744e3a3a
	.word	0x141e0a0a
	.word	0x92db4949
	.word	0x0c0a0606
	.word	0x486c2424
	.word	0xb8e45c5c
	.word	0x9f5dc2c2
	.word	0xbd6ed3d3
	.word	0x43efacac
	.word	0xc4a66262
	.word	0x39a89191
	.word	0x31a49595
	.word	0xd337e4e4
	.word	0xf28b7979
	.word	0xd532e7e7
	.word	0x8b43c8c8
	.word	0x6e593737
	.word	0xdab76d6d
	.word	0x018c8d8d
	.word	0xb164d5d5
	.word	0x9cd24e4e
	.word	0x49e0a9a9
	.word	0xd8b46c6c
	.word	0xacfa5656
	.word	0xf307f4f4
	.word	0xcf25eaea
	.word	0xcaaf6565
	.word	0xf48e7a7a
	.word	0x47e9aeae
	.word	0x10180808
	.word	0x6fd5baba
	.word	0xf0887878
	.word	0x4a6f2525
	.word	0x5c722e2e
	.word	0x38241c1c
	.word	0x57f1a6a6
	.word	0x73c7b4b4
	.word	0x9751c6c6
	.word	0xcb23e8e8
	.word	0xa17cdddd
	.word	0xe89c7474
	.word	0x3e211f1f
	.word	0x96dd4b4b
	.word	0x61dcbdbd
	.word	0x0d868b8b
	.word	0x0f858a8a
	.word	0xe0907070
	.word	0x7c423e3e
	.word	0x71c4b5b5
	.word	0xccaa6666
	.word	0x90d84848
	.word	0x06050303
	.word	0xf701f6f6
	.word	0x1c120e0e
	.word	0xc2a36161
	.word	0x6a5f3535
	.word	0xaef95757
	.word	0x69d0b9b9
	.word	0x17918686
	.word	0x9958c1c1
	.word	0x3a271d1d
	.word	0x27b99e9e
	.word	0xd938e1e1
	.word	0xeb13f8f8
	.word	0x2bb39898
	.word	0x22331111
	.word	0xd2bb6969
	.word	0xa970d9d9
	.word	0x07898e8e
	.word	0x33a79494
	.word	0x2db69b9b
	.word	0x3c221e1e
	.word	0x15928787
	.word	0xc920e9e9
	.word	0x8749cece
	.word	0xaaff5555
	.word	0x50782828
	.word	0xa57adfdf
	.word	0x038f8c8c
	.word	0x59f8a1a1
	.word	0x09808989
	.word	0x1a170d0d
	.word	0x65dabfbf
	.word	0xd731e6e6
	.word	0x84c64242
	.word	0xd0b86868
	.word	0x82c34141
	.word	0x29b09999
	.word	0x5a772d2d
	.word	0x1e110f0f
	.word	0x7bcbb0b0
	.word	0xa8fc5454
	.word	0x6dd6bbbb
	.word	0x2c3a1616
_aes_decrypt_table:
	.word	0xd56a0952
	.word	0x38a53630
	.word	0x9ea340bf
	.word	0xfbd7f381
	.word	0x8239e37c
	.word	0x87ff2f9b
	.word	0x44438e34
	.word	0xcbe9dec4
	.word	0x32947b54
	.word	0x3d23c2a6
	.word	0x0b954cee
	.word	0x4ec3fa42
	.word	0x66a12e08
	.word	0xb224d928
	.word	0x49a25b76
	.word	0x25d18b6d
	.word	0x64f6f872
	.word	0x16986886
	.word	0xcc5ca4d4
	.word	0x92b6655d
	.word	0x5048706c
	.word	0xdab9edfd
	.word	0x5746155e
	.word	0x849d8da7
	.word	0x00abd890
	.word	0x0ad3bc8c
	.word	0x0558e4f7
	.word	0x0645b3b8
	.word	0x8f1e2cd0
	.word	0x020f3fca
	.word	0x03bdafc1
	.word	0x6b8a1301
	.word	0x4111913a
	.word	0xeadc674f
	.word	0xcecff297
	.word	0x73e6b4f0
	.word	0x2274ac96
	.word	0x8535ade7
	.word	0xe837f9e2
	.word	0x6edf751c
	.word	0x711af147
	.word	0x89c5291d
	.word	0x0e62b76f
	.word	0x1bbe18aa
	.word	0x4b3e56fc
	.word	0x2079d2c6
	.word	0xfec0db9a
	.word	0xf45acd78
	.word	0x33a8dd1f
	.word	0x31c70788
	.word	0x591012b1
	.word	0x5fec8027
	.word	0xa97f5160
	.word	0x0d4ab519
	.word	0x9f7ae52d
	.word	0xef9cc993
	.word	0x4d3be0a0
	.word	0xb0f52aae
	.word	0x3cbbebc8
	.word	0x61995383
	.word	0x7e042b17
	.word	0x26d677ba
	.word	0x631469e1
	.word	0x7d0c2155
	.word	0x50a7f451
	.word	0x5365417e
	.word	0xc3a4171a
	.word	0x965e273a
	.word	0xcb6bab3b
	.word	0xf1459d1f
	.word	0xab58faac
	.word	0x9303e34b
	.word	0x55fa3020
	.word	0xf66d76ad
	.word	0x9176cc88
	.word	0x254c02f5
	.word	0xfcd7e54f
	.word	0xd7cb2ac5
	.word	0x80443526
	.word	0x8fa362b5
	.word	0x495ab1de
	.word	0x671bba25
	.word	0x980eea45
	.word	0xe1c0fe5d
	.word	0x02752fc3
	.word	0x12f04c81
	.word	0xa397468d
	.word	0xc6f9d36b
	.word	0xe75f8f03
	.word	0x959c9215
	.word	0xeb7a6dbf
	.word	0xda595295
	.word	0x2d83bed4
	.word	0xd3217458
	.word	0x2969e049
	.word	0x44c8c98e
	.word	0x6a89c275
	.word	0x78798ef4
	.word	0x6b3e5899
	.word	0xdd71b927
	.word	0xb64fe1be
	.word	0x17ad88f0
	.word	0x66ac20c9
	.word	0xb43ace7d
	.word	0x184adf63
	.word	0x82311ae5
	.word	0x60335197
	.word	0x457f5362
	.word	0xe07764b1
	.word	0x84ae6bbb
	.word	0x1ca081fe
	.word	0x942b08f9
	.word	0x58684870
	.word	0x19fd458f
	.word	0x876cde94
	.word	0xb7f87b52
	.word	0x23d373ab
	.word	0xe2024b72
	.word	0x578f1fe3
	.word	0x2aab5566
	.word	0x0728ebb2
	.word	0x03c2b52f
	.word	0x9a7bc586
	.word	0xa50837d3
	.word	0xf2872830
	.word	0xb2a5bf23
	.word	0xba6a0302
	.word	0x5c8216ed
	.word	0x2b1ccf8a
	.word	0x92b479a7
	.word	0xf0f207f3
	.word	0xa1e2694e
	.word	0xcdf4da65
	.word	0xd5be0506
	.word	0x1f6234d1
	.word	0x8afea6c4
	.word	0x9d532e34
	.word	0xa055f3a2
	.word	0x32e18a05
	.word	0x75ebf6a4
	.word	0x39ec830b
	.word	0xaaef6040
	.word	0x069f715e
	.word	0x51106ebd
	.word	0xf98a213e
	.word	0x3d06dd96
	.word	0xae053edd
	.word	0x46bde64d
	.word	0xb58d5491
	.word	0x055dc471
	.word	0x6fd40604
	.word	0xff155060
	.word	0x24fb9819
	.word	0x97e9bdd6
	.word	0xcc434089
	.word	0x779ed967
	.word	0xbd42e8b0
	.word	0x888b8907
	.word	0x385b19e7
	.word	0xdbeec879
	.word	0x470a7ca1
	.word	0xe90f427c
	.word	0xc91e84f8
	.word	0x00000000
	.word	0x83868009
	.word	0x48ed2b32
	.word	0xac70111e
	.word	0x4e725a6c
	.word	0xfbff0efd
	.word	0x5638850f
	.word	0x1ed5ae3d
	.word	0x27392d36
	.word	0x64d90f0a
	.word	0x21a65c68
	.word	0xd1545b9b
	.word	0x3a2e3624
	.word	0xb1670a0c
	.word	0x0fe75793
	.word	0xd296eeb4
	.word	0x9e919b1b
	.word	0x4fc5c080
	.word	0xa220dc61
	.word	0x694b775a
	.word	0x161a121c
	.word	0x0aba93e2
	.word	0xe52aa0c0
	.word	0x43e0223c
	.word	0x1d171b12
	.word	0x0b0d090e
	.word	0xadc78bf2
	.word	0xb9a8b62d
	.word	0xc8a91e14
	.word	0x8519f157
	.word	0x4c0775af
	.word	0xbbdd99ee
	.word	0xfd607fa3
	.word	0x9f2601f7
	.word	0xbcf5725c
	.word	0xc53b6644
	.word	0x347efb5b
	.word	0x7629438b
	.word	0xdcc623cb
	.word	0x68fcedb6
	.word	0x63f1e4b8
	.word	0xcadc31d7
	.word	0x10856342
	.word	0x40229713
	.word	0x2011c684
	.word	0x7d244a85
	.word	0xf83dbbd2
	.word	0x1132f9ae
	.word	0x6da129c7
	.word	0x4b2f9e1d
	.word	0xf330b2dc
	.word	0xec52860d
	.word	0xd0e3c177
	.word	0x6c16b32b
	.word	0x99b970a9
	.word	0xfa489411
	.word	0x2264e947
	.word	0xc48cfca8
	.word	0x1a3ff0a0
	.word	0xd82c7d56
	.word	0xef903322
	.word	0xc74e4987
	.word	0xc1d138d9
	.word	0xfea2ca8c
	.word	0x360bd498
	.word	0xcf81f5a6
	.word	0x28de7aa5
	.word	0x268eb7da
	.word	0xa4bfad3f
	.word	0xe49d3a2c
	.word	0x0d927850
	.word	0x9bcc5f6a
	.word	0x62467e54
	.word	0xc2138df6
	.word	0xe8b8d890
	.word	0x5ef7392e
	.word	0xf5afc382
	.word	0xbe805d9f
	.word	0x7c93d069
	.word	0xa92dd56f
	.word	0xb31225cf
	.word	0x3b99acc8
	.word	0xa77d1810
	.word	0x6e639ce8
	.word	0x7bbb3bdb
	.word	0x097826cd
	.word	0xf418596e
	.word	0x01b79aec
	.word	0xa89a4f83
	.word	0x656e95e6
	.word	0x7ee6ffaa
	.word	0x08cfbc21
	.word	0xe6e815ef
	.word	0xd99be7ba
	.word	0xce366f4a
	.word	0xd4099fea
	.word	0xd67cb029
	.word	0xafb2a431
	.word	0x31233f2a
	.word	0x3094a5c6
	.word	0xc066a235
	.word	0x37bc4e74
	.word	0xa6ca82fc
	.word	0xb0d090e0
	.word	0x15d8a733
	.word	0x4a9804f1
	.word	0xf7daec41
	.word	0x0e50cd7f
	.word	0x2ff69117
	.word	0x8dd64d76
	.word	0x4db0ef43
	.word	0x544daacc
	.word	0xdf0496e4
	.word	0xe3b5d19e
	.word	0x1b886a4c
	.word	0xb81f2cc1
	.word	0x7f516546
	.word	0x04ea5e9d
	.word	0x5d358c01
	.word	0x737487fa
	.word	0x2e410bfb
	.word	0x5a1d67b3
	.word	0x52d2db92
	.word	0x335610e9
	.word	0x1347d66d
	.word	0x8c61d79a
	.word	0x7a0ca137
	.word	0x8e14f859
	.word	0x893c13eb
	.word	0xee27a9ce
	.word	0x35c961b7
	.word	0xede51ce1
	.word	0x3cb1477a
	.word	0x59dfd29c
	.word	0x3f73f255
	.word	0x79ce1418
	.word	0xbf37c773
	.word	0xeacdf753
	.word	0x5baafd5f
	.word	0x146f3ddf
	.word	0x86db4478
	.word	0x81f3afca
	.word	0x3ec468b9
	.word	0x2c342438
	.word	0x5f40a3c2
	.word	0x72c31d16
	.word	0x0c25e2bc
	.word	0x8b493c28
	.word	0x41950dff
	.word	0x7101a839
	.word	0xdeb30c08
	.word	0x9ce4b4d8
	.word	0x90c15664
	.word	0x6184cb7b
	.word	0x70b632d5
	.word	0x745c6c48
	.word	0x4257b8d0
	.word	0xa7f45150
	.word	0x65417e53
	.word	0xa4171ac3
	.word	0x5e273a96
	.word	0x6bab3bcb
	.word	0x459d1ff1
	.word	0x58faacab
	.word	0x03e34b93
	.word	0xfa302055
	.word	0x6d76adf6
	.word	0x76cc8891
	.word	0x4c02f525
	.word	0xd7e54ffc
	.word	0xcb2ac5d7
	.word	0x44352680
	.word	0xa362b58f
	.word	0x5ab1de49
	.word	0x1bba2567
	.word	0x0eea4598
	.word	0xc0fe5de1
	.word	0x752fc302
	.word	0xf04c8112
	.word	0x97468da3
	.word	0xf9d36bc6
	.word	0x5f8f03e7
	.word	0x9c921595
	.word	0x7a6dbfeb
	.word	0x595295da
	.word	0x83bed42d
	.word	0x217458d3
	.word	0x69e04929
	.word	0xc8c98e44
	.word	0x89c2756a
	.word	0x798ef478
	.word	0x3e58996b
	.word	0x71b927dd
	.word	0x4fe1beb6
	.word	0xad88f017
	.word	0xac20c966
	.word	0x3ace7db4
	.word	0x4adf6318
	.word	0x311ae582
	.word	0x33519760
	.word	0x7f536245
	.word	0x7764b1e0
	.word	0xae6bbb84
	.word	0xa081fe1c
	.word	0x2b08f994
	.word	0x68487058
	.word	0xfd458f19
	.word	0x6cde9487
	.word	0xf87b52b7
	.word	0xd373ab23
	.word	0x024b72e2
	.word	0x8f1fe357
	.word	0xab55662a
	.word	0x28ebb207
	.word	0xc2b52f03
	.word	0x7bc5869a
	.word	0x0837d3a5
	.word	0x872830f2
	.word	0xa5bf23b2
	.word	0x6a0302ba
	.word	0x8216ed5c
	.word	0x1ccf8a2b
	.word	0xb479a792
	.word	0xf207f3f0
	.word	0xe2694ea1
	.word	0xf4da65cd
	.word	0xbe0506d5
	.word	0x6234d11f
	.word	0xfea6c48a
	.word	0x532e349d
	.word	0x55f3a2a0
	.word	0xe18a0532
	.word	0xebf6a475
	.word	0xec830b39
	.word	0xef6040aa
	.word	0x9f715e06
	.word	0x106ebd51
	.word	0x8a213ef9
	.word	0x06dd963d
	.word	0x053eddae
	.word	0xbde64d46
	.word	0x8d5491b5
	.word	0x5dc47105
	.word	0xd406046f
	.word	0x155060ff
	.word	0xfb981924
	.word	0xe9bdd697
	.word	0x434089cc
	.word	0x9ed96777
	.word	0x42e8b0bd
	.word	0x8b890788
	.word	0x5b19e738
	.word	0xeec879db
	.word	0x0a7ca147
	.word	0x0f427ce9
	.word	0x1e84f8c9
	.word	0x00000000
	.word	0x86800983
	.word	0xed2b3248
	.word	0x70111eac
	.word	0x725a6c4e
	.word	0xff0efdfb
	.word	0x38850f56
	.word	0xd5ae3d1e
	.word	0x392d3627
	.word	0xd90f0a64
	.word	0xa65c6821
	.word	0x545b9bd1
	.word	0x2e36243a
	.word	0x670a0cb1
	.word	0xe757930f
	.word	0x96eeb4d2
	.word	0x919b1b9e
	.word	0xc5c0804f
	.word	0x20dc61a2
	.word	0x4b775a69
	.word	0x1a121c16
	.word	0xba93e20a
	.word	0x2aa0c0e5
	.word	0xe0223c43
	.word	0x171b121d
	.word	0x0d090e0b
	.word	0xc78bf2ad
	.word	0xa8b62db9
	.word	0xa91e14c8
	.word	0x19f15785
	.word	0x0775af4c
	.word	0xdd99eebb
	.word	0x607fa3fd
	.word	0x2601f79f
	.word	0xf5725cbc
	.word	0x3b6644c5
	.word	0x7efb5b34
	.word	0x29438b76
	.word	0xc623cbdc
	.word	0xfcedb668
	.word	0xf1e4b863
	.word	0xdc31d7ca
	.word	0x85634210
	.word	0x22971340
	.word	0x11c68420
	.word	0x244a857d
	.word	0x3dbbd2f8
	.word	0x32f9ae11
	.word	0xa129c76d
	.word	0x2f9e1d4b
	.word	0x30b2dcf3
	.word	0x52860dec
	.word	0xe3c177d0
	.word	0x16b32b6c
	.word	0xb970a999
	.word	0x489411fa
	.word	0x64e94722
	.word	0x8cfca8c4
	.word	0x3ff0a01a
	.word	0x2c7d56d8
	.word	0x903322ef
	.word	0x4e4987c7
	.word	0xd138d9c1
	.word	0xa2ca8cfe
	.word	0x0bd49836
	.word	0x81f5a6cf
	.word	0xde7aa528
	.word	0x8eb7da26
	.word	0xbfad3fa4
	.word	0x9d3a2ce4
	.word	0x9278500d
	.word	0xcc5f6a9b
	.word	0x467e5462
	.word	0x138df6c2
	.word	0xb8d890e8
	.word	0xf7392e5e
	.word	0xafc382f5
	.word	0x805d9fbe
	.word	0x93d0697c
	.word	0x2dd56fa9
	.word	0x1225cfb3
	.word	0x99acc83b
	.word	0x7d1810a7
	.word	0x639ce86e
	.word	0xbb3bdb7b
	.word	0x7826cd09
	.word	0x18596ef4
	.word	0xb79aec01
	.word	0x9a4f83a8
	.word	0x6e95e665
	.word	0xe6ffaa7e
	.word	0xcfbc2108
	.word	0xe815efe6
	.word	0x9be7bad9
	.word	0x366f4ace
	.word	0x099fead4
	.word	0x7cb029d6
	.word	0xb2a431af
	.word	0x233f2a31
	.word	0x94a5c630
	.word	0x66a235c0
	.word	0xbc4e7437
	.word	0xca82fca6
	.word	0xd090e0b0
	.word	0xd8a73315
	.word	0x9804f14a
	.word	0xdaec41f7
	.word	0x50cd7f0e
	.word	0xf691172f
	.word	0xd64d768d
	.word	0xb0ef434d
	.word	0x4daacc54
	.word	0x0496e4df
	.word	0xb5d19ee3
	.word	0x886a4c1b
	.word	0x1f2cc1b8
	.word	0x5165467f
	.word	0xea5e9d04
	.word	0x358c015d
	.word	0x7487fa73
	.word	0x410bfb2e
	.word	0x1d67b35a
	.word	0xd2db9252
	.word	0x5610e933
	.word	0x47d66d13
	.word	0x61d79a8c
	.word	0x0ca1377a
	.word	0x14f8598e
	.word	0x3c13eb89
	.word	0x27a9ceee
	.word	0xc961b735
	.word	0xe51ce1ed
	.word	0xb1477a3c
	.word	0xdfd29c59
	.word	0x73f2553f
	.word	0xce141879
	.word	0x37c773bf
	.word	0xcdf753ea
	.word	0xaafd5f5b
	.word	0x6f3ddf14
	.word	0xdb447886
	.word	0xf3afca81
	.word	0xc468b93e
	.word	0x3424382c
	.word	0x40a3c25f
	.word	0xc31d1672
	.word	0x25e2bc0c
	.word	0x493c288b
	.word	0x950dff41
	.word	0x01a83971
	.word	0xb30c08de
	.word	0xe4b4d89c
	.word	0xc1566490
	.word	0x84cb7b61
	.word	0xb632d570
	.word	0x5c6c4874
	.word	0x57b8d042
	.word	0xf45150a7
	.word	0x417e5365
	.word	0x171ac3a4
	.word	0x273a965e
	.word	0xab3bcb6b
	.word	0x9d1ff145
	.word	0xfaacab58
	.word	0xe34b9303
	.word	0x302055fa
	.word	0x76adf66d
	.word	0xcc889176
	.word	0x02f5254c
	.word	0xe54ffcd7
	.word	0x2ac5d7cb
	.word	0x35268044
	.word	0x62b58fa3
	.word	0xb1de495a
	.word	0xba25671b
	.word	0xea45980e
	.word	0xfe5de1c0
	.word	0x2fc30275
	.word	0x4c8112f0
	.word	0x468da397
	.word	0xd36bc6f9
	.word	0x8f03e75f
	.word	0x9215959c
	.word	0x6dbfeb7a
	.word	0x5295da59
	.word	0xbed42d83
	.word	0x7458d321
	.word	0xe0492969
	.word	0xc98e44c8
	.word	0xc2756a89
	.word	0x8ef47879
	.word	0x58996b3e
	.word	0xb927dd71
	.word	0xe1beb64f
	.word	0x88f017ad
	.word	0x20c966ac
	.word	0xce7db43a
	.word	0xdf63184a
	.word	0x1ae58231
	.word	0x51976033
	.word	0x5362457f
	.word	0x64b1e077
	.word	0x6bbb84ae
	.word	0x81fe1ca0
	.word	0x08f9942b
	.word	0x48705868
	.word	0x458f19fd
	.word	0xde94876c
	.word	0x7b52b7f8
	.word	0x73ab23d3
	.word	0x4b72e202
	.word	0x1fe3578f
	.word	0x55662aab
	.word	0xebb20728
	.word	0xb52f03c2
	.word	0xc5869a7b
	.word	0x37d3a508
	.word	0x2830f287
	.word	0xbf23b2a5
	.word	0x0302ba6a
	.word	0x16ed5c82
	.word	0xcf8a2b1c
	.word	0x79a792b4
	.word	0x07f3f0f2
	.word	0x694ea1e2
	.word	0xda65cdf4
	.word	0x0506d5be
	.word	0x34d11f62
	.word	0xa6c48afe
	.word	0x2e349d53
	.word	0xf3a2a055
	.word	0x8a0532e1
	.word	0xf6a475eb
	.word	0x830b39ec
	.word	0x6040aaef
	.word	0x715e069f
	.word	0x6ebd5110
	.word	0x213ef98a
	.word	0xdd963d06
	.word	0x3eddae05
	.word	0xe64d46bd
	.word	0x5491b58d
	.word	0xc471055d
	.word	0x06046fd4
	.word	0x5060ff15
	.word	0x981924fb
	.word	0xbdd697e9
	.word	0x4089cc43
	.word	0xd967779e
	.word	0xe8b0bd42
	.word	0x8907888b
	.word	0x19e7385b
	.word	0xc879dbee
	.word	0x7ca1470a
	.word	0x427ce90f
	.word	0x84f8c91e
	.word	0x00000000
	.word	0x80098386
	.word	0x2b3248ed
	.word	0x111eac70
	.word	0x5a6c4e72
	.word	0x0efdfbff
	.word	0x850f5638
	.word	0xae3d1ed5
	.word	0x2d362739
	.word	0x0f0a64d9
	.word	0x5c6821a6
	.word	0x5b9bd154
	.word	0x36243a2e
	.word	0x0a0cb167
	.word	0x57930fe7
	.word	0xeeb4d296
	.word	0x9b1b9e91
	.word	0xc0804fc5
	.word	0xdc61a220
	.word	0x775a694b
	.word	0x121c161a
	.word	0x93e20aba
	.word	0xa0c0e52a
	.word	0x223c43e0
	.word	0x1b121d17
	.word	0x090e0b0d
	.word	0x8bf2adc7
	.word	0xb62db9a8
	.word	0x1e14c8a9
	.word	0xf1578519
	.word	0x75af4c07
	.word	0x99eebbdd
	.word	0x7fa3fd60
	.word	0x01f79f26
	.word	0x725cbcf5
	.word	0x6644c53b
	.word	0xfb5b347e
	.word	0x438b7629
	.word	0x23cbdcc6
	.word	0xedb668fc
	.word	0xe4b863f1
	.word	0x31d7cadc
	.word	0x63421085
	.word	0x97134022
	.word	0xc6842011
	.word	0x4a857d24
	.word	0xbbd2f83d
	.word	0xf9ae1132
	.word	0x29c76da1
	.word	0x9e1d4b2f
	.word	0xb2dcf330
	.word	0x860dec52
	.word	0xc177d0e3
	.word	0xb32b6c16
	.word	0x70a999b9
	.word	0x9411fa48
	.word	0xe9472264
	.word	0xfca8c48c
	.word	0xf0a01a3f
	.word	0x7d56d82c
	.word	0x3322ef90
	.word	0x4987c74e
	.word	0x38d9c1d1
	.word	0xca8cfea2
	.word	0xd498360b
	.word	0xf5a6cf81
	.word	0x7aa528de
	.word	0xb7da268e
	.word	0xad3fa4bf
	.word	0x3a2ce49d
	.word	0x78500d92
	.word	0x5f6a9bcc
	.word	0x7e546246
	.word	0x8df6c213
	.word	0xd890e8b8
	.word	0x392e5ef7
	.word	0xc382f5af
	.word	0x5d9fbe80
	.word	0xd0697c93
	.word	0xd56fa92d
	.word	0x25cfb312
	.word	0xacc83b99
	.word	0x1810a77d
	.word	0x9ce86e63
	.word	0x3bdb7bbb
	.word	0x26cd0978
	.word	0x596ef418
	.word	0x9aec01b7
	.word	0x4f83a89a
	.word	0x95e6656e
	.word	0xffaa7ee6
	.word	0xbc2108cf
	.word	0x15efe6e8
	.word	0xe7bad99b
	.word	0x6f4ace36
	.word	0x9fead409
	.word	0xb029d67c
	.word	0xa431afb2
	.word	0x3f2a3123
	.word	0xa5c63094
	.word	0xa235c066
	.word	0x4e7437bc
	.word	0x82fca6ca
	.word	0x90e0b0d0
	.word	0xa73315d8
	.word	0x04f14a98
	.word	0xec41f7da
	.word	0xcd7f0e50
	.word	0x91172ff6
	.word	0x4d768dd6
	.word	0xef434db0
	.word	0xaacc544d
	.word	0x96e4df04
	.word	0xd19ee3b5
	.word	0x6a4c1b88
	.word	0x2cc1b81f
	.word	0x65467f51
	.word	0x5e9d04ea
	.word	0x8c015d35
	.word	0x87fa7374
	.word	0x0bfb2e41
	.word	0x67b35a1d
	.word	0xdb9252d2
	.word	0x10e93356
	.word	0xd66d1347
	.word	0xd79a8c61
	.word	0xa1377a0c
	.word	0xf8598e14
	.word	0x13eb893c
	.word	0xa9ceee27
	.word	0x61b735c9
	.word	0x1ce1ede5
	.word	0x477a3cb1
	.word	0xd29c59df
	.word	0xf2553f73
	.word	0x141879ce
	.word	0xc773bf37
	.word	0xf753eacd
	.word	0xfd5f5baa
	.word	0x3ddf146f
	.word	0x447886db
	.word	0xafca81f3
	.word	0x68b93ec4
	.word	0x24382c34
	.word	0xa3c25f40
	.word	0x1d1672c3
	.word	0xe2bc0c25
	.word	0x3c288b49
	.word	0x0dff4195
	.word	0xa8397101
	.word	0x0c08deb3
	.word	0xb4d89ce4
	.word	0x566490c1
	.word	0xcb7b6184
	.word	0x32d570b6
	.word	0x6c48745c
	.word	0xb8d04257
	.word	0x5150a7f4
	.word	0x7e536541
	.word	0x1ac3a417
	.word	0x3a965e27
	.word	0x3bcb6bab
	.word	0x1ff1459d
	.word	0xacab58fa
	.word	0x4b9303e3
	.word	0x2055fa30
	.word	0xadf66d76
	.word	0x889176cc
	.word	0xf5254c02
	.word	0x4ffcd7e5
	.word	0xc5d7cb2a
	.word	0x26804435
	.word	0xb58fa362
	.word	0xde495ab1
	.word	0x25671bba
	.word	0x45980eea
	.word	0x5de1c0fe
	.word	0xc302752f
	.word	0x8112f04c
	.word	0x8da39746
	.word	0x6bc6f9d3
	.word	0x03e75f8f
	.word	0x15959c92
	.word	0xbfeb7a6d
	.word	0x95da5952
	.word	0xd42d83be
	.word	0x58d32174
	.word	0x492969e0
	.word	0x8e44c8c9
	.word	0x756a89c2
	.word	0xf478798e
	.word	0x996b3e58
	.word	0x27dd71b9
	.word	0xbeb64fe1
	.word	0xf017ad88
	.word	0xc966ac20
	.word	0x7db43ace
	.word	0x63184adf
	.word	0xe582311a
	.word	0x97603351
	.word	0x62457f53
	.word	0xb1e07764
	.word	0xbb84ae6b
	.word	0xfe1ca081
	.word	0xf9942b08
	.word	0x70586848
	.word	0x8f19fd45
	.word	0x94876cde
	.word	0x52b7f87b
	.word	0xab23d373
	.word	0x72e2024b
	.word	0xe3578f1f
	.word	0x662aab55
	.word	0xb20728eb
	.word	0x2f03c2b5
	.word	0x869a7bc5
	.word	0xd3a50837
	.word	0x30f28728
	.word	0x23b2a5bf
	.word	0x02ba6a03
	.word	0xed5c8216
	.word	0x8a2b1ccf
	.word	0xa792b479
	.word	0xf3f0f207
	.word	0x4ea1e269
	.word	0x65cdf4da
	.word	0x06d5be05
	.word	0xd11f6234
	.word	0xc48afea6
	.word	0x349d532e
	.word	0xa2a055f3
	.word	0x0532e18a
	.word	0xa475ebf6
	.word	0x0b39ec83
	.word	0x40aaef60
	.word	0x5e069f71
	.word	0xbd51106e
	.word	0x3ef98a21
	.word	0x963d06dd
	.word	0xddae053e
	.word	0x4d46bde6
	.word	0x91b58d54
	.word	0x71055dc4
	.word	0x046fd406
	.word	0x60ff1550
	.word	0x1924fb98
	.word	0xd697e9bd
	.word	0x89cc4340
	.word	0x67779ed9
	.word	0xb0bd42e8
	.word	0x07888b89
	.word	0xe7385b19
	.word	0x79dbeec8
	.word	0xa1470a7c
	.word	0x7ce90f42
	.word	0xf8c91e84
	.word	0x00000000
	.word	0x09838680
	.word	0x3248ed2b
	.word	0x1eac7011
	.word	0x6c4e725a
	.word	0xfdfbff0e
	.word	0x0f563885
	.word	0x3d1ed5ae
	.word	0x3627392d
	.word	0x0a64d90f
	.word	0x6821a65c
	.word	0x9bd1545b
	.word	0x243a2e36
	.word	0x0cb1670a
	.word	0x930fe757
	.word	0xb4d296ee
	.word	0x1b9e919b
	.word	0x804fc5c0
	.word	0x61a220dc
	.word	0x5a694b77
	.word	0x1c161a12
	.word	0xe20aba93
	.word	0xc0e52aa0
	.word	0x3c43e022
	.word	0x121d171b
	.word	0x0e0b0d09
	.word	0xf2adc78b
	.word	0x2db9a8b6
	.word	0x14c8a91e
	.word	0x578519f1
	.word	0xaf4c0775
	.word	0xeebbdd99
	.word	0xa3fd607f
	.word	0xf79f2601
	.word	0x5cbcf572
	.word	0x44c53b66
	.word	0x5b347efb
	.word	0x8b762943
	.word	0xcbdcc623
	.word	0xb668fced
	.word	0xb863f1e4
	.word	0xd7cadc31
	.word	0x42108563
	.word	0x13402297
	.word	0x842011c6
	.word	0x857d244a
	.word	0xd2f83dbb
	.word	0xae1132f9
	.word	0xc76da129
	.word	0x1d4b2f9e
	.word	0xdcf330b2
	.word	0x0dec5286
	.word	0x77d0e3c1
	.word	0x2b6c16b3
	.word	0xa999b970
	.word	0x11fa4894
	.word	0x472264e9
	.word	0xa8c48cfc
	.word	0xa01a3ff0
	.word	0x56d82c7d
	.word	0x22ef9033
	.word	0x87c74e49
	.word	0xd9c1d138
	.word	0x8cfea2ca
	.word	0x98360bd4
	.word	0xa6cf81f5
	.word	0xa528de7a
	.word	0xda268eb7
	.word	0x3fa4bfad
	.word	0x2ce49d3a
	.word	0x500d9278
	.word	0x6a9bcc5f
	.word	0x5462467e
	.word	0xf6c2138d
	.word	0x90e8b8d8
	.word	0x2e5ef739
	.word	0x82f5afc3
	.word	0x9fbe805d
	.word	0x697c93d0
	.word	0x6fa92dd5
	.word	0xcfb31225
	.word	0xc83b99ac
	.word	0x10a77d18
	.word	0xe86e639c
	.word	0xdb7bbb3b
	.word	0xcd097826
	.word	0x6ef41859
	.word	0xec01b79a
	.word	0x83a89a4f
	.word	0xe6656e95
	.word	0xaa7ee6ff
	.word	0x2108cfbc
	.word	0xefe6e815
	.word	0xbad99be7
	.word	0x4ace366f
	.word	0xead4099f
	.word	0x29d67cb0
	.word	0x31afb2a4
	.word	0x2a31233f
	.word	0xc63094a5
	.word	0x35c066a2
	.word	0x7437bc4e
	.word	0xfca6ca82
	.word	0xe0b0d090
	.word	0x3315d8a7
	.word	0xf14a9804
	.word	0x41f7daec
	.word	0x7f0e50cd
	.word	0x172ff691
	.word	0x768dd64d
	.word	0x434db0ef
	.word	0xcc544daa
	.word	0xe4df0496
	.word	0x9ee3b5d1
	.word	0x4c1b886a
	.word	0xc1b81f2c
	.word	0x467f5165
	.word	0x9d04ea5e
	.word	0x015d358c
	.word	0xfa737487
	.word	0xfb2e410b
	.word	0xb35a1d67
	.word	0x9252d2db
	.word	0xe9335610
	.word	0x6d1347d6
	.word	0x9a8c61d7
	.word	0x377a0ca1
	.word	0x598e14f8
	.word	0xeb893c13
	.word	0xceee27a9
	.word	0xb735c961
	.word	0xe1ede51c
	.word	0x7a3cb147
	.word	0x9c59dfd2
	.word	0x553f73f2
	.word	0x1879ce14
	.word	0x73bf37c7
	.word	0x53eacdf7
	.word	0x5f5baafd
	.word	0xdf146f3d
	.word	0x7886db44
	.word	0xca81f3af
	.word	0xb93ec468
	.word	0x382c3424
	.word	0xc25f40a3
	.word	0x1672c31d
	.word	0xbc0c25e2
	.word	0x288b493c
	.word	0xff41950d
	.word	0x397101a8
	.word	0x08deb30c
	.word	0xd89ce4b4
	.word	0x6490c156
	.word	0x7b6184cb
	.word	0xd570b632
	.word	0x48745c6c
	.word	0xd04257b8
mtable:
	.word	0x00000000
	.word	0x0b0d090e
	.word	0x161a121c
	.word	0x1d171b12
	.word	0x2c342438
	.word	0x27392d36
	.word	0x3a2e3624
	.word	0x31233f2a
	.word	0x58684870
	.word	0x5365417e
	.word	0x4e725a6c
	.word	0x457f5362
	.word	0x745c6c48
	.word	0x7f516546
	.word	0x62467e54
	.word	0x694b775a
	.word	0xb0d090e0
	.word	0xbbdd99ee
	.word	0xa6ca82fc
	.word	0xadc78bf2
	.word	0x9ce4b4d8
	.word	0x97e9bdd6
	.word	0x8afea6c4
	.word	0x81f3afca
	.word	0xe8b8d890
	.word	0xe3b5d19e
	.word	0xfea2ca8c
	.word	0xf5afc382
	.word	0xc48cfca8
	.word	0xcf81f5a6
	.word	0xd296eeb4
	.word	0xd99be7ba
	.word	0x7bbb3bdb
	.word	0x70b632d5
	.word	0x6da129c7
	.word	0x66ac20c9
	.word	0x578f1fe3
	.word	0x5c8216ed
	.word	0x41950dff
	.word	0x4a9804f1
	.word	0x23d373ab
	.word	0x28de7aa5
	.word	0x35c961b7
	.word	0x3ec468b9
	.word	0x0fe75793
	.word	0x04ea5e9d
	.word	0x19fd458f
	.word	0x12f04c81
	.word	0xcb6bab3b
	.word	0xc066a235
	.word	0xdd71b927
	.word	0xd67cb029
	.word	0xe75f8f03
	.word	0xec52860d
	.word	0xf1459d1f
	.word	0xfa489411
	.word	0x9303e34b
	.word	0x980eea45
	.word	0x8519f157
	.word	0x8e14f859
	.word	0xbf37c773
	.word	0xb43ace7d
	.word	0xa92dd56f
	.word	0xa220dc61
	.word	0xf66d76ad
	.word	0xfd607fa3
	.word	0xe07764b1
	.word	0xeb7a6dbf
	.word	0xda595295
	.word	0xd1545b9b
	.word	0xcc434089
	.word	0xc74e4987
	.word	0xae053edd
	.word	0xa50837d3
	.word	0xb81f2cc1
	.word	0xb31225cf
	.word	0x82311ae5
	.word	0x893c13eb
	.word	0x942b08f9
	.word	0x9f2601f7
	.word	0x46bde64d
	.word	0x4db0ef43
	.word	0x50a7f451
	.word	0x5baafd5f
	.word	0x6a89c275
	.word	0x6184cb7b
	.word	0x7c93d069
	.word	0x779ed967
	.word	0x1ed5ae3d
	.word	0x15d8a733
	.word	0x08cfbc21
	.word	0x03c2b52f
	.word	0x32e18a05
	.word	0x39ec830b
	.word	0x24fb9819
	.word	0x2ff69117
	.word	0x8dd64d76
	.word	0x86db4478
	.word	0x9bcc5f6a
	.word	0x90c15664
	.word	0xa1e2694e
	.word	0xaaef6040
	.word	0xb7f87b52
	.word	0xbcf5725c
	.word	0xd5be0506
	.word	0xdeb30c08
	.word	0xc3a4171a
	.word	0xc8a91e14
	.word	0xf98a213e
	.word	0xf2872830
	.word	0xef903322
	.word	0xe49d3a2c
	.word	0x3d06dd96
	.word	0x360bd498
	.word	0x2b1ccf8a
	.word	0x2011c684
	.word	0x1132f9ae
	.word	0x1a3ff0a0
	.word	0x0728ebb2
	.word	0x0c25e2bc
	.word	0x656e95e6
	.word	0x6e639ce8
	.word	0x737487fa
	.word	0x78798ef4
	.word	0x495ab1de
	.word	0x4257b8d0
	.word	0x5f40a3c2
	.word	0x544daacc
	.word	0xf7daec41
	.word	0xfcd7e54f
	.word	0xe1c0fe5d
	.word	0xeacdf753
	.word	0xdbeec879
	.word	0xd0e3c177
	.word	0xcdf4da65
	.word	0xc6f9d36b
	.word	0xafb2a431
	.word	0xa4bfad3f
	.word	0xb9a8b62d
	.word	0xb2a5bf23
	.word	0x83868009
	.word	0x888b8907
	.word	0x959c9215
	.word	0x9e919b1b
	.word	0x470a7ca1
	.word	0x4c0775af
	.word	0x51106ebd
	.word	0x5a1d67b3
	.word	0x6b3e5899
	.word	0x60335197
	.word	0x7d244a85
	.word	0x7629438b
	.word	0x1f6234d1
	.word	0x146f3ddf
	.word	0x097826cd
	.word	0x02752fc3
	.word	0x335610e9
	.word	0x385b19e7
	.word	0x254c02f5
	.word	0x2e410bfb
	.word	0x8c61d79a
	.word	0x876cde94
	.word	0x9a7bc586
	.word	0x9176cc88
	.word	0xa055f3a2
	.word	0xab58faac
	.word	0xb64fe1be
	.word	0xbd42e8b0
	.word	0xd4099fea
	.word	0xdf0496e4
	.word	0xc2138df6
	.word	0xc91e84f8
	.word	0xf83dbbd2
	.word	0xf330b2dc
	.word	0xee27a9ce
	.word	0xe52aa0c0
	.word	0x3cb1477a
	.word	0x37bc4e74
	.word	0x2aab5566
	.word	0x21a65c68
	.word	0x10856342
	.word	0x1b886a4c
	.word	0x069f715e
	.word	0x0d927850
	.word	0x64d90f0a
	.word	0x6fd40604
	.word	0x72c31d16
	.word	0x79ce1418
	.word	0x48ed2b32
	.word	0x43e0223c
	.word	0x5ef7392e
	.word	0x55fa3020
	.word	0x01b79aec
	.word	0x0aba93e2
	.word	0x17ad88f0
	.word	0x1ca081fe
	.word	0x2d83bed4
	.word	0x268eb7da
	.word	0x3b99acc8
	.word	0x3094a5c6
	.word	0x59dfd29c
	.word	0x52d2db92
	.word	0x4fc5c080
	.word	0x44c8c98e
	.word	0x75ebf6a4
	.word	0x7ee6ffaa
	.word	0x63f1e4b8
	.word	0x68fcedb6
	.word	0xb1670a0c
	.word	0xba6a0302
	.word	0xa77d1810
	.word	0xac70111e
	.word	0x9d532e34
	.word	0x965e273a
	.word	0x8b493c28
	.word	0x80443526
	.word	0xe90f427c
	.word	0xe2024b72
	.word	0xff155060
	.word	0xf418596e
	.word	0xc53b6644
	.word	0xce366f4a
	.word	0xd3217458
	.word	0xd82c7d56
	.word	0x7a0ca137
	.word	0x7101a839
	.word	0x6c16b32b
	.word	0x671bba25
	.word	0x5638850f
	.word	0x5d358c01
	.word	0x40229713
	.word	0x4b2f9e1d
	.word	0x2264e947
	.word	0x2969e049
	.word	0x347efb5b
	.word	0x3f73f255
	.word	0x0e50cd7f
	.word	0x055dc471
	.word	0x184adf63
	.word	0x1347d66d
	.word	0xcadc31d7
	.word	0xc1d138d9
	.word	0xdcc623cb
	.word	0xd7cb2ac5
	.word	0xe6e815ef
	.word	0xede51ce1
	.word	0xf0f207f3
	.word	0xfbff0efd
	.word	0x92b479a7
	.word	0x99b970a9
	.word	0x84ae6bbb
	.word	0x8fa362b5
	.word	0xbe805d9f
	.word	0xb58d5491
	.word	0xa89a4f83
	.word	0xa397468d
rcon.0:
	.word	0x08040201
	.word	0x80402010
	.word	0x0000361b
_global_impure_ptr:
	.word	0x0001ba18


	.data

key:
	.word	0x315595c9
	.word	0x54d150a6
	.word	0xaac5d87b
	.word	0xacbda4a4
	.word	0xc712ea5c
	.word	0xb8d683f8
	.word	0x2dcfd65d
	.word	0xf0a5c860
plaintext:
	.word	0x8cb37fd7
	.word	0x6fc42522
	.word	0x18c9d5b9
	.word	0x08d092c0
	.word	0x68f32a85
	.word	0xf2af84bd
	.word	0x1ef58b0c
	.word	0x70467051
	.word	0xe1de8b9e
	.word	0xcdf8a186
	.word	0xa19f0271
	.word	0x82b0447b
	.word	0xb4ce7f40
	.word	0x8ebc5dbe
	.word	0x3a0b4319
	.word	0xcca06946
	.word	0xaf614fed
	.word	0x475ba9a6
	.word	0x00d55169
	.word	0x2ede7e77
	.word	0xe03ca67e
	.word	0x40eddf33
	.word	0xe0c71a3f
	.word	0x3be346c7
	.word	0x55644e90
	.word	0x3b368d2e
	.word	0x6f879b92
	.word	0x0a3d94ae
	.word	0x7f4ea2c8
	.word	0x18ec835a
	.word	0xc85482fd
	.word	0x521eedd8
	.word	0x4bcfca7d
	.word	0xb96831ba
	.word	0x4ecaa378
	.word	0x33b28672
	.word	0xa6cdcb79
	.word	0xfa9ca343
	.word	0x3bae2aee
	.word	0x3246c672
	.word	0x924599a5
	.word	0xe3dc7946
	.word	0x118aa93e
	.word	0xe4854937
	.word	0x6e1f1a58
	.word	0x0ae6aad7
	.word	0x46fd27c4
	.word	0x28b06c5c
	.word	0x35846b2e
	.word	0x386d1a90
	.word	0xbc4a69f2
	.word	0x56d7ec96
	.word	0xa6ee2765
	.word	0x709c5fb0
	.word	0xec2ba571
	.word	0xc1166793
	.word	0x7043b3c4
	.word	0x95ad6db5
	.word	0xfc02f041
	.word	0xa18e588d
	.word	0x68343246
	.word	0x3ab38c11
	.word	0x3abe54db
	.word	0x7c2e38b3
expected:
	.word	0x1000170f
	.word	0xf97f8207
	.word	0x0e15da45
	.word	0x228f9454
	.word	0xcd039f74
	.word	0x6bb21a58
	.word	0xe705689a
	.word	0xad751fcb
	.word	0xa1568551
	.word	0xecb7d8f6
	.word	0x48c30d9e
	.word	0x99f7aa7d
	.word	0x3fea1dc2
	.word	0x84a8db53
	.word	0xe7c061ed
	.word	0xb7dcad38
	.word	0xb6c0fa9b
	.word	0x87f07c88
	.word	0x0bbc2025
	.word	0x9bb86d03
	.word	0x87a8d310
	.word	0x43dbba38
	.word	0x890f0240
	.word	0x7e69116e
	.word	0xe3c54a15
	.word	0x3b9d7ab1
	.word	0x5805be74
	.word	0x1d73401e
	.word	0x8945a083
	.word	0x4ec3cffc
	.word	0x7eef52a2
	.word	0x38982c5e
	.word	0x12b45726
	.word	0xac10244e
	.word	0x0d42897c
	.word	0x2f49af9d
	.word	0x437560c0
	.word	0xfdccd1c5
	.word	0x384eae46
	.word	0x9883f3a9
	.word	0x150afa9f
	.word	0x0e2a4605
	.word	0x2daca8be
	.word	0x542e2759
	.word	0x64527705
	.word	0x7cc46039
	.word	0x13b930a7
	.word	0x37fe1f3b
	.word	0x3dfdeab0
	.word	0xf27eed83
	.word	0x860af2b0
	.word	0x1f08b978
	.word	0xad50c0ff
	.word	0x196892b8
	.word	0xe57e9c30
	.word	0xa65e574c
	.word	0x70873a58
	.word	0x1ecf1a80
	.word	0xc6433be8
	.word	0xba4727e9
	.word	0x1452589e
	.word	0x77f1b7c0
	.word	0x43238f77
	.word	0xce240e49
impure_data:
	.word	0x00000000
	.word	0x0001bd04
	.word	0x0001bd6c
	.word	0x0001bdd4
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
	.word	0x0001c248


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
encrypted:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
decrypted:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
encctx:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
decctx:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
