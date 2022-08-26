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
	.file	"stm32f4xx_hal_uart.c"
	.text
	.align	1
	.global	HAL_UART_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_Init, %function
HAL_UART_Init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L2
	movs	r3, #1
	b	.L3
.L2:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #56]
	ldr	r0, [r7, #4]
	bl	HAL_UART_MspInit @secure
.L4:
	ldr	r3, [r7, #4]
	movs	r2, #36
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r0, [r7, #4]
	bl	UART_SetConfig 
	PUSH {R1, R2}
	MOV R1, #24 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #18432
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #42
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #58]
	movs	r3, #0
.L3:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #22 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
	.size	HAL_UART_Init, .-HAL_UART_Init
	.align	1
	.global	HAL_HalfDuplex_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_HalfDuplex_Init, %function
HAL_HalfDuplex_Init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L6
	movs	r3, #1
	b	.L7
.L6:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L8
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #56]
	ldr	r0, [r7, #4]
	bl	HAL_UART_MspInit
.L8:
	ldr	r3, [r7, #4]
	movs	r2, #36
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r0, [r7, #4]
	bl	UART_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #18432
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #34
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #58]
	movs	r3, #0
.L7:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_HalfDuplex_Init, .-HAL_HalfDuplex_Init
	.align	1
	.global	HAL_LIN_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_LIN_Init, %function
HAL_LIN_Init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L10
	movs	r3, #1
	b	.L11
.L10:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L12
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #56]
	ldr	r0, [r7, #4]
	bl	HAL_UART_MspInit
.L12:
	ldr	r3, [r7, #4]
	movs	r2, #36
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r0, [r7, #4]
	bl	UART_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2048
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #42
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #16384
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r1, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7]
	orrs	r2, r2, r1
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #58]
	movs	r3, #0
.L11:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_LIN_Init, .-HAL_LIN_Init
	.align	1
	.global	HAL_MultiProcessor_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_MultiProcessor_Init, %function
HAL_MultiProcessor_Init:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	mov	r3, r1
	str	r2, [r7, #4]
	strb	r3, [r7, #11]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L14
	movs	r3, #1
	b	.L15
.L14:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L16
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #56]
	ldr	r0, [r7, #12]
	bl	HAL_UART_MspInit
.L16:
	ldr	r3, [r7, #12]
	movs	r2, #36
	strb	r2, [r3, #57]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r0, [r7, #12]
	bl	UART_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #18432
	str	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #42
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #15
	str	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #16]
	ldrb	r2, [r7, #11]	@ zero_extendqisi2
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #2048
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	orrs	r2, r2, r1
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #58]
	movs	r3, #0
.L15:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_MultiProcessor_Init, .-HAL_MultiProcessor_Init
	.align	1
	.global	HAL_UART_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_DeInit, %function
HAL_UART_DeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L18
	movs	r3, #1
	b	.L19
.L18:
	ldr	r3, [r7, #4]
	movs	r2, #36
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3, #12]
	ldr	r0, [r7, #4]
	bl	HAL_UART_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #58]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #56]
	movs	r3, #0
.L19:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_UART_DeInit, .-HAL_UART_DeInit
	.align	1
	.weak	HAL_UART_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_MspInit, %function
HAL_UART_MspInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_MspInit, .-HAL_UART_MspInit
	.align	1
	.weak	HAL_UART_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_MspDeInit, %function
HAL_UART_MspDeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_MspDeInit, .-HAL_UART_MspDeInit
	.align	1
	.global	HAL_UART_Transmit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_Transmit, %function
HAL_UART_Transmit:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #32
	add	r7, sp, #8
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r3, [r7]
	mov	r3, r2	@ movhi
	strh	r3, [r7, #6]	@ movhi
	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #32
	bne	.L23
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L24
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	.L25
.L24:
	movs	r3, #1
	b	.L26
.L25:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L27
	movs	r3, #2
	b	.L26
.L27:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #33
	strb	r2, [r3, #57]
	bl	HAL_GetTick @secure
	str	r0, [r7, #20]
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #36]	@ movhi
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #38]	@ movhi
	b	.L28
.L34:
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #38]	@ movhi
	uxth	r3, r3
	subs	r3, r3, #1
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	cmp	r3, #4096
	bne	.L29
	ldr	r3, [r7]
	str	r3, [sp]
	ldr	r3, [r7, #20]
	movs	r2, #0
	movs	r1, #128
	ldr	r0, [r7, #12]
	PUSH {R1, R2}
	MOV R1, #41 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	UART_WaitOnFlagUntilTimeout 
	PUSH {R1, R2}
	MOV R1, #41 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r3, r0
	cmp	r3, #0
	beq	.L30
	movs	r3, #3
	b	.L26
.L30:
	ldr	r3, [r7, #8]
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ubfx	r2, r2, #0, #9
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L31
	ldr	r3, [r7, #8]
	adds	r3, r3, #2
	str	r3, [r7, #8]
	b	.L28
.L31:
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
	b	.L28
.L29:
	ldr	r3, [r7]
	str	r3, [sp]
	ldr	r3, [r7, #20]
	movs	r2, #0
	movs	r1, #128
	ldr	r0, [r7, #12]
	PUSH {R1, R2}
	MOV R1, #41 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	UART_WaitOnFlagUntilTimeout
	PUSH {R1, R2}
	MOV R1, #41 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 
	mov	r3, r0
	cmp	r3, #0
	beq	.L33
	movs	r3, #3
	b	.L26
.L33:
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	str	r2, [r3, #4]
.L28:
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #38]	@ movhi
	uxth	r3, r3
	cmp	r3, #0
	bne	.L34
	ldr	r3, [r7]
	str	r3, [sp]
	ldr	r3, [r7, #20]
	movs	r2, #0
	movs	r1, #64
	ldr	r0, [r7, #12]
	PUSH {R1, R2}
	MOV R1, #41 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	UART_WaitOnFlagUntilTimeout
	PUSH {R1, R2}
	MOV R1, #41 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 
	mov	r3, r0
	cmp	r3, #0
	beq	.L35
	movs	r3, #3
	b	.L26
.L35:
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #56]
	movs	r3, #0
	b	.L26
.L23:
	movs	r3, #2
.L26:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #39 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
	.size	HAL_UART_Transmit, .-HAL_UART_Transmit
	.align	1
	.global	HAL_UART_Receive
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_Receive, %function
HAL_UART_Receive:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #32
	add	r7, sp, #8
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r3, [r7]
	mov	r3, r2	@ movhi
	strh	r3, [r7, #6]	@ movhi
	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #58]
	uxtb	r3, r3
	cmp	r3, #32
	bne	.L37
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L38
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	.L39
.L38:
	movs	r3, #1
	b	.L40
.L39:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L41
	movs	r3, #2
	b	.L40
.L41:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #34
	strb	r2, [r3, #58]
	bl	HAL_GetTick
	str	r0, [r7, #20]
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #46]	@ movhi
	b	.L42
.L49:
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #46]	@ movhi
	uxth	r3, r3
	subs	r3, r3, #1
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	cmp	r3, #4096
	bne	.L43
	ldr	r3, [r7]
	str	r3, [sp]
	ldr	r3, [r7, #20]
	movs	r2, #0
	movs	r1, #32
	ldr	r0, [r7, #12]
	bl	UART_WaitOnFlagUntilTimeout
	mov	r3, r0
	cmp	r3, #0
	beq	.L44
	movs	r3, #3
	b	.L40
.L44:
	ldr	r3, [r7, #8]
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L45
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	uxth	r3, r3
	ubfx	r3, r3, #0, #9
	uxth	r2, r3
	ldr	r3, [r7, #16]
	strh	r2, [r3]	@ movhi
	ldr	r3, [r7, #8]
	adds	r3, r3, #2
	str	r3, [r7, #8]
	b	.L42
.L45:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	uxth	r3, r3
	uxtb	r3, r3
	uxth	r2, r3
	ldr	r3, [r7, #16]
	strh	r2, [r3]	@ movhi
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
	b	.L42
.L43:
	ldr	r3, [r7]
	str	r3, [sp]
	ldr	r3, [r7, #20]
	movs	r2, #0
	movs	r1, #32
	ldr	r0, [r7, #12]
	bl	UART_WaitOnFlagUntilTimeout
	mov	r3, r0
	cmp	r3, #0
	beq	.L47
	movs	r3, #3
	b	.L40
.L47:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L48
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	uxtb	r2, r1
	strb	r2, [r3]
	b	.L42
.L48:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	uxtb	r2, r3
	ldr	r3, [r7, #8]
	adds	r1, r3, #1
	str	r1, [r7, #8]
	and	r2, r2, #127
	uxtb	r2, r2
	strb	r2, [r3]
.L42:
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #46]	@ movhi
	uxth	r3, r3
	cmp	r3, #0
	bne	.L49
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #58]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #56]
	movs	r3, #0
	b	.L40
.L37:
	movs	r3, #2
.L40:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_UART_Receive, .-HAL_UART_Receive
	.align	1
	.global	HAL_UART_Transmit_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_Transmit_IT, %function
HAL_UART_Transmit_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #32
	bne	.L51
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L52
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	.L53
.L52:
	movs	r3, #1
	b	.L54
.L53:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L55
	movs	r3, #2
	b	.L54
.L55:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #8]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #36]	@ movhi
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #33
	strb	r2, [r3, #57]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #56]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #12]
	movs	r3, #0
	b	.L54
.L51:
	movs	r3, #2
.L54:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_Transmit_IT, .-HAL_UART_Transmit_IT
	.align	1
	.global	HAL_UART_Receive_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_Receive_IT, %function
HAL_UART_Receive_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #58]
	uxtb	r3, r3
	cmp	r3, #32
	bne	.L57
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L58
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	.L59
.L58:
	movs	r3, #1
	b	.L60
.L59:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L61
	movs	r3, #2
	b	.L60
.L61:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #8]
	str	r2, [r3, #40]
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #34
	strb	r2, [r3, #58]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #56]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #32
	str	r2, [r3, #12]
	movs	r3, #0
	b	.L60
.L57:
	movs	r3, #2
.L60:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_Receive_IT, .-HAL_UART_Receive_IT
	.align	1
	.global	HAL_UART_Transmit_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_Transmit_DMA, %function
HAL_UART_Transmit_DMA:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #32
	bne	.L63
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L64
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	.L65
.L64:
	movs	r3, #1
	b	.L66
.L65:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L67
	movs	r3, #2
	b	.L66
.L67:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #36]	@ movhi
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #33
	strb	r2, [r3, #57]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L68
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L68+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r2, .L68+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	movs	r2, #0
	str	r2, [r3, #80]
	add	r3, r7, #8
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]
	ldr	r3, [r7, #20]
	ldr	r1, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #4
	mov	r2, r3
	ldrh	r3, [r7, #6]
	bl	HAL_DMA_Start_IT
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	mvn	r2, #64
	str	r2, [r3]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #56]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #20]
	movs	r3, #0
	b	.L66
.L63:
	movs	r3, #2
.L66:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L69:
	.align	2
.L68:
	.word	UART_DMATransmitCplt
	.word	UART_DMATxHalfCplt
	.word	UART_DMAError
	.size	HAL_UART_Transmit_DMA, .-HAL_UART_Transmit_DMA
	.align	1
	.global	HAL_UART_Receive_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_Receive_DMA, %function
HAL_UART_Receive_DMA:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #58]
	uxtb	r3, r3
	cmp	r3, #32
	bne	.L71
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L72
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne	.L73
.L72:
	movs	r3, #1
	b	.L74
.L73:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L75
	movs	r3, #2
	b	.L74
.L75:
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	str	r2, [r3, #40]
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #34
	strb	r2, [r3, #58]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L76
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L76+4
	str	r2, [r3, #64]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r2, .L76+8
	str	r2, [r3, #76]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	movs	r2, #0
	str	r2, [r3, #80]
	add	r3, r7, #8
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #52]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	adds	r3, r3, #4
	mov	r1, r3
	ldr	r3, [r7, #20]
	ldr	r2, [r3]
	ldrh	r3, [r7, #6]
	bl	HAL_DMA_Start_IT
	movs	r3, #0
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3]
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #56]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #64
	str	r2, [r3, #20]
	movs	r3, #0
	b	.L74
.L71:
	movs	r3, #2
.L74:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L77:
	.align	2
.L76:
	.word	UART_DMAReceiveCplt
	.word	UART_DMARxHalfCplt
	.word	UART_DMAError
	.size	HAL_UART_Receive_DMA, .-HAL_UART_Receive_DMA
	.align	1
	.global	HAL_UART_DMAPause
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_DMAPause, %function
HAL_UART_DMAPause:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L79
	movs	r3, #2
	b	.L80
.L79:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #128
	cmp	r3, #128
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #33
	bne	.L81
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L81
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #20]
.L81:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #64
	cmp	r3, #64
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #58]
	uxtb	r3, r3
	cmp	r3, #34
	bne	.L82
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L82
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #256
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3, #20]
.L82:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #56]
	movs	r3, #0
.L80:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_DMAPause, .-HAL_UART_DMAPause
	.align	1
	.global	HAL_UART_DMAResume
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_DMAResume, %function
HAL_UART_DMAResume:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L84
	movs	r3, #2
	b	.L85
.L84:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #33
	bne	.L86
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #20]
.L86:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #58]
	uxtb	r3, r3
	cmp	r3, #34
	bne	.L87
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #64
	str	r2, [r3, #20]
.L87:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #56]
	movs	r3, #0
.L85:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_DMAResume, .-HAL_UART_DMAResume
	.align	1
	.global	HAL_UART_DMAStop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_DMAStop, %function
HAL_UART_DMAStop:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #128
	cmp	r3, #128
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #33
	bne	.L89
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L89
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L90
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_Abort
.L90:
	ldr	r0, [r7, #4]
	bl	UART_EndTxTransfer
.L89:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #64
	cmp	r3, #64
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #58]
	uxtb	r3, r3
	cmp	r3, #34
	bne	.L91
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L91
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L92
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	mov	r0, r3
	bl	HAL_DMA_Abort
.L92:
	ldr	r0, [r7, #4]
	bl	UART_EndRxTransfer
.L91:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_UART_DMAStop, .-HAL_UART_DMAStop
	.align	1
	.global	HAL_UART_Abort
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_Abort, %function
HAL_UART_Abort:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #480
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #128
	cmp	r3, #128
	bne	.L95
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L95
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	movs	r2, #0
	str	r2, [r3, #80]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_Abort
	mov	r3, r0
	cmp	r3, #0
	beq	.L95
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_GetError
	mov	r3, r0
	cmp	r3, #32
	bne	.L95
	ldr	r3, [r7, #4]
	movs	r2, #16
	str	r2, [r3, #60]
	movs	r3, #3
	b	.L96
.L95:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #64
	cmp	r3, #64
	bne	.L97
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L97
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	movs	r2, #0
	str	r2, [r3, #80]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	mov	r0, r3
	bl	HAL_DMA_Abort
	mov	r3, r0
	cmp	r3, #0
	beq	.L97
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	mov	r0, r3
	bl	HAL_DMA_GetError
	mov	r3, r0
	cmp	r3, #32
	bne	.L97
	ldr	r3, [r7, #4]
	movs	r2, #16
	str	r2, [r3, #60]
	movs	r3, #3
	b	.L96
.L97:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #58]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	movs	r3, #0
.L96:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_UART_Abort, .-HAL_UART_Abort
	.align	1
	.global	HAL_UART_AbortTransmit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_AbortTransmit, %function
HAL_UART_AbortTransmit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #192
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #128
	cmp	r3, #128
	bne	.L99
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L99
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	movs	r2, #0
	str	r2, [r3, #80]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_Abort
	mov	r3, r0
	cmp	r3, #0
	beq	.L99
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_GetError
	mov	r3, r0
	cmp	r3, #32
	bne	.L99
	ldr	r3, [r7, #4]
	movs	r2, #16
	str	r2, [r3, #60]
	movs	r3, #3
	b	.L100
.L99:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	movs	r3, #0
.L100:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_UART_AbortTransmit, .-HAL_UART_AbortTransmit
	.align	1
	.global	HAL_UART_AbortReceive
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_AbortReceive, %function
HAL_UART_AbortReceive:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #288
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #64
	cmp	r3, #64
	bne	.L102
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L102
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	movs	r2, #0
	str	r2, [r3, #80]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	mov	r0, r3
	bl	HAL_DMA_Abort
	mov	r3, r0
	cmp	r3, #0
	beq	.L102
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	mov	r0, r3
	bl	HAL_DMA_GetError
	mov	r3, r0
	cmp	r3, #32
	bne	.L102
	ldr	r3, [r7, #4]
	movs	r2, #16
	str	r2, [r3, #60]
	movs	r3, #3
	b	.L103
.L102:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #58]
	movs	r3, #0
.L103:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_UART_AbortReceive, .-HAL_UART_AbortReceive
	.align	1
	.global	HAL_UART_Abort_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_Abort_IT, %function
HAL_UART_Abort_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #1
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #480
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L105
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #128
	cmp	r3, #128
	bne	.L106
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	ldr	r2, .L115
	str	r2, [r3, #80]
	b	.L105
.L106:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	movs	r2, #0
	str	r2, [r3, #80]
.L105:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L107
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #64
	cmp	r3, #64
	bne	.L108
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	ldr	r2, .L115+4
	str	r2, [r3, #80]
	b	.L107
.L108:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	movs	r2, #0
	str	r2, [r3, #80]
.L107:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #128
	cmp	r3, #128
	bne	.L109
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L109
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L110
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	movs	r2, #0
	str	r2, [r3, #80]
	b	.L109
.L110:
	movs	r3, #0
	str	r3, [r7, #12]
.L109:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #64
	cmp	r3, #64
	bne	.L111
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L111
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L112
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	movs	r2, #0
	str	r2, [r3, #80]
	movs	r3, #1
	str	r3, [r7, #12]
	b	.L111
.L112:
	movs	r3, #0
	str	r3, [r7, #12]
.L111:
	ldr	r3, [r7, #12]
	cmp	r3, #1
	bne	.L113
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #58]
	ldr	r0, [r7, #4]
	bl	HAL_UART_AbortCpltCallback
.L113:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L116:
	.align	2
.L115:
	.word	UART_DMATxAbortCallback
	.word	UART_DMARxAbortCallback
	.size	HAL_UART_Abort_IT, .-HAL_UART_Abort_IT
	.align	1
	.global	HAL_UART_AbortTransmit_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_AbortTransmit_IT, %function
HAL_UART_AbortTransmit_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #192
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #128
	cmp	r3, #128
	bne	.L118
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L119
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	ldr	r2, .L124
	str	r2, [r3, #80]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L122
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]
	ldr	r3, [r3, #80]
	ldr	r2, [r7, #4]
	ldr	r2, [r2, #48]
	mov	r0, r2
	blx	r3
	b	.L122
.L119:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r0, [r7, #4]
	bl	HAL_UART_AbortTransmitCpltCallback
	b	.L122
.L118:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r0, [r7, #4]
	bl	HAL_UART_AbortTransmitCpltCallback
.L122:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L125:
	.align	2
.L124:
	.word	UART_DMATxOnlyAbortCallback
	.size	HAL_UART_AbortTransmit_IT, .-HAL_UART_AbortTransmit_IT
	.align	1
	.global	HAL_UART_AbortReceive_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_AbortReceive_IT, %function
HAL_UART_AbortReceive_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #288
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #64
	cmp	r3, #64
	bne	.L127
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L128
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	ldr	r2, .L133
	str	r2, [r3, #80]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT
	mov	r3, r0
	cmp	r3, #0
	beq	.L131
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	ldr	r3, [r3, #80]
	ldr	r2, [r7, #4]
	ldr	r2, [r2, #52]
	mov	r0, r2
	blx	r3
	b	.L131
.L128:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #58]
	ldr	r0, [r7, #4]
	bl	HAL_UART_AbortReceiveCpltCallback
	b	.L131
.L127:
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #58]
	ldr	r0, [r7, #4]
	bl	HAL_UART_AbortReceiveCpltCallback
.L131:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L134:
	.align	2
.L133:
	.word	UART_DMARxOnlyAbortCallback
	.size	HAL_UART_AbortReceive_IT, .-HAL_UART_AbortReceive_IT
	.align	1
	.global	HAL_UART_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_IRQHandler, %function
HAL_UART_IRQHandler:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #32
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	str	r3, [r7, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #28]
	and	r3, r3, #15
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	cmp	r3, #0
	bne	.L136
	ldr	r3, [r7, #28]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L136
	ldr	r3, [r7, #24]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L136
	ldr	r0, [r7, #4]
	PUSH {R1, R2}
	MOV R1, #47 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	UART_Receive_IT 
	PUSH {R1, R2}
	MOV R1, #47 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	b	.L135
.L136:
	ldr	r3, [r7, #16]
	cmp	r3, #0
	beq	.L138
	ldr	r3, [r7, #20]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L139
	ldr	r3, [r7, #24]
	and	r3, r3, #288
	cmp	r3, #0
	beq	.L138
.L139:
	ldr	r3, [r7, #28]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L140
	ldr	r3, [r7, #24]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L140
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	orr	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #60]
.L140:
	ldr	r3, [r7, #28]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L141
	ldr	r3, [r7, #20]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L141
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	orr	r2, r3, #2
	ldr	r3, [r7, #4]
	str	r2, [r3, #60]
.L141:
	ldr	r3, [r7, #28]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L142
	ldr	r3, [r7, #20]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L142
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	orr	r2, r3, #4
	ldr	r3, [r7, #4]
	str	r2, [r3, #60]
.L142:
	ldr	r3, [r7, #28]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L143
	ldr	r3, [r7, #20]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L143
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	orr	r2, r3, #8
	ldr	r3, [r7, #4]
	str	r2, [r3, #60]
.L143:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	cmp	r3, #0
	beq	.L154
	ldr	r3, [r7, #28]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L145
	ldr	r3, [r7, #24]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L145
	ldr	r0, [r7, #4]
	PUSH {R1, R2}
	MOV R1, #48 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	UART_Receive_IT
	PUSH {R1, R2}
	MOV R1, #48 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
.L145:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #64
	cmp	r3, #64
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	and	r3, r3, #8
	cmp	r3, #0
	bne	.L146
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L147
.L146:
	ldr	r0, [r7, #4]
	bl	UART_EndRxTransfer @secure
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #64
	cmp	r3, #64
	bne	.L148
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L149
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	ldr	r2, .L156
	str	r2, [r3, #80]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	mov	r0, r3
	bl	HAL_DMA_Abort_IT @secure
	mov	r3, r0
	cmp	r3, #0
	beq	.L155
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	ldr	r3, [r3, #80]
	ldr	r2, [r7, #4]
	ldr	r2, [r2, #52]
	mov	r0, r2
	blx	r3
	b	.L155
.L149:
	ldr	r0, [r7, #4]
	bl	HAL_UART_ErrorCallback @secure
	b	.L155
.L148:
	ldr	r0, [r7, #4]
	bl	HAL_UART_ErrorCallback @secure
	b	.L155
.L147:
	ldr	r0, [r7, #4]
	bl	HAL_UART_ErrorCallback @secure
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]
	b	.L154
.L155:
	nop
	b	.L154
.L138:
	ldr	r3, [r7, #28]
	and	r3, r3, #128
	cmp	r3, #0
	beq	.L153
	ldr	r3, [r7, #24]
	and	r3, r3, #128
	cmp	r3, #0
	beq	.L153
	ldr	r0, [r7, #4]
	bl	UART_Transmit_IT @secure
	b	.L135
.L153:
	ldr	r3, [r7, #28]
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L135
	ldr	r3, [r7, #24]
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L135
	ldr	r0, [r7, #4]
	bl	UART_EndTransmit_IT 
	PUSH {R1, R2}
	MOV R1, #50 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	nop
	b	.L135
.L154:
	nop
.L135:
	adds	r7, r7, #32
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #46 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
.L157:
	.align	2
.L156:
	.word	UART_DMAAbortOnError
	.size	HAL_UART_IRQHandler, .-HAL_UART_IRQHandler
	.align	1
	.weak	HAL_UART_TxCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_TxCpltCallback, %function
HAL_UART_TxCpltCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_TxCpltCallback, .-HAL_UART_TxCpltCallback
	.align	1
	.weak	HAL_UART_TxHalfCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_TxHalfCpltCallback, %function
HAL_UART_TxHalfCpltCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_TxHalfCpltCallback, .-HAL_UART_TxHalfCpltCallback
	.align	1
	.weak	HAL_UART_RxCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_RxCpltCallback, %function
HAL_UART_RxCpltCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_RxCpltCallback, .-HAL_UART_RxCpltCallback
	.align	1
	.weak	HAL_UART_RxHalfCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_RxHalfCpltCallback, %function
HAL_UART_RxHalfCpltCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_RxHalfCpltCallback, .-HAL_UART_RxHalfCpltCallback
	.align	1
	.weak	HAL_UART_ErrorCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_ErrorCallback, %function
HAL_UART_ErrorCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_ErrorCallback, .-HAL_UART_ErrorCallback
	.align	1
	.weak	HAL_UART_AbortCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_AbortCpltCallback, %function
HAL_UART_AbortCpltCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_AbortCpltCallback, .-HAL_UART_AbortCpltCallback
	.align	1
	.weak	HAL_UART_AbortTransmitCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_AbortTransmitCpltCallback, %function
HAL_UART_AbortTransmitCpltCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_AbortTransmitCpltCallback, .-HAL_UART_AbortTransmitCpltCallback
	.align	1
	.weak	HAL_UART_AbortReceiveCpltCallback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_AbortReceiveCpltCallback, %function
HAL_UART_AbortReceiveCpltCallback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_AbortReceiveCpltCallback, .-HAL_UART_AbortReceiveCpltCallback
	.align	1
	.global	HAL_LIN_SendBreak
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_LIN_SendBreak, %function
HAL_LIN_SendBreak:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L167
	movs	r3, #2
	b	.L168
.L167:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r3, [r7, #4]
	movs	r2, #36
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #56]
	movs	r3, #0
.L168:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_LIN_SendBreak, .-HAL_LIN_SendBreak
	.align	1
	.global	HAL_MultiProcessor_EnterMuteMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_MultiProcessor_EnterMuteMode, %function
HAL_MultiProcessor_EnterMuteMode:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L170
	movs	r3, #2
	b	.L171
.L170:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r3, [r7, #4]
	movs	r2, #36
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #56]
	movs	r3, #0
.L171:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_MultiProcessor_EnterMuteMode, .-HAL_MultiProcessor_EnterMuteMode
	.align	1
	.global	HAL_MultiProcessor_ExitMuteMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_MultiProcessor_ExitMuteMode, %function
HAL_MultiProcessor_ExitMuteMode:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L173
	movs	r3, #2
	b	.L174
.L173:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r3, [r7, #4]
	movs	r2, #36
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #56]
	movs	r3, #0
.L174:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_MultiProcessor_ExitMuteMode, .-HAL_MultiProcessor_ExitMuteMode
	.align	1
	.global	HAL_HalfDuplex_EnableTransmitter
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_HalfDuplex_EnableTransmitter, %function
HAL_HalfDuplex_EnableTransmitter:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L176
	movs	r3, #2
	b	.L177
.L176:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r3, [r7, #4]
	movs	r2, #36
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #12
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	orr	r3, r3, #8
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #56]
	movs	r3, #0
.L177:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_HalfDuplex_EnableTransmitter, .-HAL_HalfDuplex_EnableTransmitter
	.align	1
	.global	HAL_HalfDuplex_EnableReceiver
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_HalfDuplex_EnableReceiver, %function
HAL_HalfDuplex_EnableReceiver:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #56]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L179
	movs	r3, #2
	b	.L180
.L179:
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #56]
	ldr	r3, [r7, #4]
	movs	r2, #36
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic	r3, r3, #12
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	orr	r3, r3, #4
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #12]
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #56]
	movs	r3, #0
.L180:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_HalfDuplex_EnableReceiver, .-HAL_HalfDuplex_EnableReceiver
	.align	1
	.global	HAL_UART_GetState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_GetState, %function
HAL_UART_GetState:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #58]
	uxtb	r3, r3
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	uxtb	r2, r3
	ldr	r3, [r7, #8]
	uxtb	r3, r3
	orrs	r3, r3, r2
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_GetState, .-HAL_UART_GetState
	.align	1
	.global	HAL_UART_GetError
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_GetError, %function
HAL_UART_GetError:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_UART_GetError, .-HAL_UART_GetError
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_DMATransmitCplt, %function
UART_DMATransmitCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #256
	cmp	r3, #0
	bne	.L186
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	orr	r2, r2, #64
	str	r2, [r3, #12]
	b	.L188
.L186:
	ldr	r0, [r7, #12]
	bl	HAL_UART_TxCpltCallback
.L188:
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	UART_DMATransmitCplt, .-UART_DMATransmitCplt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_DMATxHalfCplt, %function
UART_DMATxHalfCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r0, [r7, #12]
	bl	HAL_UART_TxHalfCpltCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	UART_DMATxHalfCplt, .-UART_DMATxHalfCplt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_DMAReceiveCplt, %function
UART_DMAReceiveCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	and	r3, r3, #256
	cmp	r3, #0
	bne	.L191
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #256
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #58]
.L191:
	ldr	r0, [r7, #12]
	bl	HAL_UART_RxCpltCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	UART_DMAReceiveCplt, .-UART_DMAReceiveCplt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_DMARxHalfCplt, %function
UART_DMARxHalfCplt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r0, [r7, #12]
	bl	HAL_UART_RxHalfCpltCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	UART_DMARxHalfCplt, .-UART_DMARxHalfCplt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_DMAError, %function
UART_DMAError:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #128
	cmp	r3, #128
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #33
	bne	.L194
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L194
	ldr	r3, [r7, #8]
	movs	r2, #0
	strh	r2, [r3, #38]	@ movhi
	ldr	r0, [r7, #8]
	bl	UART_EndTxTransfer
.L194:
	ldr	r3, [r7, #8]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	and	r3, r3, #64
	cmp	r3, #64
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #58]
	uxtb	r3, r3
	cmp	r3, #34
	bne	.L195
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L195
	ldr	r3, [r7, #8]
	movs	r2, #0
	strh	r2, [r3, #46]	@ movhi
	ldr	r0, [r7, #8]
	bl	UART_EndRxTransfer
.L195:
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #60]
	orr	r2, r3, #16
	ldr	r3, [r7, #8]
	str	r2, [r3, #60]
	ldr	r0, [r7, #8]
	bl	HAL_UART_ErrorCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	UART_DMAError, .-UART_DMAError
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_WaitOnFlagUntilTimeout, %function
UART_WaitOnFlagUntilTimeout:
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r3, [r7]
	mov	r3, r2
	strb	r3, [r7, #7]
	b	.L197
.L200:
	ldr	r3, [r7, #24]
	cmp	r3, #-1
	beq	.L197
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L198
	bl	HAL_GetTick @secure
	mov	r2, r0
	ldr	r3, [r7]
	subs	r3, r2, r3
	ldr	r2, [r7, #24]
	cmp	r2, r3
	bcs	.L197
.L198:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #416
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #58]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #56]
	movs	r3, #3
	b	.L199
.L197:
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #8]
	ands	r3, r3, r2
	ldr	r2, [r7, #8]
	cmp	r2, r3
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L200
	movs	r3, #0
.L199:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #40 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #6]
	POP {R1, R2}
	pop	{r7, pc}
	.size	UART_WaitOnFlagUntilTimeout, .-UART_WaitOnFlagUntilTimeout
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_EndTxTransfer, %function
UART_EndTxTransfer:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #192
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	UART_EndTxTransfer, .-UART_EndTxTransfer
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_EndRxTransfer, %function
UART_EndRxTransfer:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #288
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #58]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	UART_EndRxTransfer, .-UART_EndRxTransfer
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_DMAAbortOnError, %function
UART_DMAAbortOnError:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #38]	@ movhi
	ldr	r0, [r7, #12]
	bl	HAL_UART_ErrorCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	UART_DMAAbortOnError, .-UART_DMAAbortOnError
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_DMATxAbortCallback, %function
UART_DMATxAbortCallback:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	movs	r2, #0
	str	r2, [r3, #80]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L205
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	ldr	r3, [r3, #80]
	cmp	r3, #0
	bne	.L207
.L205:
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #58]
	ldr	r0, [r7, #12]
	bl	HAL_UART_AbortCpltCallback
	b	.L204
.L207:
	nop
.L204:
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	UART_DMATxAbortCallback, .-UART_DMATxAbortCallback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_DMARxAbortCallback, %function
UART_DMARxAbortCallback:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]
	movs	r2, #0
	str	r2, [r3, #80]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L209
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]
	ldr	r3, [r3, #80]
	cmp	r3, #0
	bne	.L211
.L209:
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #58]
	ldr	r0, [r7, #12]
	bl	HAL_UART_AbortCpltCallback
	b	.L208
.L211:
	nop
.L208:
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	UART_DMARxAbortCallback, .-UART_DMARxAbortCallback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_DMATxOnlyAbortCallback, %function
UART_DMATxOnlyAbortCallback:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r0, [r7, #12]
	bl	HAL_UART_AbortTransmitCpltCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	UART_DMATxOnlyAbortCallback, .-UART_DMATxOnlyAbortCallback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_DMARxOnlyAbortCallback, %function
UART_DMARxOnlyAbortCallback:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb	r2, [r3, #58]
	ldr	r0, [r7, #12]
	bl	HAL_UART_AbortReceiveCpltCallback
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	UART_DMARxOnlyAbortCallback, .-UART_DMARxOnlyAbortCallback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_Transmit_IT, %function
UART_Transmit_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #57]
	uxtb	r3, r3
	cmp	r3, #33
	bne	.L215
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #4096
	bne	.L216
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ubfx	r2, r2, #0, #9
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L217
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	adds	r2, r3, #2
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	b	.L219
.L217:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	adds	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	b	.L219
.L216:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	adds	r1, r3, #1
	ldr	r2, [r7, #4]
	str	r1, [r2, #32]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r2, [r3, #4]
.L219:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #38]	@ movhi
	uxth	r3, r3
	subs	r3, r3, #1
	uxth	r3, r3
	ldr	r2, [r7, #4]
	mov	r1, r3	@ movhi
	strh	r1, [r2, #38]	@ movhi
	cmp	r3, #0
	bne	.L220
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r2, #64
	str	r2, [r3, #12]
.L220:
	movs	r3, #0
	b	.L221
.L215:
	movs	r3, #2
.L221:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	UART_Transmit_IT, .-UART_Transmit_IT
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_EndTransmit_IT, %function
UART_EndTransmit_IT:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #57]
	ldr	r0, [r7, #4]
	bl	HAL_UART_TxCpltCallback @secure
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #51 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
	.size	UART_EndTransmit_IT, .-UART_EndTransmit_IT
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_Receive_IT, %function
UART_Receive_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #58]
	uxtb	r3, r3
	cmp	r3, #34
	bne	.L225
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #4096
	bne	.L226
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L227
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	uxth	r3, r3
	ubfx	r3, r3, #0, #9
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3]	@ movhi
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	adds	r2, r3, #2
	ldr	r3, [r7, #4]
	str	r2, [r3, #40]
	b	.L229
.L227:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	uxth	r3, r3
	uxtb	r3, r3
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3]	@ movhi
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	adds	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #40]
	b	.L229
.L226:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L230
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	adds	r1, r3, #1
	ldr	r2, [r7, #4]
	str	r1, [r2, #40]
	uxtb	r2, r0
	strb	r2, [r3]
	b	.L229
.L230:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]
	adds	r0, r3, #1
	ldr	r1, [r7, #4]
	str	r0, [r1, #40]
	and	r2, r2, #127
	uxtb	r2, r2
	strb	r2, [r3]
.L229:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #46]	@ movhi
	uxth	r3, r3
	subs	r3, r3, #1
	uxth	r3, r3
	ldr	r2, [r7, #4]
	mov	r1, r3	@ movhi
	strh	r1, [r2, #46]	@ movhi
	cmp	r3, #0
	bne	.L231
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #32
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #256
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb	r2, [r3, #58]
	ldr	r0, [r7, #4]
	bl	HAL_UART_RxCpltCallback @secure
	movs	r3, #0
	b	.L232
.L231:
	movs	r3, #0
	b	.L232
.L225:
	movs	r3, #2
.L232:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #49 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #6]
	POP {R1, R2}
	pop	{r7, pc}
	.size	UART_Receive_IT, .-UART_Receive_IT
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UART_SetConfig, %function
UART_SetConfig:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #16]
	bic	r1, r3, #12288
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	bic	r3, r3, #38400
	bic	r3, r3, #12
	ldr	r2, [r7, #4]
	ldr	r2, [r2]
	ldr	r1, [r7, #12]
	orrs	r3, r3, r1
	str	r3, [r2, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	bic	r1, r3, #768
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	cmp	r3, #32768
	bne	.L234
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L242
	cmp	r3, r2
	beq	.L235
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L242+4
	cmp	r3, r2
	bne	.L236
.L235:
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK2Freq 
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r4, r3, #4
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK2Freq
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r5, r2, r3
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK2Freq
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100
	mul	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #3
	adds	r3, r3, #50
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r3, r3, #1
	and	r3, r3, #496
	add	r4, r4, r3
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK2Freq
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r5, r2, r3
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK2Freq
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100
	mul	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #3
	adds	r3, r3, #50
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and	r2, r3, #7
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	add	r2, r2, r4
	str	r2, [r3, #8]
	b	.L238
.L236:
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK1Freq 
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r4, r3, #4
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK1Freq
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r5, r2, r3
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK1Freq
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100
	mul	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #3
	adds	r3, r3, #50
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r3, r3, #1
	and	r3, r3, #496
	add	r4, r4, r3
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK1Freq
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r5, r2, r3
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK1Freq
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100
	mul	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #3
	adds	r3, r3, #50
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and	r2, r3, #7
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	add	r2, r2, r4
	str	r2, [r3, #8]
	b	.L241
.L234:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L242
	cmp	r3, r2
	beq	.L239
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L242+4
	cmp	r3, r2
	bne	.L240
.L239:
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK2Freq
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r4, r3, #4
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK2Freq
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r5, r2, r3
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK2Freq
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100
	mul	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #4
	adds	r3, r3, #50
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and	r3, r3, #240
	add	r4, r4, r3
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK2Freq
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r5, r2, r3
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK2Freq
	PUSH {R1, R2}
	MOV R1, #26 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100
	mul	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #4
	adds	r3, r3, #50
	ldr	r2, .L242+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and	r2, r3, #15
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	add	r2, r2, r4
	str	r2, [r3, #8]
	b	.L238
.L243:
	.align	2
.L242:
	.word	1073811456
	.word	1073812480
	.word	1374389535
.L240:
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK1Freq
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, .L244
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r4, r3, #4
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK1Freq
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r5, r2, r3
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK1Freq
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, .L244
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100
	mul	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #4
	adds	r3, r3, #50
	ldr	r2, .L244
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and	r3, r3, #240
	add	r4, r4, r3
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK1Freq
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r5, r2, r3
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione  
	MOV.W R2, #0x60000000    
	STRH R1, [R2, #4]
	POP {R1, R2}
	bl	HAL_RCC_GetPCLK1Freq
	PUSH {R1, R2}
	MOV R1, #27 			@ label = hash sicuro della posizione    
	MOV.W R2, #0x60000000
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r2, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, .L244
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100
	mul	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #4
	adds	r3, r3, #50
	ldr	r2, .L244
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and	r2, r3, #15
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	add	r2, r2, r4
	str	r2, [r3, #8]
	b	.L241
.L238:
.L241:
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #23 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r4, r5, r7, pc}
.L245:
	.align	2
.L244:
	.word	1374389535
	.size	UART_SetConfig, .-UART_SetConfig
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
