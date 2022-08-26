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
	.file	"stm32f4xx_it.c"
	.text
	.align	1
	.global	NMI_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	NMI_Handler, %function
NMI_Handler:
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
	.size	NMI_Handler, .-NMI_Handler
	.align	1
	.global	HardFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HardFault_Handler, %function
HardFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
.L3:
	b	.L3
	.size	HardFault_Handler, .-HardFault_Handler
	.align	1
	.global	MemManage_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	MemManage_Handler, %function
MemManage_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
.L5:
	b	.L5
	.size	MemManage_Handler, .-MemManage_Handler
	.align	1
	.global	BusFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	BusFault_Handler, %function
BusFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
.L7:
	b	.L7
	.size	BusFault_Handler, .-BusFault_Handler
	.align	1
	.global	UsageFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UsageFault_Handler, %function
UsageFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
.L9:
	b	.L9
	.size	UsageFault_Handler, .-UsageFault_Handler
	.align	1
	.global	SVC_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SVC_Handler, %function
SVC_Handler:
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
	.size	SVC_Handler, .-SVC_Handler
	.align	1
	.global	DebugMon_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DebugMon_Handler, %function
DebugMon_Handler:
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
	.size	DebugMon_Handler, .-DebugMon_Handler
	.align	1
	.global	PendSV_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	PendSV_Handler, %function
PendSV_Handler:
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
	.size	PendSV_Handler, .-PendSV_Handler
	.align	1
	.global	SysTick_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SysTick_Handler, %function
SysTick_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	bl	HAL_IncTick @secure
	nop
	pop	{r7, pc}
	.size	SysTick_Handler, .-SysTick_Handler
	.align	1
	.global	USART1_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	USART1_IRQHandler, %function
USART1_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	PUSH {R7, R8, R9}
	MOV.W R8, #0x600000000
	STRH R0, [R8, #10]
	LSR R7, R0, #16
	STRH R7, [R8, #10]
	STRH R1, [R8, #10]
	LSR R7, R1, #16
	STRH R7, [R8, #10]
	STRH R2, [R8, #10]
	LSR R7, R2, #16
	STRH R7, [R8, #10]
	STRH R3, [R8, #10]
	LSR R7, R3, #16
	STRH R7, [R8, #10]
	STRH R12, [R8, #10]
	LSR R7, R12, #16
	STRH R7, [R8, #10]
	STRH LR, [R8, #10]
	LSR R7, LR, #16
	STRH R7, [R8, #10]     
	LDR R7, [SP, #36]       @ salvataggio di PC leggendolo dallo stack
	STRH R7, [R8, #10]
	LSR R9, R7, #16
	STRH R7, [R8, #10]
	LDR R7, [SP, #40]       @ salvataggio di xPSR leggendolo dallo stack
	STRH R7, [R8, #10]
	LSR R9, R7, #16
	STRH R7, [R8, #10]
	POP {R7, R8, R9}
	add	r7, sp, #0
	ldr	r0, .L15
	bl	HAL_UART_IRQHandler 
	PUSH {R1, R2}
	MOV R1, #45 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	nop
	PUSH {R7, R8, R9}
	MOV.W R8, #0x60000000
	@ qui store addizionale dei registri pushati dal programma, se ce ne sono
	LDR R7, [SP, #40]       @ xPSR
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #36]       @ PC
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #32]       @ LR
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #28]       @ R12
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #24]       @ R3
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #20]       @ R2
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #16]       @ R1
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #12]       @ R0
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	POP {R7, R8, R9}
	pop	{r7, pc}
.L16:
	.align	2
.L15:
	.word	huart1
	.size	USART1_IRQHandler, .-USART1_IRQHandler
	.align	1
	.global	TIM5_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIM5_IRQHandler, %function
TIM5_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	PUSH {R7, R8, R9}
	MOV.W R8, #0x600000000
	STRH R0, [R8, #10]
	LSR R7, R0, #16
	STRH R7, [R8, #10]
	STRH R1, [R8, #10]
	LSR R7, R1, #16
	STRH R7, [R8, #10]
	STRH R2, [R8, #10]
	LSR R7, R2, #16
	STRH R7, [R8, #10]
	STRH R3, [R8, #10]
	LSR R7, R3, #16
	STRH R7, [R8, #10]
	STRH R12, [R8, #10]
	LSR R7, R12, #16
	STRH R7, [R8, #10]
	STRH LR, [R8, #10]
	LSR R7, LR, #16
	STRH R7, [R8, #10]     
	LDR R7, [SP, #36]       @ salvataggio di PC leggendolo dallo stack
	STRH R7, [R8, #10]
	LSR R9, R7, #16
	STRH R7, [R8, #10]
	LDR R7, [SP, #40]       @ salvataggio di xPSR leggendolo dallo stack
	STRH R7, [R8, #10]
	LSR R9, R7, #16
	STRH R7, [R8, #10]
	POP {R7, R8, R9}
	add	r7, sp, #0
	ldr	r0, .L18
	bl	HAL_TIM_IRQHandler @dafare
	PUSH {R1, R2}
	MOV R1, #53 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	nop
	PUSH {R7, R8, R9}
	MOV.W R8, #0x60000000
	@ qui store addizionale dei registri pushati dal programma, se ce ne sono
	LDR R7, [SP, #40]       @ xPSR
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #36]       @ PC
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #32]       @ LR
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #28]       @ R12
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #24]       @ R3
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #20]       @ R2
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #16]       @ R1
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	LDR R7, [SP, #12]       @ R0
	STRH R7, [R8, #12]
	LSR R9, R7, #16
	STRH R7, [R8, #12]
	POP {R7, R8, R9}
	pop	{r7, pc}
.L19:
	.align	2
.L18:
	.word	htim5
	.size	TIM5_IRQHandler, .-TIM5_IRQHandler
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
