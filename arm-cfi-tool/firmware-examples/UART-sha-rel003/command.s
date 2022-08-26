	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"command.c"
	.text
	.comm	out,128,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"GETK command received correctly\012\000"
	.text
	.align	1
	.global	get_key
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	get_key, %function
get_key:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	add	r7, sp, #0
	ldr	r3, .L4
	ldr	r2, .L4+4
	mov	r4, r2
	mov	ip, r3
	add	lr, r4, #32
.L2:
	mov	r5, ip
	mov	r6, r4
	ldmia	r6!, {r0, r1, r2, r3}
	str	r0, [r5]	@ unaligned
	str	r1, [r5, #4]	@ unaligned
	str	r2, [r5, #8]	@ unaligned
	str	r3, [r5, #12]	@ unaligned
	adds	r4, r4, #16
	add	ip, ip, #16
	cmp	r4, lr
	bne	.L2
	mov	r3, ip
	mov	r2, r4
	ldrb	r2, [r2]
	strb	r2, [r3]
	mov	r3, #-1
	movs	r2, #32
	ldr	r1, .L4
	ldr	r0, .L4+8
	bl	HAL_UART_Transmit
	movs	r3, #0
	mov	r0, r3
	pop	{r3, r4, r5, r6, r7, pc}
.L5:
	.align	2
.L4:
	.word	out
	.word	.LC0
	.word	huart1
	.size	get_key, .-get_key
	.section	.rodata
	.align	2
.LC1:
	.ascii	"SETK command received correctly\012\000"
	.text
	.align	1
	.global	set_key
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	set_key, %function
set_key:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	add	r7, sp, #0
	ldr	r3, .L9
	ldr	r2, .L9+4
	mov	r4, r2
	mov	ip, r3
	add	lr, r4, #32
.L7:
	mov	r5, ip
	mov	r6, r4
	ldmia	r6!, {r0, r1, r2, r3}
	str	r0, [r5]	@ unaligned
	str	r1, [r5, #4]	@ unaligned
	str	r2, [r5, #8]	@ unaligned
	str	r3, [r5, #12]	@ unaligned
	adds	r4, r4, #16
	add	ip, ip, #16
	cmp	r4, lr
	bne	.L7
	mov	r3, ip
	mov	r2, r4
	ldrb	r2, [r2]
	strb	r2, [r3]
	mov	r3, #-1
	movs	r2, #32
	ldr	r1, .L9
	ldr	r0, .L9+8
	bl	HAL_UART_Transmit
	movs	r3, #0
	mov	r0, r3
	pop	{r3, r4, r5, r6, r7, pc}
.L10:
	.align	2
.L9:
	.word	out
	.word	.LC1
	.word	huart1
	.size	set_key, .-set_key
	.section	.rodata
	.align	2
.LC2:
	.ascii	"SETP command received correctly\012\000"
	.text
	.align	1
	.global	set_password
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	set_password, %function
set_password:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	add	r7, sp, #0
	ldr	r3, .L14
	ldr	r2, .L14+4
	mov	r4, r2
	mov	ip, r3
	add	lr, r4, #32
.L12:
	mov	r5, ip
	mov	r6, r4
	ldmia	r6!, {r0, r1, r2, r3}
	str	r0, [r5]	@ unaligned
	str	r1, [r5, #4]	@ unaligned
	str	r2, [r5, #8]	@ unaligned
	str	r3, [r5, #12]	@ unaligned
	adds	r4, r4, #16
	add	ip, ip, #16
	cmp	r4, lr
	bne	.L12
	mov	r3, ip
	mov	r2, r4
	ldrb	r2, [r2]
	strb	r2, [r3]
	mov	r3, #-1
	movs	r2, #32
	ldr	r1, .L14
	ldr	r0, .L14+8
	bl	HAL_UART_Transmit
	movs	r3, #0
	mov	r0, r3
	pop	{r3, r4, r5, r6, r7, pc}
.L15:
	.align	2
.L14:
	.word	out
	.word	.LC2
	.word	huart1
	.size	set_password, .-set_password
	.section	.rodata
	.align	2
.LC3:
	.ascii	"LOGN command received correctly\012\000"
	.text
	.align	1
	.global	login
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	login, %function
login:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	add	r7, sp, #0
	ldr	r3, .L19
	ldr	r2, .L19+4
	mov	r4, r2
	mov	ip, r3
	add	lr, r4, #32
.L17:
	mov	r5, ip
	mov	r6, r4
	ldmia	r6!, {r0, r1, r2, r3}
	str	r0, [r5]	@ unaligned
	str	r1, [r5, #4]	@ unaligned
	str	r2, [r5, #8]	@ unaligned
	str	r3, [r5, #12]	@ unaligned
	adds	r4, r4, #16
	add	ip, ip, #16
	cmp	r4, lr
	bne	.L17
	mov	r3, ip
	mov	r2, r4
	ldrb	r2, [r2]
	strb	r2, [r3]
	mov	r3, #-1
	movs	r2, #32
	ldr	r1, .L19
	ldr	r0, .L19+8
	bl	HAL_UART_Transmit
	movs	r3, #0
	mov	r0, r3
	pop	{r3, r4, r5, r6, r7, pc}
.L20:
	.align	2
.L19:
	.word	out
	.word	.LC3
	.word	huart1
	.size	login, .-login
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Control Flow Redirected\012\000"
	.text
	.align	1
	.global	cf
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	cf, %function
cf:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	add	r7, sp, #0
	ldr	r2, .L23
	ldr	r3, .L23+4
	mov	r5, r2
	mov	r4, r3
	ldmia	r4!, {r0, r1, r2, r3}
	str	r0, [r5]	@ unaligned
	str	r1, [r5, #4]	@ unaligned
	str	r2, [r5, #8]	@ unaligned
	str	r3, [r5, #12]	@ unaligned
	ldmia	r4!, {r0, r1}
	str	r0, [r5, #16]	@ unaligned
	str	r1, [r5, #20]	@ unaligned
	ldrb	r3, [r4]
	strb	r3, [r5, #24]
	mov	r3, #-1
	movs	r2, #24
	ldr	r1, .L23
	ldr	r0, .L23+8
	bl	HAL_UART_Transmit
	movs	r3, #0
	mov	r0, r3
	pop	{r4, r5, r7, pc}
.L24:
	.align	2
.L23:
	.word	out
	.word	.LC4
	.word	huart1
	.size	cf, .-cf
	.align	1
	.global	receive_command
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	receive_command, %function
receive_command:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r3, .L29
	movs	r2, #0
	strb	r2, [r3]
	b	.L26
.L27:
	adds	r3, r7, #3
	movs	r2, #1
	mov	r1, r3
	ldr	r0, .L29+4
	bl	HAL_UART_Receive_IT
	mov	r3, r0
	cmp	r3, #2
	beq	.L26
	ldr	r3, .L29+4
	ldrb	r3, [r3, #58]
	uxtb	r3, r3
	cmp	r3, #34
	bne	.L26
	ldr	r3, .L29
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [r7, #3]	@ zero_extendqisi2
	add	r1, r7, #8
	add	r3, r3, r1
	strb	r2, [r3, #-4]
	ldr	r3, .L29
	ldrb	r3, [r3]	@ zero_extendqisi2
	adds	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L29
	strb	r2, [r3]
.L26:
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L27
	ldr	r3, .L29
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r2, .L29+8
	str	r3, [r2]	@ unaligned
	ldr	r3, [r7, #4]
	ldr	r2, .L29+12
	str	r3, [r2]	@ unaligned
	ldr	r3, .L29+16
	movs	r2, #1
	strb	r2, [r3]
	movs	r3, #0
	strb	r3, [r7, #3]
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L30:
	.align	2
.L29:
	.word	count
	.word	huart1
	.word	command
	.word	string
	.word	cmd_end
	.size	receive_command, .-receive_command
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
