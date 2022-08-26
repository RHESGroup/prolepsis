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
	.file	"usart.c"
	.text
	.comm	huart1,64,4
	.align	1
	.global	MX_USART1_UART_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	MX_USART1_UART_Init, %function
MX_USART1_UART_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L4
	ldr	r2, .L4+4
	str	r2, [r3]
	ldr	r3, .L4
	mov	r2, #115200
	str	r2, [r3, #4]
	ldr	r3, .L4
	movs	r2, #0
	str	r2, [r3, #8]
	ldr	r3, .L4
	movs	r2, #0
	str	r2, [r3, #12]
	ldr	r3, .L4
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, .L4
	movs	r2, #12
	str	r2, [r3, #20]
	ldr	r3, .L4
	movs	r2, #0
	str	r2, [r3, #24]
	ldr	r3, .L4
	movs	r2, #0
	str	r2, [r3, #28]
	ldr	r0, .L4
	bl	HAL_UART_Init 
	PUSH {R1, R2}
	MOV R1, #21 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	mov	r3, r0
	cmp	r3, #0
	beq	.L3
	bl	Error_Handler @secure
.L3:
	nop
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #20 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
.L5:
	.align	2
.L4:
	.word	huart1
	.word	1073811456
	.size	MX_USART1_UART_Init, .-MX_USART1_UART_Init
	.align	1
	.global	HAL_UART_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_MspInit, %function
HAL_UART_MspInit:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #40
	add	r7, sp, #0
	str	r0, [r7, #4]
	add	r3, r7, #20
	movs	r2, #0
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L9
	cmp	r3, r2
	bne	.L8
	movs	r3, #0
	str	r3, [r7, #16]
	ldr	r3, .L9+4
	ldr	r3, [r3, #68]
	ldr	r2, .L9+4
	orr	r3, r3, #16
	str	r3, [r2, #68]
	ldr	r3, .L9+4
	ldr	r3, [r3, #68]
	and	r3, r3, #16
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, .L9+4
	ldr	r3, [r3, #48]
	ldr	r2, .L9+4
	orr	r3, r3, #2
	str	r3, [r2, #48]
	ldr	r3, .L9+4
	ldr	r3, [r3, #48]
	and	r3, r3, #2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, .L9+4
	ldr	r3, [r3, #48]
	ldr	r2, .L9+4
	orr	r3, r3, #1
	str	r3, [r2, #48]
	ldr	r3, .L9+4
	ldr	r3, [r3, #48]
	and	r3, r3, #1
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	movs	r3, #64
	str	r3, [r7, #20]
	movs	r3, #2
	str	r3, [r7, #24]
	movs	r3, #1
	str	r3, [r7, #28]
	movs	r3, #3
	str	r3, [r7, #32]
	movs	r3, #7
	str	r3, [r7, #36]
	add	r3, r7, #20
	mov	r1, r3
	ldr	r0, .L9+8
	bl	HAL_GPIO_Init
	mov	r3, #1024
	str	r3, [r7, #20]
	movs	r3, #2
	str	r3, [r7, #24]
	movs	r3, #1
	str	r3, [r7, #28]
	movs	r3, #3
	str	r3, [r7, #32]
	movs	r3, #7
	str	r3, [r7, #36]
	add	r3, r7, #20
	mov	r1, r3
	ldr	r0, .L9+12
	bl	HAL_GPIO_Init
	movs	r2, #0
	movs	r1, #0
	movs	r0, #37
	bl	HAL_NVIC_SetPriority
	movs	r0, #37
	bl	HAL_NVIC_EnableIRQ
.L8:
	nop
	adds	r7, r7, #40
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
	.word	1073811456
	.word	1073887232
	.word	1073873920
	.word	1073872896
	.size	HAL_UART_MspInit, .-HAL_UART_MspInit
	.align	1
	.global	HAL_UART_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_UART_MspDeInit, %function
HAL_UART_MspDeInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L14
	cmp	r3, r2
	bne	.L13
	ldr	r3, .L14+4
	ldr	r3, [r3, #68]
	ldr	r2, .L14+4
	bic	r3, r3, #16
	str	r3, [r2, #68]
	movs	r1, #64
	ldr	r0, .L14+8
	bl	HAL_GPIO_DeInit
	mov	r1, #1024
	ldr	r0, .L14+12
	bl	HAL_GPIO_DeInit
	movs	r0, #37
	bl	HAL_NVIC_DisableIRQ
.L13:
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	1073811456
	.word	1073887232
	.word	1073873920
	.word	1073872896
	.size	HAL_UART_MspDeInit, .-HAL_UART_MspDeInit
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
