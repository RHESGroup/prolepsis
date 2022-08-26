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
	.file	"stm32f4xx_hal_cortex.c"
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_SetPriorityGrouping, %function
__NVIC_SetPriorityGrouping:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	and	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, .L2
	ldr	r3, [r3, #12]
	str	r3, [r7, #8]
	ldr	r2, [r7, #8]
	movw	r3, #63743
	ands	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	lsls	r2, r3, #8
	ldr	r3, [r7, #8]
	orrs	r3, r3, r2
	orr	r3, r3, #100139008
	orr	r3, r3, #131072
	str	r3, [r7, #8]
	ldr	r2, .L2
	ldr	r3, [r7, #8]
	str	r3, [r2, #12]
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	-536810240
	.size	__NVIC_SetPriorityGrouping, .-__NVIC_SetPriorityGrouping
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_GetPriorityGrouping, %function
__NVIC_GetPriorityGrouping:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L6
	ldr	r3, [r3, #12]
	lsrs	r3, r3, #8
	and	r3, r3, #7
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	-536810240
	.size	__NVIC_GetPriorityGrouping, .-__NVIC_GetPriorityGrouping
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_EnableIRQ, %function
__NVIC_EnableIRQ:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	cmp	r3, #0
	blt	.L10
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	and	r2, r3, #31
	ldr	r1, .L11
	ldrsb	r3, [r7, #7]
	lsrs	r3, r3, #5
	movs	r0, #1
	lsl	r2, r0, r2
	str	r2, [r1, r3, lsl #2]
.L10:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	-536813312
	.size	__NVIC_EnableIRQ, .-__NVIC_EnableIRQ
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_DisableIRQ, %function
__NVIC_DisableIRQ:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	cmp	r3, #0
	blt	.L15
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	and	r2, r3, #31
	ldr	r1, .L16
	ldrsb	r3, [r7, #7]
	lsrs	r3, r3, #5
	movs	r0, #1
	lsl	r2, r0, r2
	adds	r3, r3, #32
	str	r2, [r1, r3, lsl #2]
	.syntax unified
@ 879 "../Drivers/CMSIS/Include/cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
@ 868 "../Drivers/CMSIS/Include/cmsis_gcc.h" 1
	isb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.L15:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L17:
	.align	2
.L16:
	.word	-536813312
	.size	__NVIC_DisableIRQ, .-__NVIC_DisableIRQ
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_GetPendingIRQ, %function
__NVIC_GetPendingIRQ:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	cmp	r3, #0
	blt	.L19
	ldr	r2, .L21
	ldrsb	r3, [r7, #7]
	lsrs	r3, r3, #5
	adds	r3, r3, #64
	ldr	r2, [r2, r3, lsl #2]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	and	r3, r3, #31
	lsr	r3, r2, r3
	and	r3, r3, #1
	b	.L20
.L19:
	movs	r3, #0
.L20:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	-536813312
	.size	__NVIC_GetPendingIRQ, .-__NVIC_GetPendingIRQ
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_SetPendingIRQ, %function
__NVIC_SetPendingIRQ:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	cmp	r3, #0
	blt	.L25
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	and	r2, r3, #31
	ldr	r1, .L26
	ldrsb	r3, [r7, #7]
	lsrs	r3, r3, #5
	movs	r0, #1
	lsl	r2, r0, r2
	adds	r3, r3, #64
	str	r2, [r1, r3, lsl #2]
.L25:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L27:
	.align	2
.L26:
	.word	-536813312
	.size	__NVIC_SetPendingIRQ, .-__NVIC_SetPendingIRQ
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_ClearPendingIRQ, %function
__NVIC_ClearPendingIRQ:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	cmp	r3, #0
	blt	.L30
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	and	r2, r3, #31
	ldr	r1, .L31
	ldrsb	r3, [r7, #7]
	lsrs	r3, r3, #5
	movs	r0, #1
	lsl	r2, r0, r2
	adds	r3, r3, #96
	str	r2, [r1, r3, lsl #2]
.L30:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L32:
	.align	2
.L31:
	.word	-536813312
	.size	__NVIC_ClearPendingIRQ, .-__NVIC_ClearPendingIRQ
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_GetActive, %function
__NVIC_GetActive:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	cmp	r3, #0
	blt	.L34
	ldr	r2, .L36
	ldrsb	r3, [r7, #7]
	lsrs	r3, r3, #5
	adds	r3, r3, #128
	ldr	r2, [r2, r3, lsl #2]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	and	r3, r3, #31
	lsr	r3, r2, r3
	and	r3, r3, #1
	b	.L35
.L34:
	movs	r3, #0
.L35:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L37:
	.align	2
.L36:
	.word	-536813312
	.size	__NVIC_GetActive, .-__NVIC_GetActive
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_SetPriority, %function
__NVIC_SetPriority:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	str	r1, [r7]
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	cmp	r3, #0
	blt	.L39
	ldr	r3, [r7]
	uxtb	r2, r3
	ldr	r1, .L42
	ldrsb	r3, [r7, #7]
	lsls	r2, r2, #4
	uxtb	r2, r2
	add	r3, r3, r1
	strb	r2, [r3, #768]
	b	.L41
.L39:
	ldr	r3, [r7]
	uxtb	r2, r3
	ldr	r1, .L42+4
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	and	r3, r3, #15
	subs	r3, r3, #4
	lsls	r2, r2, #4
	uxtb	r2, r2
	add	r3, r3, r1
	strb	r2, [r3, #24]
.L41:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L43:
	.align	2
.L42:
	.word	-536813312
	.word	-536810240
	.size	__NVIC_SetPriority, .-__NVIC_SetPriority
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_GetPriority, %function
__NVIC_GetPriority:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	cmp	r3, #0
	blt	.L45
	ldr	r2, .L47
	ldrsb	r3, [r7, #7]
	add	r3, r3, r2
	ldrb	r3, [r3, #768]
	uxtb	r3, r3
	lsrs	r3, r3, #4
	uxtb	r3, r3
	b	.L46
.L45:
	ldr	r2, .L47+4
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	and	r3, r3, #15
	subs	r3, r3, #4
	add	r3, r3, r2
	ldrb	r3, [r3, #24]
	uxtb	r3, r3
	lsrs	r3, r3, #4
	uxtb	r3, r3
.L46:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L48:
	.align	2
.L47:
	.word	-536813312
	.word	-536810240
	.size	__NVIC_GetPriority, .-__NVIC_GetPriority
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	NVIC_EncodePriority, %function
NVIC_EncodePriority:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #36
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	and	r3, r3, #7
	str	r3, [r7, #28]
	ldr	r3, [r7, #28]
	rsb	r3, r3, #7
	cmp	r3, #4
	it	cs
	movcs	r3, #4
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	adds	r3, r3, #4
	cmp	r3, #6
	bls	.L50
	ldr	r3, [r7, #28]
	subs	r3, r3, #3
	b	.L51
.L50:
	movs	r3, #0
.L51:
	str	r3, [r7, #20]
	mov	r2, #-1
	ldr	r3, [r7, #24]
	lsl	r3, r2, r3
	mvns	r2, r3
	ldr	r3, [r7, #8]
	ands	r2, r2, r3
	ldr	r3, [r7, #20]
	lsls	r2, r2, r3
	mov	r1, #-1
	ldr	r3, [r7, #20]
	lsl	r3, r1, r3
	mvns	r1, r3
	ldr	r3, [r7, #4]
	ands	r3, r3, r1
	orrs	r3, r3, r2
	mov	r0, r3
	adds	r7, r7, #36
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	NVIC_EncodePriority, .-NVIC_EncodePriority
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	NVIC_DecodePriority, %function
NVIC_DecodePriority:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #36
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r3, [r7, #8]
	and	r3, r3, #7
	str	r3, [r7, #28]
	ldr	r3, [r7, #28]
	rsb	r3, r3, #7
	cmp	r3, #4
	it	cs
	movcs	r3, #4
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	adds	r3, r3, #4
	cmp	r3, #6
	bls	.L54
	ldr	r3, [r7, #28]
	subs	r3, r3, #3
	b	.L55
.L54:
	movs	r3, #0
.L55:
	str	r3, [r7, #20]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #20]
	lsrs	r2, r2, r3
	mov	r1, #-1
	ldr	r3, [r7, #24]
	lsl	r3, r1, r3
	mvns	r3, r3
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	mov	r2, #-1
	ldr	r3, [r7, #20]
	lsl	r3, r2, r3
	mvns	r2, r3
	ldr	r3, [r7, #12]
	ands	r2, r2, r3
	ldr	r3, [r7]
	str	r2, [r3]
	nop
	adds	r7, r7, #36
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	NVIC_DecodePriority, .-NVIC_DecodePriority
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	__NVIC_SystemReset, %function
__NVIC_SystemReset:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	.syntax unified
@ 879 "../Drivers/CMSIS/Include/cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L58
	ldr	r3, [r3, #12]
	and	r2, r3, #1792
	ldr	r1, .L58
	ldr	r3, .L58+4
	orrs	r3, r3, r2
	str	r3, [r1, #12]
	.syntax unified
@ 879 "../Drivers/CMSIS/Include/cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
.L57:
	.syntax unified
@ 1950 "../Drivers/CMSIS/Include/core_cm4.h" 1
	nop
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L57
.L59:
	.align	2
.L58:
	.word	-536810240
	.word	100270084
	.size	__NVIC_SystemReset, .-__NVIC_SystemReset
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SysTick_Config, %function
SysTick_Config:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	cmp	r3, #16777216
	bcc	.L61
	movs	r3, #1
	b	.L62
.L61:
	ldr	r2, .L63
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r2, #4]
	movs	r1, #15
	mov	r0, #-1
	bl	__NVIC_SetPriority @secure
	ldr	r3, .L63
	movs	r2, #0
	str	r2, [r3, #8]
	ldr	r3, .L63
	movs	r2, #7
	str	r2, [r3]
	movs	r3, #0
.L62:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #9 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
.L64:
	.align	2
.L63:
	.word	-536813552
	.size	SysTick_Config, .-SysTick_Config
	.align	1
	.global	HAL_NVIC_SetPriorityGrouping
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_NVIC_SetPriorityGrouping, %function
HAL_NVIC_SetPriorityGrouping:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	__NVIC_SetPriorityGrouping @secure
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #3 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
	.size	HAL_NVIC_SetPriorityGrouping, .-HAL_NVIC_SetPriorityGrouping
	.align	1
	.global	HAL_NVIC_SetPriority
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_NVIC_SetPriority, %function
HAL_NVIC_SetPriority:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	mov	r3, r0
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strb	r3, [r7, #15]
	movs	r3, #0
	str	r3, [r7, #20]
	bl	__NVIC_GetPriorityGrouping @secure
	str	r0, [r7, #20]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #20]
	bl	NVIC_EncodePriority @secure
	mov	r2, r0
	ldrsb	r3, [r7, #15]
	mov	r1, r2
	mov	r0, r3
	bl	__NVIC_SetPriority @secure
	nop
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	@CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #11 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
	.size	HAL_NVIC_SetPriority, .-HAL_NVIC_SetPriority
	.align	1
	.global	HAL_NVIC_EnableIRQ
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_NVIC_EnableIRQ, %function
HAL_NVIC_EnableIRQ:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	mov	r0, r3
	bl	__NVIC_EnableIRQ
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_NVIC_EnableIRQ, .-HAL_NVIC_EnableIRQ
	.align	1
	.global	HAL_NVIC_DisableIRQ
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_NVIC_DisableIRQ, %function
HAL_NVIC_DisableIRQ:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	mov	r0, r3
	bl	__NVIC_DisableIRQ
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_NVIC_DisableIRQ, .-HAL_NVIC_DisableIRQ
	.align	1
	.global	HAL_NVIC_SystemReset
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_NVIC_SystemReset, %function
HAL_NVIC_SystemReset:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	bl	__NVIC_SystemReset
	.size	HAL_NVIC_SystemReset, .-HAL_NVIC_SystemReset
	.align	1
	.global	HAL_SYSTICK_Config
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_SYSTICK_Config, %function
HAL_SYSTICK_Config:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	SysTick_Config 
	PUSH {R1, R2}
	MOV R1, #10 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #7 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
	.size	HAL_SYSTICK_Config, .-HAL_SYSTICK_Config
	.align	1
	.global	HAL_MPU_Disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_MPU_Disable, %function
HAL_MPU_Disable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	.syntax unified
@ 890 "../Drivers/CMSIS/Include/cmsis_gcc.h" 1
	dmb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L73
	ldr	r3, [r3, #36]
	ldr	r2, .L73
	bic	r3, r3, #65536
	str	r3, [r2, #36]
	ldr	r3, .L73+4
	movs	r2, #0
	str	r2, [r3, #4]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L74:
	.align	2
.L73:
	.word	-536810240
	.word	-536810096
	.size	HAL_MPU_Disable, .-HAL_MPU_Disable
	.align	1
	.global	HAL_MPU_Enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_MPU_Enable, %function
HAL_MPU_Enable:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r2, .L76
	ldr	r3, [r7, #4]
	orr	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, .L76+4
	ldr	r3, [r3, #36]
	ldr	r2, .L76+4
	orr	r3, r3, #65536
	str	r3, [r2, #36]
	.syntax unified
@ 879 "../Drivers/CMSIS/Include/cmsis_gcc.h" 1
	dsb 0xF
@ 0 "" 2
@ 868 "../Drivers/CMSIS/Include/cmsis_gcc.h" 1
	isb 0xF
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L77:
	.align	2
.L76:
	.word	-536810096
	.word	-536810240
	.size	HAL_MPU_Enable, .-HAL_MPU_Enable
	.align	1
	.global	HAL_MPU_ConfigRegion
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_MPU_ConfigRegion, %function
HAL_MPU_ConfigRegion:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	ldr	r3, .L82
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L79
	ldr	r2, .L82
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r2, #12]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	lsls	r2, r3, #28
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	lsls	r3, r3, #24
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	lsls	r3, r3, #19
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #13]	@ zero_extendqisi2
	lsls	r3, r3, #18
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #14]	@ zero_extendqisi2
	lsls	r3, r3, #17
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #15]	@ zero_extendqisi2
	lsls	r3, r3, #16
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	lsls	r3, r3, #8
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	lsls	r3, r3, #1
	orrs	r3, r3, r2
	ldr	r2, [r7, #4]
	ldrb	r2, [r2]	@ zero_extendqisi2
	mov	r1, r2
	ldr	r2, .L82
	orrs	r3, r3, r1
	str	r3, [r2, #16]
	b	.L81
.L79:
	ldr	r3, .L82
	movs	r2, #0
	str	r2, [r3, #12]
	ldr	r3, .L82
	movs	r2, #0
	str	r2, [r3, #16]
.L81:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L83:
	.align	2
.L82:
	.word	-536810096
	.size	HAL_MPU_ConfigRegion, .-HAL_MPU_ConfigRegion
	.align	1
	.global	HAL_NVIC_GetPriorityGrouping
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_NVIC_GetPriorityGrouping, %function
HAL_NVIC_GetPriorityGrouping:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	bl	__NVIC_GetPriorityGrouping
	mov	r3, r0
	mov	r0, r3
	pop	{r7, pc}
	.size	HAL_NVIC_GetPriorityGrouping, .-HAL_NVIC_GetPriorityGrouping
	.align	1
	.global	HAL_NVIC_GetPriority
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_NVIC_GetPriority, %function
HAL_NVIC_GetPriority:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	mov	r3, r0
	strb	r3, [r7, #15]
	ldrsb	r3, [r7, #15]
	mov	r0, r3
	bl	__NVIC_GetPriority
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	bl	NVIC_DecodePriority
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_NVIC_GetPriority, .-HAL_NVIC_GetPriority
	.align	1
	.global	HAL_NVIC_SetPendingIRQ
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_NVIC_SetPendingIRQ, %function
HAL_NVIC_SetPendingIRQ:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	mov	r0, r3
	bl	__NVIC_SetPendingIRQ
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_NVIC_SetPendingIRQ, .-HAL_NVIC_SetPendingIRQ
	.align	1
	.global	HAL_NVIC_GetPendingIRQ
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_NVIC_GetPendingIRQ, %function
HAL_NVIC_GetPendingIRQ:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	mov	r0, r3
	bl	__NVIC_GetPendingIRQ
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_NVIC_GetPendingIRQ, .-HAL_NVIC_GetPendingIRQ
	.align	1
	.global	HAL_NVIC_ClearPendingIRQ
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_NVIC_ClearPendingIRQ, %function
HAL_NVIC_ClearPendingIRQ:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	mov	r0, r3
	bl	__NVIC_ClearPendingIRQ
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_NVIC_ClearPendingIRQ, .-HAL_NVIC_ClearPendingIRQ
	.align	1
	.global	HAL_NVIC_GetActive
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_NVIC_GetActive, %function
HAL_NVIC_GetActive:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb	r3, [r7, #7]
	mov	r0, r3
	bl	__NVIC_GetActive
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_NVIC_GetActive, .-HAL_NVIC_GetActive
	.align	1
	.global	HAL_SYSTICK_CLKSourceConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_SYSTICK_CLKSourceConfig, %function
HAL_SYSTICK_CLKSourceConfig:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #4
	bne	.L94
	ldr	r3, .L97
	ldr	r3, [r3]
	ldr	r2, .L97
	orr	r3, r3, #4
	str	r3, [r2]
	b	.L96
.L94:
	ldr	r3, .L97
	ldr	r3, [r3]
	ldr	r2, .L97
	bic	r3, r3, #4
	str	r3, [r2]
.L96:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L98:
	.align	2
.L97:
	.word	-536813552
	.size	HAL_SYSTICK_CLKSourceConfig, .-HAL_SYSTICK_CLKSourceConfig
	.align	1
	.global	HAL_SYSTICK_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_SYSTICK_IRQHandler, %function
HAL_SYSTICK_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	bl	HAL_SYSTICK_Callback
	nop
	pop	{r7, pc}
	.size	HAL_SYSTICK_IRQHandler, .-HAL_SYSTICK_IRQHandler
	.align	1
	.weak	HAL_SYSTICK_Callback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_SYSTICK_Callback, %function
HAL_SYSTICK_Callback:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_SYSTICK_Callback, .-HAL_SYSTICK_Callback
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
