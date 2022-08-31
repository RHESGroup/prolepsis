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
	ldr r1, =0x0c56
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =0x00000000	
	cbz	r3, lab1
	ldr	r0, =0x0000848d	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	ldr r1, =0x18fd
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
	ldr	r0, =0x00008968	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	ldr r1, =0x14dd
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
	ldr	r0, =0x00008968	
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
	ldr	r2, =0x00018dd4	
	subs	r2, r2, r0
	bl	memset
	push {r1, r2}
	ldr r1, =0x06f3
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
	ldr	r0, =0x00008481	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x0000848d	
push {r1, r2}
	ldr r1, =0x02f7
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	atexit
lab7:	push {r1, r2}
	ldr r1, =0x02f7
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	bl	__libc_init_array
	push {r1, r2}
	ldr r1, =0x0c66
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, r4
	movs	r1, r5
	bl	main
	push {r1, r2}
	ldr r1, =0x1136
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	exit
	nop
	.ltorg
crc32pseudo:
	push	{r4, r7, lr}
	sub	sp, #12
	add	r7, sp, #0
	mov	r4, #4294967295	
	movs	r3, #0
	str	r3, [r7, #4]
	b	lab8
lab9: 	mov	r3, r0
	uxtb	r3, r3
	eors	r3, r4
	uxtb	r3, r3
	ldr	r2, =crc_32_tab	
	ldr	r2, [r2, r3, lsl #2]
	lsrs	r3, r4, #8
	eor	r4, r2, r3
	ldr	r3, [r7, #4]
	adds	r3, #1
	str	r3, [r7, #4]
lab8: 	ldr	r3, [r7, #4]
	cmp	r3, #1024	
	blt	lab9
	mvns	r3, r4
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x15bf
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, r7, pc}
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
	ldr r1, =0x04f9
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x04f9
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
	ldr r1, =0x095c
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movs	r0, #170	
push {r1, r2}
	ldr r1, =0x14f9
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x14f9
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x0c42
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
	b	lab10
lab11: 	bl	srand_beebs
	bl	crc32pseudo
	push {r1, r2}
	ldr r1, =0x0669
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
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
	cpsid f
	push {r1, r2}
	ldr r1, =0x097d
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
verify_benchmark:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movw	r2, #11433	
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
	ldr r1, =0x02cc
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	start_trigger
	bl	benchmark
	push {r1, r2}
	ldr r1, =0x10a8
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
	ldr r1, =0x0e3b
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
rand_beebs:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =seed	
	ldr	r3, [r3, #0]
	ldr	r2, =0x41c64e6d	
	mul	r3, r2, r3
	add	r3, r3, #12288	
	adds	r3, #57	
	bic	r3, r3, #2147483648	
	ldr	r2, =seed	
	str	r3, [r2, #0]
	ldr	r3, =seed	
	ldr	r3, [r3, #0]
	asrs	r3, r3, #16
	mov	r0, r3
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
srand_beebs:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r2, =seed	
	str	r3, [r2, #0]
	nop
	adds	r7, #12
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x0001896c	
	ldr	r5, =0x0001896c	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab12
	movs	r4, #0
lab13: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x0037
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x12f7
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab13
lab12: 	ldr	r6, =0x00018974	
	ldr	r5, =0x0001896c	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab14
	movs	r4, #0
lab15: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x1037
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x1fee
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab15
lab14:	cpsid f
	push {r1, r2}
	ldr r1, =0x0096
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, r6, pc}
	.ltorg
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
lab17:	cpsid f
	push {r1, r2}
	ldr r1, =0x087e
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, pc}
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
	cbz	r6, lab29
	mov	r9, #1
	mov	sl, #0
lab35: 	subs	r5, r4, #1
	bmi	lab29
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab31: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab30
lab32: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab31
lab29: 	ldr	r3, =__atexit_recursive_mutex	
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
	ldr	r0, [r6, #392]	
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
lab33: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab36
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab37
lab34: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab35
	b	lab29
lab36: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab38
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =impure_data	
	ldr	r5, =0x00018974	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab39
	subs	r3, #4
	add	r5, r3
lab40: 	ldr	r3, [r5], #-4
	cpsid f
	push {r1, r2}
	ldr r1, =0x03ff
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r4, #0
	push {r1, r2}
	ldr r1, =0x05a2
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab40
lab39: 	ldmia	sp!, {r3, r4, r5, lr}
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
lab46:	cpsid f
	push {r1, r2}
	ldr r1, =0x0cfc
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 lab43: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab44
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab44
lab41: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab45
lab42: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab46
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

crc_32_tab:
	.word	0x00000000
	.word	0x77073096
	.word	0xee0e612c
	.word	0x990951ba
	.word	0x076dc419
	.word	0x706af48f
	.word	0xe963a535
	.word	0x9e6495a3
	.word	0x0edb8832
	.word	0x79dcb8a4
	.word	0xe0d5e91e
	.word	0x97d2d988
	.word	0x09b64c2b
	.word	0x7eb17cbd
	.word	0xe7b82d07
	.word	0x90bf1d91
	.word	0x1db71064
	.word	0x6ab020f2
	.word	0xf3b97148
	.word	0x84be41de
	.word	0x1adad47d
	.word	0x6ddde4eb
	.word	0xf4d4b551
	.word	0x83d385c7
	.word	0x136c9856
	.word	0x646ba8c0
	.word	0xfd62f97a
	.word	0x8a65c9ec
	.word	0x14015c4f
	.word	0x63066cd9
	.word	0xfa0f3d63
	.word	0x8d080df5
	.word	0x3b6e20c8
	.word	0x4c69105e
	.word	0xd56041e4
	.word	0xa2677172
	.word	0x3c03e4d1
	.word	0x4b04d447
	.word	0xd20d85fd
	.word	0xa50ab56b
	.word	0x35b5a8fa
	.word	0x42b2986c
	.word	0xdbbbc9d6
	.word	0xacbcf940
	.word	0x32d86ce3
	.word	0x45df5c75
	.word	0xdcd60dcf
	.word	0xabd13d59
	.word	0x26d930ac
	.word	0x51de003a
	.word	0xc8d75180
	.word	0xbfd06116
	.word	0x21b4f4b5
	.word	0x56b3c423
	.word	0xcfba9599
	.word	0xb8bda50f
	.word	0x2802b89e
	.word	0x5f058808
	.word	0xc60cd9b2
	.word	0xb10be924
	.word	0x2f6f7c87
	.word	0x58684c11
	.word	0xc1611dab
	.word	0xb6662d3d
	.word	0x76dc4190
	.word	0x01db7106
	.word	0x98d220bc
	.word	0xefd5102a
	.word	0x71b18589
	.word	0x06b6b51f
	.word	0x9fbfe4a5
	.word	0xe8b8d433
	.word	0x7807c9a2
	.word	0x0f00f934
	.word	0x9609a88e
	.word	0xe10e9818
	.word	0x7f6a0dbb
	.word	0x086d3d2d
	.word	0x91646c97
	.word	0xe6635c01
	.word	0x6b6b51f4
	.word	0x1c6c6162
	.word	0x856530d8
	.word	0xf262004e
	.word	0x6c0695ed
	.word	0x1b01a57b
	.word	0x8208f4c1
	.word	0xf50fc457
	.word	0x65b0d9c6
	.word	0x12b7e950
	.word	0x8bbeb8ea
	.word	0xfcb9887c
	.word	0x62dd1ddf
	.word	0x15da2d49
	.word	0x8cd37cf3
	.word	0xfbd44c65
	.word	0x4db26158
	.word	0x3ab551ce
	.word	0xa3bc0074
	.word	0xd4bb30e2
	.word	0x4adfa541
	.word	0x3dd895d7
	.word	0xa4d1c46d
	.word	0xd3d6f4fb
	.word	0x4369e96a
	.word	0x346ed9fc
	.word	0xad678846
	.word	0xda60b8d0
	.word	0x44042d73
	.word	0x33031de5
	.word	0xaa0a4c5f
	.word	0xdd0d7cc9
	.word	0x5005713c
	.word	0x270241aa
	.word	0xbe0b1010
	.word	0xc90c2086
	.word	0x5768b525
	.word	0x206f85b3
	.word	0xb966d409
	.word	0xce61e49f
	.word	0x5edef90e
	.word	0x29d9c998
	.word	0xb0d09822
	.word	0xc7d7a8b4
	.word	0x59b33d17
	.word	0x2eb40d81
	.word	0xb7bd5c3b
	.word	0xc0ba6cad
	.word	0xedb88320
	.word	0x9abfb3b6
	.word	0x03b6e20c
	.word	0x74b1d29a
	.word	0xead54739
	.word	0x9dd277af
	.word	0x04db2615
	.word	0x73dc1683
	.word	0xe3630b12
	.word	0x94643b84
	.word	0x0d6d6a3e
	.word	0x7a6a5aa8
	.word	0xe40ecf0b
	.word	0x9309ff9d
	.word	0x0a00ae27
	.word	0x7d079eb1
	.word	0xf00f9344
	.word	0x8708a3d2
	.word	0x1e01f268
	.word	0x6906c2fe
	.word	0xf762575d
	.word	0x806567cb
	.word	0x196c3671
	.word	0x6e6b06e7
	.word	0xfed41b76
	.word	0x89d32be0
	.word	0x10da7a5a
	.word	0x67dd4acc
	.word	0xf9b9df6f
	.word	0x8ebeeff9
	.word	0x17b7be43
	.word	0x60b08ed5
	.word	0xd6d6a3e8
	.word	0xa1d1937e
	.word	0x38d8c2c4
	.word	0x4fdff252
	.word	0xd1bb67f1
	.word	0xa6bc5767
	.word	0x3fb506dd
	.word	0x48b2364b
	.word	0xd80d2bda
	.word	0xaf0a1b4c
	.word	0x36034af6
	.word	0x41047a60
	.word	0xdf60efc3
	.word	0xa867df55
	.word	0x316e8eef
	.word	0x4669be79
	.word	0xcb61b38c
	.word	0xbc66831a
	.word	0x256fd2a0
	.word	0x5268e236
	.word	0xcc0c7795
	.word	0xbb0b4703
	.word	0x220216b9
	.word	0x5505262f
	.word	0xc5ba3bbe
	.word	0xb2bd0b28
	.word	0x2bb45a92
	.word	0x5cb36a04
	.word	0xc2d7ffa7
	.word	0xb5d0cf31
	.word	0x2cd99e8b
	.word	0x5bdeae1d
	.word	0x9b64c2b0
	.word	0xec63f226
	.word	0x756aa39c
	.word	0x026d930a
	.word	0x9c0906a9
	.word	0xeb0e363f
	.word	0x72076785
	.word	0x05005713
	.word	0x95bf4a82
	.word	0xe2b87a14
	.word	0x7bb12bae
	.word	0x0cb61b38
	.word	0x92d28e9b
	.word	0xe5d5be0d
	.word	0x7cdcefb7
	.word	0x0bdbdf21
	.word	0x86d3d2d4
	.word	0xf1d4e242
	.word	0x68ddb3f8
	.word	0x1fda836e
	.word	0x81be16cd
	.word	0xf6b9265b
	.word	0x6fb077e1
	.word	0x18b74777
	.word	0x88085ae6
	.word	0xff0f6a70
	.word	0x66063bca
	.word	0x11010b5c
	.word	0x8f659eff
	.word	0xf862ae69
	.word	0x616bffd3
	.word	0x166ccf45
	.word	0xa00ae278
	.word	0xd70dd2ee
	.word	0x4e048354
	.word	0x3903b3c2
	.word	0xa7672661
	.word	0xd06016f7
	.word	0x4969474d
	.word	0x3e6e77db
	.word	0xaed16a4a
	.word	0xd9d65adc
	.word	0x40df0b66
	.word	0x37d83bf0
	.word	0xa9bcae53
	.word	0xdebb9ec5
	.word	0x47b2cf7f
	.word	0x30b5ffe9
	.word	0xbdbdf21c
	.word	0xcabac28a
	.word	0x53b39330
	.word	0x24b4a3a6
	.word	0xbad03605
	.word	0xcdd70693
	.word	0x54de5729
	.word	0x23d967bf
	.word	0xb3667a2e
	.word	0xc4614ab8
	.word	0x5d681b02
	.word	0x2a6f2b94
	.word	0xb40bbe37
	.word	0xc30c8ea1
	.word	0x5a05df1b
	.word	0x2d02ef8d
_global_impure_ptr:
	.word	0x00018978


	.data

impure_data:
	.word	0x00000000
	.word	0x00018c64
	.word	0x00018ccc
	.word	0x00018d34
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
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
	.word	0x00018dd0


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
seed:
	.word	0x00000000
heap_ptr:
	.word	0x00000000
heap_end:
	.word	0x00000000
heap_requested:
	.word	0x00000000
__lock___atexit_recursive_mutex:
	.word	0x00000000
