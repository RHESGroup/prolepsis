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
	.file	"tim.c"
	.text
	.comm	htim5,64,4
	.align	1
	.global	MX_TIM5_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	MX_TIM5_Init, %function
MX_TIM5_Init:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	add	r3, r7, #8
	movs	r2, #0
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	mov	r3, r7
	movs	r2, #0
	str	r2, [r3]
	str	r2, [r3, #4]
	ldr	r3, .L6
	ldr	r2, .L6+4
	str	r2, [r3]
	ldr	r3, .L6
	movs	r2, #50
	str	r2, [r3, #4]
	ldr	r3, .L6
	movs	r2, #0
	str	r2, [r3, #8]
	ldr	r3, .L6
	mov	r2, #-1
	str	r2, [r3, #12]
	ldr	r3, .L6
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, .L6
	movs	r2, #0
	str	r2, [r3, #24]
	ldr	r0, .L6
	bl	HAL_TIM_Base_Init 
	PUSH {R1, R2}
	MOV R1, #32 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r3, r0
	cmp	r3, #0
	beq	.L2
	bl	Error_Handler @secure
.L2:
	mov	r3, #4096
	str	r3, [r7, #8]
	add	r3, r7, #8
	mov	r1, r3
	ldr	r0, .L6
	bl	HAL_TIM_ConfigClockSource 
	PUSH {R1, R2}
	MOV R1, #35 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r3, r0
	cmp	r3, #0
	beq	.L3
	bl	Error_Handler @secure
.L3:
	movs	r3, #0
	str	r3, [r7]
	movs	r3, #0
	str	r3, [r7, #4]
	mov	r3, r7
	mov	r1, r3
	ldr	r0, .L6
	bl	HAL_TIMEx_MasterConfigSynchronization @secure
	mov	r3, r0
	cmp	r3, #0
	beq	.L5
	bl	Error_Handler @secure
.L5:
	nop
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #30 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
.L7:
	.align	2
.L6:
	.word	htim5
	.word	1073744896
	.size	MX_TIM5_Init, .-MX_TIM5_Init
	.align	1
	.global	HAL_TIM_Base_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_MspInit, %function
HAL_TIM_Base_MspInit:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L11
	cmp	r3, r2
	bne	.L10
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, .L11+4
	ldr	r3, [r3, #64]
	ldr	r2, .L11+4
	orr	r3, r3, #8
	str	r3, [r2, #64]
	ldr	r3, .L11+4
	ldr	r3, [r3, #64]
	and	r3, r3, #8
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	movs	r1, #0
	movs	r0, #50
	bl	HAL_NVIC_SetPriority
	movs	r0, #50
	bl	HAL_NVIC_EnableIRQ
.L10:
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	1073744896
	.word	1073887232
	.size	HAL_TIM_Base_MspInit, .-HAL_TIM_Base_MspInit
	.align	1
	.global	HAL_TIM_Base_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_TIM_Base_MspDeInit, %function
HAL_TIM_Base_MspDeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L16
	cmp	r3, r2
	bne	.L15
	ldr	r3, .L16+4
	ldr	r3, [r3, #64]
	ldr	r2, .L16+4
	bic	r3, r3, #8
	str	r3, [r2, #64]
	movs	r0, #50
	bl	HAL_NVIC_DisableIRQ
.L15:
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L17:
	.align	2
.L16:
	.word	1073744896
	.word	1073887232
	.size	HAL_TIM_Base_MspDeInit, .-HAL_TIM_Base_MspDeInit
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
