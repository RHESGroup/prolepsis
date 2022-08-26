	.cpu cortex-m4
	.text
	.thumb
	.syntax unified

_start:
b 

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
	mov.w r1, #998813
	mov.w r2, #1610612736 
	cbz	r3, lab1
	ldr	r0, =0x00008559	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	mov.w r1, #86718
	mov.w r2, #1610612736 
	ldr	r4, =__bss_start	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x00008634	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	mov.w r1, #242052
	mov.w r2, #1610612736 
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x00008634	
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
	ldr	r2, =0x00018a94	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	mov.w r1, #174854
	mov.w r2, #1610612736 
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
	ldr	r0, =0x0000854d	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x00008559	
push {r1, r2}
	mov.w r1, #144736
	mov.w r2, #1610612736 
lab7:	push {r1, r2}
	mov.w r1, #144736
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #279449
	mov.w r2, #1610612736 
	movs	r1, r5
	bl	main
	push {r1, r2}
	mov.w r1, #57960
	mov.w r2, #1610612736 
	nop
	.ltorg
countPrimes:
	push	{r7}
	sub	sp, #364	
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #356]	
	movs	r3, #2
	str	r3, [r7, #172]	
	add	r3, r7, #360	
	sub	r3, r3, #356	
	movs	r2, #4
	str	r2, [r3, #0]
	ldr	r3, [r7, #356]	
	adds	r3, #1
	str	r3, [r7, #356]	
	movs	r3, #1
	str	r3, [r7, #352]	
	movs	r3, #3
	str	r3, [r7, #348]	
	movs	r3, #2
	str	r3, [r7, #344]	
	b	lab8
lab9: 	adds	r3, #1
	str	r3, [r7, #344]	
lab8: 	ldr	r3, [r7, #344]	
	mul	r3, r3, r3
	ldr	r2, [r7, #348]	
	cmp	r2, r3
	bge	lab9
	ldr	r3, [r7, #344]	
	subs	r3, #1
	str	r3, [r7, #344]	
	movs	r3, #0
	str	r3, [r7, #340]	
	b	lab10
lab15: 	lsls	r3, r3, #2
	add	r3, r3, #360	
	add	r3, r7
	ldr	r3, [r3, #-188]
	ldr	r2, [r7, #344]	
	cmp	r2, r3
	blt	lab11
	b	lab12
lab13: 	sub	r3, r3, #356	
	ldr	r2, [r7, #340]	
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [r7, #340]	
	lsls	r3, r3, #2
	add	r3, r3, #360	
	add	r3, r7
	ldr	r3, [r3, #-188]
	adds	r1, r2, r3
	add	r3, r7, #360	
	sub	r3, r3, #356	
	ldr	r2, [r7, #340]	
	str	r1, [r3, r2, lsl #2]
lab12: 	add	r3, r7, #360	
	sub	r3, r3, #356	
	ldr	r2, [r7, #340]	
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [r7, #348]	
	cmp	r2, r3
	bgt	lab13
	add	r3, r7, #360	
	sub	r3, r3, #356	
	ldr	r2, [r7, #340]	
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [r7, #348]	
	cmp	r2, r3
	beq	lab14
	ldr	r3, [r7, #340]	
	adds	r3, #1
	str	r3, [r7, #340]	
lab10: 	ldr	r2, [r7, #340]	
	ldr	r3, [r7, #356]	
	cmp	r2, r3
	blt	lab15
	b	lab16
lab11: 	nop
	ldr	r3, [r7, #356]	
	cmp	r3, #41	
	bgt	lab17
	ldr	r3, [r7, #356]	
	lsls	r3, r3, #2
	add	r3, r3, #360	
	add	r3, r7
	ldr	r2, [r7, #348]	
	str	r2, [r3, #-188]
	ldr	r3, [r7, #348]	
	mul	r1, r3, r3
	add	r3, r7, #360	
	sub	r3, r3, #356	
	ldr	r2, [r7, #356]	
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [r7, #356]	
	adds	r3, #1
	str	r3, [r7, #356]	
lab17: 	ldr	r3, [r7, #352]	
	adds	r3, #1
	str	r3, [r7, #352]	
	b	lab18
lab14: 	nop
lab18: 	ldr	r3, [r7, #348]	
	adds	r3, #1
	str	r3, [r7, #348]	
	b	lab8
lab16: 	ldr	r3, [r7, #352]	
	mov	r0, r3
	add	r7, r7, #364	
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
	mov.w r1, #684883
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #684883
	mov.w r2, #1610612736 
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #284484
	mov.w r2, #1610612736 
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #1
push {r1, r2}
	mov.w r1, #268538
	mov.w r2, #1610612736 
	push {r1, r2}
	mov.w r1, #268538
	mov.w r2, #1610612736 
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #170893
	mov.w r2, #1610612736 
benchmark_body:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab19
lab20: 	str	r0, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab19: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab20
	ldr	r3, [r7, #8]
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #234123
	mov.w r2, #1610612736 
initialise_benchmark:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
verify_benchmark:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movw	r2, #3512	
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
	mov.w r1, #639148
	mov.w r2, #1610612736 
	bl	benchmark
	push {r1, r2}
	mov.w r1, #311044
	mov.w r2, #1610612736 
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
	mov.w r1, #341384
	mov.w r2, #1610612736 
	movs	r0, r0
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x00018638	
	ldr	r5, =0x00018638	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab21
	movs	r4, #0
lab22: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #28136
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #-368753
	mov.w r2, #1610612736 
lab21: 	ldr	r6, =0x00018640	
	ldr	r5, =0x00018638	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab23
	movs	r4, #0
lab24: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	mov.w r1, #-556241
	mov.w r2, #1610612736 
	cmp	r6, r4
	push {r1, r2}
	mov.w r1, #155535
	mov.w r2, #1610612736 
lab23:	cpsid f
	push {r1, r2}
	mov.w r1, #687411
	mov.w r2, #1610612736 
	.ltorg
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab25
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab26
	uxtb	r2, r1
	mov	r3, r0
	b	lab27
lab28: 	bcc	lab26
lab27: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab28
lab36: 	bls	lab29
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab30
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab31: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab31
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab32
lab37: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab33: 	cmp	r3, r2
	bne	lab33
	and	r4, ip, #3
lab29: 	cbz	r4, lab26
lab35: 	add	r4, r3
lab34: 	cmp	r4, r3
	bne	lab34
lab26:	cpsid f
	push {r1, r2}
	mov.w r1, #831371
	mov.w r2, #1610612736 
lab32: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab35
	b	lab26
lab25: 	mov	r3, r0
	mov	r4, r2
	b	lab36
lab30: 	mov	r2, r3
	mov	ip, r4
	b	lab37
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
	cbz	r6, lab38
	mov	r9, #1
	mov	sl, #0
lab44: 	subs	r5, r4, #1
	bmi	lab38
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab40: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab39
lab41: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab40
lab38: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab39: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab41
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab42
	blx	r2
lab47: 	cmp	r2, fp
	bne	lab43
lab46: 	cmp	r3, r6
	beq	lab41
	mov	r6, r3
	cmp	r6, #0
	bne	lab44
	b	lab38
lab42: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab45
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab46
lab43: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab44
	b	lab38
lab45: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab47
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =0x00018644	
	ldr	r5, =0x00018640	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab48
	subs	r3, #4
	add	r5, r3
lab49: 	ldr	r3, [r5], #-4
	cpsid f
	push {r1, r2}
	mov.w r1, #370165
	mov.w r2, #1610612736 
	cmp	r4, #0
	push {r1, r2}
	mov.w r1, #700859
	mov.w r2, #1610612736 
lab48: 	ldmia	sp!, {r3, r4, r5, lr}
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
	cbz	r4, lab50
lab54: 	cmp	r5, #31
	bgt	lab51
	cbnz	r6, lab52
lab53: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab55:	cpsid f
	push {r1, r2}
	mov.w r1, #836435
	mov.w r2, #1610612736 
lab52: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab53
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab53
lab50: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab54
lab51: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab55
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
	.word	0x00018648


	.data

impure_data:
	.word	0x00000000
	.word	0x00018934
	.word	0x0001899c
	.word	0x00018a04
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
	.word	0x00018a90


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
