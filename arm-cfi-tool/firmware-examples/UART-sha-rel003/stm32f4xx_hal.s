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
	.file	"stm32f4xx_hal.c"
	.text
	.comm	uwTick,4,4
	.global	uwTickPrio
	.section	.data.uwTickPrio,"aw",%progbits
	.align	2
	.type	uwTickPrio, %object
	.size	uwTickPrio, 4
uwTickPrio:
	.word	16
	.global	uwTickFreq
	.section	.data.uwTickFreq,"aw",%progbits
	.type	uwTickFreq, %object
	.size	uwTickFreq, 1
uwTickFreq:
	.byte	1
	.text
	.align	1
	.global	HAL_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_Init, %function
HAL_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L3
	ldr	r3, [r3]
	ldr	r2, .L3
	orr	r3, r3, #512
	str	r3, [r2]
	ldr	r3, .L3
	ldr	r3, [r3]
	ldr	r2, .L3
	orr	r3, r3, #1024
	str	r3, [r2]
	ldr	r3, .L3
	ldr	r3, [r3]
	ldr	r2, .L3
	orr	r3, r3, #256
	str	r3, [r2]
	movs	r0, #3
	bl	HAL_NVIC_SetPriorityGrouping 
	PUSH {R1, R2}
	MOV R1, #4 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	movs	r0, #0
	PUSH {R1, R2}
	MOV R1, #5 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_InitTick 
	PUSH {R1, R2}
	MOV R1, #6 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	bl	HAL_MspInit @secure
	movs	r3, #0
	mov	r0, r3
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #1 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
.L4:
	.align	2
.L3:
	.word	1073888256
	.size	HAL_Init, .-HAL_Init
	.align	1
	.global	HAL_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DeInit, %function
HAL_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L7
	mov	r2, #-1
	str	r2, [r3, #32]
	ldr	r3, .L7
	movs	r2, #0
	str	r2, [r3, #32]
	ldr	r3, .L7
	mov	r2, #-1
	str	r2, [r3, #36]
	ldr	r3, .L7
	movs	r2, #0
	str	r2, [r3, #36]
	ldr	r3, .L7
	mov	r2, #-1
	str	r2, [r3, #16]
	ldr	r3, .L7
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, .L7
	mov	r2, #-1
	str	r2, [r3, #20]
	ldr	r3, .L7
	movs	r2, #0
	str	r2, [r3, #20]
	ldr	r3, .L7
	mov	r2, #-1
	str	r2, [r3, #24]
	ldr	r3, .L7
	movs	r2, #0
	str	r2, [r3, #24]
	bl	HAL_MspDeInit
	movs	r3, #0
	mov	r0, r3
	pop	{r7, pc}
.L8:
	.align	2
.L7:
	.word	1073887232
	.size	HAL_DeInit, .-HAL_DeInit
	.align	1
	.weak	HAL_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_MspInit, %function
HAL_MspInit:
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
	.size	HAL_MspInit, .-HAL_MspInit
	.align	1
	.weak	HAL_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_MspDeInit, %function
HAL_MspDeInit:
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
	.size	HAL_MspDeInit, .-HAL_MspDeInit
	.align	1
	.weak	HAL_InitTick
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_InitTick, %function
HAL_InitTick:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L16
	ldr	r2, [r3]
	ldr	r3, .L16+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, #1000
	udiv	r3, r3, r1
	udiv	r3, r2, r3
	mov	r0, r3
	bl	HAL_SYSTICK_Config 
	PUSH {R1, R2}
	MOV R1, #8 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r3, r0
	cmp	r3, #0
	beq	.L12
	movs	r3, #1
	b	.L13
.L12:
	ldr	r3, [r7, #4]
	cmp	r3, #15
	bhi	.L14
	movs	r2, #0
	ldr	r1, [r7, #4]
	mov	r0, #-1
	bl	HAL_NVIC_SetPriority 
	PUSH {R1, R2}
	MOV R1, #12 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	@CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	ldr	r2, .L16+8
	ldr	r3, [r7, #4]
	str	r3, [r2]
	movs	r3, #0
	b	.L13
.L14:
	movs	r3, #1
.L13:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	@CPSID f 				@ disabilita tutti gli interrupt e i fault handlers									
	PUSH {R1, R2}
	MOV R1, #5 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #6]
	POP {R1, R2}
	pop	{r7, pc}
.L17:
	.align	2
.L16:
	.word	SystemCoreClock
	.word	uwTickFreq
	.word	uwTickPrio
	.size	HAL_InitTick, .-HAL_InitTick
	.align	1
	.weak	HAL_IncTick
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_IncTick, %function
HAL_IncTick:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L19
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L19+4
	ldr	r3, [r3]
	add	r3, r3, r2
	ldr	r2, .L19+4
	str	r3, [r2]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L20:
	.align	2
.L19:
	.word	uwTickFreq
	.word	uwTick
	.size	HAL_IncTick, .-HAL_IncTick
	.align	1
	.weak	HAL_GetTick
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GetTick, %function
HAL_GetTick:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L23
	ldr	r3, [r3]
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L24:
	.align	2
.L23:
	.word	uwTick
	.size	HAL_GetTick, .-HAL_GetTick
	.align	1
	.global	HAL_GetTickPrio
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GetTickPrio, %function
HAL_GetTickPrio:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L27
	ldr	r3, [r3]
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L28:
	.align	2
.L27:
	.word	uwTickPrio
	.size	HAL_GetTickPrio, .-HAL_GetTickPrio
	.align	1
	.global	HAL_SetTickFreq
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_SetTickFreq, %function
HAL_SetTickFreq:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	movs	r3, #0
	strb	r3, [r7, #15]
	ldr	r3, .L32
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L30
	ldr	r2, .L32
	ldrb	r3, [r7, #7]
	strb	r3, [r2]
	ldr	r3, .L32+4
	ldr	r3, [r3]
	mov	r0, r3
	bl	HAL_InitTick
	mov	r3, r0
	strb	r3, [r7, #15]
.L30:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L33:
	.align	2
.L32:
	.word	uwTickFreq
	.word	uwTickPrio
	.size	HAL_SetTickFreq, .-HAL_SetTickFreq
	.align	1
	.global	HAL_GetTickFreq
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GetTickFreq, %function
HAL_GetTickFreq:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L36
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L37:
	.align	2
.L36:
	.word	uwTickFreq
	.size	HAL_GetTickFreq, .-HAL_GetTickFreq
	.align	1
	.weak	HAL_Delay
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_Delay, %function
HAL_Delay:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	bl	HAL_GetTick @secure
	str	r0, [r7, #8]
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #-1
	beq	.L41
	ldr	r3, .L42
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #12]
.L41:
	nop
.L40:
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7, #8]
	subs	r3, r2, r3
	ldr	r2, [r7, #12]
	cmp	r2, r3
	bhi	.L40
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #37 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
.L43:
	.align	2
.L42:
	.word	uwTickFreq
	.size	HAL_Delay, .-HAL_Delay
	.align	1
	.weak	HAL_SuspendTick
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_SuspendTick, %function
HAL_SuspendTick:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L45
	ldr	r3, [r3]
	ldr	r2, .L45
	bic	r3, r3, #2
	str	r3, [r2]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L46:
	.align	2
.L45:
	.word	-536813552
	.size	HAL_SuspendTick, .-HAL_SuspendTick
	.align	1
	.weak	HAL_ResumeTick
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_ResumeTick, %function
HAL_ResumeTick:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L48
	ldr	r3, [r3]
	ldr	r2, .L48
	orr	r3, r3, #2
	str	r3, [r2]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L49:
	.align	2
.L48:
	.word	-536813552
	.size	HAL_ResumeTick, .-HAL_ResumeTick
	.align	1
	.global	HAL_GetHalVersion
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GetHalVersion, %function
HAL_GetHalVersion:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L52
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L53:
	.align	2
.L52:
	.word	17237504
	.size	HAL_GetHalVersion, .-HAL_GetHalVersion
	.align	1
	.global	HAL_GetREVID
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GetREVID, %function
HAL_GetREVID:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L56
	ldr	r3, [r3]
	lsrs	r3, r3, #16
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L57:
	.align	2
.L56:
	.word	-536600576
	.size	HAL_GetREVID, .-HAL_GetREVID
	.align	1
	.global	HAL_GetDEVID
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GetDEVID, %function
HAL_GetDEVID:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L60
	ldr	r3, [r3]
	ubfx	r3, r3, #0, #12
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L61:
	.align	2
.L60:
	.word	-536600576
	.size	HAL_GetDEVID, .-HAL_GetDEVID
	.align	1
	.global	HAL_DBGMCU_EnableDBGSleepMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DBGMCU_EnableDBGSleepMode, %function
HAL_DBGMCU_EnableDBGSleepMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L63
	ldr	r3, [r3, #4]
	ldr	r2, .L63
	orr	r3, r3, #1
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L64:
	.align	2
.L63:
	.word	-536600576
	.size	HAL_DBGMCU_EnableDBGSleepMode, .-HAL_DBGMCU_EnableDBGSleepMode
	.align	1
	.global	HAL_DBGMCU_DisableDBGSleepMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DBGMCU_DisableDBGSleepMode, %function
HAL_DBGMCU_DisableDBGSleepMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L66
	ldr	r3, [r3, #4]
	ldr	r2, .L66
	bic	r3, r3, #1
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L67:
	.align	2
.L66:
	.word	-536600576
	.size	HAL_DBGMCU_DisableDBGSleepMode, .-HAL_DBGMCU_DisableDBGSleepMode
	.align	1
	.global	HAL_DBGMCU_EnableDBGStopMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DBGMCU_EnableDBGStopMode, %function
HAL_DBGMCU_EnableDBGStopMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L69
	ldr	r3, [r3, #4]
	ldr	r2, .L69
	orr	r3, r3, #2
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L70:
	.align	2
.L69:
	.word	-536600576
	.size	HAL_DBGMCU_EnableDBGStopMode, .-HAL_DBGMCU_EnableDBGStopMode
	.align	1
	.global	HAL_DBGMCU_DisableDBGStopMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DBGMCU_DisableDBGStopMode, %function
HAL_DBGMCU_DisableDBGStopMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L72
	ldr	r3, [r3, #4]
	ldr	r2, .L72
	bic	r3, r3, #2
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L73:
	.align	2
.L72:
	.word	-536600576
	.size	HAL_DBGMCU_DisableDBGStopMode, .-HAL_DBGMCU_DisableDBGStopMode
	.align	1
	.global	HAL_DBGMCU_EnableDBGStandbyMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DBGMCU_EnableDBGStandbyMode, %function
HAL_DBGMCU_EnableDBGStandbyMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L75
	ldr	r3, [r3, #4]
	ldr	r2, .L75
	orr	r3, r3, #4
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L76:
	.align	2
.L75:
	.word	-536600576
	.size	HAL_DBGMCU_EnableDBGStandbyMode, .-HAL_DBGMCU_EnableDBGStandbyMode
	.align	1
	.global	HAL_DBGMCU_DisableDBGStandbyMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DBGMCU_DisableDBGStandbyMode, %function
HAL_DBGMCU_DisableDBGStandbyMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L78
	ldr	r3, [r3, #4]
	ldr	r2, .L78
	bic	r3, r3, #4
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L79:
	.align	2
.L78:
	.word	-536600576
	.size	HAL_DBGMCU_DisableDBGStandbyMode, .-HAL_DBGMCU_DisableDBGStandbyMode
	.align	1
	.global	HAL_EnableCompensationCell
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_EnableCompensationCell, %function
HAL_EnableCompensationCell:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L81
	movs	r2, #1
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L82:
	.align	2
.L81:
	.word	1109853184
	.size	HAL_EnableCompensationCell, .-HAL_EnableCompensationCell
	.align	1
	.global	HAL_DisableCompensationCell
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DisableCompensationCell, %function
HAL_DisableCompensationCell:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L84
	movs	r2, #0
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L85:
	.align	2
.L84:
	.word	1109853184
	.size	HAL_DisableCompensationCell, .-HAL_DisableCompensationCell
	.align	1
	.global	HAL_GetUIDw0
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GetUIDw0, %function
HAL_GetUIDw0:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L88
	ldr	r3, [r3]
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L89:
	.align	2
.L88:
	.word	536836624
	.size	HAL_GetUIDw0, .-HAL_GetUIDw0
	.align	1
	.global	HAL_GetUIDw1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GetUIDw1, %function
HAL_GetUIDw1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L92
	ldr	r3, [r3]
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L93:
	.align	2
.L92:
	.word	536836628
	.size	HAL_GetUIDw1, .-HAL_GetUIDw1
	.align	1
	.global	HAL_GetUIDw2
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GetUIDw2, %function
HAL_GetUIDw2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L96
	ldr	r3, [r3]
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L97:
	.align	2
.L96:
	.word	536836632
	.size	HAL_GetUIDw2, .-HAL_GetUIDw2
	.align	1
	.global	HAL_EnableMemorySwappingBank
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_EnableMemorySwappingBank, %function
HAL_EnableMemorySwappingBank:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L99
	movs	r2, #1
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L100:
	.align	2
.L99:
	.word	1109852192
	.size	HAL_EnableMemorySwappingBank, .-HAL_EnableMemorySwappingBank
	.align	1
	.global	HAL_DisableMemorySwappingBank
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_DisableMemorySwappingBank, %function
HAL_DisableMemorySwappingBank:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L102
	movs	r2, #0
	str	r2, [r3]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L103:
	.align	2
.L102:
	.word	1109852192
	.size	HAL_DisableMemorySwappingBank, .-HAL_DisableMemorySwappingBank
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
