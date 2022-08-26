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
	ldr r1, =0x8b780
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =0x00000000	
	cbz	r3, lab1
	ldr	r0, =0x00008f09	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	ldr r1, =0x00ff5
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
	ldr	r0, =0x00009624	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	ldr r1, =0x63de0
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
	ldr	r0, =0x00009624	
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
	ldr	r2, =0x0001a0d0	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	ldr r1, =0x2ac7b
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
	ldr	r0, =0x00008efd	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x00008f09	
push {r1, r2}
	ldr r1, =0xacb7b
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	atexit
lab7:	push {r1, r2}
	ldr r1, =0xacb7b
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	bl	__libc_init_array
	push {r1, r2}
	ldr r1, =0x14758
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, r4
	movs	r1, r5
	bl	main
	push {r1, r2}
	ldr r1, =0x68df9
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	exit
	nop
	.ltorg
vec_mpy1:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]
	movs	r3, #0
	str	r3, [r7, #20]
	b	lab8
lab9: 	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	uxth	r2, r3
	ldrsh	r3, [r7, #6]
	ldr	r1, [r7, #20]
	lsls	r1, r1, #1
	ldr	r0, [r7, #8]
	add	r1, r0
	ldrsh	r1, [r1]
	mul	r3, r1, r3
	asrs	r3, r3, #15
	uxth	r3, r3
	add	r3, r2
	uxth	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab8: 	ldr	r3, [r7, #20]
	cmp	r3, #149	
	ble	lab9
	nop
	nop
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
mac:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #20]
	b	lab10
lab11: 	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [r7, #16]
	add	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [r7, #4]
	add	r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab10: 	ldr	r3, [r7, #20]
	cmp	r3, #149	
	ble	lab11
	ldr	r3, [r7, #0]
	ldr	r2, [r7, #16]
	str	r2, [r3, #0]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
fir:
	push	{r7}
	sub	sp, #36	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #28]
	b	lab12
lab15: 	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #24]
	b	lab13
lab14: 	ldr	r3, [r7, #24]
	add	r3, r2
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #24]
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [r7, #20]
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #24]
	adds	r3, #1
	str	r3, [r7, #24]
lab13: 	ldr	r3, [r7, #24]
	cmp	r3, #49	
	ble	lab14
	ldr	r3, [r7, #28]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r2, [r7, #20]
	asrs	r2, r2, #15
	str	r2, [r3, #0]
	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab12: 	ldr	r3, [r7, #28]
	cmp	r3, #49	
	ble	lab15
	nop
	nop
	adds	r7, #36	
	mov	sp, r7
	pop	{r7}
	bx	lr
fir_no_red_ld:
	push	{r7}
	sub	sp, #44	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #32]
	b	lab16
lab19: 	str	r3, [r7, #28]
	movs	r3, #0
	str	r3, [r7, #24]
	ldr	r3, [r7, #32]
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #22]
	movs	r3, #0
	str	r3, [r7, #36]	
	b	lab17
lab18: 	ldr	r3, [r7, #36]	
	add	r3, r2
	adds	r3, #1
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #20]
	ldr	r3, [r7, #36]	
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #18]
	ldrsh	r3, [r7, #22]
	ldrsh	r2, [r7, #18]
	mul	r3, r2, r3
	ldr	r2, [r7, #28]
	add	r3, r2
	str	r3, [r7, #28]
	ldrsh	r3, [r7, #20]
	ldrsh	r2, [r7, #18]
	mul	r3, r2, r3
	ldr	r2, [r7, #24]
	add	r3, r2
	str	r3, [r7, #24]
	ldr	r2, [r7, #32]
	ldr	r3, [r7, #36]	
	add	r3, r2
	adds	r3, #2
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #22]
	ldr	r3, [r7, #36]	
	adds	r3, #1
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrh	r3, [r3, #0]
	strh	r3, [r7, #16]
	ldrsh	r3, [r7, #20]
	ldrsh	r2, [r7, #16]
	mul	r3, r2, r3
	ldr	r2, [r7, #28]
	add	r3, r2
	str	r3, [r7, #28]
	ldrsh	r3, [r7, #22]
	ldrsh	r2, [r7, #16]
	mul	r3, r2, r3
	ldr	r2, [r7, #24]
	add	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #36]	
	adds	r3, #2
	str	r3, [r7, #36]	
lab17: 	ldr	r3, [r7, #36]	
	cmp	r3, #31
	ble	lab18
	ldr	r3, [r7, #32]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r2, [r7, #28]
	asrs	r2, r2, #15
	str	r2, [r3, #0]
	ldr	r3, [r7, #32]
	adds	r3, #1
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	ldr	r2, [r7, #24]
	asrs	r2, r2, #15
	str	r2, [r3, #0]
	ldr	r3, [r7, #32]
	adds	r3, #2
	str	r3, [r7, #32]
lab16: 	ldr	r3, [r7, #32]
	cmp	r3, #99	
	ble	lab19
	nop
	nop
	adds	r7, #44	
	mov	sp, r7
	pop	{r7}
	bx	lr
latsynth:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #4]
	add	r3, r3, #2147483648	
	subs	r3, #1
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #4]
	add	r3, r3, #2147483648	
	subs	r3, #1
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [r7, #0]
	subs	r3, r2, r3
	str	r3, [r7, #0]
	ldr	r3, [r7, #4]
	subs	r3, #2
	str	r3, [r7, #20]
	b	lab20
lab21: 	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #8]
	add	r3, r2
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [r7, #0]
	subs	r3, r2, r3
	str	r3, [r7, #0]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	ldrsh	r3, [r3]
	uxth	r2, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	ldr	r1, [r7, #8]
	add	r3, r1
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #0]
	asrs	r3, r3, #16
	mul	r3, r1, r3
	asrs	r3, r3, #16
	uxth	r3, r3
	add	r3, r2
	uxth	r1, r3
	ldr	r3, [r7, #20]
	adds	r3, #1
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #20]
	subs	r3, #1
	str	r3, [r7, #20]
lab20: 	ldr	r3, [r7, #20]
	cmp	r3, #0
	bge	lab21
	ldr	r3, [r7, #0]
	asrs	r3, r3, #16
	sxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #0]
	mov	r0, r3
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
iir1:
	push	{r7}
	sub	sp, #36	
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #8]
	ldrsh	r3, [r3]
	str	r3, [r7, #28]
	movs	r3, #0
	str	r3, [r7, #24]
	b	lab22
lab23: 	adds	r3, #4
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	mul	r2, r3, r2
	ldr	r3, [r7, #12]
	adds	r3, #6
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #0]
	adds	r3, #4
	ldr	r3, [r3, #0]
	mul	r3, r1, r3
	add	r3, r2
	asrs	r3, r3, #15
	ldr	r2, [r7, #28]
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	mul	r2, r3, r2
	ldr	r3, [r7, #12]
	adds	r3, #2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [r7, #0]
	adds	r3, #4
	ldr	r3, [r3, #0]
	mul	r3, r1, r3
	add	r3, r2
	asrs	r3, r3, #15
	ldr	r2, [r7, #20]
	add	r3, r2
	str	r3, [r7, #28]
	ldr	r3, [r7, #0]
	adds	r3, #4
	ldr	r2, [r7, #0]
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r2, [r7, #20]
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	adds	r3, #8
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	adds	r3, #8
	str	r3, [r7, #0]
	ldr	r3, [r7, #24]
	adds	r3, #1
	str	r3, [r7, #24]
lab22: 	ldr	r3, [r7, #24]
	cmp	r3, #49	
	ble	lab23
	ldr	r3, [r7, #4]
	adds	r2, r3, #4
	str	r2, [r7, #4]
	ldr	r2, [r7, #28]
	str	r2, [r3, #0]
	nop
	adds	r7, #36	
	mov	sp, r7
	pop	{r7}
	bx	lr
codebook:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #8]
	adds	r3, #1
	str	r3, [r7, #20]
	b	lab24
lab25: 	adds	r3, #1
	str	r3, [r7, #20]
lab24: 	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	ble	lab25
	ldr	r3, [r7, #32]
	mov	r0, r3
	adds	r7, #28
	mov	sp, r7
	pop	{r7}
	bx	lr
jpegdct:
	push	{r7}
	sub	sp, #76	
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #1
	strh	r3, [r7, #66]	
	movs	r3, #0
	strh	r3, [r7, #64]	
	movs	r3, #13
	strh	r3, [r7, #62]	
	movs	r3, #8
	strh	r3, [r7, #60]	
	b	lab26
lab31: 	strh	r3, [r7, #70]	
	b	lab27
lab30: 	strh	r3, [r7, #68]	
	b	lab28
lab29: 	ldrsh	r2, [r7, #68]	
	mul	r3, r2, r3
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldrsh	r3, [r7, #66]	
	ldrsh	r2, [r7, #68]	
	rsb	r2, r2, #7
	mul	r3, r2, r3
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r2, r3
	ldrsh	r3, [r7, #68]	
	add	r2, r1
	lsls	r3, r3, #2
	adds	r3, #72	
	add	r3, r7
	str	r2, [r3, #-60]
	ldrsh	r3, [r7, #66]	
	ldrsh	r2, [r7, #68]	
	mul	r3, r2, r3
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldrsh	r3, [r7, #66]	
	ldrsh	r2, [r7, #68]	
	rsb	r2, r2, #7
	mul	r3, r2, r3
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	ldrsh	r3, [r3]
	mov	r2, r3
	ldrsh	r3, [r7, #68]	
	rsb	r3, r3, #7
	subs	r2, r1, r2
	lsls	r3, r3, #2
	adds	r3, #72	
	add	r3, r7
	str	r2, [r3, #-60]
	ldrsh	r3, [r7, #68]	
	uxth	r3, r3
	adds	r3, #1
	uxth	r3, r3
	strh	r3, [r7, #68]	
lab28: 	ldrsh	r3, [r7, #68]	
	cmp	r3, #3
	ble	lab29
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #24]
	add	r3, r2
	str	r3, [r7, #44]	
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #24]
	subs	r3, r2, r3
	str	r3, [r7, #48]	
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	add	r3, r2
	str	r3, [r7, #52]	
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	str	r3, [r7, #56]	
	ldr	r2, [r7, #44]	
	ldr	r3, [r7, #52]	
	add	r2, r3
	ldrsh	r3, [r7, #64]	
	asr	r3, r2, r3
	sxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #0]
	ldr	r2, [r7, #44]	
	ldr	r3, [r7, #52]	
	subs	r2, r2, r3
	ldrsh	r3, [r7, #64]	
	asr	r1, r2, r3
	ldrsh	r3, [r7, #66]	
	lsls	r3, r3, #3
	ldr	r2, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #56]	
	uxth	r2, r3
	ldr	r3, [r7, #48]	
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #20
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [r7, #44]	
	ldr	r3, [r7, #44]	
	uxth	r2, r3
	ldr	r3, [r7, #48]	
	ldr	r1, [r7, #0]
	adds	r1, #18
	ldrsh	r1, [r1]
	mul	r1, r3, r1
	ldrsh	r3, [r7, #62]	
	asr	r3, r1, r3
	uxth	r3, r3
	add	r3, r2
	uxth	r1, r3
	ldrsh	r3, [r7, #66]	
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #44]	
	uxth	r2, r3
	ldr	r3, [r7, #56]	
	ldr	r1, [r7, #0]
	adds	r1, #22
	ldrsh	r1, [r1]
	mul	r1, r3, r1
	ldrsh	r3, [r7, #62]	
	asr	r3, r1, r3
	uxth	r3, r3
	add	r3, r2
	uxth	r1, r3
	ldrsh	r2, [r7, #66]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	lsls	r3, r3, #2
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #28]
	uxth	r2, r3
	ldr	r3, [r7, #40]	
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #4
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #32]
	uxth	r2, r3
	ldr	r3, [r7, #36]	
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [r7, #16]
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #36]	
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r2, [r7, #32]
	ldr	r3, [r7, #40]	
	add	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #20]
	uxth	r2, r3
	ldr	r3, [r7, #24]
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #16
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [r7, #44]	
	ldr	r3, [r7, #20]
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #2
	ldrsh	r3, [r3]
	mul	r2, r3, r2
	ldr	r3, [r7, #44]	
	add	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #24]
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #6
	ldrsh	r3, [r3]
	mul	r2, r3, r2
	ldr	r3, [r7, #44]	
	add	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	uxth	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #8
	ldrsh	r3, [r3]
	uxth	r3, r3
	smulbb	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #12]
	uxth	r3, r3
	add	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #20]
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldrsh	r3, [r7, #62]	
	asr	r1, r2, r3
	ldrsh	r2, [r7, #66]	
	mov	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #32]
	uxth	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #12
	ldrsh	r3, [r3]
	uxth	r3, r3
	smulbb	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #16]
	uxth	r3, r3
	add	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #24]
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldrsh	r3, [r7, #62]	
	asr	r1, r2, r3
	ldrsh	r2, [r7, #66]	
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #36]	
	uxth	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #10
	ldrsh	r3, [r3]
	uxth	r3, r3
	smulbb	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #16]
	uxth	r3, r3
	add	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #20]
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldrsh	r3, [r7, #62]	
	asr	r1, r2, r3
	ldrsh	r2, [r7, #66]	
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r2
	lsls	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldr	r3, [r7, #40]	
	uxth	r2, r3
	ldr	r3, [r7, #0]
	adds	r3, #14
	ldrsh	r3, [r3]
	uxth	r3, r3
	smulbb	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [r7, #12]
	uxth	r3, r3
	add	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #24]
	uxth	r3, r3
	add	r3, r2
	uxth	r3, r3
	sxth	r3, r3
	mov	r2, r3
	ldrsh	r3, [r7, #62]	
	asr	r1, r2, r3
	ldrsh	r3, [r7, #66]	
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	sxth	r2, r1
	strh	r2, [r3, #0]
	ldrsh	r3, [r7, #70]	
	uxth	r3, r3
	adds	r3, #1
	uxth	r3, r3
	strh	r3, [r7, #70]	
	ldrsh	r3, [r7, #60]	
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r2
	str	r3, [r7, #4]
lab27: 	ldrsh	r3, [r7, #70]	
	cmp	r3, #7
	ble	lab30
	ldrh	r3, [r7, #66]	
	adds	r3, #7
	uxth	r3, r3
	strh	r3, [r7, #66]	
	ldrh	r3, [r7, #64]	
	adds	r3, #3
	uxth	r3, r3
	strh	r3, [r7, #64]	
	ldrh	r3, [r7, #62]	
	adds	r3, #3
	uxth	r3, r3
	strh	r3, [r7, #62]	
	ldrh	r3, [r7, #60]	
	subs	r3, #7
	uxth	r3, r3
	strh	r3, [r7, #60]	
	ldr	r3, [r7, #4]
	subs	r3, #128	
	str	r3, [r7, #4]
lab26: 	ldrsh	r3, [r7, #66]	
	cmp	r3, #8
	ble	lab31
	nop
	nop
	adds	r7, #76	
	mov	sp, r7
	pop	{r7}
	bx	lr
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
	ldr r1, =0x19912
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x19912
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
	ldr r1, =0x80095
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #87	
push {r1, r2}
	ldr r1, =0x945c1
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x945c1
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x1978f
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark_body:
	push	{r4, r7, lr}
	sub	sp, sp, #836	
	add	r7, sp, #16
	add	r3, r7, #816	
	sub	r3, r3, #812	
	str	r0, [r3, #0]
	movs	r3, #0
	str	r3, [r7, #812]	
	b	lab32
lab35: 	sub	r3, r3, #808	
	ldr	r2, =_global_impure_ptr_2
	mov	r0, r3
	mov	r1, r2
	mov	r3, #400	
	mov	r2, r3
	bl	memcpy
	add	r3, r7, #816	
	sub	r3, r3, #408	
	ldr	r2, [pc, #312]	
	mov	r0, r3
	mov	r1, r2
	mov	r3, #400	
	mov	r2, r3
	bl	memcpy
	ldr	r3, =c	
	movs	r2, #3
	strh	r2, [r3, #0]
	ldr	r3, =d	
	movw	r2, #43690	
	str	r2, [r3, #0]
	ldr	r3, =e	
	movw	r2, #61166	
	str	r2, [r3, #0]
	movs	r3, #0
	str	r3, [r7, #808]	
	b	lab33
lab34: 	sub	r3, r3, #808	
	ldr	r2, [r7, #808]	
	ldrh	r3, [r3, r2, lsl #1]
	sxth	r1, r3
	ldr	r2, =a	
	ldr	r3, [r7, #808]	
	strh	r1, [r2, r3, lsl #1]
	add	r3, r7, #816	
	sub	r3, r3, #408	
	ldr	r2, [r7, #808]	
	ldrh	r3, [r3, r2, lsl #1]
	sxth	r1, r3
	ldr	r2, =b	
	ldr	r3, [r7, #808]	
	strh	r1, [r2, r3, lsl #1]
	ldr	r3, [r7, #808]	
	adds	r3, #1
	str	r3, [r7, #808]	
lab33: 	ldr	r3, [r7, #808]	
	cmp	r3, #199	
	ble	lab34
	ldr	r3, =c	
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r1, =b	
	ldr	r0, =a	
	bl	vec_mpy1
	ldr	r3, =c	
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, =output	
	ldr	r1, =b	
	ldr	r0, =a	
	bl	mac
	mov	r3, r0
	sxth	r2, r3
	ldr	r3, =c	
	strh	r2, [r3, #0]
	ldr	r2, =output	
	ldr	r1, =b	
	ldr	r0, =a	
	bl	fir
	ldr	r2, =output	
	ldr	r1, =b	
	ldr	r0, =a	
	bl	fir_no_red_ld
	ldr	r3, =d	
	ldr	r3, [r3, #0]
	movs	r2, #100	
	ldr	r1, =b	
	ldr	r0, =a	
	bl	latsynth
	mov	r3, r0
	ldr	r2, =d	
	str	r3, [r2, #0]
	ldr	r3, =output	
	ldr	r2, [pc, #136]	
	ldr	r1, =b	
	ldr	r0, =a	
	bl	iir1
	ldr	r3, =d	
	ldr	r0, [r3, #0]
	ldr	r3, =e	
	ldr	r1, [r3, #0]
	ldr	r3, =d	
	ldr	r3, [r3, #0]
	ldr	r2, =c	
	ldrsh	r2, [r2]
	movs	r4, #1
	str	r4, [sp, #12]
	str	r2, [sp, #8]
	ldr	r2, =a	
	str	r2, [sp, #4]
	str	r3, [sp, #0]
	mov	r3, r1
	movs	r2, #17
	movs	r1, #1
	bl	codebook
	mov	r3, r0
	ldr	r2, =e	
	str	r3, [r2, #0]
	ldr	r1, =b	
	ldr	r0, =a	
	bl	jpegdct
	ldr	r3, [r7, #812]	
	adds	r3, #1
	str	r3, [r7, #812]	
lab32: 	add	r3, r7, #816	
	sub	r3, r3, #812	
	ldr	r2, [r7, #812]	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	blt	lab35
	movs	r3, #0
	mov	r0, r3
	add	r7, r7, #820	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0xe2005
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, r7, pc}
	.ltorg
verify_benchmark:
	push	{r7, lr}
	sub	sp, sp, #808	
	add	r7, sp, #0
	add	r3, r7, #808	
	sub	r3, r3, #804	
	str	r0, [r3, #0]
	add	r3, r7, #808	
	sub	r3, r3, #800	
	ldr	r2, [pc, #88]	
	mov	r0, r3
	mov	r1, r2
	mov	r3, #800	
	mov	r2, r3
	bl	memcpy
	add	r3, r7, #8
	mov	r2, #800	
	mov	r1, r3
	ldr	r0, =output	
	bl	memcmp
	push {r1, r2}
	ldr r1, =0xe9647
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	bne	lab36
	ldr	r3, =c	
	ldrsh	r3, [r3]
	movw	r2, #10243	
	cmp	r3, r2
	bne	lab36
	ldr	r3, =d	
	ldr	r3, [r3, #0]
	ldr	r2, =0xe5a959ea	
	cmp	r3, r2
	bne	lab36
	ldr	r3, =e	
	ldr	r3, [r3, #0]
	ldr	r2, =0xe5a959ea	
	cmp	r3, r2
	bne	lab36
	movs	r3, #1
	b	lab37
lab36: 	movs	r3, #0
lab37: 	mov	r0, r3
	add	r7, r7, #808	
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x16b9f
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
	ldr r1, =0x712f3
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	start_trigger
	bl	benchmark
	push {r1, r2}
	ldr r1, =0x17bf9
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
	ldr r1, =0x662a3
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
	ldr r1, =0x4858f
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x00019628	
	ldr	r5, =0x00019628	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab38
	movs	r4, #0
lab39: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x6ae46
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x34c5a
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab39
lab38: 	ldr	r6, =0x00019630	
	ldr	r5, =0x00019628	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab40
	movs	r4, #0
lab41: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0xec9dd
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0xb4c5a
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab41
lab40:	cpsid f
	push {r1, r2}
	ldr r1, =0xe3a05
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, r6, pc}
	.ltorg
memcmp:
	cmp	r2, #3
	push	{r4, lr}
	bls	lab42
	orr	ip, r0, r1
	tst	ip, #3
	mov	r4, r0
	mov	r3, r1
	bne	lab43
lab44: 	mov	r0, r4
	ldr	lr, [r1]
	ldr	ip, [r0]
	cmp	ip, lr
	add	r4, r4, #4
	add	r3, r3, #4
	bne	lab43
	subs	r2, #4
	cmp	r2, #3
	mov	r0, r4
	mov	r1, r3
	bhi	lab44
lab42: 	subs	r4, r2, #1
	cbz	r2, lab45
lab49: 	subs	r1, #1
	b	lab46
lab48: 	beq	lab47
lab46: 	ldrb	lr, [ip, #1]!
	ldrb	r2, [r1, #1]!
	cmp	lr, r2
	sub	r3, r4, ip
	beq	lab48
	sub	r0, lr, r2
	cpsid f
	push {r1, r2}
	ldr r1, =0x137fb
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, pc}
lab43: 	subs	r4, r2, #1
	b	lab49
lab47: 	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x9618a
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, pc}
lab45: 	mov	r0, r2
	cpsid f
	push {r1, r2}
	ldr r1, =0x1618a
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, pc}
memcpy:
	mov	ip, r0
	orr	r3, r1, r0
	ands	r3, r3, #3
	bne	lab50
lab59: 	bcc	lab51
lab52: 	str	r3, [r0], #4
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
	bcs	lab52
lab51: 	adds	r2, #48	
	bcc	lab53
lab54: 	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	ldr	r3, [r1], #4
	str	r3, [r0], #4
	subs	r2, #16
	bcs	lab54
lab53: 	adds	r2, #12
	bcc	lab55
lab56: 	str	r3, [r0], #4
	subs	r2, #4
	bcs	lab56
lab55: 	adds	r2, #4
	beq	lab57
	lsls	r2, r2, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab57
	ldrh	r3, [r1, #0]
	strh	r3, [r0, #0]
lab57: 	mov	r0, ip
	bx	lr
	nop
lab50: 	cmp	r2, #8
	bcc	lab58
	lsls	r3, r1, #30
	beq	lab59
	ands	r3, r0, #3
	beq	lab59
	rsb	r3, r3, #4
	subs	r2, r2, r3
	lsls	r3, r3, #31
	itt	ne
	ldrbne	r3, [r1], #1
	strbne	r3, [r0], #1
	bcc	lab59
	ldrh	r3, [r1], #2
	strh	r3, [r0], #2
	b	lab59
lab58: 	subs	r2, #4
	bcc	lab55
lab60: 	ldrb	r3, [r1], #1
	strb	r3, [r0], #1
	bcs	lab60
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
	beq	lab61
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab62
	uxtb	r2, r1
	mov	r3, r0
	b	lab63
lab64: 	bcc	lab62
lab63: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab64
lab72: 	bls	lab65
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab66
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab67: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab67
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab68
lab73: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab69: 	cmp	r3, r2
	bne	lab69
	and	r4, ip, #3
lab65: 	cbz	r4, lab62
lab71: 	add	r4, r3
lab70: 	cmp	r4, r3
	bne	lab70
lab62:	cpsid f
	push {r1, r2}
	ldr r1, =0x4670d
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, pc}
lab68: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab71
	b	lab62
lab61: 	mov	r3, r0
	mov	r4, r2
	b	lab72
lab66: 	mov	r2, r3
	mov	ip, r4
	b	lab73
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
	cbz	r6, lab74
	mov	r9, #1
	mov	sl, #0
lab80: 	subs	r5, r4, #1
	bmi	lab74
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab76: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab75
lab77: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab76
lab74: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab75: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab77
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab78
	blx	r2
lab83: 	cmp	r2, fp
	bne	lab79
lab82: 	cmp	r3, r6
	beq	lab77
	mov	r6, r3
	cmp	r6, #0
	bne	lab80
	b	lab74
lab78: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab81
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab82
lab79: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab80
	b	lab74
lab81: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab83
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =0x00019634	
	ldr	r5, =0x00019630	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab84
	subs	r3, #4
	add	r5, r3
lab85: 	ldr	r3, [r5], #-4
	cpsid f
	push {r1, r2}
	ldr r1, =0x692a7
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r4, #0
	push {r1, r2}
	ldr r1, =0x17b37
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab85
lab84: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab86
lab90: 	cmp	r5, #31
	bgt	lab87
	cbnz	r6, lab88
lab89: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab91:	cpsid f
	push {r1, r2}
	ldr r1, =0x3d721
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 lab88: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab89
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab89
lab86: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab90
lab87: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab91
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
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x07ff0000
	.word	0x08000c00
	.word	0xf8000200
	.word	0x0400f300
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x0c400c60
	.word	0x0c000c20
	.word	0xf400f600
	.word	0xf000f200
	.word	0x00000eb0
	.word	0x000010ad
	.word	0x00000c36
	.word	0x00000406
	.word	0x00000995
	.word	0xffffee07
	.word	0x000007bd
	.word	0xfffffbe0
	.word	0x00000a3d
	.word	0x000010ad
	.word	0x00000bf2
	.word	0x00000406
	.word	0x0000094a
	.word	0xffffee07
	.word	0x0000076e
	.word	0xfffffbe0
	.word	0x000009f4
	.word	0x000010ad
	.word	0x00000bac
	.word	0x00000406
	.word	0x000008fc
	.word	0xffffee07
	.word	0x0000071e
	.word	0xfffffbe0
	.word	0x000009aa
	.word	0x000010ad
	.word	0x00000b65
	.word	0x00000406
	.word	0x000008ac
	.word	0xffffee07
	.word	0x000006ca
	.word	0xfffffbe0
	.word	0x0000095e
	.word	0x000010ad
	.word	0x00000b1c
	.word	0x00000406
	.word	0x0000085c
	.word	0xffffee07
	.word	0x00000677
	.word	0xfffffbe0
	.word	0x00000911
	.word	0x000010ad
	.word	0x00000ad2
	.word	0x00000406
	.word	0x0000080a
	.word	0xffffee07
	.word	0x00000621
	.word	0xfffffbe0
	.word	0x000008c2
	.word	0x000010ad
	.word	0x00000868
	.word	0x00000406
	.word	0x00000693
	.word	0xffffee07
	.word	0x0000065b
	.word	0xfffffbe0
	.word	0x000007ee
	.word	0x000010ad
	.word	0x00000820
	.word	0x00000406
	.word	0x0000064b
	.word	0xffffee07
	.word	0x00000613
	.word	0xfffffbe0
	.word	0x000007a6
	.word	0x000010ad
	.word	0x000007d8
	.word	0x00000406
	.word	0x00000603
	.word	0xffffee07
	.word	0x000005cb
	.word	0xfffffbe0
	.word	0x0000075e
	.word	0x000010ad
	.word	0x0000078f
	.word	0x00000406
	.word	0x000005ba
	.word	0xffffee07
	.word	0x00000582
	.word	0xfffffbe0
	.word	0x00000715
	.word	0x000010ad
	.word	0x00000746
	.word	0x00000406
	.word	0x00000571
	.word	0xffffee07
	.word	0x00000539
	.word	0xfffffbe0
	.word	0x000006cc
	.word	0x000010ad
	.word	0x000006fd
	.word	0x00000406
	.word	0x00000528
	.word	0xffffee07
	.word	0x000004f0
	.word	0xfffffbe0
	.word	0x00000683
	.word	0x000010ad
	.word	0x000006b4
	.word	0x00000406
	.word	0x000007b0
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
	.word	0x00019638


	.data

impure_data:
	.word	0x00000000
	.word	0x00019924
	.word	0x0001998c
	.word	0x000199f4
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
	.word	0x0001a0cc


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
a:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
b:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
c:
	.word	0x00000000
d:
	.word	0x00000000
e:
	.word	0x00000000
output:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
