__do_global_dtors_aux:
	push	{r4, lr}
	ldr	r4, [pc, #20]	 ;  (80801c8 <__do_global_dtors_aux+0x18>)
	ldrb	r3, [r4, #0]
	cbnz r3,lab0___do_global_dtors_aux
	ldr	r3, [pc, #16]	 ;  (80801cc <__do_global_dtors_aux+0x1c>)
	cbz r3,lab1___do_global_dtors_aux
	ldr	r0, [pc, #16]	 ;  (80801d0 <__do_global_dtors_aux+0x20>)
	nop.w
lab1___do_global_dtors_aux: 	movs	r3, #1
	strb	r3, [r4, #0]
lab0___do_global_dtors_aux: 	pop	{r4, pc}
	.word	0x20009cb0
	.word	0x00000000
	.word	0x0808b6e0
frame_dummy:
	push	{r3, lr}
	ldr	r3, [pc, #12]	 ;  (80801e4 <frame_dummy+0x10>)
	cbz r3,lab0_frame_dummy
	ldr	r1, [pc, #12]	 ;  (80801e8 <frame_dummy+0x14>)
	ldr	r0, [pc, #12]	 ;  (80801ec <frame_dummy+0x18>)
	nop.w
lab0_frame_dummy: 	pop	{r3, pc}
	.word	0x00000000
	.word	0x20009cb4
	.word	0x0808b6e0
MX_GPIO_Init:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, [pc, #64]	 ;  (808023c <MX_GPIO_Init+0x4c>)
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #60]	 ;  (808023c <MX_GPIO_Init+0x4c>)
	orr.w	r3, r3, #2
	str	r3, [r2, #48]	 ;  0x30
	ldr	r3, [pc, #52]	 ;  (808023c <MX_GPIO_Init+0x4c>)
	ldr	r3, [r3, #48]	 ;  0x30
	and.w	r3, r3, #2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #0]
	ldr	r3, [pc, #36]	 ;  (808023c <MX_GPIO_Init+0x4c>)
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #32]	 ;  (808023c <MX_GPIO_Init+0x4c>)
	orr.w	r3, r3, #1
	str	r3, [r2, #48]	 ;  0x30
	ldr	r3, [pc, #24]	 ;  (808023c <MX_GPIO_Init+0x4c>)
	ldr	r3, [r3, #48]	 ;  0x30
	and.w	r3, r3, #1
	str	r3, [r7, #0]
	ldr	r3, [r7, #0]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x40023800
HAL_MspInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, [pc, #64]	 ;  (808028c <HAL_MspInit+0x4c>)
	ldr	r3, [r3, #68]	 ;  0x44
	ldr	r2, [pc, #60]	 ;  (808028c <HAL_MspInit+0x4c>)
	orr.w	r3, r3, #16384	 ;  0x4000
	str	r3, [r2, #68]	 ;  0x44
	ldr	r3, [pc, #52]	 ;  (808028c <HAL_MspInit+0x4c>)
	ldr	r3, [r3, #68]	 ;  0x44
	and.w	r3, r3, #16384	 ;  0x4000
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #0]
	ldr	r3, [pc, #36]	 ;  (808028c <HAL_MspInit+0x4c>)
	ldr	r3, [r3, #64]	 ;  0x40
	ldr	r2, [pc, #32]	 ;  (808028c <HAL_MspInit+0x4c>)
	orr.w	r3, r3, #268435456	 ;  0x10000000
	str	r3, [r2, #64]	 ;  0x40
	ldr	r3, [pc, #24]	 ;  (808028c <HAL_MspInit+0x4c>)
	ldr	r3, [r3, #64]	 ;  0x40
	and.w	r3, r3, #268435456	 ;  0x10000000
	str	r3, [r7, #0]
	ldr	r3, [r7, #0]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x40023800
NMI_Handler:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HardFault_Handler:
	push	{r7}
	add	r7, sp, #0
lab0_HardFault_Handler: b.n lab0_HardFault_Handler
MemManage_Handler:
	push	{r7}
	add	r7, sp, #0
lab0_MemManage_Handler: b.n lab0_MemManage_Handler
BusFault_Handler:
	push	{r7}
	add	r7, sp, #0
lab0_BusFault_Handler: b.n lab0_BusFault_Handler
UsageFault_Handler:
	push	{r7}
	add	r7, sp, #0
lab0_UsageFault_Handler: b.n lab0_UsageFault_Handler
SVC_Handler:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
DebugMon_Handler:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
PendSV_Handler:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
SysTick_Handler:
	push	{r7, lr}
	add	r7, sp, #0
	bl HAL_IncTick
	nop
	pop	{r7, pc}
USART1_IRQHandler:
	push	{r7, lr}
	stmdb sp!, {r7, r8, r9}
	mov.w	r8, #0
	strh.w	r0, [r8, #10]
	mov.w	r7, r0, lsr #16
	strh.w	r7, [r8, #10]
	strh.w	r1, [r8, #10]
	mov.w	r7, r1, lsr #16
	strh.w	r7, [r8, #10]
	strh.w	r2, [r8, #10]
	mov.w	r7, r2, lsr #16
	strh.w	r7, [r8, #10]
	strh.w	r3, [r8, #10]
	mov.w	r7, r3, lsr #16
	strh.w	r7, [r8, #10]
	strh.w	ip, [r8, #10]
	mov.w	r7, ip, lsr #16
	strh.w	r7, [r8, #10]
	strh.w	lr, [r8, #10]
	mov.w	r7, lr, lsr #16
	strh.w	r7, [r8, #10]
	ldr	r7, [sp, #36]	; 0x24
	strh.w	r7, [r8, #10]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #10]
	ldr	r7, [sp, #40]	; 0x28
	strh.w	r7, [r8, #10]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #10]
	ldmia.w	sp!, {r7, r8, r9}
	add	r7, sp, #0
	ldr	r0, [pc, #8]	 ;  (80802fc <USART1_IRQHandler+0x10>)
	bl HAL_UART_IRQHandler
	nop
	stmdb	sp!, {r7, r8, r9}
	mov.w	r8, #1610612736	; 0x60000000
	ldr	r7, [sp, #40]	; 0x28
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #36]	; 0x24
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #32]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #28]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #24]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #20]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #16]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #12]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldmia.w	sp!, {r7, r8, r9}
	pop	{r7, pc}
	nop
	.word	0x20009d20
TIM5_IRQHandler:
	push	{r7, lr}
	stmdb sp!, {r7, r8, r9}
	mov.w	r8, #0
	strh.w	r0, [r8, #10]
	mov.w	r7, r0, lsr #16
	strh.w	r7, [r8, #10]
	strh.w	r1, [r8, #10]
	mov.w	r7, r1, lsr #16
	strh.w	r7, [r8, #10]
	strh.w	r2, [r8, #10]
	mov.w	r7, r2, lsr #16
	strh.w	r7, [r8, #10]
	strh.w	r3, [r8, #10]
	mov.w	r7, r3, lsr #16
	strh.w	r7, [r8, #10]
	strh.w	ip, [r8, #10]
	mov.w	r7, ip, lsr #16
	strh.w	r7, [r8, #10]
	strh.w	lr, [r8, #10]
	mov.w	r7, lr, lsr #16
	strh.w	r7, [r8, #10]
	ldr	r7, [sp, #36]	; 0x24
	strh.w	r7, [r8, #10]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #10]
	ldr	r7, [sp, #40]	; 0x28
	strh.w	r7, [r8, #10]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #10]
	ldmia.w	sp!, {r7, r8, r9}
	add	r7, sp, #0
	ldr	r0, [pc, #8]	 ;  (8080310 <TIM5_IRQHandler+0x10>)
	bl HAL_TIM_IRQHandler
	push{r1, r2}
	mov.w r1, #136
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	nop
	stmdb	sp!, {r7, r8, r9}
	mov.w	r8, #1610612736	; 0x60000000
	ldr	r7, [sp, #40]	; 0x28
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #36]	; 0x24
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #32]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #28]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #24]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #20]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #16]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldr	r7, [sp, #12]
	strh.w	r7, [r8, #12]
	mov.w	r9, r7, lsr #16
	strh.w	r7, [r8, #12]
	ldmia.w	sp!, {r7, r8, r9}
	pop	{r7, pc}
	nop
	.word	0x20009ce0
SystemInit:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #88]	 ;  (8080374 <SystemInit+0x60>)
	ldr.w	r3, [r3, #136]	 ;  0x88
	ldr	r2, [pc, #84]	 ;  (8080374 <SystemInit+0x60>)
	orr.w	r3, r3, #15728640	 ;  0xf00000
	str.w	r3, [r2, #136]	 ;  0x88
	ldr	r3, [pc, #76]	 ;  (8080378 <SystemInit+0x64>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #72]	 ;  (8080378 <SystemInit+0x64>)
	orr.w	r3, r3, #1
	str	r3, [r2, #0]
	ldr	r3, [pc, #64]	 ;  (8080378 <SystemInit+0x64>)
	movs	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [pc, #60]	 ;  (8080378 <SystemInit+0x64>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #56]	 ;  (8080378 <SystemInit+0x64>)
	bic.w	r3, r3, #17301504	 ;  0x1080000
	bic.w	r3, r3, #65536	 ;  0x10000
	str	r3, [r2, #0]
	ldr	r3, [pc, #44]	 ;  (8080378 <SystemInit+0x64>)
	ldr	r2, [pc, #44]	 ;  (808037c <SystemInit+0x68>)
	str	r2, [r3, #4]
	ldr	r3, [pc, #36]	 ;  (8080378 <SystemInit+0x64>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #32]	 ;  (8080378 <SystemInit+0x64>)
	bic.w	r3, r3, #262144	 ;  0x40000
	str	r3, [r2, #0]
	ldr	r3, [pc, #24]	 ;  (8080378 <SystemInit+0x64>)
	movs	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [pc, #16]	 ;  (8080374 <SystemInit+0x60>)
	ldr	r2, [pc, #24]	 ;  (8080380 <SystemInit+0x6c>)
	str	r2, [r3, #8]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe000ed00
	.word	0x40023800
	.word	0x24003010
	.word	0x08080000
SystemCoreClockUpdate:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #2
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #2
	str	r3, [r7, #4]
	ldr	r3, [pc, #196]	 ;  (8080464 <SystemCoreClockUpdate+0xe0>)
	ldr	r3, [r3, #8]
	and.w	r3, r3, #12
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	cmp	r3, #4
	beq.n lab0_SystemCoreClockUpdate
	cmp	r3, #8
	beq.n lab1_SystemCoreClockUpdate
	cmp	r3, #0
	bne.n lab2_SystemCoreClockUpdate
	ldr	r3, [pc, #176]	 ;  (8080468 <SystemCoreClockUpdate+0xe4>)
	ldr	r2, [pc, #176]	 ;  (808046c <SystemCoreClockUpdate+0xe8>)
	str	r2, [r3, #0]
	b.n lab3_SystemCoreClockUpdate
lab0_SystemCoreClockUpdate: 	ldr	r3, [pc, #168]	 ;  (8080468 <SystemCoreClockUpdate+0xe4>)
	ldr	r2, [pc, #172]	 ;  (8080470 <SystemCoreClockUpdate+0xec>)
	str	r2, [r3, #0]
	b.n lab3_SystemCoreClockUpdate
lab1_SystemCoreClockUpdate: 	ldr	r3, [pc, #156]	 ;  (8080464 <SystemCoreClockUpdate+0xe0>)
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #22
	and.w	r3, r3, #1
	str	r3, [r7, #8]
	ldr	r3, [pc, #144]	 ;  (8080464 <SystemCoreClockUpdate+0xe0>)
	ldr	r3, [r3, #4]
	and.w	r3, r3, #63	 ;  0x3f
	str	r3, [r7, #4]
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq.n lab4_SystemCoreClockUpdate
	ldr	r2, [pc, #140]	 ;  (8080470 <SystemCoreClockUpdate+0xec>)
	ldr	r3, [r7, #4]
	udiv	r3, r2, r3
	ldr	r2, [pc, #120]	 ;  (8080464 <SystemCoreClockUpdate+0xe0>)
	ldr	r2, [r2, #4]
	lsrs	r2, r2, #6
	ubfx	r2, r2, #0, #9
	mul.w	r3, r2, r3
	str	r3, [r7, #20]
	b.n lab5_SystemCoreClockUpdate
lab4_SystemCoreClockUpdate: 	ldr	r2, [pc, #108]	 ;  (808046c <SystemCoreClockUpdate+0xe8>)
	ldr	r3, [r7, #4]
	udiv	r3, r2, r3
	ldr	r2, [pc, #92]	 ;  (8080464 <SystemCoreClockUpdate+0xe0>)
	ldr	r2, [r2, #4]
	lsrs	r2, r2, #6
	ubfx	r2, r2, #0, #9
	mul.w	r3, r2, r3
	str	r3, [r7, #20]
lab5_SystemCoreClockUpdate: 	ldr	r3, [pc, #76]	 ;  (8080464 <SystemCoreClockUpdate+0xe0>)
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #16
	and.w	r3, r3, #3
	adds	r3, #1
	lsls	r3, r3, #1
	str	r3, [r7, #12]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #12]
	udiv	r3, r2, r3
	ldr	r2, [pc, #56]	 ;  (8080468 <SystemCoreClockUpdate+0xe4>)
	str	r3, [r2, #0]
	b.n lab3_SystemCoreClockUpdate
lab2_SystemCoreClockUpdate: 	ldr	r3, [pc, #52]	 ;  (8080468 <SystemCoreClockUpdate+0xe4>)
	ldr	r2, [pc, #52]	 ;  (808046c <SystemCoreClockUpdate+0xe8>)
	str	r2, [r3, #0]
	nop
lab3_SystemCoreClockUpdate: 	ldr	r3, [pc, #40]	 ;  (8080464 <SystemCoreClockUpdate+0xe0>)
	ldr	r3, [r3, #8]
	lsrs	r3, r3, #4
	and.w	r3, r3, #15
	ldr	r2, [pc, #44]	 ;  (8080474 <SystemCoreClockUpdate+0xf0>)
	ldrb	r3, [r2, r3]
	str	r3, [r7, #16]
	ldr	r3, [pc, #28]	 ;  (8080468 <SystemCoreClockUpdate+0xe4>)
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #16]
	lsr.w	r3, r2, r3
	ldr	r2, [pc, #16]	 ;  (8080468 <SystemCoreClockUpdate+0xe4>)
	str	r3, [r2, #0]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x40023800
	.word	0x20000000
	.word	0x00f42400
	.word	0x017d7840
	.word	0x0808b710
MX_TIM5_Init:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	add.w	r3, r7, #8
	movs	r2, #0
	str	r2, [r3, #0]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	mov	r3, r7
	movs	r2, #0
	str	r2, [r3, #0]
	str	r2, [r3, #4]
	ldr	r3, [pc, #116]	 ;  (808050c <MX_TIM5_Init+0x94>)
	ldr	r2, [pc, #120]	 ;  (8080510 <MX_TIM5_Init+0x98>)
	str	r2, [r3, #0]
	ldr	r3, [pc, #112]	 ;  (808050c <MX_TIM5_Init+0x94>)
	movs	r2, #50	 ;  0x32
	str	r2, [r3, #4]
	ldr	r3, [pc, #104]	 ;  (808050c <MX_TIM5_Init+0x94>)
	movs	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [pc, #100]	 ;  (808050c <MX_TIM5_Init+0x94>)
	mov.w	r2, #4294967295	 ;  0xffffffff
	str	r2, [r3, #12]
	ldr	r3, [pc, #92]	 ;  (808050c <MX_TIM5_Init+0x94>)
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, [pc, #84]	 ;  (808050c <MX_TIM5_Init+0x94>)
	movs	r2, #0
	str	r2, [r3, #24]
	ldr	r0, [pc, #80]	 ;  (808050c <MX_TIM5_Init+0x94>)
	bl HAL_TIM_Base_Init
	push{r1, r2}
	mov.w r1, #78
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	beq.n lab0_MX_TIM5_Init
	bl Error_Handler
lab0_MX_TIM5_Init: 	mov.w	r3, #4096	 ;  0x1000
	str	r3, [r7, #8]
	add.w	r3, r7, #8
	mov	r1, r3
	ldr	r0, [pc, #52]	 ;  (808050c <MX_TIM5_Init+0x94>)
	bl HAL_TIM_ConfigClockSource
	push{r1, r2}
	mov.w r1, #86
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	beq.n lab1_MX_TIM5_Init
	bl Error_Handler
lab1_MX_TIM5_Init: 	movs	r3, #0
	str	r3, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #4]
	mov	r3, r7
	mov	r1, r3
	ldr	r0, [pc, #24]	 ;  (808050c <MX_TIM5_Init+0x94>)
	bl HAL_TIMEx_MasterConfigSynchronization
	mov	r3, r0
	cmp	r3, #0
	beq.n lab2_MX_TIM5_Init
	bl Error_Handler
lab2_MX_TIM5_Init: 	nop
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #75
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.word	0x20009ce0
	.word	0x40000c00
HAL_TIM_Base_MspInit:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #56]	 ;  (808055c <HAL_TIM_Base_MspInit+0x48>)
	cmp	r3, r2
	bne.n lab0_HAL_TIM_Base_MspInit
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [pc, #52]	 ;  (8080560 <HAL_TIM_Base_MspInit+0x4c>)
	ldr	r3, [r3, #64]	 ;  0x40
	ldr	r2, [pc, #48]	 ;  (8080560 <HAL_TIM_Base_MspInit+0x4c>)
	orr.w	r3, r3, #8
	str	r3, [r2, #64]	 ;  0x40
	ldr	r3, [pc, #40]	 ;  (8080560 <HAL_TIM_Base_MspInit+0x4c>)
	ldr	r3, [r3, #64]	 ;  0x40
	and.w	r3, r3, #8
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	movs	r1, #0
	movs	r0, #50	 ;  0x32
	push {r1, r2}
	mov.w r1, #11
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_NVIC_SetPriority
	push{r1, r2}
	mov.w r1, #11
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, #50	 ;  0x32
	push {r1, r2}
	mov.w r1, #33
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_NVIC_EnableIRQ
	push{r1, r2}
	mov.w r1, #33
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
lab0_HAL_TIM_Base_MspInit: 	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #79
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.word	0x40000c00
	.word	0x40023800
HAL_TIM_Base_MspDeInit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #28]	 ;  (8080590 <HAL_TIM_Base_MspDeInit+0x2c>)
	cmp	r3, r2
	bne.n lab0_HAL_TIM_Base_MspDeInit
	ldr	r3, [pc, #28]	 ;  (8080594 <HAL_TIM_Base_MspDeInit+0x30>)
	ldr	r3, [r3, #64]	 ;  0x40
	ldr	r2, [pc, #24]	 ;  (8080594 <HAL_TIM_Base_MspDeInit+0x30>)
	bic.w	r3, r3, #8
	str	r3, [r2, #64]	 ;  0x40
	movs	r0, #50	 ;  0x32
	bl HAL_NVIC_DisableIRQ
lab0_HAL_TIM_Base_MspDeInit: 	nop
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.word	0x40000c00
	.word	0x40023800
MX_USART1_UART_Init:
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, [pc, #68]	 ;  (80805e4 <MX_USART1_UART_Init+0x4c>)
	ldr	r2, [pc, #72]	 ;  (80805e8 <MX_USART1_UART_Init+0x50>)
	str	r2, [r3, #0]
	ldr	r3, [pc, #64]	 ;  (80805e4 <MX_USART1_UART_Init+0x4c>)
	mov.w	r2, #115200	 ;  0x1c200
	str	r2, [r3, #4]
	ldr	r3, [pc, #56]	 ;  (80805e4 <MX_USART1_UART_Init+0x4c>)
	movs	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [pc, #48]	 ;  (80805e4 <MX_USART1_UART_Init+0x4c>)
	movs	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [pc, #44]	 ;  (80805e4 <MX_USART1_UART_Init+0x4c>)
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, [pc, #36]	 ;  (80805e4 <MX_USART1_UART_Init+0x4c>)
	movs	r2, #12
	str	r2, [r3, #20]
	ldr	r3, [pc, #32]	 ;  (80805e4 <MX_USART1_UART_Init+0x4c>)
	movs	r2, #0
	str	r2, [r3, #24]
	ldr	r3, [pc, #24]	 ;  (80805e4 <MX_USART1_UART_Init+0x4c>)
	movs	r2, #0
	str	r2, [r3, #28]
	ldr	r0, [pc, #20]	 ;  (80805e4 <MX_USART1_UART_Init+0x4c>)
	bl HAL_UART_Init
	push{r1, r2}
	mov.w r1, #28
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	beq.n lab0_MX_USART1_UART_Init
	bl Error_Handler
lab0_MX_USART1_UART_Init: 	nop
	cpsid f
	push {r1, r2}
	mov.w r1, #25
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.word	0x20009d20
	.word	0x40011000
HAL_UART_MspInit:
	push	{r7, lr}
	sub	sp, #40	 ;  0x28
	add	r7, sp, #0
	str	r0, [r7, #4]
	add.w	r3, r7, #20
	movs	r2, #0
	str	r2, [r3, #0]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #176]	 ;  (80806bc <HAL_UART_MspInit+0xd0>)
	cmp	r3, r2
	bne.n lab0_HAL_UART_MspInit
	movs	r3, #0
	str	r3, [r7, #16]
	ldr	r3, [pc, #172]	 ;  (80806c0 <HAL_UART_MspInit+0xd4>)
	ldr	r3, [r3, #68]	 ;  0x44
	ldr	r2, [pc, #168]	 ;  (80806c0 <HAL_UART_MspInit+0xd4>)
	orr.w	r3, r3, #16
	str	r3, [r2, #68]	 ;  0x44
	ldr	r3, [pc, #160]	 ;  (80806c0 <HAL_UART_MspInit+0xd4>)
	ldr	r3, [r3, #68]	 ;  0x44
	and.w	r3, r3, #16
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [pc, #144]	 ;  (80806c0 <HAL_UART_MspInit+0xd4>)
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #140]	 ;  (80806c0 <HAL_UART_MspInit+0xd4>)
	orr.w	r3, r3, #2
	str	r3, [r2, #48]	 ;  0x30
	ldr	r3, [pc, #132]	 ;  (80806c0 <HAL_UART_MspInit+0xd4>)
	ldr	r3, [r3, #48]	 ;  0x30
	and.w	r3, r3, #2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, [pc, #116]	 ;  (80806c0 <HAL_UART_MspInit+0xd4>)
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #112]	 ;  (80806c0 <HAL_UART_MspInit+0xd4>)
	orr.w	r3, r3, #1
	str	r3, [r2, #48]	 ;  0x30
	ldr	r3, [pc, #104]	 ;  (80806c0 <HAL_UART_MspInit+0xd4>)
	ldr	r3, [r3, #48]	 ;  0x30
	and.w	r3, r3, #1
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	movs	r3, #64	 ;  0x40
	str	r3, [r7, #20]
	movs	r3, #2
	str	r3, [r7, #24]
	movs	r3, #1
	str	r3, [r7, #28]
	movs	r3, #3
	str	r3, [r7, #32]
	movs	r3, #7
	str	r3, [r7, #36]	 ;  0x24
	add.w	r3, r7, #20
	mov	r1, r3
	ldr	r0, [pc, #68]	 ;  (80806c4 <HAL_UART_MspInit+0xd8>)
	bl HAL_GPIO_Init
	mov.w	r3, #1024	 ;  0x400
	str	r3, [r7, #20]
	movs	r3, #2
	str	r3, [r7, #24]
	movs	r3, #1
	str	r3, [r7, #28]
	movs	r3, #3
	str	r3, [r7, #32]
	movs	r3, #7
	str	r3, [r7, #36]	 ;  0x24
	add.w	r3, r7, #20
	mov	r1, r3
	ldr	r0, [pc, #40]	 ;  (80806c8 <HAL_UART_MspInit+0xdc>)
	bl HAL_GPIO_Init
	movs	r2, #0
	movs	r1, #0
	movs	r0, #37	 ;  0x25
	push {r1, r2}
	mov.w r1, #11
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_NVIC_SetPriority
	push{r1, r2}
	mov.w r1, #11
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, #37	 ;  0x25
	push {r1, r2}
	mov.w r1, #33
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_NVIC_EnableIRQ
	push{r1, r2}
	mov.w r1, #33
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
lab0_HAL_UART_MspInit: 	nop
	adds	r7, #40	 ;  0x28
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #29
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	.word	0x40011000
	.word	0x40023800
	.word	0x40020400
	.word	0x40020000
HAL_UART_MspDeInit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #48]	 ;  (808070c <HAL_UART_MspDeInit+0x40>)
	cmp	r3, r2
	bne.n lab0_HAL_UART_MspDeInit
	ldr	r3, [pc, #48]	 ;  (8080710 <HAL_UART_MspDeInit+0x44>)
	ldr	r3, [r3, #68]	 ;  0x44
	ldr	r2, [pc, #44]	 ;  (8080710 <HAL_UART_MspDeInit+0x44>)
	bic.w	r3, r3, #16
	str	r3, [r2, #68]	 ;  0x44
	movs	r1, #64	 ;  0x40
	ldr	r0, [pc, #36]	 ;  (8080714 <HAL_UART_MspDeInit+0x48>)
	bl HAL_GPIO_DeInit
	mov.w	r1, #1024	 ;  0x400
	ldr	r0, [pc, #32]	 ;  (8080718 <HAL_UART_MspDeInit+0x4c>)
	bl HAL_GPIO_DeInit
	movs	r0, #37	 ;  0x25
	bl HAL_NVIC_DisableIRQ
lab0_HAL_UART_MspDeInit: 	nop
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x40011000
	.word	0x40023800
	.word	0x40020400
	.word	0x40020000
HAL_Init:
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, [pc, #56]	 ;  (808075c <HAL_Init+0x40>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #52]	 ;  (808075c <HAL_Init+0x40>)
	orr.w	r3, r3, #512	 ;  0x200
	str	r3, [r2, #0]
	ldr	r3, [pc, #44]	 ;  (808075c <HAL_Init+0x40>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #40]	 ;  (808075c <HAL_Init+0x40>)
	orr.w	r3, r3, #1024	 ;  0x400
	str	r3, [r2, #0]
	ldr	r3, [pc, #32]	 ;  (808075c <HAL_Init+0x40>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #28]	 ;  (808075c <HAL_Init+0x40>)
	orr.w	r3, r3, #256	 ;  0x100
	str	r3, [r2, #0]
	movs	r0, #3
	bl HAL_NVIC_SetPriorityGrouping
	push{r1, r2}
	mov.w r1, #4
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, #0
	push {r1, r2}
	mov.w r1, #5
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_InitTick
	push{r1, r2}
	mov.w r1, #5
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl HAL_MspInit
	movs	r3, #0
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #1
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.word	0x40023c00
HAL_DeInit:
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, [pc, #76]	 ;  (80807b4 <HAL_DeInit+0x54>)
	mov.w	r2, #4294967295	 ;  0xffffffff
	str	r2, [r3, #32]
	ldr	r3, [pc, #68]	 ;  (80807b4 <HAL_DeInit+0x54>)
	movs	r2, #0
	str	r2, [r3, #32]
	ldr	r3, [pc, #64]	 ;  (80807b4 <HAL_DeInit+0x54>)
	mov.w	r2, #4294967295	 ;  0xffffffff
	str	r2, [r3, #36]	 ;  0x24
	ldr	r3, [pc, #56]	 ;  (80807b4 <HAL_DeInit+0x54>)
	movs	r2, #0
	str	r2, [r3, #36]	 ;  0x24
	ldr	r3, [pc, #48]	 ;  (80807b4 <HAL_DeInit+0x54>)
	mov.w	r2, #4294967295	 ;  0xffffffff
	str	r2, [r3, #16]
	ldr	r3, [pc, #40]	 ;  (80807b4 <HAL_DeInit+0x54>)
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, [pc, #36]	 ;  (80807b4 <HAL_DeInit+0x54>)
	mov.w	r2, #4294967295	 ;  0xffffffff
	str	r2, [r3, #20]
	ldr	r3, [pc, #28]	 ;  (80807b4 <HAL_DeInit+0x54>)
	movs	r2, #0
	str	r2, [r3, #20]
	ldr	r3, [pc, #20]	 ;  (80807b4 <HAL_DeInit+0x54>)
	mov.w	r2, #4294967295	 ;  0xffffffff
	str	r2, [r3, #24]
	ldr	r3, [pc, #12]	 ;  (80807b4 <HAL_DeInit+0x54>)
	movs	r2, #0
	str	r2, [r3, #24]
	bl HAL_MspDeInit
	movs	r3, #0
	mov	r0, r3
	pop	{r7, pc}
	.word	0x40023800
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_MspDeInit:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_InitTick:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [pc, #72]	 ;  (8080828 <HAL_InitTick+0x54>)
	ldr	r2, [r3, #0]
	ldr	r3, [pc, #72]	 ;  (808082c <HAL_InitTick+0x58>)
	ldrb	r3, [r3, #0]
	mov	r1, r3
	mov.w	r3, #1000	 ;  0x3e8
	udiv	r3, r3, r1
	udiv	r3, r2, r3
	mov	r0, r3
	bl HAL_SYSTICK_Config
	push{r1, r2}
	mov.w r1, #8
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	beq.n lab0_HAL_InitTick
	movs	r3, #1
	b.n lab1_HAL_InitTick
lab0_HAL_InitTick: 	ldr	r3, [r7, #4]
	cmp	r3, #15
	bhi.n lab2_HAL_InitTick
	movs	r2, #0
	ldr	r1, [r7, #4]
	mov.w	r0, #4294967295	 ;  0xffffffff
	push {r1, r2}
	mov.w r1, #11
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_NVIC_SetPriority
	push{r1, r2}
	mov.w r1, #11
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r2, [pc, #24]	 ;  (8080830 <HAL_InitTick+0x5c>)
	ldr	r3, [r7, #4]
	str	r3, [r2, #0]
	movs	r3, #0
	b.n lab1_HAL_InitTick
lab2_HAL_InitTick: 	movs	r3, #1
lab1_HAL_InitTick: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #5
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
	pop	{r7, pc}
	.word	0x20000000
	.word	0x20000008
	.word	0x20000004
HAL_IncTick:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #24]	 ;  (8080854 <HAL_IncTick+0x20>)
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [pc, #24]	 ;  (8080858 <HAL_IncTick+0x24>)
	ldr	r3, [r3, #0]
	add	r3, r2
	ldr	r2, [pc, #16]	 ;  (8080858 <HAL_IncTick+0x24>)
	str	r3, [r2, #0]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x20000008
	.word	0x20009d60
HAL_GetTick:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8080870 <HAL_GetTick+0x14>)
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x20009d60
HAL_GetTickPrio:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8080888 <HAL_GetTickPrio+0x14>)
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x20000004
HAL_SetTickFreq:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	movs	r3, #0
	strb	r3, [r7, #15]
	ldr	r3, [pc, #40]	 ;  (80808c4 <HAL_SetTickFreq+0x38>)
	ldrb	r3, [r3, #0]
	ldrb	r2, [r7, #7]
	cmp	r2, r3
	beq.n lab0_HAL_SetTickFreq
	ldr	r2, [pc, #28]	 ;  (80808c4 <HAL_SetTickFreq+0x38>)
	ldrb	r3, [r7, #7]
	strb	r3, [r2, #0]
	ldr	r3, [pc, #28]	 ;  (80808c8 <HAL_SetTickFreq+0x3c>)
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl HAL_InitTick
	mov	r3, r0
	strb	r3, [r7, #15]
lab0_HAL_SetTickFreq: 	ldrb	r3, [r7, #15]
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x20000008
	.word	0x20000004
HAL_GetTickFreq:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (80808e0 <HAL_GetTickFreq+0x14>)
	ldrb	r3, [r3, #0]
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x20000008
HAL_Delay:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	bl HAL_GetTick
	str	r0, [r7, #8]
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp.w	r3, #4294967295	 ;  0xffffffff
	beq.n lab0_HAL_Delay
	ldr	r3, [pc, #36]	 ;  (8080924 <HAL_Delay+0x40>)
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2
	str	r3, [r7, #12]
lab0_HAL_Delay: 	nop
lab1_HAL_Delay: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #8]
	subs	r3, r2, r3
	ldr	r2, [r7, #12]
	cmp	r2, r3
	bhi.n lab1_HAL_Delay
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #85
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	.word	0x20000008
HAL_SuspendTick:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #20]	 ;  (8080944 <HAL_SuspendTick+0x1c>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #16]	 ;  (8080944 <HAL_SuspendTick+0x1c>)
	bic.w	r3, r3, #2
	str	r3, [r2, #0]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe000e010
HAL_ResumeTick:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #20]	 ;  (8080964 <HAL_ResumeTick+0x1c>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #16]	 ;  (8080964 <HAL_ResumeTick+0x1c>)
	orr.w	r3, r3, #2
	str	r3, [r2, #0]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe000e010
HAL_GetHalVersion:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #8]	 ;  (8080978 <HAL_GetHalVersion+0x10>)
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x01070600
HAL_GetREVID:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8080990 <HAL_GetREVID+0x14>)
	ldr	r3, [r3, #0]
	lsrs	r3, r3, #16
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0xe0042000
HAL_GetDEVID:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #16]	 ;  (80809ac <HAL_GetDEVID+0x18>)
	ldr	r3, [r3, #0]
	ubfx	r3, r3, #0, #12
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe0042000
HAL_DBGMCU_EnableDBGSleepMode:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #20]	 ;  (80809cc <HAL_DBGMCU_EnableDBGSleepMode+0x1c>)
	ldr	r3, [r3, #4]
	ldr	r2, [pc, #16]	 ;  (80809cc <HAL_DBGMCU_EnableDBGSleepMode+0x1c>)
	orr.w	r3, r3, #1
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe0042000
HAL_DBGMCU_DisableDBGSleepMode:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #20]	 ;  (80809ec <HAL_DBGMCU_DisableDBGSleepMode+0x1c>)
	ldr	r3, [r3, #4]
	ldr	r2, [pc, #16]	 ;  (80809ec <HAL_DBGMCU_DisableDBGSleepMode+0x1c>)
	bic.w	r3, r3, #1
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe0042000
HAL_DBGMCU_EnableDBGStopMode:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #20]	 ;  (8080a0c <HAL_DBGMCU_EnableDBGStopMode+0x1c>)
	ldr	r3, [r3, #4]
	ldr	r2, [pc, #16]	 ;  (8080a0c <HAL_DBGMCU_EnableDBGStopMode+0x1c>)
	orr.w	r3, r3, #2
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe0042000
HAL_DBGMCU_DisableDBGStopMode:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #20]	 ;  (8080a2c <HAL_DBGMCU_DisableDBGStopMode+0x1c>)
	ldr	r3, [r3, #4]
	ldr	r2, [pc, #16]	 ;  (8080a2c <HAL_DBGMCU_DisableDBGStopMode+0x1c>)
	bic.w	r3, r3, #2
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe0042000
HAL_DBGMCU_EnableDBGStandbyMode:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #20]	 ;  (8080a4c <HAL_DBGMCU_EnableDBGStandbyMode+0x1c>)
	ldr	r3, [r3, #4]
	ldr	r2, [pc, #16]	 ;  (8080a4c <HAL_DBGMCU_EnableDBGStandbyMode+0x1c>)
	orr.w	r3, r3, #4
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe0042000
HAL_DBGMCU_DisableDBGStandbyMode:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #20]	 ;  (8080a6c <HAL_DBGMCU_DisableDBGStandbyMode+0x1c>)
	ldr	r3, [r3, #4]
	ldr	r2, [pc, #16]	 ;  (8080a6c <HAL_DBGMCU_DisableDBGStandbyMode+0x1c>)
	bic.w	r3, r3, #4
	str	r3, [r2, #4]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe0042000
HAL_EnableCompensationCell:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8080a84 <HAL_EnableCompensationCell+0x14>)
	movs	r2, #1
	str	r2, [r3, #0]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x42270400
HAL_DisableCompensationCell:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8080a9c <HAL_DisableCompensationCell+0x14>)
	movs	r2, #0
	str	r2, [r3, #0]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x42270400
HAL_GetUIDw0:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8080ab4 <HAL_GetUIDw0+0x14>)
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x1fff7a10
HAL_GetUIDw1:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8080acc <HAL_GetUIDw1+0x14>)
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x1fff7a14
HAL_GetUIDw2:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8080ae4 <HAL_GetUIDw2+0x14>)
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x1fff7a18
HAL_EnableMemorySwappingBank:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8080afc <HAL_EnableMemorySwappingBank+0x14>)
	movs	r2, #1
	str	r2, [r3, #0]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x42270020
HAL_DisableMemorySwappingBank:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8080b14 <HAL_DisableMemorySwappingBank+0x14>)
	movs	r2, #0
	str	r2, [r3, #0]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x42270020
__NVIC_SetPriorityGrouping:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [pc, #48]	 ;  (8080b5c <__NVIC_SetPriorityGrouping+0x44>)
	ldr	r3, [r3, #12]
	str	r3, [r7, #8]
	ldr	r2, [r7, #8]
	movw	r3, #63743	 ;  0xf8ff
	ands	r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	lsls	r2, r3, #8
	ldr	r3, [r7, #8]
	orrs	r3, r2
	orr.w	r3, r3, #100139008	 ;  0x5f80000
	orr.w	r3, r3, #131072	 ;  0x20000
	str	r3, [r7, #8]
	ldr	r2, [pc, #16]	 ;  (8080b5c <__NVIC_SetPriorityGrouping+0x44>)
	ldr	r3, [r7, #8]
	str	r3, [r2, #12]
	nop
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0xe000ed00
__NVIC_GetPriorityGrouping:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #16]	 ;  (8080b78 <__NVIC_GetPriorityGrouping+0x18>)
	ldr	r3, [r3, #12]
	lsrs	r3, r3, #8
	and.w	r3, r3, #7
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0xe000ed00
__NVIC_EnableIRQ:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	cmp	r3, #0
	blt.n lab0___NVIC_EnableIRQ
	ldrb	r3, [r7, #7]
	and.w	r2, r3, #31
	ldr	r1, [pc, #28]	 ;  (8080bb4 <__NVIC_EnableIRQ+0x38>)
	ldrsb.w	r3, [r7, #7]
	lsrs	r3, r3, #5
	movs	r0, #1
	lsl.w	r2, r0, r2
	str.w	r2, [r1, r3, lsl #2]
lab0___NVIC_EnableIRQ: 	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe000e100
__NVIC_DisableIRQ:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	cmp	r3, #0
	blt.n lab0___NVIC_DisableIRQ
	ldrb	r3, [r7, #7]
	and.w	r2, r3, #31
	ldr	r1, [pc, #36]	 ;  (8080bf8 <__NVIC_DisableIRQ+0x40>)
	ldrsb.w	r3, [r7, #7]
	lsrs	r3, r3, #5
	movs	r0, #1
	lsl.w	r2, r0, r2
	adds	r3, #32
	str.w	r2, [r1, r3, lsl #2]
	dsb	sy
	isb	sy
lab0___NVIC_DisableIRQ: 	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0xe000e100
__NVIC_GetPendingIRQ:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	cmp	r3, #0
	blt.n lab0___NVIC_GetPendingIRQ
	ldr	r2, [pc, #44]	 ;  (8080c3c <__NVIC_GetPendingIRQ+0x40>)
	ldrsb.w	r3, [r7, #7]
	lsrs	r3, r3, #5
	adds	r3, #64	 ;  0x40
	ldr.w	r2, [r2, r3, lsl #2]
	ldrb	r3, [r7, #7]
	and.w	r3, r3, #31
	lsr.w	r3, r2, r3
	and.w	r3, r3, #1
	b.n lab1___NVIC_GetPendingIRQ
lab0___NVIC_GetPendingIRQ: 	movs	r3, #0
lab1___NVIC_GetPendingIRQ: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe000e100
__NVIC_SetPendingIRQ:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	cmp	r3, #0
	blt.n lab0___NVIC_SetPendingIRQ
	ldrb	r3, [r7, #7]
	and.w	r2, r3, #31
	ldr	r1, [pc, #28]	 ;  (8080c78 <__NVIC_SetPendingIRQ+0x38>)
	ldrsb.w	r3, [r7, #7]
	lsrs	r3, r3, #5
	movs	r0, #1
	lsl.w	r2, r0, r2
	adds	r3, #64	 ;  0x40
	str.w	r2, [r1, r3, lsl #2]
lab0___NVIC_SetPendingIRQ: 	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0xe000e100
__NVIC_ClearPendingIRQ:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	cmp	r3, #0
	blt.n lab0___NVIC_ClearPendingIRQ
	ldrb	r3, [r7, #7]
	and.w	r2, r3, #31
	ldr	r1, [pc, #28]	 ;  (8080cb4 <__NVIC_ClearPendingIRQ+0x38>)
	ldrsb.w	r3, [r7, #7]
	lsrs	r3, r3, #5
	movs	r0, #1
	lsl.w	r2, r0, r2
	adds	r3, #96	 ;  0x60
	str.w	r2, [r1, r3, lsl #2]
lab0___NVIC_ClearPendingIRQ: 	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0xe000e100
__NVIC_GetActive:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	cmp	r3, #0
	blt.n lab0___NVIC_GetActive
	ldr	r2, [pc, #44]	 ;  (8080cf8 <__NVIC_GetActive+0x40>)
	ldrsb.w	r3, [r7, #7]
	lsrs	r3, r3, #5
	adds	r3, #128	 ;  0x80
	ldr.w	r2, [r2, r3, lsl #2]
	ldrb	r3, [r7, #7]
	and.w	r3, r3, #31
	lsr.w	r3, r2, r3
	and.w	r3, r3, #1
	b.n lab1___NVIC_GetActive
lab0___NVIC_GetActive: 	movs	r3, #0
lab1___NVIC_GetActive: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe000e100
__NVIC_SetPriority:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	str	r1, [r7, #0]
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	cmp	r3, #0
	blt.n lab0___NVIC_SetPriority
	ldr	r3, [r7, #0]
	uxtb	r2, r3
	ldr	r1, [pc, #48]	 ;  (8080d48 <__NVIC_SetPriority+0x4c>)
	ldrsb.w	r3, [r7, #7]
	lsls	r2, r2, #4
	uxtb	r2, r2
	add	r3, r1
	strb.w	r2, [r3, #768]	 ;  0x300
	b.n lab1___NVIC_SetPriority
lab0___NVIC_SetPriority: 	ldr	r3, [r7, #0]
	uxtb	r2, r3
	ldr	r1, [pc, #32]	 ;  (8080d4c <__NVIC_SetPriority+0x50>)
	ldrb	r3, [r7, #7]
	and.w	r3, r3, #15
	subs	r3, #4
	lsls	r2, r2, #4
	uxtb	r2, r2
	add	r3, r1
	strb	r2, [r3, #24]
lab1___NVIC_SetPriority: 	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0xe000e100
	.word	0xe000ed00
__NVIC_GetPriority:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	cmp	r3, #0
	blt.n lab0___NVIC_GetPriority
	ldr	r2, [pc, #52]	 ;  (8080d98 <__NVIC_GetPriority+0x48>)
	ldrsb.w	r3, [r7, #7]
	add	r3, r2
	ldrb.w	r3, [r3, #768]	 ;  0x300
	uxtb	r3, r3
	lsrs	r3, r3, #4
	uxtb	r3, r3
	b.n lab1___NVIC_GetPriority
lab0___NVIC_GetPriority: 	ldr	r2, [pc, #36]	 ;  (8080d9c <__NVIC_GetPriority+0x4c>)
	ldrb	r3, [r7, #7]
	and.w	r3, r3, #15
	subs	r3, #4
	add	r3, r2
	ldrb	r3, [r3, #24]
	uxtb	r3, r3
	lsrs	r3, r3, #4
	uxtb	r3, r3
lab1___NVIC_GetPriority: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe000e100
	.word	0xe000ed00
NVIC_EncodePriority:
	push	{r7}
	sub	sp, #36	 ;  0x24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	and.w	r3, r3, #7
	str	r3, [r7, #28]
	ldr	r3, [r7, #28]
	rsb	r3, r3, #7
	cmp	r3, #4
	it	cs
	movcs	r3, #4
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	adds	r3, #4
	cmp	r3, #6
	bls.n lab0_NVIC_EncodePriority
	ldr	r3, [r7, #28]
	subs	r3, #3
	b.n lab1_NVIC_EncodePriority
lab0_NVIC_EncodePriority: 	movs	r3, #0
lab1_NVIC_EncodePriority: 	str	r3, [r7, #20]
	mov.w	r2, #4294967295	 ;  0xffffffff
	ldr	r3, [r7, #24]
	lsl.w	r3, r2, r3
	mvns	r2, r3
	ldr	r3, [r7, #8]
	ands	r2, r3
	ldr	r3, [r7, #20]
	lsls	r2, r3
	mov.w	r1, #4294967295	 ;  0xffffffff
	ldr	r3, [r7, #20]
	lsl.w	r3, r1, r3
	mvns	r1, r3
	ldr	r3, [r7, #4]
	ands	r3, r1
	orrs	r3, r2
	mov	r0, r3
	adds	r7, #36	 ;  0x24
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
NVIC_DecodePriority:
	push	{r7}
	sub	sp, #36	 ;  0x24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #28]
	ldr	r3, [r7, #28]
	rsb	r3, r3, #7
	cmp	r3, #4
	it	cs
	movcs	r3, #4
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	adds	r3, #4
	cmp	r3, #6
	bls.n lab0_NVIC_DecodePriority
	ldr	r3, [r7, #28]
	subs	r3, #3
	b.n lab1_NVIC_DecodePriority
lab0_NVIC_DecodePriority: 	movs	r3, #0
lab1_NVIC_DecodePriority: 	str	r3, [r7, #20]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #20]
	lsrs	r2, r3
	mov.w	r1, #4294967295	 ;  0xffffffff
	ldr	r3, [r7, #24]
	lsl.w	r3, r1, r3
	mvns	r3, r3
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #0]
	mov.w	r2, #4294967295	 ;  0xffffffff
	ldr	r3, [r7, #20]
	lsl.w	r3, r2, r3
	mvns	r2, r3
	ldr	r3, [r7, #12]
	ands	r2, r3
	ldr	r3, [r7, #0]
	str	r2, [r3, #0]
	nop
	adds	r7, #36	 ;  0x24
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
__NVIC_SystemReset:
	push	{r7}
	add	r7, sp, #0
	dsb	sy
	ldr	r3, [pc, #20]	 ;  (8080e94 <__NVIC_SystemReset+0x20>)
	ldr	r3, [r3, #12]
	and.w	r2, r3, #1792	 ;  0x700
	ldr	r1, [pc, #12]	 ;  (8080e94 <__NVIC_SystemReset+0x20>)
	ldr	r3, [pc, #16]	 ;  (8080e98 <__NVIC_SystemReset+0x24>)
	orrs	r3, r2
	str	r3, [r1, #12]
	dsb	sy
lab0___NVIC_SystemReset: 	nop
	b.n lab0___NVIC_SystemReset
	.word	0xe000ed00
	.word	0x05fa0004
SysTick_Config:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	subs	r3, #1
	cmp.w	r3, #16777216	 ;  0x1000000
	bcc.n lab0_SysTick_Config
	movs	r3, #1
	b.n lab1_SysTick_Config
lab0_SysTick_Config: 	ldr	r2, [pc, #40]	 ;  (8080edc <SysTick_Config+0x40>)
	ldr	r3, [r7, #4]
	subs	r3, #1
	str	r3, [r2, #4]
	movs	r1, #15
	mov.w	r0, #4294967295	 ;  0xffffffff
	bl __NVIC_SetPriority
	ldr	r3, [pc, #20]	 ;  (8080edc <SysTick_Config+0x40>)
	movs	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [pc, #16]	 ;  (8080edc <SysTick_Config+0x40>)
	movs	r2, #7
	str	r2, [r3, #0]
	movs	r3, #0
lab1_SysTick_Config: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #9
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.word	0xe000e010
HAL_NVIC_SetPriorityGrouping:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl __NVIC_SetPriorityGrouping
	nop
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #3
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
HAL_NVIC_SetPriority:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	mov	r3, r0
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strb	r3, [r7, #15]
	movs	r3, #0
	str	r3, [r7, #20]
	bl __NVIC_GetPriorityGrouping
	str	r0, [r7, #20]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #20]
	bl NVIC_EncodePriority
	mov	r2, r0
	ldrsb.w	r3, [r7, #15]
	mov	r1, r2
	mov	r0, r3
	bl __NVIC_SetPriority
	nop
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #11
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
	pop	{r7, pc}
HAL_NVIC_EnableIRQ:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	mov	r0, r3
	bl __NVIC_EnableIRQ
	nop
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #33
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
	pop	{r7, pc}
HAL_NVIC_DisableIRQ:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	mov	r0, r3
	bl __NVIC_DisableIRQ
	nop
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_NVIC_SystemReset:
	push	{r7, lr}
	add	r7, sp, #0
	bl __NVIC_SystemReset
HAL_SYSTICK_Config:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl SysTick_Config
	push{r1, r2}
	mov.w r1, #10
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #7
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
HAL_MPU_Disable:
	push	{r7}
	add	r7, sp, #0
	dmb	sy
	ldr	r3, [pc, #28]	 ;  (8080fac <HAL_MPU_Disable+0x26>)
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #24]	 ;  (8080fac <HAL_MPU_Disable+0x26>)
	bic.w	r3, r3, #65536	 ;  0x10000
	str	r3, [r2, #36]	 ;  0x24
	ldr	r3, [pc, #20]	 ;  (8080fb0 <HAL_MPU_Disable+0x2a>)
	movs	r2, #0
	str	r2, [r3, #4]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe000ed00
	.word	0xe000ed90
HAL_MPU_Enable:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r2, [pc, #40]	 ;  (8080fe8 <HAL_MPU_Enable+0x34>)
	ldr	r3, [r7, #4]
	orr.w	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [pc, #36]	 ;  (8080fec <HAL_MPU_Enable+0x38>)
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #32]	 ;  (8080fec <HAL_MPU_Enable+0x38>)
	orr.w	r3, r3, #65536	 ;  0x10000
	str	r3, [r2, #36]	 ;  0x24
	dsb	sy
	isb	sy
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe000ed90
	.word	0xe000ed00
HAL_MPU_ConfigRegion:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r2, [r3, #1]
	ldr	r3, [pc, #116]	 ;  (8081074 <HAL_MPU_ConfigRegion+0x84>)
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq.n lab0_HAL_MPU_ConfigRegion
	ldr	r2, [pc, #104]	 ;  (8081074 <HAL_MPU_ConfigRegion+0x84>)
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r2, #12]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #12]
	lsls	r2, r3, #28
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #10]
	lsls	r3, r3, #19
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #13]
	lsls	r3, r3, #18
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #14]
	lsls	r3, r3, #17
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #15]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #9]
	lsls	r3, r3, #8
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #8]
	lsls	r3, r3, #1
	orrs	r3, r2
	ldr	r2, [r7, #4]
	ldrb	r2, [r2, #0]
	mov	r1, r2
	ldr	r2, [pc, #28]	 ;  (8081074 <HAL_MPU_ConfigRegion+0x84>)
	orrs	r3, r1
	str	r3, [r2, #16]
	b.n lab1_HAL_MPU_ConfigRegion
lab0_HAL_MPU_ConfigRegion: 	ldr	r3, [pc, #20]	 ;  (8081074 <HAL_MPU_ConfigRegion+0x84>)
	movs	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [pc, #16]	 ;  (8081074 <HAL_MPU_ConfigRegion+0x84>)
	movs	r2, #0
	str	r2, [r3, #16]
lab1_HAL_MPU_ConfigRegion: 	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0xe000ed90
HAL_NVIC_GetPriorityGrouping:
	push	{r7, lr}
	add	r7, sp, #0
	bl __NVIC_GetPriorityGrouping
	mov	r3, r0
	mov	r0, r3
	pop	{r7, pc}
HAL_NVIC_GetPriority:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	mov	r3, r0
	strb	r3, [r7, #15]
	ldrsb.w	r3, [r7, #15]
	mov	r0, r3
	bl __NVIC_GetPriority
	ldr	r3, [r7, #0]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	bl NVIC_DecodePriority
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_NVIC_SetPendingIRQ:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	mov	r0, r3
	bl __NVIC_SetPendingIRQ
	nop
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_NVIC_GetPendingIRQ:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	mov	r0, r3
	bl __NVIC_GetPendingIRQ
	mov	r3, r0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_NVIC_ClearPendingIRQ:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	mov	r0, r3
	bl __NVIC_ClearPendingIRQ
	nop
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_NVIC_GetActive:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrsb.w	r3, [r7, #7]
	mov	r0, r3
	bl __NVIC_GetActive
	mov	r3, r0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_SYSTICK_CLKSourceConfig:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #4
	bne.n lab0_HAL_SYSTICK_CLKSourceConfig
	ldr	r3, [pc, #36]	 ;  (808115c <HAL_SYSTICK_CLKSourceConfig+0x36>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #32]	 ;  (808115c <HAL_SYSTICK_CLKSourceConfig+0x36>)
	orr.w	r3, r3, #4
	str	r3, [r2, #0]
	b.n lab1_HAL_SYSTICK_CLKSourceConfig
lab0_HAL_SYSTICK_CLKSourceConfig: 	ldr	r3, [pc, #24]	 ;  (808115c <HAL_SYSTICK_CLKSourceConfig+0x36>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #20]	 ;  (808115c <HAL_SYSTICK_CLKSourceConfig+0x36>)
	bic.w	r3, r3, #4
	str	r3, [r2, #0]
lab1_HAL_SYSTICK_CLKSourceConfig: 	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xe000e010
HAL_SYSTICK_IRQHandler:
	push	{r7, lr}
	add	r7, sp, #0
	bl HAL_SYSTICK_Callback
	nop
	pop	{r7, pc}
HAL_SYSTICK_Callback:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
HAL_DMA_Init:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #20]
	bl HAL_GetTick
	str	r0, [r7, #16]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_DMA_Init
	movs	r3, #1
	b.n lab1_HAL_DMA_Init
lab0_HAL_DMA_Init: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #53]	 ;  0x35
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
	b.n lab2_HAL_DMA_Init
lab3_HAL_DMA_Init: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #5
	bls.n lab2_HAL_DMA_Init
	ldr	r3, [r7, #4]
	movs	r2, #32
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #4]
	movs	r2, #3
	strb.w	r2, [r3, #53]	 ;  0x35
	movs	r3, #3
	b.n lab1_HAL_DMA_Init
lab2_HAL_DMA_Init: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #1
	cmp	r3, #0
	bne.n lab3_HAL_DMA_Init
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	str	r3, [r7, #20]
	ldr	r2, [r7, #20]
	ldr	r3, [pc, #224]	 ;  (80812d4 <HAL_DMA_Init+0x158>)
	ands	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	orrs	r3, r2
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	cmp	r3, #4
	bne.n lab4_HAL_DMA_Init
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #44]	 ;  0x2c
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	orrs	r3, r2
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
lab4_HAL_DMA_Init: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #20]
	str	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	cmp	r3, #4
	bne.n lab5_HAL_DMA_Init
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	cmp	r3, #0
	beq.n lab5_HAL_DMA_Init
	ldr	r0, [r7, #4]
	bl DMA_CheckFifoParam
	mov	r3, r0
	cmp	r3, #0
	beq.n lab5_HAL_DMA_Init
	ldr	r3, [r7, #4]
	movs	r2, #64	 ;  0x40
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #53]	 ;  0x35
	movs	r3, #1
	b.n lab1_HAL_DMA_Init
lab5_HAL_DMA_Init: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #20]
	str	r2, [r3, #20]
	ldr	r0, [r7, #4]
	bl DMA_CalcBaseAndBitshift
	mov	r3, r0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #63	 ;  0x3f
	lsls	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #53]	 ;  0x35
	movs	r3, #0
lab1_HAL_DMA_Init: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
	.word	0xf010803f
HAL_DMA_DeInit:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_DMA_DeInit
	movs	r3, #1
	b.n lab1_HAL_DMA_DeInit
lab0_HAL_DMA_DeInit: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #53]	 ;  0x35
	uxtb	r3, r3
	cmp	r3, #2
	bne.n lab2_HAL_DMA_DeInit
	movs	r3, #2
	b.n lab1_HAL_DMA_DeInit
lab2_HAL_DMA_DeInit: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #33	 ;  0x21
	str	r2, [r3, #20]
	ldr	r0, [r7, #4]
	bl DMA_CalcBaseAndBitshift
	mov	r3, r0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #72]	 ;  0x48
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #63	 ;  0x3f
	lsls	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #53]	 ;  0x35
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	movs	r3, #0
lab1_HAL_DMA_DeInit: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_DMA_Start:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	movs	r3, #0
	strb	r3, [r7, #23]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #52]	 ;  0x34
	cmp	r3, #1
	bne.n lab0_HAL_DMA_Start
	movs	r3, #2
	b.n lab1_HAL_DMA_Start
lab0_HAL_DMA_Start: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #53]	 ;  0x35
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_DMA_Start
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #53]	 ;  0x35
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #0]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl DMA_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
	b.n lab3_HAL_DMA_Start
lab2_HAL_DMA_Start: 	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	movs	r3, #2
	strb	r3, [r7, #23]
lab3_HAL_DMA_Start: 	ldrb	r3, [r7, #23]
lab1_HAL_DMA_Start: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
HAL_DMA_Start_IT:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	movs	r3, #0
	strb	r3, [r7, #23]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #88]	 ;  0x58
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #52]	 ;  0x34
	cmp	r3, #1
	bne.n lab0_HAL_DMA_Start_IT
	movs	r3, #2
	b.n lab1_HAL_DMA_Start_IT
lab0_HAL_DMA_Start_IT: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #53]	 ;  0x35
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_DMA_Start_IT
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #53]	 ;  0x35
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #0]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl DMA_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #63	 ;  0x3f
	lsls	r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #22
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #64]	 ;  0x40
	cmp	r3, #0
	beq.n lab3_HAL_DMA_Start_IT
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8
	str	r2, [r3, #0]
lab3_HAL_DMA_Start_IT: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
	b.n lab4_HAL_DMA_Start_IT
lab2_HAL_DMA_Start_IT: 	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	movs	r3, #2
	strb	r3, [r7, #23]
lab4_HAL_DMA_Start_IT: 	ldrb	r3, [r7, #23]
lab1_HAL_DMA_Start_IT: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
HAL_DMA_Abort:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #88]	 ;  0x58
	str	r3, [r7, #12]
	bl HAL_GetTick
	str	r0, [r7, #8]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #53]	 ;  0x35
	uxtb	r3, r3
	cmp	r3, #2
	beq.n lab0_HAL_DMA_Abort
	ldr	r3, [r7, #4]
	movs	r2, #128	 ;  0x80
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	movs	r3, #1
	b.n lab1_HAL_DMA_Abort
lab0_HAL_DMA_Abort: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #22
	str	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]	 ;  0x40
	cmp	r3, #0
	bne.n lab2_HAL_DMA_Abort
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #72]	 ;  0x48
	cmp	r3, #0
	beq.n lab3_HAL_DMA_Abort
lab2_HAL_DMA_Abort: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8
	str	r2, [r3, #0]
lab3_HAL_DMA_Abort: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
	b.n lab4_HAL_DMA_Abort
lab5_HAL_DMA_Abort: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #8]
	subs	r3, r2, r3
	cmp	r3, #5
	bls.n lab4_HAL_DMA_Abort
	ldr	r3, [r7, #4]
	movs	r2, #32
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #4]
	movs	r2, #3
	strb.w	r2, [r3, #53]	 ;  0x35
	movs	r3, #3
	b.n lab1_HAL_DMA_Abort
lab4_HAL_DMA_Abort: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #1
	cmp	r3, #0
	bne.n lab5_HAL_DMA_Abort
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #63	 ;  0x3f
	lsls	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #53]	 ;  0x35
	movs	r3, #0
lab1_HAL_DMA_Abort: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_DMA_Abort_IT:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #53]	 ;  0x35
	uxtb	r3, r3
	cmp	r3, #2
	beq.n lab0_HAL_DMA_Abort_IT
	ldr	r3, [r7, #4]
	movs	r2, #128	 ;  0x80
	str	r2, [r3, #84]	 ;  0x54
	movs	r3, #1
	b.n lab1_HAL_DMA_Abort_IT
lab0_HAL_DMA_Abort_IT: 	ldr	r3, [r7, #4]
	movs	r2, #5
	strb.w	r2, [r3, #53]	 ;  0x35
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
	movs	r3, #0
lab1_HAL_DMA_Abort_IT: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_DMA_PollForTransfer:
	push	{r7, lr}
	sub	sp, #40	 ;  0x28
	add	r7, sp, #0
	str	r0, [r7, #12]
	mov	r3, r1
	str	r2, [r7, #4]
	strb	r3, [r7, #11]
	movs	r3, #0
	strb	r3, [r7, #31]
	bl HAL_GetTick
	str	r0, [r7, #24]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #53]	 ;  0x35
	uxtb	r3, r3
	cmp	r3, #2
	beq.n lab0_HAL_DMA_PollForTransfer
	ldr	r3, [r7, #12]
	movs	r2, #128	 ;  0x80
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	movs	r3, #1
	b.n lab1_HAL_DMA_PollForTransfer
lab0_HAL_DMA_PollForTransfer: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #256	 ;  0x100
	cmp	r3, #0
	beq.n lab2_HAL_DMA_PollForTransfer
	ldr	r3, [r7, #12]
	mov.w	r2, #256	 ;  0x100
	str	r2, [r3, #84]	 ;  0x54
	movs	r3, #1
	b.n lab1_HAL_DMA_PollForTransfer
lab2_HAL_DMA_PollForTransfer: 	ldrb	r3, [r7, #11]
	cmp	r3, #0
	bne.n lab3_HAL_DMA_PollForTransfer
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #32
	lsl.w	r3, r2, r3
	str	r3, [r7, #36]	 ;  0x24
	b.n lab4_HAL_DMA_PollForTransfer
lab3_HAL_DMA_PollForTransfer: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #16
	lsl.w	r3, r2, r3
	str	r3, [r7, #36]	 ;  0x24
lab4_HAL_DMA_PollForTransfer: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #88]	 ;  0x58
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #0]
	str	r3, [r7, #32]
	b.n lab5_HAL_DMA_PollForTransfer
lab11_HAL_DMA_PollForTransfer: 	ldr	r3, [r7, #4]
	cmp.w	r3, #4294967295	 ;  0xffffffff
	beq.n lab6_HAL_DMA_PollForTransfer
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq.n lab7_HAL_DMA_PollForTransfer
	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #24]
	subs	r3, r2, r3
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bcs.n lab6_HAL_DMA_PollForTransfer
lab7_HAL_DMA_PollForTransfer: 	ldr	r3, [r7, #12]
	movs	r2, #32
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #53]	 ;  0x35
	movs	r3, #3
	b.n lab1_HAL_DMA_PollForTransfer
lab6_HAL_DMA_PollForTransfer: 	ldr	r3, [r7, #20]
	ldr	r3, [r3, #0]
	str	r3, [r7, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #8
	lsls	r2, r3
	ldr	r3, [r7, #32]
	ands	r3, r2
	cmp	r3, #0
	beq.n lab8_HAL_DMA_PollForTransfer
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]	 ;  0x54
	orr.w	r2, r3, #1
	ldr	r3, [r7, #12]
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #8
	lsls	r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
lab8_HAL_DMA_PollForTransfer: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #1
	lsls	r2, r3
	ldr	r3, [r7, #32]
	ands	r3, r2
	cmp	r3, #0
	beq.n lab9_HAL_DMA_PollForTransfer
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]	 ;  0x54
	orr.w	r2, r3, #2
	ldr	r3, [r7, #12]
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #1
	lsls	r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
lab9_HAL_DMA_PollForTransfer: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #4
	lsls	r2, r3
	ldr	r3, [r7, #32]
	ands	r3, r2
	cmp	r3, #0
	beq.n lab5_HAL_DMA_PollForTransfer
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]	 ;  0x54
	orr.w	r2, r3, #4
	ldr	r3, [r7, #12]
	str	r2, [r3, #84]	 ;  0x54
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #4
	lsls	r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
lab5_HAL_DMA_PollForTransfer: 	ldr	r2, [r7, #32]
	ldr	r3, [r7, #36]	 ;  0x24
	ands	r3, r2
	cmp	r3, #0
	bne.n lab10_HAL_DMA_PollForTransfer
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]	 ;  0x54
	and.w	r3, r3, #1
	cmp	r3, #0
	beq.n lab11_HAL_DMA_PollForTransfer
lab10_HAL_DMA_PollForTransfer: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]	 ;  0x54
	cmp	r3, #0
	beq.n lab12_HAL_DMA_PollForTransfer
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #84]	 ;  0x54
	and.w	r3, r3, #1
	cmp	r3, #0
	beq.n lab12_HAL_DMA_PollForTransfer
	ldr	r0, [r7, #12]
	bl HAL_DMA_Abort
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #48	 ;  0x30
	lsls	r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #53]	 ;  0x35
	movs	r3, #1
	b.n lab1_HAL_DMA_PollForTransfer
lab12_HAL_DMA_PollForTransfer: 	ldrb	r3, [r7, #11]
	cmp	r3, #0
	bne.n lab13_HAL_DMA_PollForTransfer
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #48	 ;  0x30
	lsls	r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #53]	 ;  0x35
	b.n lab14_HAL_DMA_PollForTransfer
lab13_HAL_DMA_PollForTransfer: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #16
	lsls	r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #8]
lab14_HAL_DMA_PollForTransfer: 	ldrb	r3, [r7, #31]
lab1_HAL_DMA_PollForTransfer: 	mov	r0, r3
	adds	r7, #40	 ;  0x28
	mov	sp, r7
	pop	{r7, pc}
HAL_DMA_IRQHandler:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, [pc, #584]	 ;  (8081a04 <HAL_DMA_IRQHandler+0x258>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #584]	 ;  (8081a08 <HAL_DMA_IRQHandler+0x25c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #10
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #88]	 ;  0x58
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	ldr	r3, [r3, #0]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #8
	lsls	r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r2
	cmp	r3, #0
	beq.n lab0_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #4
	cmp	r3, #0
	beq.n lab0_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #8
	lsls	r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]	 ;  0x54
	orr.w	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #84]	 ;  0x54
lab0_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #1
	lsls	r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r2
	cmp	r3, #0
	beq.n lab1_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #0
	beq.n lab1_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #1
	lsls	r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]	 ;  0x54
	orr.w	r2, r3, #2
	ldr	r3, [r7, #4]
	str	r2, [r3, #84]	 ;  0x54
lab1_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #4
	lsls	r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r2
	cmp	r3, #0
	beq.n lab2_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #2
	cmp	r3, #0
	beq.n lab2_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #4
	lsls	r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]	 ;  0x54
	orr.w	r2, r3, #4
	ldr	r3, [r7, #4]
	str	r2, [r3, #84]	 ;  0x54
lab2_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #16
	lsls	r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r2
	cmp	r3, #0
	beq.n lab3_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #8
	cmp	r3, #0
	beq.n lab3_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #16
	lsls	r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #262144	 ;  0x40000
	cmp	r3, #0
	beq.n lab4_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #524288	 ;  0x80000
	cmp	r3, #0
	bne.n lab5_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]	 ;  0x40
	cmp	r3, #0
	beq.n lab3_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]	 ;  0x40
	ldr	r0, [r7, #4]
	blx r3
	b.n lab3_HAL_DMA_IRQHandler
lab5_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #72]	 ;  0x48
	cmp	r3, #0
	beq.n lab3_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #72]	 ;  0x48
	ldr	r0, [r7, #4]
	blx r3
	b.n lab3_HAL_DMA_IRQHandler
lab4_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #256	 ;  0x100
	cmp	r3, #0
	bne.n lab6_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8
	str	r2, [r3, #0]
lab6_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]	 ;  0x40
	cmp	r3, #0
	beq.n lab3_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]	 ;  0x40
	ldr	r0, [r7, #4]
	blx r3
lab3_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #32
	lsls	r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r2
	cmp	r3, #0
	beq.w lab7_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #16
	cmp	r3, #0
	beq.w lab7_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #32
	lsls	r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #53]	 ;  0x35
	uxtb	r3, r3
	cmp	r3, #5
	bne.n lab8_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #22
	str	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]	 ;  0x40
	cmp	r3, #0
	bne.n lab9_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #72]	 ;  0x48
	cmp	r3, #0
	beq.n lab10_HAL_DMA_IRQHandler
lab9_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8
	str	r2, [r3, #0]
lab10_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #92]	 ;  0x5c
	movs	r2, #63	 ;  0x3f
	lsls	r2, r3
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #53]	 ;  0x35
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #80]	 ;  0x50
	cmp	r3, #0
	beq.n lab11_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #80]	 ;  0x50
	ldr	r0, [r7, #4]
	blx r3
	b.n lab11_HAL_DMA_IRQHandler
lab8_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #262144	 ;  0x40000
	cmp	r3, #0
	beq.n lab12_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #524288	 ;  0x80000
	cmp	r3, #0
	bne.n lab13_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #68]	 ;  0x44
	cmp	r3, #0
	beq.n lab7_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #68]	 ;  0x44
	ldr	r0, [r7, #4]
	blx r3
	b.n lab7_HAL_DMA_IRQHandler
lab13_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #0
	beq.n lab7_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]	 ;  0x3c
	ldr	r0, [r7, #4]
	blx r3
	b.n lab7_HAL_DMA_IRQHandler
	.word	0x20000000
	.word	0x1b4e81b5
lab12_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #256	 ;  0x100
	cmp	r3, #0
	bne.n lab14_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #16
	str	r2, [r3, #0]
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #53]	 ;  0x35
lab14_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #0
	beq.n lab7_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]	 ;  0x3c
	ldr	r0, [r7, #4]
	blx r3
lab7_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]	 ;  0x54
	cmp	r3, #0
	beq.n lab15_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]	 ;  0x54
	and.w	r3, r3, #1
	cmp	r3, #0
	beq.n lab16_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	movs	r2, #5
	strb.w	r2, [r3, #53]	 ;  0x35
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab18_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #8]
	adds	r3, #1
	str	r3, [r7, #8]
	ldr	r2, [r7, #20]
	cmp	r2, r3
	bcc.n lab17_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #1
	cmp	r3, #0
	bne.n lab18_HAL_DMA_IRQHandler
	b.n lab19_HAL_DMA_IRQHandler
lab17_HAL_DMA_IRQHandler: 	nop
lab19_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #53]	 ;  0x35
lab16_HAL_DMA_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #76]	 ;  0x4c
	cmp	r3, #0
	beq.n lab15_HAL_DMA_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #76]	 ;  0x4c
	ldr	r0, [r7, #4]
	blx r3
	b.n lab15_HAL_DMA_IRQHandler
lab11_HAL_DMA_IRQHandler: 	nop
lab15_HAL_DMA_IRQHandler: 	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
HAL_DMA_RegisterCallback:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	mov	r3, r1
	str	r2, [r7, #4]
	strb	r3, [r7, #11]
	movs	r3, #0
	strb	r3, [r7, #23]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #52]	 ;  0x34
	cmp	r3, #1
	bne.n lab0_HAL_DMA_RegisterCallback
	movs	r3, #2
	b.n lab1_HAL_DMA_RegisterCallback
lab0_HAL_DMA_RegisterCallback: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #53]	 ;  0x35
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_DMA_RegisterCallback
	ldrb	r3, [r7, #11]
	cmp	r3, #5
	bhi.n lab3_HAL_DMA_RegisterCallback
	add	r2, pc, #4	 ;  (adr r2, 8081b00 <HAL_DMA_RegisterCallback+0x42>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x08081b19
	.word	0x08081b21
	.word	0x08081b29
	.word	0x08081b31
	.word	0x08081b39
	.word	0x08081b41
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #60]	 ;  0x3c
	b.n lab4_HAL_DMA_RegisterCallback
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #64]	 ;  0x40
	b.n lab4_HAL_DMA_RegisterCallback
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #68]	 ;  0x44
	b.n lab4_HAL_DMA_RegisterCallback
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #72]	 ;  0x48
	b.n lab4_HAL_DMA_RegisterCallback
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #76]	 ;  0x4c
	b.n lab4_HAL_DMA_RegisterCallback
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #80]	 ;  0x50
	b.n lab4_HAL_DMA_RegisterCallback
lab2_HAL_DMA_RegisterCallback: 	movs	r3, #1
	strb	r3, [r7, #23]
	b.n lab4_HAL_DMA_RegisterCallback
lab3_HAL_DMA_RegisterCallback: 	nop
lab4_HAL_DMA_RegisterCallback: 	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	ldrb	r3, [r7, #23]
lab1_HAL_DMA_RegisterCallback: 	mov	r0, r3
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_DMA_UnRegisterCallback:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strb	r3, [r7, #3]
	movs	r3, #0
	strb	r3, [r7, #15]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #52]	 ;  0x34
	cmp	r3, #1
	bne.n lab0_HAL_DMA_UnRegisterCallback
	movs	r3, #2
	b.n lab1_HAL_DMA_UnRegisterCallback
lab0_HAL_DMA_UnRegisterCallback: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #53]	 ;  0x35
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_DMA_UnRegisterCallback
	ldrb	r3, [r7, #3]
	cmp	r3, #6
	bhi.n lab3_HAL_DMA_UnRegisterCallback
	add	r2, pc, #4	 ;  (adr r2, 8081ba4 <HAL_DMA_UnRegisterCallback+0x3e>)
	ldr.w	pc, [r2, r3, lsl #2]
	.word	0x08081bc1
	.word	0x08081bc9
	.word	0x08081bd1
	.word	0x08081bd9
	.word	0x08081be1
	.word	0x08081be9
	.word	0x08081bf1
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	b.n lab4_HAL_DMA_UnRegisterCallback
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #64]	 ;  0x40
	b.n lab4_HAL_DMA_UnRegisterCallback
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #68]	 ;  0x44
	b.n lab4_HAL_DMA_UnRegisterCallback
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #72]	 ;  0x48
	b.n lab4_HAL_DMA_UnRegisterCallback
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #76]	 ;  0x4c
	b.n lab4_HAL_DMA_UnRegisterCallback
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	b.n lab4_HAL_DMA_UnRegisterCallback
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #72]	 ;  0x48
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	b.n lab4_HAL_DMA_UnRegisterCallback
lab3_HAL_DMA_UnRegisterCallback: 	movs	r3, #1
	strb	r3, [r7, #15]
	nop
	b.n lab4_HAL_DMA_UnRegisterCallback
lab2_HAL_DMA_UnRegisterCallback: 	movs	r3, #1
	strb	r3, [r7, #15]
lab4_HAL_DMA_UnRegisterCallback: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #52]	 ;  0x34
	ldrb	r3, [r7, #15]
lab1_HAL_DMA_UnRegisterCallback: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_DMA_GetState:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #53]	 ;  0x35
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_DMA_GetError:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #84]	 ;  0x54
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
DMA_SetConfig:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #262144	 ;  0x40000
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #0]
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	cmp	r3, #64	 ;  0x40
	bne.n lab0_DMA_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #8]
	str	r2, [r3, #12]
	b.n lab1_DMA_SetConfig
lab0_DMA_SetConfig: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #8]
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	str	r2, [r3, #12]
lab1_DMA_SetConfig: 	nop
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
DMA_CalcBaseAndBitshift:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	uxtb	r3, r3
	subs	r3, #16
	ldr	r2, [pc, #80]	 ;  (8081d2c <DMA_CalcBaseAndBitshift+0x64>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #4
	str	r3, [r7, #12]
	ldr	r2, [pc, #76]	 ;  (8081d30 <DMA_CalcBaseAndBitshift+0x68>)
	ldr	r3, [r7, #12]
	add	r3, r2
	ldrb	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #92]	 ;  0x5c
	ldr	r3, [r7, #12]
	cmp	r3, #3
	bls.n lab0_DMA_CalcBaseAndBitshift
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r3, r3, #1020	 ;  0x3fc
	bic.w	r3, r3, #3
	adds	r2, r3, #4
	ldr	r3, [r7, #4]
	str	r2, [r3, #88]	 ;  0x58
	b.n lab1_DMA_CalcBaseAndBitshift
lab0_DMA_CalcBaseAndBitshift: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r3, r3, #1020	 ;  0x3fc
	bic.w	r3, r3, #3
	ldr	r2, [r7, #4]
	str	r3, [r2, #88]	 ;  0x58
lab1_DMA_CalcBaseAndBitshift: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #88]	 ;  0x58
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0xaaaaaaab
	.word	0x0808b728
DMA_CheckFifoParam:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	strb	r3, [r7, #15]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne.n lab0_DMA_CheckFifoParam
	ldr	r3, [r7, #8]
	cmp	r3, #3
	bhi.n lab1_DMA_CheckFifoParam
	add	r2, pc, #4	 ;  (adr r2, 8081d5c <DMA_CheckFifoParam+0x28>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x08081d6d
	.word	0x08081d7f
	.word	0x08081d6d
	.word	0x08081e01
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	and.w	r3, r3, #16777216	 ;  0x1000000
	cmp	r3, #0
	beq.n lab2_DMA_CheckFifoParam
	movs	r3, #1
	strb	r3, [r7, #15]
	b.n lab2_DMA_CheckFifoParam
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	cmp.w	r3, #25165824	 ;  0x1800000
	bne.n lab3_DMA_CheckFifoParam
	movs	r3, #1
	strb	r3, [r7, #15]
	b.n lab3_DMA_CheckFifoParam
lab0_DMA_CheckFifoParam: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	cmp.w	r3, #8192	 ;  0x2000
	bne.n lab4_DMA_CheckFifoParam
	ldr	r3, [r7, #8]
	cmp	r3, #3
	bhi.n lab5_DMA_CheckFifoParam
	add	r2, pc, #4	 ;  (adr r2, 8081da4 <DMA_CheckFifoParam+0x70>)
	ldr.w	pc, [r2, r3, lsl #2]
	.word	0x08081db5
	.word	0x08081dbb
	.word	0x08081db5
	.word	0x08081dcd
	movs	r3, #1
	strb	r3, [r7, #15]
	b.n lab6_DMA_CheckFifoParam
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	and.w	r3, r3, #16777216	 ;  0x1000000
	cmp	r3, #0
	beq.n lab7_DMA_CheckFifoParam
	movs	r3, #1
	strb	r3, [r7, #15]
	b.n lab7_DMA_CheckFifoParam
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	cmp.w	r3, #25165824	 ;  0x1800000
	bne.n lab8_DMA_CheckFifoParam
	movs	r3, #1
	strb	r3, [r7, #15]
	b.n lab8_DMA_CheckFifoParam
lab4_DMA_CheckFifoParam: 	ldr	r3, [r7, #8]
	cmp	r3, #2
	bls.n lab9_DMA_CheckFifoParam
	cmp	r3, #3
	beq.n lab10_DMA_CheckFifoParam
	b.n lab6_DMA_CheckFifoParam
lab9_DMA_CheckFifoParam: 	movs	r3, #1
	strb	r3, [r7, #15]
	b.n lab6_DMA_CheckFifoParam
lab10_DMA_CheckFifoParam: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	and.w	r3, r3, #16777216	 ;  0x1000000
	cmp	r3, #0
	beq.n lab11_DMA_CheckFifoParam
	movs	r3, #1
	strb	r3, [r7, #15]
	b.n lab11_DMA_CheckFifoParam
lab1_DMA_CheckFifoParam: 	nop
	b.n lab6_DMA_CheckFifoParam
lab2_DMA_CheckFifoParam: 	nop
	b.n lab6_DMA_CheckFifoParam
lab3_DMA_CheckFifoParam: 	nop
	b.n lab6_DMA_CheckFifoParam
lab5_DMA_CheckFifoParam: 	nop
	b.n lab6_DMA_CheckFifoParam
lab7_DMA_CheckFifoParam: 	nop
	b.n lab6_DMA_CheckFifoParam
lab8_DMA_CheckFifoParam: 	nop
	b.n lab6_DMA_CheckFifoParam
lab11_DMA_CheckFifoParam: 	nop
lab6_DMA_CheckFifoParam: 	ldrb	r3, [r7, #15]
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_GPIO_Init:
	push	{r7}
	sub	sp, #36	 ;  0x24
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #28]
	b.n lab0_HAL_GPIO_Init
lab21_HAL_GPIO_Init: 	movs	r2, #1
	ldr	r3, [r7, #28]
	lsl.w	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #20]
	ands	r3, r2
	str	r3, [r7, #16]
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	bne.w lab1_HAL_GPIO_Init
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	cmp	r3, #2
	beq.n lab2_HAL_GPIO_Init
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	cmp	r3, #18
	bne.n lab3_HAL_GPIO_Init
lab2_HAL_GPIO_Init: 	ldr	r3, [r7, #28]
	lsrs	r2, r3, #3
	ldr	r3, [r7, #4]
	adds	r2, #8
	ldr.w	r3, [r3, r2, lsl #2]
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	and.w	r3, r3, #7
	lsls	r3, r3, #2
	movs	r2, #15
	lsl.w	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #28]
	and.w	r3, r3, #7
	lsls	r3, r3, #2
	lsl.w	r3, r2, r3
	ldr	r2, [r7, #24]
	orrs	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	lsrs	r2, r3, #3
	ldr	r3, [r7, #4]
	adds	r2, #8
	ldr	r1, [r7, #24]
	str.w	r1, [r3, r2, lsl #2]
lab3_HAL_GPIO_Init: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	movs	r2, #3
	lsl.w	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	and.w	r2, r3, #3
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	lsl.w	r3, r2, r3
	ldr	r2, [r7, #24]
	orrs	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #24]
	str	r2, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	cmp	r3, #1
	beq.n lab4_HAL_GPIO_Init
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	cmp	r3, #2
	beq.n lab4_HAL_GPIO_Init
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	cmp	r3, #17
	beq.n lab4_HAL_GPIO_Init
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	cmp	r3, #18
	bne.n lab5_HAL_GPIO_Init
lab4_HAL_GPIO_Init: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	movs	r2, #3
	lsl.w	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	lsl.w	r3, r2, r3
	ldr	r2, [r7, #24]
	orrs	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #24]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #24]
	movs	r2, #1
	ldr	r3, [r7, #28]
	lsl.w	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #4
	and.w	r2, r3, #1
	ldr	r3, [r7, #28]
	lsl.w	r3, r2, r3
	ldr	r2, [r7, #24]
	orrs	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #24]
	str	r2, [r3, #4]
lab5_HAL_GPIO_Init: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	movs	r2, #3
	lsl.w	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	lsl.w	r3, r2, r3
	ldr	r2, [r7, #24]
	orrs	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #24]
	str	r2, [r3, #12]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	and.w	r3, r3, #268435456	 ;  0x10000000
	cmp	r3, #0
	beq.w lab1_HAL_GPIO_Init
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [pc, #404]	 ;  (8082148 <HAL_GPIO_Init+0x320>)
	ldr	r3, [r3, #68]	 ;  0x44
	ldr	r2, [pc, #400]	 ;  (8082148 <HAL_GPIO_Init+0x320>)
	orr.w	r3, r3, #16384	 ;  0x4000
	str	r3, [r2, #68]	 ;  0x44
	ldr	r3, [pc, #392]	 ;  (8082148 <HAL_GPIO_Init+0x320>)
	ldr	r3, [r3, #68]	 ;  0x44
	and.w	r3, r3, #16384	 ;  0x4000
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r2, [pc, #384]	 ;  (808214c <HAL_GPIO_Init+0x324>)
	ldr	r3, [r7, #28]
	lsrs	r3, r3, #2
	adds	r3, #2
	ldr.w	r3, [r2, r3, lsl #2]
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	and.w	r3, r3, #3
	lsls	r3, r3, #2
	movs	r2, #15
	lsl.w	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #348]	 ;  (8082150 <HAL_GPIO_Init+0x328>)
	cmp	r3, r2
	beq.n lab6_HAL_GPIO_Init
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #344]	 ;  (8082154 <HAL_GPIO_Init+0x32c>)
	cmp	r3, r2
	beq.n lab7_HAL_GPIO_Init
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #340]	 ;  (8082158 <HAL_GPIO_Init+0x330>)
	cmp	r3, r2
	beq.n lab8_HAL_GPIO_Init
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #336]	 ;  (808215c <HAL_GPIO_Init+0x334>)
	cmp	r3, r2
	beq.n lab9_HAL_GPIO_Init
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #332]	 ;  (8082160 <HAL_GPIO_Init+0x338>)
	cmp	r3, r2
	beq.n lab10_HAL_GPIO_Init
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #328]	 ;  (8082164 <HAL_GPIO_Init+0x33c>)
	cmp	r3, r2
	beq.n lab11_HAL_GPIO_Init
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #324]	 ;  (8082168 <HAL_GPIO_Init+0x340>)
	cmp	r3, r2
	beq.n lab12_HAL_GPIO_Init
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #320]	 ;  (808216c <HAL_GPIO_Init+0x344>)
	cmp	r3, r2
	beq.n lab13_HAL_GPIO_Init
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #316]	 ;  (8082170 <HAL_GPIO_Init+0x348>)
	cmp	r3, r2
	beq.n lab14_HAL_GPIO_Init
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #312]	 ;  (8082174 <HAL_GPIO_Init+0x34c>)
	cmp	r3, r2
	bne.n lab15_HAL_GPIO_Init
	movs	r3, #9
	b.n lab16_HAL_GPIO_Init
lab15_HAL_GPIO_Init: 	movs	r3, #10
	b.n lab16_HAL_GPIO_Init
lab14_HAL_GPIO_Init: 	movs	r3, #8
	b.n lab16_HAL_GPIO_Init
lab13_HAL_GPIO_Init: 	movs	r3, #7
	b.n lab16_HAL_GPIO_Init
lab12_HAL_GPIO_Init: 	movs	r3, #6
	b.n lab16_HAL_GPIO_Init
lab11_HAL_GPIO_Init: 	movs	r3, #5
	b.n lab16_HAL_GPIO_Init
lab10_HAL_GPIO_Init: 	movs	r3, #4
	b.n lab16_HAL_GPIO_Init
lab9_HAL_GPIO_Init: 	movs	r3, #3
	b.n lab16_HAL_GPIO_Init
lab8_HAL_GPIO_Init: 	movs	r3, #2
	b.n lab16_HAL_GPIO_Init
lab7_HAL_GPIO_Init: 	movs	r3, #1
	b.n lab16_HAL_GPIO_Init
lab6_HAL_GPIO_Init: 	movs	r3, #0
lab16_HAL_GPIO_Init: 	ldr	r2, [r7, #28]
	and.w	r2, r2, #3
	lsls	r2, r2, #2
	lsls	r3, r2
	ldr	r2, [r7, #24]
	orrs	r3, r2
	str	r3, [r7, #24]
	ldr	r1, [pc, #208]	 ;  (808214c <HAL_GPIO_Init+0x324>)
	ldr	r3, [r7, #28]
	lsrs	r3, r3, #2
	adds	r3, #2
	ldr	r2, [r7, #24]
	str.w	r2, [r1, r3, lsl #2]
	ldr	r3, [pc, #240]	 ;  (8082178 <HAL_GPIO_Init+0x350>)
	ldr	r3, [r3, #0]
	str	r3, [r7, #24]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	and.w	r3, r3, #65536	 ;  0x10000
	cmp	r3, #0
	beq.n lab17_HAL_GPIO_Init
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #24]
lab17_HAL_GPIO_Init: 	ldr	r2, [pc, #204]	 ;  (8082178 <HAL_GPIO_Init+0x350>)
	ldr	r3, [r7, #24]
	str	r3, [r2, #0]
	ldr	r3, [pc, #196]	 ;  (8082178 <HAL_GPIO_Init+0x350>)
	ldr	r3, [r3, #4]
	str	r3, [r7, #24]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	and.w	r3, r3, #131072	 ;  0x20000
	cmp	r3, #0
	beq.n lab18_HAL_GPIO_Init
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #24]
lab18_HAL_GPIO_Init: 	ldr	r2, [pc, #160]	 ;  (8082178 <HAL_GPIO_Init+0x350>)
	ldr	r3, [r7, #24]
	str	r3, [r2, #4]
	ldr	r3, [pc, #156]	 ;  (8082178 <HAL_GPIO_Init+0x350>)
	ldr	r3, [r3, #8]
	str	r3, [r7, #24]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	and.w	r3, r3, #1048576	 ;  0x100000
	cmp	r3, #0
	beq.n lab19_HAL_GPIO_Init
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #24]
lab19_HAL_GPIO_Init: 	ldr	r2, [pc, #120]	 ;  (8082178 <HAL_GPIO_Init+0x350>)
	ldr	r3, [r7, #24]
	str	r3, [r2, #8]
	ldr	r3, [pc, #112]	 ;  (8082178 <HAL_GPIO_Init+0x350>)
	ldr	r3, [r3, #12]
	str	r3, [r7, #24]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	and.w	r3, r3, #2097152	 ;  0x200000
	cmp	r3, #0
	beq.n lab20_HAL_GPIO_Init
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #24]
lab20_HAL_GPIO_Init: 	ldr	r2, [pc, #76]	 ;  (8082178 <HAL_GPIO_Init+0x350>)
	ldr	r3, [r7, #24]
	str	r3, [r2, #12]
lab1_HAL_GPIO_Init: 	ldr	r3, [r7, #28]
	adds	r3, #1
	str	r3, [r7, #28]
lab0_HAL_GPIO_Init: 	ldr	r3, [r7, #28]
	cmp	r3, #15
	bls.w lab21_HAL_GPIO_Init
	nop
	adds	r7, #36	 ;  0x24
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x40023800
	.word	0x40013800
	.word	0x40020000
	.word	0x40020400
	.word	0x40020800
	.word	0x40020c00
	.word	0x40021000
	.word	0x40021400
	.word	0x40021800
	.word	0x40021c00
	.word	0x40022000
	.word	0x40022400
	.word	0x40013c00
HAL_GPIO_DeInit:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #20]
	b.n lab0_HAL_GPIO_DeInit
lab14_HAL_GPIO_DeInit: 	movs	r2, #1
	ldr	r3, [r7, #20]
	lsl.w	r3, r2, r3
	str	r3, [r7, #16]
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #16]
	ands	r3, r2
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	bne.w lab1_HAL_GPIO_DeInit
	ldr	r2, [pc, #424]	 ;  (8082360 <HAL_GPIO_DeInit+0x1e4>)
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #2
	adds	r3, #2
	ldr.w	r3, [r2, r3, lsl #2]
	str	r3, [r7, #8]
	ldr	r3, [r7, #20]
	and.w	r3, r3, #3
	lsls	r3, r3, #2
	movs	r2, #15
	lsl.w	r3, r2, r3
	ldr	r2, [r7, #8]
	ands	r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #392]	 ;  (8082364 <HAL_GPIO_DeInit+0x1e8>)
	cmp	r3, r2
	beq.n lab2_HAL_GPIO_DeInit
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #388]	 ;  (8082368 <HAL_GPIO_DeInit+0x1ec>)
	cmp	r3, r2
	beq.n lab3_HAL_GPIO_DeInit
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #384]	 ;  (808236c <HAL_GPIO_DeInit+0x1f0>)
	cmp	r3, r2
	beq.n lab4_HAL_GPIO_DeInit
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #380]	 ;  (8082370 <HAL_GPIO_DeInit+0x1f4>)
	cmp	r3, r2
	beq.n lab5_HAL_GPIO_DeInit
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #376]	 ;  (8082374 <HAL_GPIO_DeInit+0x1f8>)
	cmp	r3, r2
	beq.n lab6_HAL_GPIO_DeInit
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #372]	 ;  (8082378 <HAL_GPIO_DeInit+0x1fc>)
	cmp	r3, r2
	beq.n lab7_HAL_GPIO_DeInit
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #368]	 ;  (808237c <HAL_GPIO_DeInit+0x200>)
	cmp	r3, r2
	beq.n lab8_HAL_GPIO_DeInit
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #364]	 ;  (8082380 <HAL_GPIO_DeInit+0x204>)
	cmp	r3, r2
	beq.n lab9_HAL_GPIO_DeInit
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #360]	 ;  (8082384 <HAL_GPIO_DeInit+0x208>)
	cmp	r3, r2
	beq.n lab10_HAL_GPIO_DeInit
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #356]	 ;  (8082388 <HAL_GPIO_DeInit+0x20c>)
	cmp	r3, r2
	bne.n lab11_HAL_GPIO_DeInit
	movs	r3, #9
	b.n lab12_HAL_GPIO_DeInit
lab11_HAL_GPIO_DeInit: 	movs	r3, #10
	b.n lab12_HAL_GPIO_DeInit
lab10_HAL_GPIO_DeInit: 	movs	r3, #8
	b.n lab12_HAL_GPIO_DeInit
lab9_HAL_GPIO_DeInit: 	movs	r3, #7
	b.n lab12_HAL_GPIO_DeInit
lab8_HAL_GPIO_DeInit: 	movs	r3, #6
	b.n lab12_HAL_GPIO_DeInit
lab7_HAL_GPIO_DeInit: 	movs	r3, #5
	b.n lab12_HAL_GPIO_DeInit
lab6_HAL_GPIO_DeInit: 	movs	r3, #4
	b.n lab12_HAL_GPIO_DeInit
lab5_HAL_GPIO_DeInit: 	movs	r3, #3
	b.n lab12_HAL_GPIO_DeInit
lab4_HAL_GPIO_DeInit: 	movs	r3, #2
	b.n lab12_HAL_GPIO_DeInit
lab3_HAL_GPIO_DeInit: 	movs	r3, #1
	b.n lab12_HAL_GPIO_DeInit
lab2_HAL_GPIO_DeInit: 	movs	r3, #0
lab12_HAL_GPIO_DeInit: 	ldr	r2, [r7, #20]
	and.w	r2, r2, #3
	lsls	r2, r2, #2
	lsls	r3, r2
	ldr	r2, [r7, #8]
	cmp	r2, r3
	bne.n lab13_HAL_GPIO_DeInit
	ldr	r3, [r7, #20]
	and.w	r3, r3, #3
	lsls	r3, r3, #2
	movs	r2, #15
	lsl.w	r3, r2, r3
	str	r3, [r7, #8]
	ldr	r2, [pc, #236]	 ;  (8082360 <HAL_GPIO_DeInit+0x1e4>)
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #2
	adds	r3, #2
	ldr.w	r1, [r2, r3, lsl #2]
	ldr	r3, [r7, #8]
	mvns	r2, r3
	ldr	r0, [pc, #220]	 ;  (8082360 <HAL_GPIO_DeInit+0x1e4>)
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #2
	ands	r2, r1
	adds	r3, #2
	str.w	r2, [r0, r3, lsl #2]
	ldr	r3, [pc, #252]	 ;  (808238c <HAL_GPIO_DeInit+0x210>)
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	mvns	r3, r3
	ldr	r1, [pc, #244]	 ;  (808238c <HAL_GPIO_DeInit+0x210>)
	ands	r3, r2
	str	r3, [r1, #0]
	ldr	r3, [pc, #236]	 ;  (808238c <HAL_GPIO_DeInit+0x210>)
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	mvns	r3, r3
	ldr	r1, [pc, #228]	 ;  (808238c <HAL_GPIO_DeInit+0x210>)
	ands	r3, r2
	str	r3, [r1, #4]
	ldr	r3, [pc, #224]	 ;  (808238c <HAL_GPIO_DeInit+0x210>)
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	mvns	r3, r3
	ldr	r1, [pc, #216]	 ;  (808238c <HAL_GPIO_DeInit+0x210>)
	ands	r3, r2
	str	r3, [r1, #8]
	ldr	r3, [pc, #208]	 ;  (808238c <HAL_GPIO_DeInit+0x210>)
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	mvns	r3, r3
	ldr	r1, [pc, #200]	 ;  (808238c <HAL_GPIO_DeInit+0x210>)
	ands	r3, r2
	str	r3, [r1, #12]
lab13_HAL_GPIO_DeInit: 	ldr	r3, [r7, #4]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	movs	r1, #3
	lsl.w	r3, r1, r3
	mvns	r3, r3
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #0]
	ldr	r3, [r7, #20]
	lsrs	r2, r3, #3
	ldr	r3, [r7, #4]
	adds	r2, #8
	ldr.w	r1, [r3, r2, lsl #2]
	ldr	r3, [r7, #20]
	and.w	r3, r3, #7
	lsls	r3, r3, #2
	movs	r2, #15
	lsl.w	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #20]
	lsrs	r2, r2, #3
	ands	r1, r3
	ldr	r3, [r7, #4]
	adds	r2, #8
	str.w	r1, [r3, r2, lsl #2]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	movs	r1, #3
	lsl.w	r3, r1, r3
	mvns	r3, r3
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	movs	r1, #1
	ldr	r3, [r7, #20]
	lsl.w	r3, r1, r3
	mvns	r3, r3
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	movs	r1, #3
	lsl.w	r3, r1, r3
	mvns	r3, r3
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
lab1_HAL_GPIO_DeInit: 	ldr	r3, [r7, #20]
	adds	r3, #1
	str	r3, [r7, #20]
lab0_HAL_GPIO_DeInit: 	ldr	r3, [r7, #20]
	cmp	r3, #15
	bls.w lab14_HAL_GPIO_DeInit
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x40013800
	.word	0x40020000
	.word	0x40020400
	.word	0x40020800
	.word	0x40020c00
	.word	0x40021000
	.word	0x40021400
	.word	0x40021800
	.word	0x40021c00
	.word	0x40022000
	.word	0x40022400
	.word	0x40013c00
HAL_GPIO_ReadPin:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strh	r3, [r7, #2]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #16]
	ldrh	r3, [r7, #2]
	ands	r3, r2
	cmp	r3, #0
	beq.n lab0_HAL_GPIO_ReadPin
	movs	r3, #1
	strb	r3, [r7, #15]
	b.n lab1_HAL_GPIO_ReadPin
lab0_HAL_GPIO_ReadPin: 	movs	r3, #0
	strb	r3, [r7, #15]
lab1_HAL_GPIO_ReadPin: 	ldrb	r3, [r7, #15]
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_GPIO_WritePin:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strh	r3, [r7, #2]
	mov	r3, r2
	strb	r3, [r7, #1]
	ldrb	r3, [r7, #1]
	cmp	r3, #0
	beq.n lab0_HAL_GPIO_WritePin
	ldrh	r2, [r7, #2]
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
	b.n lab1_HAL_GPIO_WritePin
lab0_HAL_GPIO_WritePin: 	ldrh	r3, [r7, #2]
	lsls	r2, r3, #16
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
lab1_HAL_GPIO_WritePin: 	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_GPIO_TogglePin:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strh	r3, [r7, #2]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #20]
	ldrh	r3, [r7, #2]
	ands	r2, r3
	ldrh	r3, [r7, #2]
	cmp	r2, r3
	bne.n lab0_HAL_GPIO_TogglePin
	ldrh	r3, [r7, #2]
	lsls	r2, r3, #16
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
	b.n lab1_HAL_GPIO_TogglePin
lab0_HAL_GPIO_TogglePin: 	ldrh	r2, [r7, #2]
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
lab1_HAL_GPIO_TogglePin: 	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_GPIO_LockPin:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strh	r3, [r7, #2]
	mov.w	r3, #65536	 ;  0x10000
	str	r3, [r7, #12]
	ldrh	r2, [r7, #2]
	ldr	r3, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	ldrh	r2, [r7, #2]
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	and.w	r3, r3, #65536	 ;  0x10000
	cmp	r3, #0
	beq.n lab0_HAL_GPIO_LockPin
	movs	r3, #0
	b.n lab1_HAL_GPIO_LockPin
lab0_HAL_GPIO_LockPin: 	movs	r3, #1
lab1_HAL_GPIO_LockPin: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_GPIO_EXTI_IRQHandler:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strh	r3, [r7, #6]
	ldr	r3, [pc, #32]	 ;  (80824a4 <HAL_GPIO_EXTI_IRQHandler+0x2c>)
	ldr	r2, [r3, #20]
	ldrh	r3, [r7, #6]
	ands	r3, r2
	cmp	r3, #0
	beq.n lab0_HAL_GPIO_EXTI_IRQHandler
	ldr	r2, [pc, #20]	 ;  (80824a4 <HAL_GPIO_EXTI_IRQHandler+0x2c>)
	ldrh	r3, [r7, #6]
	str	r3, [r2, #20]
	ldrh	r3, [r7, #6]
	mov	r0, r3
	bl HAL_GPIO_EXTI_Callback
lab0_HAL_GPIO_EXTI_IRQHandler: 	nop
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.word	0x40013c00
HAL_GPIO_EXTI_Callback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strh	r3, [r7, #6]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	push	{r7}
	add	r7, sp, #0
	movs	r3, #0
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_RCC_OscConfig:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_RCC_OscConfig
	movs	r3, #1
	b.n lab1_HAL_RCC_OscConfig
lab0_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #1
	cmp	r3, #0
	beq.n lab2_HAL_RCC_OscConfig
	ldr	r3, [pc, #652]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #8]
	and.w	r3, r3, #12
	cmp	r3, #4
	beq.n lab3_HAL_RCC_OscConfig
	ldr	r3, [pc, #640]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #8]
	and.w	r3, r3, #12
	cmp	r3, #8
	bne.n lab4_HAL_RCC_OscConfig
	ldr	r3, [pc, #628]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #4]
	and.w	r3, r3, #4194304	 ;  0x400000
	cmp.w	r3, #4194304	 ;  0x400000
	bne.n lab4_HAL_RCC_OscConfig
lab3_HAL_RCC_OscConfig: 	ldr	r3, [pc, #612]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #131072	 ;  0x20000
	cmp	r3, #0
	beq.n lab5_HAL_RCC_OscConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne.n lab5_HAL_RCC_OscConfig
	movs	r3, #1
	b.n lab1_HAL_RCC_OscConfig
lab4_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp.w	r3, #65536	 ;  0x10000
	bne.n lab6_HAL_RCC_OscConfig
	ldr	r3, [pc, #580]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #576]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	orr.w	r3, r3, #65536	 ;  0x10000
	str	r3, [r2, #0]
	b.n lab7_HAL_RCC_OscConfig
lab6_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp.w	r3, #327680	 ;  0x50000
	bne.n lab8_HAL_RCC_OscConfig
	ldr	r3, [pc, #556]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #552]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	orr.w	r3, r3, #262144	 ;  0x40000
	str	r3, [r2, #0]
	ldr	r3, [pc, #544]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #540]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	orr.w	r3, r3, #65536	 ;  0x10000
	str	r3, [r2, #0]
	b.n lab7_HAL_RCC_OscConfig
lab8_HAL_RCC_OscConfig: 	ldr	r3, [pc, #528]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #524]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	bic.w	r3, r3, #65536	 ;  0x10000
	str	r3, [r2, #0]
	ldr	r3, [pc, #516]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #512]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	bic.w	r3, r3, #262144	 ;  0x40000
	str	r3, [r2, #0]
lab7_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq.n lab9_HAL_RCC_OscConfig
	bl HAL_GetTick
	str	r0, [r7, #16]
	b.n lab10_HAL_RCC_OscConfig
lab11_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #100	 ;  0x64
	bls.n lab10_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab10_HAL_RCC_OscConfig: 	ldr	r3, [pc, #472]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #131072	 ;  0x20000
	cmp	r3, #0
	beq.n lab11_HAL_RCC_OscConfig
	b.n lab2_HAL_RCC_OscConfig
lab9_HAL_RCC_OscConfig: 	bl	HAL_GetTick 
	str	r0, [r7, #16]
	b.n lab12_HAL_RCC_OscConfig
lab13_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #100	 ;  0x64
	bls.n lab12_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab12_HAL_RCC_OscConfig: 	ldr	r3, [pc, #432]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #131072	 ;  0x20000
	cmp	r3, #0
	bne.n lab13_HAL_RCC_OscConfig
	b.n lab2_HAL_RCC_OscConfig
lab5_HAL_RCC_OscConfig: 	nop
lab2_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #2
	cmp	r3, #0
	beq.n lab14_HAL_RCC_OscConfig
	ldr	r3, [pc, #404]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #8]
	and.w	r3, r3, #12
	cmp	r3, #0
	beq.n lab15_HAL_RCC_OscConfig
	ldr	r3, [pc, #392]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #8]
	and.w	r3, r3, #12
	cmp	r3, #8
	bne.n lab16_HAL_RCC_OscConfig
	ldr	r3, [pc, #380]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #4]
	and.w	r3, r3, #4194304	 ;  0x400000
	cmp	r3, #0
	bne.n lab16_HAL_RCC_OscConfig
lab15_HAL_RCC_OscConfig: 	ldr	r3, [pc, #368]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #2
	cmp	r3, #0
	beq.n lab17_HAL_RCC_OscConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq.n lab17_HAL_RCC_OscConfig
	movs	r3, #1
	b.n lab1_HAL_RCC_OscConfig
lab17_HAL_RCC_OscConfig: 	ldr	r3, [pc, #344]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	bic.w	r2, r3, #248	 ;  0xf8
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	lsls	r3, r3, #3
	ldr	r1, [pc, #328]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	orrs	r3, r2
	str	r3, [r1, #0]
	b.n lab14_HAL_RCC_OscConfig
lab16_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq.n lab18_HAL_RCC_OscConfig
	ldr	r3, [pc, #316]	 ;  (8082780 <HAL_RCC_OscConfig+0x2b0>)
	movs	r2, #1
	str	r2, [r3, #0]
	bl HAL_GetTick
	str	r0, [r7, #16]
	b.n lab19_HAL_RCC_OscConfig
lab20_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls.n lab19_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab19_HAL_RCC_OscConfig: 	ldr	r3, [pc, #280]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #2
	cmp	r3, #0
	beq.n lab20_HAL_RCC_OscConfig
	ldr	r3, [pc, #268]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	bic.w	r2, r3, #248	 ;  0xf8
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	lsls	r3, r3, #3
	ldr	r1, [pc, #256]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	orrs	r3, r2
	str	r3, [r1, #0]
	b.n lab14_HAL_RCC_OscConfig
lab18_HAL_RCC_OscConfig: 	ldr	r3, [pc, #252]	 ;  (8082780 <HAL_RCC_OscConfig+0x2b0>)
	movs	r2, #0
	str	r2, [r3, #0]
	bl HAL_GetTick
	str	r0, [r7, #16]
	b.n lab21_HAL_RCC_OscConfig
lab22_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls.n lab21_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab21_HAL_RCC_OscConfig: 	ldr	r3, [pc, #216]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #2
	cmp	r3, #0
	bne.n lab22_HAL_RCC_OscConfig
lab14_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #8
	cmp	r3, #0
	beq.n lab23_HAL_RCC_OscConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq.n lab24_HAL_RCC_OscConfig
	ldr	r3, [pc, #192]	 ;  (8082784 <HAL_RCC_OscConfig+0x2b4>)
	movs	r2, #1
	str	r2, [r3, #0]
	bl HAL_GetTick
	str	r0, [r7, #16]
	b.n lab25_HAL_RCC_OscConfig
lab26_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls.n lab25_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab25_HAL_RCC_OscConfig: 	ldr	r3, [pc, #152]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #116]	 ;  0x74
	and.w	r3, r3, #2
	cmp	r3, #0
	beq.n lab26_HAL_RCC_OscConfig
	b.n lab23_HAL_RCC_OscConfig
lab24_HAL_RCC_OscConfig: 	ldr	r3, [pc, #144]	 ;  (8082784 <HAL_RCC_OscConfig+0x2b4>)
	movs	r2, #0
	str	r2, [r3, #0]
	bl HAL_GetTick
	str	r0, [r7, #16]
	b.n lab27_HAL_RCC_OscConfig
lab28_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls.n lab27_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab27_HAL_RCC_OscConfig: 	ldr	r3, [pc, #104]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #116]	 ;  0x74
	and.w	r3, r3, #2
	cmp	r3, #0
	bne.n lab28_HAL_RCC_OscConfig
lab23_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #4
	cmp	r3, #0
	beq.w lab29_HAL_RCC_OscConfig
	movs	r3, #0
	strb	r3, [r7, #23]
	ldr	r3, [pc, #76]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #64]	 ;  0x40
	and.w	r3, r3, #268435456	 ;  0x10000000
	cmp	r3, #0
	bne.n lab30_HAL_RCC_OscConfig
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [pc, #60]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #64]	 ;  0x40
	ldr	r2, [pc, #56]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	orr.w	r3, r3, #268435456	 ;  0x10000000
	str	r3, [r2, #64]	 ;  0x40
	ldr	r3, [pc, #48]	 ;  (808277c <HAL_RCC_OscConfig+0x2ac>)
	ldr	r3, [r3, #64]	 ;  0x40
	and.w	r3, r3, #268435456	 ;  0x10000000
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r3, #1
	strb	r3, [r7, #23]
lab30_HAL_RCC_OscConfig: 	ldr	r3, [pc, #44]	 ;  (8082788 <HAL_RCC_OscConfig+0x2b8>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #256	 ;  0x100
	cmp	r3, #0
	bne.n lab31_HAL_RCC_OscConfig
	ldr	r3, [pc, #32]	 ;  (8082788 <HAL_RCC_OscConfig+0x2b8>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #28]	 ;  (8082788 <HAL_RCC_OscConfig+0x2b8>)
	orr.w	r3, r3, #256	 ;  0x100
	str	r3, [r2, #0]
	bl HAL_GetTick
	str	r0, [r7, #16]
	b.n lab32_HAL_RCC_OscConfig
	nop
	.word	0x40023800
	.word	0x42470000
	.word	0x42470e80
	.word	0x40007000
lab33_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls.n lab32_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab32_HAL_RCC_OscConfig: 	ldr	r3, [pc, #424]	 ;  (8082948 <HAL_RCC_OscConfig+0x478>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #256	 ;  0x100
	cmp	r3, #0
	beq.n lab33_HAL_RCC_OscConfig
lab31_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #1
	bne.n lab34_HAL_RCC_OscConfig
	ldr	r3, [pc, #408]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #112]	 ;  0x70
	ldr	r2, [pc, #404]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	orr.w	r3, r3, #1
	str	r3, [r2, #112]	 ;  0x70
	b.n lab35_HAL_RCC_OscConfig
lab34_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #5
	bne.n lab36_HAL_RCC_OscConfig
	ldr	r3, [pc, #384]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #112]	 ;  0x70
	ldr	r2, [pc, #380]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	orr.w	r3, r3, #4
	str	r3, [r2, #112]	 ;  0x70
	ldr	r3, [pc, #372]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #112]	 ;  0x70
	ldr	r2, [pc, #368]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	orr.w	r3, r3, #1
	str	r3, [r2, #112]	 ;  0x70
	b.n lab35_HAL_RCC_OscConfig
lab36_HAL_RCC_OscConfig: 	ldr	r3, [pc, #360]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #112]	 ;  0x70
	ldr	r2, [pc, #356]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	bic.w	r3, r3, #1
	str	r3, [r2, #112]	 ;  0x70
	ldr	r3, [pc, #348]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #112]	 ;  0x70
	ldr	r2, [pc, #344]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	bic.w	r3, r3, #4
	str	r3, [r2, #112]	 ;  0x70
lab35_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq.n lab37_HAL_RCC_OscConfig
	bl HAL_GetTick
	str	r0, [r7, #16]
	b.n lab38_HAL_RCC_OscConfig
lab39_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	movw	r2, #5000	 ;  0x1388
	cmp	r3, r2
	bls.n lab38_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab38_HAL_RCC_OscConfig: 	ldr	r3, [pc, #296]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #112]	 ;  0x70
	and.w	r3, r3, #2
	cmp	r3, #0
	beq.n lab39_HAL_RCC_OscConfig
	b.n lab40_HAL_RCC_OscConfig
lab37_HAL_RCC_OscConfig: 	bl	HAL_GetTick 
	str	r0, [r7, #16]
	b.n lab41_HAL_RCC_OscConfig
lab42_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	movw	r2, #5000	 ;  0x1388
	cmp	r3, r2
	bls.n lab41_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab41_HAL_RCC_OscConfig: 	ldr	r3, [pc, #252]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #112]	 ;  0x70
	and.w	r3, r3, #2
	cmp	r3, #0
	bne.n lab42_HAL_RCC_OscConfig
lab40_HAL_RCC_OscConfig: 	ldrb	r3, [r7, #23]
	cmp	r3, #1
	bne.n lab29_HAL_RCC_OscConfig
	ldr	r3, [pc, #236]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #64]	 ;  0x40
	ldr	r2, [pc, #232]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	bic.w	r3, r3, #268435456	 ;  0x10000000
	str	r3, [r2, #64]	 ;  0x40
lab29_HAL_RCC_OscConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq.n lab43_HAL_RCC_OscConfig
	ldr	r3, [pc, #216]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #8]
	and.w	r3, r3, #12
	cmp	r3, #8
	beq.n lab44_HAL_RCC_OscConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	cmp	r3, #2
	bne.n lab45_HAL_RCC_OscConfig
	ldr	r3, [pc, #200]	 ;  (8082950 <HAL_RCC_OscConfig+0x480>)
	movs	r2, #0
	str	r2, [r3, #0]
	bl HAL_GetTick
	str	r0, [r7, #16]
	b.n lab46_HAL_RCC_OscConfig
lab47_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls.n lab46_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab46_HAL_RCC_OscConfig: 	ldr	r3, [pc, #164]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #33554432	 ;  0x2000000
	cmp	r3, #0
	bne.n lab47_HAL_RCC_OscConfig
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	lsls	r3, r3, #6
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	lsrs	r3, r3, #1
	subs	r3, #1
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	lsls	r3, r3, #24
	ldr	r1, [pc, #116]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	orrs	r3, r2
	str	r3, [r1, #4]
	ldr	r3, [pc, #112]	 ;  (8082950 <HAL_RCC_OscConfig+0x480>)
	movs	r2, #1
	str	r2, [r3, #0]
	bl HAL_GetTick
	str	r0, [r7, #16]
	b.n lab48_HAL_RCC_OscConfig
lab49_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls.n lab48_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab48_HAL_RCC_OscConfig: 	ldr	r3, [pc, #76]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #33554432	 ;  0x2000000
	cmp	r3, #0
	beq.n lab49_HAL_RCC_OscConfig
	b.n lab43_HAL_RCC_OscConfig
lab45_HAL_RCC_OscConfig: 	ldr	r3, [pc, #68]	 ;  (8082950 <HAL_RCC_OscConfig+0x480>)
	movs	r2, #0
	str	r2, [r3, #0]
	bl HAL_GetTick
	str	r0, [r7, #16]
	b.n lab50_HAL_RCC_OscConfig
lab51_HAL_RCC_OscConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #16]
	subs	r3, r2, r3
	cmp	r3, #2
	bls.n lab50_HAL_RCC_OscConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_OscConfig
lab50_HAL_RCC_OscConfig: 	ldr	r3, [pc, #32]	 ;  (808294c <HAL_RCC_OscConfig+0x47c>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #33554432	 ;  0x2000000
	cmp	r3, #0
	bne.n lab51_HAL_RCC_OscConfig
	b.n lab43_HAL_RCC_OscConfig
lab44_HAL_RCC_OscConfig: 	movs	r3, #1
	b.n lab1_HAL_RCC_OscConfig
lab43_HAL_RCC_OscConfig: 	movs	r3, #0
lab1_HAL_RCC_OscConfig: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #13
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.word	0x40007000
	.word	0x40023800
	.word	0x42470060
HAL_RCC_ClockConfig:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_RCC_ClockConfig
	movs	r3, #1
	b.n lab1_HAL_RCC_ClockConfig
lab0_HAL_RCC_ClockConfig: 	ldr	r3, [pc, #412]	 ;  (8082b08 <HAL_RCC_ClockConfig+0x1b4>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #15
	ldr	r2, [r7, #0]
	cmp	r2, r3
	bls.n lab2_HAL_RCC_ClockConfig
	ldr	r3, [pc, #400]	 ;  (8082b08 <HAL_RCC_ClockConfig+0x1b4>)
	ldr	r2, [r7, #0]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [pc, #392]	 ;  (8082b08 <HAL_RCC_ClockConfig+0x1b4>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #15
	ldr	r2, [r7, #0]
	cmp	r2, r3
	beq.n lab2_HAL_RCC_ClockConfig
	movs	r3, #1
	b.n lab1_HAL_RCC_ClockConfig
lab2_HAL_RCC_ClockConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #2
	cmp	r3, #0
	beq.n lab3_HAL_RCC_ClockConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #4
	cmp	r3, #0
	beq.n lab4_HAL_RCC_ClockConfig
	ldr	r3, [pc, #352]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	ldr	r3, [r3, #8]
	ldr	r2, [pc, #348]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	orr.w	r3, r3, #7168	 ;  0x1c00
	str	r3, [r2, #8]
lab4_HAL_RCC_ClockConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #8
	cmp	r3, #0
	beq.n lab5_HAL_RCC_ClockConfig
	ldr	r3, [pc, #328]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	ldr	r3, [r3, #8]
	ldr	r2, [pc, #324]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	orr.w	r3, r3, #57344	 ;  0xe000
	str	r3, [r2, #8]
lab5_HAL_RCC_ClockConfig: 	ldr	r3, [pc, #316]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	ldr	r3, [r3, #8]
	bic.w	r2, r3, #240	 ;  0xf0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	ldr	r1, [pc, #304]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	orrs	r3, r2
	str	r3, [r1, #8]
lab3_HAL_RCC_ClockConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #1
	cmp	r3, #0
	beq.n lab6_HAL_RCC_ClockConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #1
	bne.n lab7_HAL_RCC_ClockConfig
	ldr	r3, [pc, #280]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #131072	 ;  0x20000
	cmp	r3, #0
	bne.n lab8_HAL_RCC_ClockConfig
	movs	r3, #1
	b.n lab1_HAL_RCC_ClockConfig
lab7_HAL_RCC_ClockConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #2
	beq.n lab9_HAL_RCC_ClockConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #3
	bne.n lab10_HAL_RCC_ClockConfig
lab9_HAL_RCC_ClockConfig: 	ldr	r3, [pc, #248]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #33554432	 ;  0x2000000
	cmp	r3, #0
	bne.n lab8_HAL_RCC_ClockConfig
	movs	r3, #1
	b.n lab1_HAL_RCC_ClockConfig
lab10_HAL_RCC_ClockConfig: 	ldr	r3, [pc, #232]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #2
	cmp	r3, #0
	bne.n lab8_HAL_RCC_ClockConfig
	movs	r3, #1
	b.n lab1_HAL_RCC_ClockConfig
lab8_HAL_RCC_ClockConfig: 	ldr	r3, [pc, #216]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	ldr	r3, [r3, #8]
	bic.w	r2, r3, #3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r1, [pc, #204]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	orrs	r3, r2
	str	r3, [r1, #8]
	bl HAL_GetTick
	str	r0, [r7, #12]
	b.n lab11_HAL_RCC_ClockConfig
lab12_HAL_RCC_ClockConfig: 	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	movw	r2, #5000	 ;  0x1388
	cmp	r3, r2
	bls.n lab11_HAL_RCC_ClockConfig
	movs	r3, #3
	b.n lab1_HAL_RCC_ClockConfig
lab11_HAL_RCC_ClockConfig: 	ldr	r3, [pc, #168]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	ldr	r3, [r3, #8]
	and.w	r2, r3, #12
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	cmp	r2, r3
	bne.n lab12_HAL_RCC_ClockConfig
lab6_HAL_RCC_ClockConfig: 	ldr	r3, [pc, #144]	 ;  (8082b08 <HAL_RCC_ClockConfig+0x1b4>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #15
	ldr	r2, [r7, #0]
	cmp	r2, r3
	bcs.n lab13_HAL_RCC_ClockConfig
	ldr	r3, [pc, #132]	 ;  (8082b08 <HAL_RCC_ClockConfig+0x1b4>)
	ldr	r2, [r7, #0]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [pc, #124]	 ;  (8082b08 <HAL_RCC_ClockConfig+0x1b4>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #15
	ldr	r2, [r7, #0]
	cmp	r2, r3
	beq.n lab13_HAL_RCC_ClockConfig
	movs	r3, #1
	b.n lab1_HAL_RCC_ClockConfig
lab13_HAL_RCC_ClockConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #4
	cmp	r3, #0
	beq.n lab14_HAL_RCC_ClockConfig
	ldr	r3, [pc, #96]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	ldr	r3, [r3, #8]
	bic.w	r2, r3, #7168	 ;  0x1c00
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r1, [pc, #84]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	orrs	r3, r2
	str	r3, [r1, #8]
lab14_HAL_RCC_ClockConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #8
	cmp	r3, #0
	beq.n lab15_HAL_RCC_ClockConfig
	ldr	r3, [pc, #68]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	ldr	r3, [r3, #8]
	bic.w	r2, r3, #57344	 ;  0xe000
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	lsls	r3, r3, #3
	ldr	r1, [pc, #52]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	orrs	r3, r2
	str	r3, [r1, #8]
lab15_HAL_RCC_ClockConfig: 	bl	HAL_RCC_GetSysClockFreq 
	push{r1, r2}
	mov.w r1, #18
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r1, r0
	ldr	r3, [pc, #40]	 ;  (8082b0c <HAL_RCC_ClockConfig+0x1b8>)
	ldr	r3, [r3, #8]
	lsrs	r3, r3, #4
	and.w	r3, r3, #15
	ldr	r2, [pc, #36]	 ;  (8082b10 <HAL_RCC_ClockConfig+0x1bc>)
	ldrb	r3, [r2, r3]
	lsr.w	r3, r1, r3
	ldr	r2, [pc, #32]	 ;  (8082b14 <HAL_RCC_ClockConfig+0x1c0>)
	str	r3, [r2, #0]
	movs	r0, #0
	push {r1, r2}
	mov.w r1, #5
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_InitTick
	push{r1, r2}
	mov.w r1, #5
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r3, #0
lab1_HAL_RCC_ClockConfig: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #15
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.word	0x40023c00
	.word	0x40023800
	.word	0x0808b710
	.word	0x20000000
HAL_RCC_MCOConfig:
	push	{r7, lr}
	sub	sp, #48	 ;  0x30
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne.n lab0_HAL_RCC_MCOConfig
	movs	r3, #0
	str	r3, [r7, #24]
	ldr	r3, [pc, #172]	 ;  (8082bdc <HAL_RCC_MCOConfig+0xc4>)
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #168]	 ;  (8082bdc <HAL_RCC_MCOConfig+0xc4>)
	orr.w	r3, r3, #1
	str	r3, [r2, #48]	 ;  0x30
	ldr	r3, [pc, #160]	 ;  (8082bdc <HAL_RCC_MCOConfig+0xc4>)
	ldr	r3, [r3, #48]	 ;  0x30
	and.w	r3, r3, #1
	str	r3, [r7, #24]
	ldr	r3, [r7, #24]
	mov.w	r3, #256	 ;  0x100
	str	r3, [r7, #28]
	movs	r3, #2
	str	r3, [r7, #32]
	movs	r3, #3
	str	r3, [r7, #40]	 ;  0x28
	movs	r3, #0
	str	r3, [r7, #36]	 ;  0x24
	movs	r3, #0
	str	r3, [r7, #44]	 ;  0x2c
	add.w	r3, r7, #28
	mov	r1, r3
	ldr	r0, [pc, #124]	 ;  (8082be0 <HAL_RCC_MCOConfig+0xc8>)
	bl HAL_GPIO_Init
	ldr	r3, [pc, #112]	 ;  (8082bdc <HAL_RCC_MCOConfig+0xc4>)
	ldr	r3, [r3, #8]
	bic.w	r2, r3, #123731968	 ;  0x7600000
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #4]
	orrs	r3, r1
	ldr	r1, [pc, #100]	 ;  (8082bdc <HAL_RCC_MCOConfig+0xc4>)
	orrs	r3, r2
	str	r3, [r1, #8]
	b.n lab1_HAL_RCC_MCOConfig
lab0_HAL_RCC_MCOConfig: 	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r3, [pc, #88]	 ;  (8082bdc <HAL_RCC_MCOConfig+0xc4>)
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #84]	 ;  (8082bdc <HAL_RCC_MCOConfig+0xc4>)
	orr.w	r3, r3, #4
	str	r3, [r2, #48]	 ;  0x30
	ldr	r3, [pc, #76]	 ;  (8082bdc <HAL_RCC_MCOConfig+0xc4>)
	ldr	r3, [r3, #48]	 ;  0x30
	and.w	r3, r3, #4
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	mov.w	r3, #512	 ;  0x200
	str	r3, [r7, #28]
	movs	r3, #2
	str	r3, [r7, #32]
	movs	r3, #3
	str	r3, [r7, #40]	 ;  0x28
	movs	r3, #0
	str	r3, [r7, #36]	 ;  0x24
	movs	r3, #0
	str	r3, [r7, #44]	 ;  0x2c
	add.w	r3, r7, #28
	mov	r1, r3
	ldr	r0, [pc, #44]	 ;  (8082be4 <HAL_RCC_MCOConfig+0xcc>)
	bl HAL_GPIO_Init
	ldr	r3, [pc, #28]	 ;  (8082bdc <HAL_RCC_MCOConfig+0xc4>)
	ldr	r3, [r3, #8]
	bic.w	r2, r3, #4160749568	 ;  0xf8000000
	ldr	r3, [r7, #4]
	lsls	r1, r3, #3
	ldr	r3, [r7, #8]
	orrs	r3, r1
	ldr	r1, [pc, #12]	 ;  (8082bdc <HAL_RCC_MCOConfig+0xc4>)
	orrs	r3, r2
	str	r3, [r1, #8]
lab1_HAL_RCC_MCOConfig: 	nop
	adds	r7, #48	 ;  0x30
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x40023800
	.word	0x40020000
	.word	0x40020800
HAL_RCC_EnableCSS:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8082bfc <HAL_RCC_EnableCSS+0x14>)
	movs	r2, #1
	str	r2, [r3, #0]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x4247004c
HAL_RCC_DisableCSS:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8082c14 <HAL_RCC_DisableCSS+0x14>)
	movs	r2, #0
	str	r2, [r3, #0]
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x4247004c
HAL_RCC_GetSysClockFreq:
	push	{r4, r5, r6, r7, lr}
	sub	sp, #20
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, [pc, #320]	 ;  (8082d70 <HAL_RCC_GetSysClockFreq+0x158>)
	ldr	r3, [r3, #8]
	and.w	r3, r3, #12
	cmp	r3, #4
	beq.n lab0_HAL_RCC_GetSysClockFreq
	cmp	r3, #8
	beq.n lab1_HAL_RCC_GetSysClockFreq
	cmp	r3, #0
	bne.w lab2_HAL_RCC_GetSysClockFreq
	ldr	r3, [pc, #300]	 ;  (8082d74 <HAL_RCC_GetSysClockFreq+0x15c>)
	str	r3, [r7, #8]
	b.n lab3_HAL_RCC_GetSysClockFreq
lab0_HAL_RCC_GetSysClockFreq: 	ldr	r3, [pc, #300]	 ;  (8082d78 <HAL_RCC_GetSysClockFreq+0x160>)
	str	r3, [r7, #8]
	b.n lab3_HAL_RCC_GetSysClockFreq
lab1_HAL_RCC_GetSysClockFreq: 	ldr	r3, [pc, #284]	 ;  (8082d70 <HAL_RCC_GetSysClockFreq+0x158>)
	ldr	r3, [r3, #4]
	and.w	r3, r3, #63	 ;  0x3f
	str	r3, [r7, #4]
	ldr	r3, [pc, #276]	 ;  (8082d70 <HAL_RCC_GetSysClockFreq+0x158>)
	ldr	r3, [r3, #4]
	and.w	r3, r3, #4194304	 ;  0x400000
	cmp	r3, #0
	beq.n lab4_HAL_RCC_GetSysClockFreq
	ldr	r3, [pc, #264]	 ;  (8082d70 <HAL_RCC_GetSysClockFreq+0x158>)
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #6
	mov.w	r4, #0
	movw	r1, #511	 ;  0x1ff
	mov.w	r2, #0
	and.w	r5, r3, r1
	and.w	r6, r4, r2
	ldr	r2, [pc, #244]	 ;  (8082d78 <HAL_RCC_GetSysClockFreq+0x160>)
	mul.w	r1, r2, r6
	movs	r2, #0
	mul.w	r2, r2, r5
	add	r2, r1
	ldr	r1, [pc, #232]	 ;  (8082d78 <HAL_RCC_GetSysClockFreq+0x160>)
	umull	r0, r1, r5, r1
	adds	r3, r2, r1
	mov	r1, r3
	ldr	r3, [r7, #4]
	mov.w	r4, #0
	mov	r2, r3
	mov	r3, r4
	push {r1, r2}
	mov.w r1, #19
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl __aeabi_uldivmod
	push{r1, r2}
	mov.w r1, #19
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r4, r1
	str	r3, [r7, #12]
	b.n lab5_HAL_RCC_GetSysClockFreq
lab4_HAL_RCC_GetSysClockFreq: 	ldr	r3, [pc, #192]	 ;  (8082d70 <HAL_RCC_GetSysClockFreq+0x158>)
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #6
	mov.w	r4, #0
	movw	r1, #511	 ;  0x1ff
	mov.w	r2, #0
	and.w	r5, r3, r1
	and.w	r6, r4, r2
	mov	r1, r5
	mov	r2, r6
	mov.w	r3, #0
	mov.w	r4, #0
	lsls	r4, r2, #5
	orr.w	r4, r4, r1, lsr #27
	lsls	r3, r1, #5
	mov	r1, r3
	mov	r2, r4
	subs	r1, r1, r5
	sbc.w	r2, r2, r6
	mov.w	r3, #0
	mov.w	r4, #0
	lsls	r4, r2, #6
	orr.w	r4, r4, r1, lsr #26
	lsls	r3, r1, #6
	subs	r3, r3, r1
	sbc.w	r4, r4, r2
	mov.w	r1, #0
	mov.w	r2, #0
	lsls	r2, r4, #3
	orr.w	r2, r2, r3, lsr #29
	lsls	r1, r3, #3
	mov	r3, r1
	mov	r4, r2
	adds	r3, r3, r5
	adc.w	r4, r4, r6
	mov.w	r1, #0
	mov.w	r2, #0
	lsls	r2, r4, #10
	orr.w	r2, r2, r3, lsr #22
	lsls	r1, r3, #10
	mov	r3, r1
	mov	r4, r2
	mov	r0, r3
	mov	r1, r4
	ldr	r3, [r7, #4]
	mov.w	r4, #0
	mov	r2, r3
	mov	r3, r4
	push {r1, r2}
	mov.w r1, #19
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl __aeabi_uldivmod
	push{r1, r2}
	mov.w r1, #19
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r4, r1
	str	r3, [r7, #12]
lab5_HAL_RCC_GetSysClockFreq: 	ldr	r3, [pc, #44]	 ;  (8082d70 <HAL_RCC_GetSysClockFreq+0x158>)
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #16
	and.w	r3, r3, #3
	adds	r3, #1
	lsls	r3, r3, #1
	str	r3, [r7, #0]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #0]
	udiv	r3, r2, r3
	str	r3, [r7, #8]
	b.n lab3_HAL_RCC_GetSysClockFreq
lab2_HAL_RCC_GetSysClockFreq: 	ldr	r3, [pc, #20]	 ;  (8082d74 <HAL_RCC_GetSysClockFreq+0x15c>)
	str	r3, [r7, #8]
	nop
lab3_HAL_RCC_GetSysClockFreq: 	ldr	r3, [r7, #8]
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #17
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, r5, r6, r7, pc}
	nop
	.word	0x40023800
	.word	0x00f42400
	.word	0x017d7840
HAL_RCC_GetHCLKFreq:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (8082d90 <HAL_RCC_GetHCLKFreq+0x14>)
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x20000000
HAL_RCC_GetPCLK1Freq:
	push	{r7, lr}
	add	r7, sp, #0
	bl HAL_RCC_GetHCLKFreq
	mov	r1, r0
	ldr	r3, [pc, #20]	 ;  (8082db4 <HAL_RCC_GetPCLK1Freq+0x20>)
	ldr	r3, [r3, #8]
	lsrs	r3, r3, #10
	and.w	r3, r3, #7
	ldr	r2, [pc, #12]	 ;  (8082db8 <HAL_RCC_GetPCLK1Freq+0x24>)
	ldrb	r3, [r2, r3]
	lsr.w	r3, r1, r3
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
	pop	{r7, pc}
	.word	0x40023800
	.word	0x0808b720
HAL_RCC_GetPCLK2Freq:
	push	{r7, lr}
	add	r7, sp, #0
	bl HAL_RCC_GetHCLKFreq
	mov	r1, r0
	ldr	r3, [pc, #20]	 ;  (8082ddc <HAL_RCC_GetPCLK2Freq+0x20>)
	ldr	r3, [r3, #8]
	lsrs	r3, r3, #13
	and.w	r3, r3, #7
	ldr	r2, [pc, #12]	 ;  (8082de0 <HAL_RCC_GetPCLK2Freq+0x24>)
	ldrb	r3, [r2, r3]
	lsr.w	r3, r1, r3
	mov	r0, r3
	cpsid f
	push {r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
	pop	{r7, pc}
	.word	0x40023800
	.word	0x0808b720
HAL_RCC_GetOscConfig:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #15
	str	r2, [r3, #0]
	ldr	r3, [pc, #276]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #262144	 ;  0x40000
	cmp.w	r3, #262144	 ;  0x40000
	bne.n lab0_HAL_RCC_GetOscConfig
	ldr	r3, [r7, #4]
	mov.w	r2, #327680	 ;  0x50000
	str	r2, [r3, #4]
	b.n lab1_HAL_RCC_GetOscConfig
lab0_HAL_RCC_GetOscConfig: 	ldr	r3, [pc, #252]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #65536	 ;  0x10000
	cmp.w	r3, #65536	 ;  0x10000
	bne.n lab2_HAL_RCC_GetOscConfig
	ldr	r3, [r7, #4]
	mov.w	r2, #65536	 ;  0x10000
	str	r2, [r3, #4]
	b.n lab1_HAL_RCC_GetOscConfig
lab2_HAL_RCC_GetOscConfig: 	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #4]
lab1_HAL_RCC_GetOscConfig: 	ldr	r3, [pc, #220]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #1
	cmp	r3, #1
	bne.n lab3_HAL_RCC_GetOscConfig
	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3, #12]
	b.n lab4_HAL_RCC_GetOscConfig
lab3_HAL_RCC_GetOscConfig: 	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #12]
lab4_HAL_RCC_GetOscConfig: 	ldr	r3, [pc, #196]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #0]
	lsrs	r3, r3, #3
	and.w	r2, r3, #31
	ldr	r3, [r7, #4]
	str	r2, [r3, #16]
	ldr	r3, [pc, #180]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #112]	 ;  0x70
	and.w	r3, r3, #4
	cmp	r3, #4
	bne.n lab5_HAL_RCC_GetOscConfig
	ldr	r3, [r7, #4]
	movs	r2, #5
	str	r2, [r3, #8]
	b.n lab6_HAL_RCC_GetOscConfig
lab5_HAL_RCC_GetOscConfig: 	ldr	r3, [pc, #160]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #112]	 ;  0x70
	and.w	r3, r3, #1
	cmp	r3, #1
	bne.n lab7_HAL_RCC_GetOscConfig
	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3, #8]
	b.n lab6_HAL_RCC_GetOscConfig
lab7_HAL_RCC_GetOscConfig: 	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
lab6_HAL_RCC_GetOscConfig: 	ldr	r3, [pc, #136]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #116]	 ;  0x74
	and.w	r3, r3, #1
	cmp	r3, #1
	bne.n lab8_HAL_RCC_GetOscConfig
	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3, #20]
	b.n lab9_HAL_RCC_GetOscConfig
lab8_HAL_RCC_GetOscConfig: 	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #20]
lab9_HAL_RCC_GetOscConfig: 	ldr	r3, [pc, #108]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #16777216	 ;  0x1000000
	cmp.w	r3, #16777216	 ;  0x1000000
	bne.n lab10_HAL_RCC_GetOscConfig
	ldr	r3, [r7, #4]
	movs	r2, #2
	str	r2, [r3, #24]
	b.n lab11_HAL_RCC_GetOscConfig
lab10_HAL_RCC_GetOscConfig: 	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3, #24]
lab11_HAL_RCC_GetOscConfig: 	ldr	r3, [pc, #80]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #4]
	and.w	r2, r3, #4194304	 ;  0x400000
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	ldr	r3, [pc, #68]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #4]
	and.w	r2, r3, #63	 ;  0x3f
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	ldr	r3, [pc, #56]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #6
	ubfx	r2, r3, #0, #9
	ldr	r3, [r7, #4]
	str	r2, [r3, #36]	 ;  0x24
	ldr	r3, [pc, #44]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #4]
	and.w	r3, r3, #196608	 ;  0x30000
	add.w	r3, r3, #65536	 ;  0x10000
	lsls	r3, r3, #1
	lsrs	r2, r3, #16
	ldr	r3, [r7, #4]
	str	r2, [r3, #40]	 ;  0x28
	ldr	r3, [pc, #24]	 ;  (8082f08 <HAL_RCC_GetOscConfig+0x124>)
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #24
	and.w	r2, r3, #15
	ldr	r3, [r7, #4]
	str	r2, [r3, #44]	 ;  0x2c
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x40023800
HAL_RCC_GetClockConfig:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	movs	r2, #15
	str	r2, [r3, #0]
	ldr	r3, [pc, #72]	 ;  (8082f68 <HAL_RCC_GetClockConfig+0x5c>)
	ldr	r3, [r3, #8]
	and.w	r2, r3, #3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	ldr	r3, [pc, #60]	 ;  (8082f68 <HAL_RCC_GetClockConfig+0x5c>)
	ldr	r3, [r3, #8]
	and.w	r2, r3, #240	 ;  0xf0
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	ldr	r3, [pc, #48]	 ;  (8082f68 <HAL_RCC_GetClockConfig+0x5c>)
	ldr	r3, [r3, #8]
	and.w	r2, r3, #7168	 ;  0x1c00
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	ldr	r3, [pc, #36]	 ;  (8082f68 <HAL_RCC_GetClockConfig+0x5c>)
	ldr	r3, [r3, #8]
	lsrs	r3, r3, #3
	and.w	r2, r3, #7168	 ;  0x1c00
	ldr	r3, [r7, #4]
	str	r2, [r3, #16]
	ldr	r3, [pc, #28]	 ;  (8082f6c <HAL_RCC_GetClockConfig+0x60>)
	ldr	r3, [r3, #0]
	and.w	r2, r3, #15
	ldr	r3, [r7, #0]
	str	r2, [r3, #0]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x40023800
	.word	0x40023c00
HAL_RCC_NMI_IRQHandler:
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, [pc, #24]	 ;  (8082f90 <HAL_RCC_NMI_IRQHandler+0x20>)
	ldr	r3, [r3, #12]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #128	 ;  0x80
	bne.n lab0_HAL_RCC_NMI_IRQHandler
	bl HAL_RCC_CSSCallback
	ldr	r3, [pc, #12]	 ;  (8082f94 <HAL_RCC_NMI_IRQHandler+0x24>)
	movs	r2, #128	 ;  0x80
	strb	r2, [r3, #0]
lab0_HAL_RCC_NMI_IRQHandler: 	nop
	pop	{r7, pc}
	nop
	.word	0x40023800
	.word	0x4002380e
HAL_RCC_CSSCallback:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
HAL_TIM_Base_Init:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Base_Init
	movs	r3, #1
	b.n lab1_HAL_TIM_Base_Init
lab0_HAL_TIM_Base_Init: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #0
	bne.n lab2_HAL_TIM_Base_Init
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r0, [r7, #4]
	bl HAL_TIM_Base_MspInit
	push{r1, r2}
	mov.w r1, #80
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
lab2_HAL_TIM_Base_Init: 	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #4
	mov	r1, r3
	mov	r0, r2
	bl TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
lab1_HAL_TIM_Base_Init: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #77
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
HAL_TIM_Base_DeInit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Base_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Base_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_Base_DeInit: 	ldr	r0, [r7, #4]
	bl HAL_TIM_Base_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_Base_Start:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab0_HAL_TIM_Base_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_Base_Start: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_Base_Stop:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Base_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Base_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_Base_Stop: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_Base_Start_IT:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab0_HAL_TIM_Base_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_Base_Start_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_Base_Stop_IT:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Base_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Base_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_Base_Stop_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_Base_Start_DMA:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #2
	bne.n lab0_HAL_TIM_Base_Start_DMA
	movs	r3, #2
	b.n lab1_HAL_TIM_Base_Start_DMA
lab0_HAL_TIM_Base_Start_DMA: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_TIM_Base_Start_DMA
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne.n lab3_HAL_TIM_Base_Start_DMA
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	beq.n lab3_HAL_TIM_Base_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_Base_Start_DMA
lab3_HAL_TIM_Base_Start_DMA: 	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
lab2_HAL_TIM_Base_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, [pc, #108]	 ;  (8083278 <HAL_TIM_Base_Start_DMA+0xb6>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, [pc, #104]	 ;  (808327c <HAL_TIM_Base_Start_DMA+0xba>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, [pc, #100]	 ;  (8083280 <HAL_TIM_Base_Start_DMA+0xbe>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #32]
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #44	 ;  0x2c
	mov	r2, r3
	ldrh	r3, [r7, #6]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab4_HAL_TIM_Base_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_Base_Start_DMA
lab4_HAL_TIM_Base_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #256	 ;  0x100
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq.n lab5_HAL_TIM_Base_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab5_HAL_TIM_Base_Start_DMA: 	movs	r3, #0
lab1_HAL_TIM_Base_Start_DMA: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08086955
	.word	0x08086979
	.word	0x08086771
HAL_TIM_Base_Stop_DMA:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #256	 ;  0x100
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Base_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Base_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_Base_Stop_DMA: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_OC_Init:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_TIM_OC_Init
	movs	r3, #1
	b.n lab1_HAL_TIM_OC_Init
lab0_HAL_TIM_OC_Init: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #0
	bne.n lab2_HAL_TIM_OC_Init
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r0, [r7, #4]
	bl HAL_TIM_OC_MspInit
lab2_HAL_TIM_OC_Init: 	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #4
	mov	r1, r3
	mov	r0, r2
	bl TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
lab1_HAL_TIM_OC_Init: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_OC_DeInit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_OC_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_OC_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_OC_DeInit: 	ldr	r0, [r7, #4]
	bl HAL_TIM_OC_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_OC_MspInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_OC_MspDeInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_OC_Start:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #84]	 ;  (8083438 <HAL_TIM_OC_Start+0x72>)
	cmp	r3, r2
	beq.n lab0_HAL_TIM_OC_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #76]	 ;  (808343c <HAL_TIM_OC_Start+0x76>)
	cmp	r3, r2
	bne.n lab1_HAL_TIM_OC_Start
lab0_HAL_TIM_OC_Start: 	movs	r3, #1
	b.n lab2_HAL_TIM_OC_Start
lab1_HAL_TIM_OC_Start: 	movs	r3, #0
lab2_HAL_TIM_OC_Start: 	cmp	r3, #0
	beq.n lab3_HAL_TIM_OC_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab3_HAL_TIM_OC_Start: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab4_HAL_TIM_OC_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab4_HAL_TIM_OC_Start: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
	.word	0x40010000
	.word	0x40010400
HAL_TIM_OC_Stop:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #128]	 ;  (80834e0 <HAL_TIM_OC_Stop+0xa0>)
	cmp	r3, r2
	beq.n lab0_HAL_TIM_OC_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #124]	 ;  (80834e4 <HAL_TIM_OC_Stop+0xa4>)
	cmp	r3, r2
	bne.n lab1_HAL_TIM_OC_Stop
lab0_HAL_TIM_OC_Stop: 	movs	r3, #1
	b.n lab2_HAL_TIM_OC_Stop
lab1_HAL_TIM_OC_Stop: 	movs	r3, #0
lab2_HAL_TIM_OC_Stop: 	cmp	r3, #0
	beq.n lab3_HAL_TIM_OC_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_OC_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_OC_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab3_HAL_TIM_OC_Stop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIM_OC_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIM_OC_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab4_HAL_TIM_OC_Stop: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.word	0x40010000
	.word	0x40010400
HAL_TIM_OC_Start_IT:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #12
	bhi.n lab0_HAL_TIM_OC_Start_IT
	add	r2, pc, #4	 ;  (adr r2, 8083500 <HAL_TIM_OC_Start_IT+0x18>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x08083535
	.word	0x0808357d
	.word	0x0808357d
	.word	0x0808357d
	.word	0x08083547
	.word	0x0808357d
	.word	0x0808357d
	.word	0x0808357d
	.word	0x08083559
	.word	0x0808357d
	.word	0x0808357d
	.word	0x0808357d
	.word	0x0808356b
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_OC_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_OC_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_OC_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #16
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_OC_Start_IT
lab0_HAL_TIM_OC_Start_IT: 	nop
lab1_HAL_TIM_OC_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #84]	 ;  (80835e8 <HAL_TIM_OC_Start_IT+0x100>)
	cmp	r3, r2
	beq.n lab2_HAL_TIM_OC_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #80]	 ;  (80835ec <HAL_TIM_OC_Start_IT+0x104>)
	cmp	r3, r2
	bne.n lab3_HAL_TIM_OC_Start_IT
lab2_HAL_TIM_OC_Start_IT: 	movs	r3, #1
	b.n lab4_HAL_TIM_OC_Start_IT
lab3_HAL_TIM_OC_Start_IT: 	movs	r3, #0
lab4_HAL_TIM_OC_Start_IT: 	cmp	r3, #0
	beq.n lab5_HAL_TIM_OC_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab5_HAL_TIM_OC_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab6_HAL_TIM_OC_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab6_HAL_TIM_OC_Start_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x40010000
	.word	0x40010400
HAL_TIM_OC_Stop_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #12
	bhi.n lab0_HAL_TIM_OC_Stop_IT
	add	r2, pc, #4	 ;  (adr r2, 8083608 <HAL_TIM_OC_Stop_IT+0x18>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x0808363d
	.word	0x08083685
	.word	0x08083685
	.word	0x08083685
	.word	0x0808364f
	.word	0x08083685
	.word	0x08083685
	.word	0x08083685
	.word	0x08083661
	.word	0x08083685
	.word	0x08083685
	.word	0x08083685
	.word	0x08083673
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_OC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_OC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_OC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #16
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_OC_Stop_IT
lab0_HAL_TIM_OC_Stop_IT: 	nop
lab1_HAL_TIM_OC_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #128]	 ;  (808371c <HAL_TIM_OC_Stop_IT+0x12c>)
	cmp	r3, r2
	beq.n lab2_HAL_TIM_OC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #124]	 ;  (8083720 <HAL_TIM_OC_Stop_IT+0x130>)
	cmp	r3, r2
	bne.n lab3_HAL_TIM_OC_Stop_IT
lab2_HAL_TIM_OC_Stop_IT: 	movs	r3, #1
	b.n lab4_HAL_TIM_OC_Stop_IT
lab3_HAL_TIM_OC_Stop_IT: 	movs	r3, #0
lab4_HAL_TIM_OC_Stop_IT: 	cmp	r3, #0
	beq.n lab5_HAL_TIM_OC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIM_OC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIM_OC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab5_HAL_TIM_OC_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIM_OC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIM_OC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab6_HAL_TIM_OC_Stop_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.word	0x40010000
	.word	0x40010400
HAL_TIM_OC_Start_DMA:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strh	r3, [r7, #2]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #2
	bne.n lab0_HAL_TIM_OC_Start_DMA
	movs	r3, #2
	b.n lab1_HAL_TIM_OC_Start_DMA
lab0_HAL_TIM_OC_Start_DMA: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_TIM_OC_Start_DMA
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab3_HAL_TIM_OC_Start_DMA
	ldrh	r3, [r7, #2]
	cmp	r3, #0
	beq.n lab3_HAL_TIM_OC_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_OC_Start_DMA
lab3_HAL_TIM_OC_Start_DMA: 	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
lab2_HAL_TIM_OC_Start_DMA: 	ldr	r3, [r7, #8]
	cmp	r3, #12
	bhi.w lab4_HAL_TIM_OC_Start_DMA
	add	r2, pc, #4	 ;  (adr r2, 8083774 <HAL_TIM_OC_Start_DMA+0x50>)
	ldr.w	pc, [r2, r3, lsl #2]
	.word	0x080837a9
	.word	0x080838c9
	.word	0x080838c9
	.word	0x080838c9
	.word	0x080837f1
	.word	0x080838c9
	.word	0x080838c9
	.word	0x080838c9
	.word	0x08083839
	.word	0x080838c9
	.word	0x080838c9
	.word	0x080838c9
	.word	0x08083881
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #388]	 ;  (8083934 <HAL_TIM_OC_Start_DMA+0x210>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #384]	 ;  (8083938 <HAL_TIM_OC_Start_DMA+0x214>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #380]	 ;  (808393c <HAL_TIM_OC_Start_DMA+0x218>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]	 ;  0x24
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #52	 ;  0x34
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab5_HAL_TIM_OC_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_OC_Start_DMA
lab5_HAL_TIM_OC_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_OC_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #316]	 ;  (8083934 <HAL_TIM_OC_Start_DMA+0x210>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #312]	 ;  (8083938 <HAL_TIM_OC_Start_DMA+0x214>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #308]	 ;  (808393c <HAL_TIM_OC_Start_DMA+0x218>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]	 ;  0x28
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #56	 ;  0x38
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab7_HAL_TIM_OC_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_OC_Start_DMA
lab7_HAL_TIM_OC_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_OC_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #244]	 ;  (8083934 <HAL_TIM_OC_Start_DMA+0x210>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #240]	 ;  (8083938 <HAL_TIM_OC_Start_DMA+0x214>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #236]	 ;  (808393c <HAL_TIM_OC_Start_DMA+0x218>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]	 ;  0x2c
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #60	 ;  0x3c
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab8_HAL_TIM_OC_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_OC_Start_DMA
lab8_HAL_TIM_OC_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_OC_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #172]	 ;  (8083934 <HAL_TIM_OC_Start_DMA+0x210>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #168]	 ;  (8083938 <HAL_TIM_OC_Start_DMA+0x214>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #164]	 ;  (808393c <HAL_TIM_OC_Start_DMA+0x218>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]	 ;  0x30
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #64	 ;  0x40
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab9_HAL_TIM_OC_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_OC_Start_DMA
lab9_HAL_TIM_OC_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4096	 ;  0x1000
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_OC_Start_DMA
lab4_HAL_TIM_OC_Start_DMA: 	nop
lab6_HAL_TIM_OC_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	movs	r2, #1
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #96]	 ;  (8083940 <HAL_TIM_OC_Start_DMA+0x21c>)
	cmp	r3, r2
	beq.n lab10_HAL_TIM_OC_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #92]	 ;  (8083944 <HAL_TIM_OC_Start_DMA+0x220>)
	cmp	r3, r2
	bne.n lab11_HAL_TIM_OC_Start_DMA
lab10_HAL_TIM_OC_Start_DMA: 	movs	r3, #1
	b.n lab12_HAL_TIM_OC_Start_DMA
lab11_HAL_TIM_OC_Start_DMA: 	movs	r3, #0
lab12_HAL_TIM_OC_Start_DMA: 	cmp	r3, #0
	beq.n lab13_HAL_TIM_OC_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab13_HAL_TIM_OC_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq.n lab14_HAL_TIM_OC_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab14_HAL_TIM_OC_Start_DMA: 	movs	r3, #0
lab1_HAL_TIM_OC_Start_DMA: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08086795
	.word	0x08086805
	.word	0x08086771
	.word	0x40010000
	.word	0x40010400
HAL_TIM_OC_Stop_DMA:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #12
	bhi.n lab0_HAL_TIM_OC_Stop_DMA
	add	r2, pc, #4	 ;  (adr r2, 8083960 <HAL_TIM_OC_Stop_DMA+0x18>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x08083995
	.word	0x08083a05
	.word	0x08083a05
	.word	0x08083a05
	.word	0x080839b1
	.word	0x08083a05
	.word	0x08083a05
	.word	0x08083a05
	.word	0x080839cd
	.word	0x08083a05
	.word	0x08083a05
	.word	0x08083a05
	.word	0x080839e9
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_OC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_OC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_OC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4096	 ;  0x1000
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_OC_Stop_DMA
lab0_HAL_TIM_OC_Stop_DMA: 	nop
lab1_HAL_TIM_OC_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #136]	 ;  (8083aa4 <HAL_TIM_OC_Stop_DMA+0x15c>)
	cmp	r3, r2
	beq.n lab2_HAL_TIM_OC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #132]	 ;  (8083aa8 <HAL_TIM_OC_Stop_DMA+0x160>)
	cmp	r3, r2
	bne.n lab3_HAL_TIM_OC_Stop_DMA
lab2_HAL_TIM_OC_Stop_DMA: 	movs	r3, #1
	b.n lab4_HAL_TIM_OC_Stop_DMA
lab3_HAL_TIM_OC_Stop_DMA: 	movs	r3, #0
lab4_HAL_TIM_OC_Stop_DMA: 	cmp	r3, #0
	beq.n lab5_HAL_TIM_OC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIM_OC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIM_OC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab5_HAL_TIM_OC_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIM_OC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIM_OC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab6_HAL_TIM_OC_Stop_DMA: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.word	0x40010000
	.word	0x40010400
HAL_TIM_PWM_Init:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_TIM_PWM_Init
	movs	r3, #1
	b.n lab1_HAL_TIM_PWM_Init
lab0_HAL_TIM_PWM_Init: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #0
	bne.n lab2_HAL_TIM_PWM_Init
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r0, [r7, #4]
	bl HAL_TIM_PWM_MspInit
lab2_HAL_TIM_PWM_Init: 	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #4
	mov	r1, r3
	mov	r0, r2
	bl TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
lab1_HAL_TIM_PWM_Init: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_PWM_DeInit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_PWM_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_PWM_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_PWM_DeInit: 	ldr	r0, [r7, #4]
	bl HAL_TIM_PWM_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_PWM_MspInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_PWM_MspDeInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_PWM_Start:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #84]	 ;  (8083bfc <HAL_TIM_PWM_Start+0x72>)
	cmp	r3, r2
	beq.n lab0_HAL_TIM_PWM_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #76]	 ;  (8083c00 <HAL_TIM_PWM_Start+0x76>)
	cmp	r3, r2
	bne.n lab1_HAL_TIM_PWM_Start
lab0_HAL_TIM_PWM_Start: 	movs	r3, #1
	b.n lab2_HAL_TIM_PWM_Start
lab1_HAL_TIM_PWM_Start: 	movs	r3, #0
lab2_HAL_TIM_PWM_Start: 	cmp	r3, #0
	beq.n lab3_HAL_TIM_PWM_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab3_HAL_TIM_PWM_Start: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab4_HAL_TIM_PWM_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab4_HAL_TIM_PWM_Start: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
	.word	0x40010000
	.word	0x40010400
HAL_TIM_PWM_Stop:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #136]	 ;  (8083cac <HAL_TIM_PWM_Stop+0xa8>)
	cmp	r3, r2
	beq.n lab0_HAL_TIM_PWM_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #132]	 ;  (8083cb0 <HAL_TIM_PWM_Stop+0xac>)
	cmp	r3, r2
	bne.n lab1_HAL_TIM_PWM_Stop
lab0_HAL_TIM_PWM_Stop: 	movs	r3, #1
	b.n lab2_HAL_TIM_PWM_Stop
lab1_HAL_TIM_PWM_Stop: 	movs	r3, #0
lab2_HAL_TIM_PWM_Stop: 	cmp	r3, #0
	beq.n lab3_HAL_TIM_PWM_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_PWM_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_PWM_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab3_HAL_TIM_PWM_Stop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIM_PWM_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIM_PWM_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab4_HAL_TIM_PWM_Stop: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.word	0x40010000
	.word	0x40010400
HAL_TIM_PWM_Start_IT:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #12
	bhi.n lab0_HAL_TIM_PWM_Start_IT
	add	r2, pc, #4	 ;  (adr r2, 8083ccc <HAL_TIM_PWM_Start_IT+0x18>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x08083d01
	.word	0x08083d49
	.word	0x08083d49
	.word	0x08083d49
	.word	0x08083d13
	.word	0x08083d49
	.word	0x08083d49
	.word	0x08083d49
	.word	0x08083d25
	.word	0x08083d49
	.word	0x08083d49
	.word	0x08083d49
	.word	0x08083d37
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_PWM_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_PWM_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_PWM_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #16
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_PWM_Start_IT
lab0_HAL_TIM_PWM_Start_IT: 	nop
lab1_HAL_TIM_PWM_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #84]	 ;  (8083db4 <HAL_TIM_PWM_Start_IT+0x100>)
	cmp	r3, r2
	beq.n lab2_HAL_TIM_PWM_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #80]	 ;  (8083db8 <HAL_TIM_PWM_Start_IT+0x104>)
	cmp	r3, r2
	bne.n lab3_HAL_TIM_PWM_Start_IT
lab2_HAL_TIM_PWM_Start_IT: 	movs	r3, #1
	b.n lab4_HAL_TIM_PWM_Start_IT
lab3_HAL_TIM_PWM_Start_IT: 	movs	r3, #0
lab4_HAL_TIM_PWM_Start_IT: 	cmp	r3, #0
	beq.n lab5_HAL_TIM_PWM_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab5_HAL_TIM_PWM_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab6_HAL_TIM_PWM_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab6_HAL_TIM_PWM_Start_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x40010000
	.word	0x40010400
HAL_TIM_PWM_Stop_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #12
	bhi.n lab0_HAL_TIM_PWM_Stop_IT
	add	r2, pc, #4	 ;  (adr r2, 8083dd4 <HAL_TIM_PWM_Stop_IT+0x18>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x08083e09
	.word	0x08083e51
	.word	0x08083e51
	.word	0x08083e51
	.word	0x08083e1b
	.word	0x08083e51
	.word	0x08083e51
	.word	0x08083e51
	.word	0x08083e2d
	.word	0x08083e51
	.word	0x08083e51
	.word	0x08083e51
	.word	0x08083e3f
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_PWM_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_PWM_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_PWM_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #16
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_PWM_Stop_IT
lab0_HAL_TIM_PWM_Stop_IT: 	nop
lab1_HAL_TIM_PWM_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #128]	 ;  (8083ee8 <HAL_TIM_PWM_Stop_IT+0x12c>)
	cmp	r3, r2
	beq.n lab2_HAL_TIM_PWM_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #124]	 ;  (8083eec <HAL_TIM_PWM_Stop_IT+0x130>)
	cmp	r3, r2
	bne.n lab3_HAL_TIM_PWM_Stop_IT
lab2_HAL_TIM_PWM_Stop_IT: 	movs	r3, #1
	b.n lab4_HAL_TIM_PWM_Stop_IT
lab3_HAL_TIM_PWM_Stop_IT: 	movs	r3, #0
lab4_HAL_TIM_PWM_Stop_IT: 	cmp	r3, #0
	beq.n lab5_HAL_TIM_PWM_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIM_PWM_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIM_PWM_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab5_HAL_TIM_PWM_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIM_PWM_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIM_PWM_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab6_HAL_TIM_PWM_Stop_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.word	0x40010000
	.word	0x40010400
HAL_TIM_PWM_Start_DMA:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strh	r3, [r7, #2]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #2
	bne.n lab0_HAL_TIM_PWM_Start_DMA
	movs	r3, #2
	b.n lab1_HAL_TIM_PWM_Start_DMA
lab0_HAL_TIM_PWM_Start_DMA: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_TIM_PWM_Start_DMA
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab3_HAL_TIM_PWM_Start_DMA
	ldrh	r3, [r7, #2]
	cmp	r3, #0
	beq.n lab3_HAL_TIM_PWM_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_PWM_Start_DMA
lab3_HAL_TIM_PWM_Start_DMA: 	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
lab2_HAL_TIM_PWM_Start_DMA: 	ldr	r3, [r7, #8]
	cmp	r3, #12
	bhi.w lab4_HAL_TIM_PWM_Start_DMA
	add	r2, pc, #4	 ;  (adr r2, 8083f40 <HAL_TIM_PWM_Start_DMA+0x50>)
	ldr.w	pc, [r2, r3, lsl #2]
	.word	0x08083f75
	.word	0x08084095
	.word	0x08084095
	.word	0x08084095
	.word	0x08083fbd
	.word	0x08084095
	.word	0x08084095
	.word	0x08084095
	.word	0x08084005
	.word	0x08084095
	.word	0x08084095
	.word	0x08084095
	.word	0x0808404d
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #388]	 ;  (8084100 <HAL_TIM_PWM_Start_DMA+0x210>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #384]	 ;  (8084104 <HAL_TIM_PWM_Start_DMA+0x214>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #380]	 ;  (8084108 <HAL_TIM_PWM_Start_DMA+0x218>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]	 ;  0x24
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #52	 ;  0x34
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab5_HAL_TIM_PWM_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_PWM_Start_DMA
lab5_HAL_TIM_PWM_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_PWM_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #316]	 ;  (8084100 <HAL_TIM_PWM_Start_DMA+0x210>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #312]	 ;  (8084104 <HAL_TIM_PWM_Start_DMA+0x214>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #308]	 ;  (8084108 <HAL_TIM_PWM_Start_DMA+0x218>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]	 ;  0x28
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #56	 ;  0x38
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab7_HAL_TIM_PWM_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_PWM_Start_DMA
lab7_HAL_TIM_PWM_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_PWM_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #244]	 ;  (8084100 <HAL_TIM_PWM_Start_DMA+0x210>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #240]	 ;  (8084104 <HAL_TIM_PWM_Start_DMA+0x214>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #236]	 ;  (8084108 <HAL_TIM_PWM_Start_DMA+0x218>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]	 ;  0x2c
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #60	 ;  0x3c
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab8_HAL_TIM_PWM_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_PWM_Start_DMA
lab8_HAL_TIM_PWM_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_PWM_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #172]	 ;  (8084100 <HAL_TIM_PWM_Start_DMA+0x210>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #168]	 ;  (8084104 <HAL_TIM_PWM_Start_DMA+0x214>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #164]	 ;  (8084108 <HAL_TIM_PWM_Start_DMA+0x218>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]	 ;  0x30
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #64	 ;  0x40
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab9_HAL_TIM_PWM_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_PWM_Start_DMA
lab9_HAL_TIM_PWM_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4096	 ;  0x1000
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_PWM_Start_DMA
lab4_HAL_TIM_PWM_Start_DMA: 	nop
lab6_HAL_TIM_PWM_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	movs	r2, #1
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #96]	 ;  (808410c <HAL_TIM_PWM_Start_DMA+0x21c>)
	cmp	r3, r2
	beq.n lab10_HAL_TIM_PWM_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #92]	 ;  (8084110 <HAL_TIM_PWM_Start_DMA+0x220>)
	cmp	r3, r2
	bne.n lab11_HAL_TIM_PWM_Start_DMA
lab10_HAL_TIM_PWM_Start_DMA: 	movs	r3, #1
	b.n lab12_HAL_TIM_PWM_Start_DMA
lab11_HAL_TIM_PWM_Start_DMA: 	movs	r3, #0
lab12_HAL_TIM_PWM_Start_DMA: 	cmp	r3, #0
	beq.n lab13_HAL_TIM_PWM_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab13_HAL_TIM_PWM_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq.n lab14_HAL_TIM_PWM_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab14_HAL_TIM_PWM_Start_DMA: 	movs	r3, #0
lab1_HAL_TIM_PWM_Start_DMA: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08086795
	.word	0x08086805
	.word	0x08086771
	.word	0x40010000
	.word	0x40010400
HAL_TIM_PWM_Stop_DMA:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #12
	bhi.n lab0_HAL_TIM_PWM_Stop_DMA
	add	r2, pc, #4	 ;  (adr r2, 808412c <HAL_TIM_PWM_Stop_DMA+0x18>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x08084161
	.word	0x080841d1
	.word	0x080841d1
	.word	0x080841d1
	.word	0x0808417d
	.word	0x080841d1
	.word	0x080841d1
	.word	0x080841d1
	.word	0x08084199
	.word	0x080841d1
	.word	0x080841d1
	.word	0x080841d1
	.word	0x080841b5
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_PWM_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_PWM_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_PWM_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4096	 ;  0x1000
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_PWM_Stop_DMA
lab0_HAL_TIM_PWM_Stop_DMA: 	nop
lab1_HAL_TIM_PWM_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #136]	 ;  (8084270 <HAL_TIM_PWM_Stop_DMA+0x15c>)
	cmp	r3, r2
	beq.n lab2_HAL_TIM_PWM_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #132]	 ;  (8084274 <HAL_TIM_PWM_Stop_DMA+0x160>)
	cmp	r3, r2
	bne.n lab3_HAL_TIM_PWM_Stop_DMA
lab2_HAL_TIM_PWM_Stop_DMA: 	movs	r3, #1
	b.n lab4_HAL_TIM_PWM_Stop_DMA
lab3_HAL_TIM_PWM_Stop_DMA: 	movs	r3, #0
lab4_HAL_TIM_PWM_Stop_DMA: 	cmp	r3, #0
	beq.n lab5_HAL_TIM_PWM_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIM_PWM_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIM_PWM_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab5_HAL_TIM_PWM_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIM_PWM_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIM_PWM_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab6_HAL_TIM_PWM_Stop_DMA: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.word	0x40010000
	.word	0x40010400
HAL_TIM_IC_Init:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_TIM_IC_Init
	movs	r3, #1
	b.n lab1_HAL_TIM_IC_Init
lab0_HAL_TIM_IC_Init: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #0
	bne.n lab2_HAL_TIM_IC_Init
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r0, [r7, #4]
	bl HAL_TIM_IC_MspInit
lab2_HAL_TIM_IC_Init: 	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #4
	mov	r1, r3
	mov	r0, r2
	bl TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
lab1_HAL_TIM_IC_Init: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_IC_DeInit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_IC_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_IC_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_IC_DeInit: 	ldr	r0, [r7, #4]
	bl HAL_TIM_IC_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_IC_MspInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_IC_MspDeInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_IC_Start:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab0_HAL_TIM_IC_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_IC_Start: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_IC_Stop:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_IC_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_IC_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_IC_Stop: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_IC_Start_IT:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #12
	bhi.n lab0_HAL_TIM_IC_Start_IT
	add	r2, pc, #4	 ;  (adr r2, 8084404 <HAL_TIM_IC_Start_IT+0x18>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x08084439
	.word	0x08084481
	.word	0x08084481
	.word	0x08084481
	.word	0x0808444b
	.word	0x08084481
	.word	0x08084481
	.word	0x08084481
	.word	0x0808445d
	.word	0x08084481
	.word	0x08084481
	.word	0x08084481
	.word	0x0808446f
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_IC_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_IC_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_IC_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #16
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_IC_Start_IT
lab0_HAL_TIM_IC_Start_IT: 	nop
lab1_HAL_TIM_IC_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab2_HAL_TIM_IC_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab2_HAL_TIM_IC_Start_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_IC_Stop_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #12
	bhi.n lab0_HAL_TIM_IC_Stop_IT
	add	r2, pc, #4	 ;  (adr r2, 80844d4 <HAL_TIM_IC_Stop_IT+0x18>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x08084509
	.word	0x08084551
	.word	0x08084551
	.word	0x08084551
	.word	0x0808451b
	.word	0x08084551
	.word	0x08084551
	.word	0x08084551
	.word	0x0808452d
	.word	0x08084551
	.word	0x08084551
	.word	0x08084551
	.word	0x0808453f
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_IC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_IC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_IC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #16
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_IC_Stop_IT
lab0_HAL_TIM_IC_Stop_IT: 	nop
lab1_HAL_TIM_IC_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab2_HAL_TIM_IC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab2_HAL_TIM_IC_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab2_HAL_TIM_IC_Stop_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_IC_Start_DMA:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strh	r3, [r7, #2]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #2
	bne.n lab0_HAL_TIM_IC_Start_DMA
	movs	r3, #2
	b.n lab1_HAL_TIM_IC_Start_DMA
lab0_HAL_TIM_IC_Start_DMA: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_TIM_IC_Start_DMA
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab3_HAL_TIM_IC_Start_DMA
	ldrh	r3, [r7, #2]
	cmp	r3, #0
	beq.n lab3_HAL_TIM_IC_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_IC_Start_DMA
lab3_HAL_TIM_IC_Start_DMA: 	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
lab2_HAL_TIM_IC_Start_DMA: 	ldr	r3, [r7, #8]
	cmp	r3, #12
	bhi.w lab4_HAL_TIM_IC_Start_DMA
	add	r2, pc, #4	 ;  (adr r2, 80845ec <HAL_TIM_IC_Start_DMA+0x52>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x08084621
	.word	0x08084741
	.word	0x08084741
	.word	0x08084741
	.word	0x08084669
	.word	0x08084741
	.word	0x08084741
	.word	0x08084741
	.word	0x080846b1
	.word	0x08084741
	.word	0x08084741
	.word	0x08084741
	.word	0x080846f9
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #340]	 ;  (808477c <HAL_TIM_IC_Start_DMA+0x1e2>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #336]	 ;  (8084780 <HAL_TIM_IC_Start_DMA+0x1e6>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #332]	 ;  (8084784 <HAL_TIM_IC_Start_DMA+0x1ea>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]	 ;  0x24
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #52	 ;  0x34
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab5_HAL_TIM_IC_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_IC_Start_DMA
lab5_HAL_TIM_IC_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_IC_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #268]	 ;  (808477c <HAL_TIM_IC_Start_DMA+0x1e2>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #264]	 ;  (8084780 <HAL_TIM_IC_Start_DMA+0x1e6>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #260]	 ;  (8084784 <HAL_TIM_IC_Start_DMA+0x1ea>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]	 ;  0x28
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #56	 ;  0x38
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab7_HAL_TIM_IC_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_IC_Start_DMA
lab7_HAL_TIM_IC_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_IC_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #196]	 ;  (808477c <HAL_TIM_IC_Start_DMA+0x1e2>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #192]	 ;  (8084780 <HAL_TIM_IC_Start_DMA+0x1e6>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #188]	 ;  (8084784 <HAL_TIM_IC_Start_DMA+0x1ea>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]	 ;  0x2c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #60	 ;  0x3c
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab8_HAL_TIM_IC_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_IC_Start_DMA
lab8_HAL_TIM_IC_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_IC_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #124]	 ;  (808477c <HAL_TIM_IC_Start_DMA+0x1e2>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #120]	 ;  (8084780 <HAL_TIM_IC_Start_DMA+0x1e6>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #116]	 ;  (8084784 <HAL_TIM_IC_Start_DMA+0x1ea>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]	 ;  0x30
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #64	 ;  0x40
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab9_HAL_TIM_IC_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_IC_Start_DMA
lab9_HAL_TIM_IC_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4096	 ;  0x1000
	str	r2, [r3, #12]
	b.n lab6_HAL_TIM_IC_Start_DMA
lab4_HAL_TIM_IC_Start_DMA: 	nop
lab6_HAL_TIM_IC_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	movs	r2, #1
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq.n lab10_HAL_TIM_IC_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab10_HAL_TIM_IC_Start_DMA: 	movs	r3, #0
lab1_HAL_TIM_IC_Start_DMA: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
	.word	0x08086875
	.word	0x080868e5
	.word	0x08086771
HAL_TIM_IC_Stop_DMA:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #12
	bhi.n lab0_HAL_TIM_IC_Stop_DMA
	add	r2, pc, #4	 ;  (adr r2, 80847a0 <HAL_TIM_IC_Stop_DMA+0x18>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x080847d5
	.word	0x08084845
	.word	0x08084845
	.word	0x08084845
	.word	0x080847f1
	.word	0x08084845
	.word	0x08084845
	.word	0x08084845
	.word	0x0808480d
	.word	0x08084845
	.word	0x08084845
	.word	0x08084845
	.word	0x08084829
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_IC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_IC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_IC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4096	 ;  0x1000
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_IC_Stop_DMA
lab0_HAL_TIM_IC_Stop_DMA: 	nop
lab1_HAL_TIM_IC_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab2_HAL_TIM_IC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab2_HAL_TIM_IC_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab2_HAL_TIM_IC_Stop_DMA: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_OnePulse_Init:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_TIM_OnePulse_Init
	movs	r3, #1
	b.n lab1_HAL_TIM_OnePulse_Init
lab0_HAL_TIM_OnePulse_Init: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #0
	bne.n lab2_HAL_TIM_OnePulse_Init
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r0, [r7, #4]
	bl HAL_TIM_OnePulse_MspInit
lab2_HAL_TIM_OnePulse_Init: 	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #4
	mov	r1, r3
	mov	r0, r2
	bl TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8
	str	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #0]
	orrs	r2, r1
	str	r2, [r3, #0]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
lab1_HAL_TIM_OnePulse_Init: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_OnePulse_DeInit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_OnePulse_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_OnePulse_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_OnePulse_DeInit: 	ldr	r0, [r7, #4]
	bl HAL_TIM_OnePulse_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_OnePulse_MspInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_OnePulse_MspDeInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_OnePulse_Start:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #48]	 ;  (80849f4 <HAL_TIM_OnePulse_Start+0x5e>)
	cmp	r3, r2
	beq.n lab0_HAL_TIM_OnePulse_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #44]	 ;  (80849f8 <HAL_TIM_OnePulse_Start+0x62>)
	cmp	r3, r2
	bne.n lab1_HAL_TIM_OnePulse_Start
lab0_HAL_TIM_OnePulse_Start: 	movs	r3, #1
	b.n lab2_HAL_TIM_OnePulse_Start
lab1_HAL_TIM_OnePulse_Start: 	movs	r3, #0
lab2_HAL_TIM_OnePulse_Start: 	cmp	r3, #0
	beq.n lab3_HAL_TIM_OnePulse_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab3_HAL_TIM_OnePulse_Start: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.word	0x40010000
	.word	0x40010400
HAL_TIM_OnePulse_Stop:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #132]	 ;  (8084aac <HAL_TIM_OnePulse_Stop+0xb0>)
	cmp	r3, r2
	beq.n lab0_HAL_TIM_OnePulse_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #124]	 ;  (8084ab0 <HAL_TIM_OnePulse_Stop+0xb4>)
	cmp	r3, r2
	bne.n lab1_HAL_TIM_OnePulse_Stop
lab0_HAL_TIM_OnePulse_Stop: 	movs	r3, #1
	b.n lab2_HAL_TIM_OnePulse_Stop
lab1_HAL_TIM_OnePulse_Stop: 	movs	r3, #0
lab2_HAL_TIM_OnePulse_Stop: 	cmp	r3, #0
	beq.n lab3_HAL_TIM_OnePulse_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_OnePulse_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_OnePulse_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab3_HAL_TIM_OnePulse_Stop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIM_OnePulse_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIM_OnePulse_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab4_HAL_TIM_OnePulse_Stop: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x40010000
	.word	0x40010400
HAL_TIM_OnePulse_Start_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #52]	 ;  (8084b34 <HAL_TIM_OnePulse_Start_IT+0x80>)
	cmp	r3, r2
	beq.n lab0_HAL_TIM_OnePulse_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #44]	 ;  (8084b38 <HAL_TIM_OnePulse_Start_IT+0x84>)
	cmp	r3, r2
	bne.n lab1_HAL_TIM_OnePulse_Start_IT
lab0_HAL_TIM_OnePulse_Start_IT: 	movs	r3, #1
	b.n lab2_HAL_TIM_OnePulse_Start_IT
lab1_HAL_TIM_OnePulse_Start_IT: 	movs	r3, #0
lab2_HAL_TIM_OnePulse_Start_IT: 	cmp	r3, #0
	beq.n lab3_HAL_TIM_OnePulse_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab3_HAL_TIM_OnePulse_Start_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x40010000
	.word	0x40010400
HAL_TIM_OnePulse_Stop_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #132]	 ;  (8084c0c <HAL_TIM_OnePulse_Stop_IT+0xd0>)
	cmp	r3, r2
	beq.n lab0_HAL_TIM_OnePulse_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #124]	 ;  (8084c10 <HAL_TIM_OnePulse_Stop_IT+0xd4>)
	cmp	r3, r2
	bne.n lab1_HAL_TIM_OnePulse_Stop_IT
lab0_HAL_TIM_OnePulse_Stop_IT: 	movs	r3, #1
	b.n lab2_HAL_TIM_OnePulse_Stop_IT
lab1_HAL_TIM_OnePulse_Stop_IT: 	movs	r3, #0
lab2_HAL_TIM_OnePulse_Stop_IT: 	cmp	r3, #0
	beq.n lab3_HAL_TIM_OnePulse_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_OnePulse_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_OnePulse_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab3_HAL_TIM_OnePulse_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIM_OnePulse_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIM_OnePulse_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab4_HAL_TIM_OnePulse_Stop_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x40010000
	.word	0x40010400
HAL_TIM_Encoder_Init:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Encoder_Init
	movs	r3, #1
	b.n lab1_HAL_TIM_Encoder_Init
lab0_HAL_TIM_Encoder_Init: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #0
	bne.n lab2_HAL_TIM_Encoder_Init
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r0, [r7, #4]
	bl HAL_TIM_Encoder_MspInit
lab2_HAL_TIM_Encoder_Init: 	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	ldr	r2, [r7, #4]
	ldr	r2, [r2, #0]
	bic.w	r3, r3, #16384	 ;  0x4000
	bic.w	r3, r3, #7
	str	r3, [r2, #8]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #4
	mov	r1, r3
	mov	r0, r2
	bl TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #24]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #32]
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #768	 ;  0x300
	bic.w	r3, r3, #3
	str	r3, [r7, #16]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #24]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #3072	 ;  0xc00
	bic.w	r3, r3, #12
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #61440	 ;  0xf000
	bic.w	r3, r3, #240	 ;  0xf0
	str	r3, [r7, #16]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #28]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #16]
	lsls	r2, r3, #4
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #32]
	lsls	r3, r3, #12
	orrs	r3, r2
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #34	 ;  0x22
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #136	 ;  0x88
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #20]
	lsls	r3, r3, #4
	orrs	r3, r2
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #20]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #16]
	str	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
lab1_HAL_TIM_Encoder_Init: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_Encoder_DeInit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Encoder_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Encoder_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIM_Encoder_DeInit: 	ldr	r0, [r7, #4]
	bl HAL_TIM_Encoder_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_Encoder_MspInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_Encoder_MspDeInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_Encoder_Start:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq.n lab0_HAL_TIM_Encoder_Start
	cmp	r3, #4
	beq.n lab1_HAL_TIM_Encoder_Start
	b.n lab2_HAL_TIM_Encoder_Start
lab0_HAL_TIM_Encoder_Start: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	b.n lab3_HAL_TIM_Encoder_Start
lab1_HAL_TIM_Encoder_Start: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	b.n lab3_HAL_TIM_Encoder_Start
lab2_HAL_TIM_Encoder_Start: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	nop
lab3_HAL_TIM_Encoder_Start: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_Encoder_Stop:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq.n lab0_HAL_TIM_Encoder_Stop
	cmp	r3, #4
	beq.n lab1_HAL_TIM_Encoder_Stop
	b.n lab2_HAL_TIM_Encoder_Stop
lab0_HAL_TIM_Encoder_Stop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	b.n lab3_HAL_TIM_Encoder_Stop
lab1_HAL_TIM_Encoder_Stop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	b.n lab3_HAL_TIM_Encoder_Stop
lab2_HAL_TIM_Encoder_Stop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	nop
lab3_HAL_TIM_Encoder_Stop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIM_Encoder_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIM_Encoder_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab4_HAL_TIM_Encoder_Stop: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_Encoder_Start_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq.n lab0_HAL_TIM_Encoder_Start_IT
	cmp	r3, #4
	beq.n lab1_HAL_TIM_Encoder_Start_IT
	b.n lab2_HAL_TIM_Encoder_Start_IT
lab0_HAL_TIM_Encoder_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab3_HAL_TIM_Encoder_Start_IT
lab1_HAL_TIM_Encoder_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab3_HAL_TIM_Encoder_Start_IT
lab2_HAL_TIM_Encoder_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4
	str	r2, [r3, #12]
	nop
lab3_HAL_TIM_Encoder_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_Encoder_Stop_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Encoder_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_Encoder_Stop_IT
lab0_HAL_TIM_Encoder_Stop_IT: 	ldr	r3, [r7, #0]
	cmp	r3, #4
	bne.n lab2_HAL_TIM_Encoder_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab1_HAL_TIM_Encoder_Stop_IT
lab2_HAL_TIM_Encoder_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #12]
lab1_HAL_TIM_Encoder_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_Encoder_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_Encoder_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab3_HAL_TIM_Encoder_Stop_IT: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_Encoder_Start_DMA:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #2
	bne.n lab0_HAL_TIM_Encoder_Start_DMA
	movs	r3, #2
	b.n lab1_HAL_TIM_Encoder_Start_DMA
lab0_HAL_TIM_Encoder_Start_DMA: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_TIM_Encoder_Start_DMA
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq.n lab3_HAL_TIM_Encoder_Start_DMA
	ldr	r3, [r7, #0]
	cmp	r3, #0
	bne.n lab4_HAL_TIM_Encoder_Start_DMA
lab3_HAL_TIM_Encoder_Start_DMA: 	ldrh	r3, [r7, #24]
	cmp	r3, #0
	beq.n lab4_HAL_TIM_Encoder_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_Encoder_Start_DMA
lab4_HAL_TIM_Encoder_Start_DMA: 	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
lab2_HAL_TIM_Encoder_Start_DMA: 	ldr	r3, [r7, #8]
	cmp	r3, #4
	beq.n lab5_HAL_TIM_Encoder_Start_DMA
	cmp	r3, #60	 ;  0x3c
	beq.n lab6_HAL_TIM_Encoder_Start_DMA
	cmp	r3, #0
	beq.n lab7_HAL_TIM_Encoder_Start_DMA
	b.n lab8_HAL_TIM_Encoder_Start_DMA
lab7_HAL_TIM_Encoder_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #396]	 ;  (8085228 <HAL_TIM_Encoder_Start_DMA+0x1ea>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #392]	 ;  (808522c <HAL_TIM_Encoder_Start_DMA+0x1ee>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #388]	 ;  (8085230 <HAL_TIM_Encoder_Start_DMA+0x1f2>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]	 ;  0x24
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #52	 ;  0x34
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #24]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab9_HAL_TIM_Encoder_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_Encoder_Start_DMA
lab9_HAL_TIM_Encoder_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	b.n lab8_HAL_TIM_Encoder_Start_DMA
lab5_HAL_TIM_Encoder_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #292]	 ;  (8085228 <HAL_TIM_Encoder_Start_DMA+0x1ea>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #288]	 ;  (808522c <HAL_TIM_Encoder_Start_DMA+0x1ee>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #284]	 ;  (8085230 <HAL_TIM_Encoder_Start_DMA+0x1f2>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]	 ;  0x28
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #56	 ;  0x38
	mov	r1, r3
	ldr	r2, [r7, #0]
	ldrh	r3, [r7, #24]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab10_HAL_TIM_Encoder_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_Encoder_Start_DMA
lab10_HAL_TIM_Encoder_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	b.n lab8_HAL_TIM_Encoder_Start_DMA
lab6_HAL_TIM_Encoder_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #192]	 ;  (8085228 <HAL_TIM_Encoder_Start_DMA+0x1ea>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #188]	 ;  (808522c <HAL_TIM_Encoder_Start_DMA+0x1ee>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #184]	 ;  (8085230 <HAL_TIM_Encoder_Start_DMA+0x1f2>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]	 ;  0x24
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #52	 ;  0x34
	mov	r1, r3
	ldr	r2, [r7, #4]
	ldrh	r3, [r7, #24]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab11_HAL_TIM_Encoder_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_Encoder_Start_DMA
lab11_HAL_TIM_Encoder_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #136]	 ;  (8085228 <HAL_TIM_Encoder_Start_DMA+0x1ea>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #132]	 ;  (808522c <HAL_TIM_Encoder_Start_DMA+0x1ee>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #128]	 ;  (8085230 <HAL_TIM_Encoder_Start_DMA+0x1f2>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]	 ;  0x28
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #56	 ;  0x38
	mov	r1, r3
	ldr	r2, [r7, #0]
	ldrh	r3, [r7, #24]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab12_HAL_TIM_Encoder_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIM_Encoder_Start_DMA
lab12_HAL_TIM_Encoder_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	nop
lab8_HAL_TIM_Encoder_Start_DMA: 	movs	r3, #0
lab1_HAL_TIM_Encoder_Start_DMA: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08086875
	.word	0x080868e5
	.word	0x08086771
HAL_TIM_Encoder_Stop_DMA:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #0
	bne.n lab0_HAL_TIM_Encoder_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_Encoder_Stop_DMA
lab0_HAL_TIM_Encoder_Stop_DMA: 	ldr	r3, [r7, #0]
	cmp	r3, #4
	bne.n lab2_HAL_TIM_Encoder_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab1_HAL_TIM_Encoder_Stop_DMA
lab2_HAL_TIM_Encoder_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #4
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	mov	r0, r3
	bl HAL_DMA_Abort_IT
lab1_HAL_TIM_Encoder_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_Encoder_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab3_HAL_TIM_Encoder_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab3_HAL_TIM_Encoder_Stop_DMA: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_IRQHandler:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	and.w	r3, r3, #2
	cmp	r3, #2
	bne.n lab0_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	and.w	r3, r3, #2
	cmp	r3, #2
	bne.n lab0_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	mvn.w	r2, #2
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #24]
	and.w	r3, r3, #3
	cmp	r3, #0
	beq.n lab1_HAL_TIM_IRQHandler
	ldr	r0, [r7, #4]
	bl HAL_TIM_IC_CaptureCallback
	b.n lab2_HAL_TIM_IRQHandler
lab1_HAL_TIM_IRQHandler: 	ldr	r0, [r7, #4]
	bl HAL_TIM_OC_DelayElapsedCallback
	ldr	r0, [r7, #4]
	bl HAL_TIM_PWM_PulseFinishedCallback
lab2_HAL_TIM_IRQHandler: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #28]
lab0_HAL_TIM_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	and.w	r3, r3, #4
	cmp	r3, #4
	bne.n lab3_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	and.w	r3, r3, #4
	cmp	r3, #4
	bne.n lab3_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	mvn.w	r2, #4
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #24]
	and.w	r3, r3, #768	 ;  0x300
	cmp	r3, #0
	beq.n lab4_HAL_TIM_IRQHandler
	ldr	r0, [r7, #4]
	bl HAL_TIM_IC_CaptureCallback
	b.n lab5_HAL_TIM_IRQHandler
lab4_HAL_TIM_IRQHandler: 	ldr	r0, [r7, #4]
	bl HAL_TIM_OC_DelayElapsedCallback
	ldr	r0, [r7, #4]
	bl HAL_TIM_PWM_PulseFinishedCallback
lab5_HAL_TIM_IRQHandler: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #28]
lab3_HAL_TIM_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	and.w	r3, r3, #8
	cmp	r3, #8
	bne.n lab6_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	and.w	r3, r3, #8
	cmp	r3, #8
	bne.n lab6_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	mvn.w	r2, #8
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	movs	r2, #4
	strb	r2, [r3, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #28]
	and.w	r3, r3, #3
	cmp	r3, #0
	beq.n lab7_HAL_TIM_IRQHandler
	ldr	r0, [r7, #4]
	bl HAL_TIM_IC_CaptureCallback
	b.n lab8_HAL_TIM_IRQHandler
lab7_HAL_TIM_IRQHandler: 	ldr	r0, [r7, #4]
	bl HAL_TIM_OC_DelayElapsedCallback
	ldr	r0, [r7, #4]
	bl HAL_TIM_PWM_PulseFinishedCallback
lab8_HAL_TIM_IRQHandler: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #28]
lab6_HAL_TIM_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	and.w	r3, r3, #16
	cmp	r3, #16
	bne.n lab9_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	and.w	r3, r3, #16
	cmp	r3, #16
	bne.n lab9_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	mvn.w	r2, #16
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	movs	r2, #8
	strb	r2, [r3, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #28]
	and.w	r3, r3, #768	 ;  0x300
	cmp	r3, #0
	beq.n lab10_HAL_TIM_IRQHandler
	ldr	r0, [r7, #4]
	bl HAL_TIM_IC_CaptureCallback
	b.n lab11_HAL_TIM_IRQHandler
lab10_HAL_TIM_IRQHandler: 	ldr	r0, [r7, #4]
	bl HAL_TIM_OC_DelayElapsedCallback
	ldr	r0, [r7, #4]
	bl HAL_TIM_PWM_PulseFinishedCallback
lab11_HAL_TIM_IRQHandler: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #28]
lab9_HAL_TIM_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	and.w	r3, r3, #1
	cmp	r3, #1
	bne.n lab12_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	and.w	r3, r3, #1
	cmp	r3, #1
	bne.n lab12_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	mvn.w	r2, #1
	str	r2, [r3, #16]
	ldr	r0, [r7, #4]
	bl HAL_TIM_PeriodElapsedCallback
lab12_HAL_TIM_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #128	 ;  0x80
	bne.n lab13_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #128	 ;  0x80
	bne.n lab13_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	mvn.w	r2, #128	 ;  0x80
	str	r2, [r3, #16]
	ldr	r0, [r7, #4]
	bl HAL_TIMEx_BreakCallback
lab13_HAL_TIM_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	bne.n lab14_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	bne.n lab14_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	mvn.w	r2, #64	 ;  0x40
	str	r2, [r3, #16]
	ldr	r0, [r7, #4]
	bl HAL_TIM_TriggerCallback
lab14_HAL_TIM_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	and.w	r3, r3, #32
	cmp	r3, #32
	bne.n lab15_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	and.w	r3, r3, #32
	cmp	r3, #32
	bne.n lab15_HAL_TIM_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	mvn.w	r2, #32
	str	r2, [r3, #16]
	ldr	r0, [r7, #4]
	bl HAL_TIMEx_CommutCallback
lab15_HAL_TIM_IRQHandler: 	nop
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #135
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
HAL_TIM_OC_ConfigChannel:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIM_OC_ConfigChannel
	movs	r3, #2
	b.n lab1_HAL_TIM_OC_ConfigChannel
lab0_HAL_TIM_OC_ConfigChannel: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	cmp	r3, #12
	bhi.n lab2_HAL_TIM_OC_ConfigChannel
	add	r2, pc, #4	 ;  (adr r2, 8085578 <HAL_TIM_OC_ConfigChannel+0x38>)
	ldr.w	pc, [r2, r3, lsl #2]
	nop
	.word	0x080855ad
	.word	0x080855e5
	.word	0x080855e5
	.word	0x080855e5
	.word	0x080855bb
	.word	0x080855e5
	.word	0x080855e5
	.word	0x080855e5
	.word	0x080855c9
	.word	0x080855e5
	.word	0x080855e5
	.word	0x080855e5
	.word	0x080855d7
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_OC1_SetConfig
	b.n lab3_HAL_TIM_OC_ConfigChannel
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_OC2_SetConfig
	b.n lab3_HAL_TIM_OC_ConfigChannel
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_OC3_SetConfig
	b.n lab3_HAL_TIM_OC_ConfigChannel
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_OC4_SetConfig
	b.n lab3_HAL_TIM_OC_ConfigChannel
lab2_HAL_TIM_OC_ConfigChannel: 	nop
lab3_HAL_TIM_OC_ConfigChannel: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIM_OC_ConfigChannel: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_IC_ConfigChannel:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIM_IC_ConfigChannel
	movs	r3, #2
	b.n lab1_HAL_TIM_IC_ConfigChannel
lab0_HAL_TIM_IC_ConfigChannel: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab2_HAL_TIM_IC_ConfigChannel
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #8]
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	bl TIM_TI1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #12
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #24]
	b.n lab3_HAL_TIM_IC_ConfigChannel
lab2_HAL_TIM_IC_ConfigChannel: 	ldr	r3, [r7, #4]
	cmp	r3, #4
	bne.n lab4_HAL_TIM_IC_ConfigChannel
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #8]
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	bl TIM_TI2_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #3072	 ;  0xc00
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	lsls	r2, r3, #8
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #24]
	b.n lab3_HAL_TIM_IC_ConfigChannel
lab4_HAL_TIM_IC_ConfigChannel: 	ldr	r3, [r7, #4]
	cmp	r3, #8
	bne.n lab5_HAL_TIM_IC_ConfigChannel
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #8]
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	bl TIM_TI3_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #12
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #28]
	b.n lab3_HAL_TIM_IC_ConfigChannel
lab5_HAL_TIM_IC_ConfigChannel: 	ldr	r3, [r7, #12]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #8]
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	bl TIM_TI4_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #3072	 ;  0xc00
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	lsls	r2, r3, #8
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #28]
lab3_HAL_TIM_IC_ConfigChannel: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIM_IC_ConfigChannel: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_PWM_ConfigChannel:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIM_PWM_ConfigChannel
	movs	r3, #2
	b.n lab1_HAL_TIM_PWM_ConfigChannel
lab0_HAL_TIM_PWM_ConfigChannel: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	cmp	r3, #12
	bhi.w lab2_HAL_TIM_PWM_ConfigChannel
	add	r2, pc, #4	 ;  (adr r2, 8085770 <HAL_TIM_PWM_ConfigChannel+0x38>)
	ldr.w	pc, [r2, r3, lsl #2]
	.word	0x080857a5
	.word	0x080858a9
	.word	0x080858a9
	.word	0x080858a9
	.word	0x080857e5
	.word	0x080858a9
	.word	0x080858a9
	.word	0x080858a9
	.word	0x08085827
	.word	0x080858a9
	.word	0x080858a9
	.word	0x080858a9
	.word	0x08085867
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_OC1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #24]
	b.n lab3_HAL_TIM_PWM_ConfigChannel
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_OC2_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #16]
	lsls	r2, r3, #8
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #24]
	b.n lab3_HAL_TIM_PWM_ConfigChannel
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_OC3_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #28]
	b.n lab3_HAL_TIM_PWM_ConfigChannel
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_OC4_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #16]
	lsls	r2, r3, #8
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #28]
	b.n lab3_HAL_TIM_PWM_ConfigChannel
lab2_HAL_TIM_PWM_ConfigChannel: 	nop
lab3_HAL_TIM_PWM_ConfigChannel: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIM_PWM_ConfigChannel: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_OnePulse_ConfigChannel:
	push	{r7, lr}
	sub	sp, #48	 ;  0x30
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #0]
	cmp	r2, r3
	beq.w lab0_HAL_TIM_OnePulse_ConfigChannel
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab1_HAL_TIM_OnePulse_ConfigChannel
	movs	r3, #2
	b.n lab2_HAL_TIM_OnePulse_ConfigChannel
lab1_HAL_TIM_OnePulse_ConfigChannel: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #0]
	str	r3, [r7, #20]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #4]
	str	r3, [r7, #24]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	str	r3, [r7, #28]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	str	r3, [r7, #32]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #16]
	str	r3, [r7, #40]	 ;  0x28
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #20]
	str	r3, [r7, #44]	 ;  0x2c
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq.n lab3_HAL_TIM_OnePulse_ConfigChannel
	cmp	r3, #4
	beq.n lab4_HAL_TIM_OnePulse_ConfigChannel
	b.n lab5_HAL_TIM_OnePulse_ConfigChannel
lab3_HAL_TIM_OnePulse_ConfigChannel: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	add.w	r2, r7, #20
	mov	r1, r2
	mov	r0, r3
	bl TIM_OC1_SetConfig
	b.n lab5_HAL_TIM_OnePulse_ConfigChannel
lab4_HAL_TIM_OnePulse_ConfigChannel: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	add.w	r2, r7, #20
	mov	r1, r2
	mov	r0, r3
	bl TIM_OC2_SetConfig
	nop
lab5_HAL_TIM_OnePulse_ConfigChannel: 	ldr	r3, [r7, #0]
	cmp	r3, #0
	beq.n lab6_HAL_TIM_OnePulse_ConfigChannel
	cmp	r3, #4
	beq.n lab7_HAL_TIM_OnePulse_ConfigChannel
	b.n lab8_HAL_TIM_OnePulse_ConfigChannel
lab6_HAL_TIM_OnePulse_ConfigChannel: 	ldr	r3, [r7, #12]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #8]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #32]
	bl TIM_TI1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #12
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #112	 ;  0x70
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #80	 ;  0x50
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #7
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #6
	str	r2, [r3, #8]
	b.n lab8_HAL_TIM_OnePulse_ConfigChannel
lab7_HAL_TIM_OnePulse_ConfigChannel: 	ldr	r3, [r7, #12]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #8]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #32]
	bl TIM_TI2_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #3072	 ;  0xc00
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #112	 ;  0x70
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #96	 ;  0x60
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #7
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #6
	str	r2, [r3, #8]
	nop
lab8_HAL_TIM_OnePulse_ConfigChannel: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
	b.n lab2_HAL_TIM_OnePulse_ConfigChannel
lab0_HAL_TIM_OnePulse_ConfigChannel: 	movs	r3, #1
lab2_HAL_TIM_OnePulse_ConfigChannel: 	mov	r0, r3
	adds	r7, #48	 ;  0x30
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_DMABurst_WriteStart:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #2
	bne.n lab0_HAL_TIM_DMABurst_WriteStart
	movs	r3, #2
	b.n lab1_HAL_TIM_DMABurst_WriteStart
lab0_HAL_TIM_DMABurst_WriteStart: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_TIM_DMABurst_WriteStart
	ldr	r3, [r7, #0]
	cmp	r3, #0
	bne.n lab3_HAL_TIM_DMABurst_WriteStart
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq.n lab3_HAL_TIM_DMABurst_WriteStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_WriteStart
lab3_HAL_TIM_DMABurst_WriteStart: 	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
lab2_HAL_TIM_DMABurst_WriteStart: 	ldr	r3, [r7, #4]
	cmp.w	r3, #2048	 ;  0x800
	beq.n lab4_HAL_TIM_DMABurst_WriteStart
	cmp.w	r3, #2048	 ;  0x800
	bhi.n lab5_HAL_TIM_DMABurst_WriteStart
	cmp.w	r3, #512	 ;  0x200
	beq.n lab6_HAL_TIM_DMABurst_WriteStart
	cmp.w	r3, #1024	 ;  0x400
	beq.n lab7_HAL_TIM_DMABurst_WriteStart
	cmp.w	r3, #256	 ;  0x100
	beq.n lab8_HAL_TIM_DMABurst_WriteStart
	b.n lab9_HAL_TIM_DMABurst_WriteStart
lab5_HAL_TIM_DMABurst_WriteStart: 	cmp.w	r3, #8192	 ;  0x2000
	beq.w lab10_HAL_TIM_DMABurst_WriteStart
	cmp.w	r3, #16384	 ;  0x4000
	beq.w lab11_HAL_TIM_DMABurst_WriteStart
	cmp.w	r3, #4096	 ;  0x1000
	beq.n lab12_HAL_TIM_DMABurst_WriteStart
	b.n lab9_HAL_TIM_DMABurst_WriteStart
lab8_HAL_TIM_DMABurst_WriteStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, [pc, #476]	 ;  (8085ca4 <HAL_TIM_DMABurst_WriteStart+0x260>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, [pc, #472]	 ;  (8085ca8 <HAL_TIM_DMABurst_WriteStart+0x264>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, [pc, #468]	 ;  (8085cac <HAL_TIM_DMABurst_WriteStart+0x268>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #32]
	ldr	r1, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.w lab13_HAL_TIM_DMABurst_WriteStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_WriteStart
lab6_HAL_TIM_DMABurst_WriteStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #428]	 ;  (8085cb0 <HAL_TIM_DMABurst_WriteStart+0x26c>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #424]	 ;  (8085cb4 <HAL_TIM_DMABurst_WriteStart+0x270>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #408]	 ;  (8085cac <HAL_TIM_DMABurst_WriteStart+0x268>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]	 ;  0x24
	ldr	r1, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.w lab14_HAL_TIM_DMABurst_WriteStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_WriteStart
lab7_HAL_TIM_DMABurst_WriteStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #368]	 ;  (8085cb0 <HAL_TIM_DMABurst_WriteStart+0x26c>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #364]	 ;  (8085cb4 <HAL_TIM_DMABurst_WriteStart+0x270>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #348]	 ;  (8085cac <HAL_TIM_DMABurst_WriteStart+0x268>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]	 ;  0x28
	ldr	r1, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab15_HAL_TIM_DMABurst_WriteStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_WriteStart
lab4_HAL_TIM_DMABurst_WriteStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #312]	 ;  (8085cb0 <HAL_TIM_DMABurst_WriteStart+0x26c>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #308]	 ;  (8085cb4 <HAL_TIM_DMABurst_WriteStart+0x270>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #292]	 ;  (8085cac <HAL_TIM_DMABurst_WriteStart+0x268>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]	 ;  0x2c
	ldr	r1, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab16_HAL_TIM_DMABurst_WriteStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_WriteStart
lab12_HAL_TIM_DMABurst_WriteStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #252]	 ;  (8085cb0 <HAL_TIM_DMABurst_WriteStart+0x26c>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #248]	 ;  (8085cb4 <HAL_TIM_DMABurst_WriteStart+0x270>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #232]	 ;  (8085cac <HAL_TIM_DMABurst_WriteStart+0x268>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]	 ;  0x30
	ldr	r1, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab17_HAL_TIM_DMABurst_WriteStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_WriteStart
lab10_HAL_TIM_DMABurst_WriteStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #204]	 ;  (8085cb8 <HAL_TIM_DMABurst_WriteStart+0x274>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #200]	 ;  (8085cbc <HAL_TIM_DMABurst_WriteStart+0x278>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #176]	 ;  (8085cac <HAL_TIM_DMABurst_WriteStart+0x268>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #52]	 ;  0x34
	ldr	r1, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab18_HAL_TIM_DMABurst_WriteStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_WriteStart
lab11_HAL_TIM_DMABurst_WriteStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]	 ;  0x38
	ldr	r2, [pc, #152]	 ;  (8085cc0 <HAL_TIM_DMABurst_WriteStart+0x27c>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]	 ;  0x38
	ldr	r2, [pc, #148]	 ;  (8085cc4 <HAL_TIM_DMABurst_WriteStart+0x280>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]	 ;  0x38
	ldr	r2, [pc, #116]	 ;  (8085cac <HAL_TIM_DMABurst_WriteStart+0x268>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #56]	 ;  0x38
	ldr	r1, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r2, r3
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab19_HAL_TIM_DMABurst_WriteStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_WriteStart
lab13_HAL_TIM_DMABurst_WriteStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_WriteStart
lab14_HAL_TIM_DMABurst_WriteStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_WriteStart
lab15_HAL_TIM_DMABurst_WriteStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_WriteStart
lab16_HAL_TIM_DMABurst_WriteStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_WriteStart
lab17_HAL_TIM_DMABurst_WriteStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_WriteStart
lab18_HAL_TIM_DMABurst_WriteStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_WriteStart
lab19_HAL_TIM_DMABurst_WriteStart: 	nop
lab9_HAL_TIM_DMABurst_WriteStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #24]
	orrs	r2, r1
	str	r2, [r3, #72]	 ;  0x48
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
lab1_HAL_TIM_DMABurst_WriteStart: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08086955
	.word	0x08086979
	.word	0x08086771
	.word	0x08086795
	.word	0x08086805
	.word	0x0808871d
	.word	0x08088741
	.word	0x0808699d
	.word	0x080869c1
HAL_TIM_DMABurst_WriteStop:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #0
	strb	r3, [r7, #15]
	ldr	r3, [r7, #0]
	cmp.w	r3, #2048	 ;  0x800
	beq.n lab0_HAL_TIM_DMABurst_WriteStop
	cmp.w	r3, #2048	 ;  0x800
	bhi.n lab1_HAL_TIM_DMABurst_WriteStop
	cmp.w	r3, #512	 ;  0x200
	beq.n lab2_HAL_TIM_DMABurst_WriteStop
	cmp.w	r3, #1024	 ;  0x400
	beq.n lab3_HAL_TIM_DMABurst_WriteStop
	cmp.w	r3, #256	 ;  0x100
	beq.n lab4_HAL_TIM_DMABurst_WriteStop
	b.n lab5_HAL_TIM_DMABurst_WriteStop
lab1_HAL_TIM_DMABurst_WriteStop: 	cmp.w	r3, #8192	 ;  0x2000
	beq.n lab6_HAL_TIM_DMABurst_WriteStop
	cmp.w	r3, #16384	 ;  0x4000
	beq.n lab7_HAL_TIM_DMABurst_WriteStop
	cmp.w	r3, #4096	 ;  0x1000
	beq.n lab8_HAL_TIM_DMABurst_WriteStop
	b.n lab5_HAL_TIM_DMABurst_WriteStop
lab4_HAL_TIM_DMABurst_WriteStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_WriteStop
lab2_HAL_TIM_DMABurst_WriteStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_WriteStop
lab3_HAL_TIM_DMABurst_WriteStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_WriteStop
lab0_HAL_TIM_DMABurst_WriteStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_WriteStop
lab8_HAL_TIM_DMABurst_WriteStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_WriteStop
lab6_HAL_TIM_DMABurst_WriteStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_WriteStop
lab7_HAL_TIM_DMABurst_WriteStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	nop
lab5_HAL_TIM_DMABurst_WriteStop: 	ldrb	r3, [r7, #15]
	cmp	r3, #0
	bne.n lab9_HAL_TIM_DMABurst_WriteStop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #0]
	mvns	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ands	r2, r1
	str	r2, [r3, #12]
lab9_HAL_TIM_DMABurst_WriteStop: 	ldrb	r3, [r7, #15]
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_DMABurst_ReadStart:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #2
	bne.n lab0_HAL_TIM_DMABurst_ReadStart
	movs	r3, #2
	b.n lab1_HAL_TIM_DMABurst_ReadStart
lab0_HAL_TIM_DMABurst_ReadStart: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_TIM_DMABurst_ReadStart
	ldr	r3, [r7, #0]
	cmp	r3, #0
	bne.n lab3_HAL_TIM_DMABurst_ReadStart
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq.n lab3_HAL_TIM_DMABurst_ReadStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_ReadStart
lab3_HAL_TIM_DMABurst_ReadStart: 	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
lab2_HAL_TIM_DMABurst_ReadStart: 	ldr	r3, [r7, #4]
	cmp.w	r3, #2048	 ;  0x800
	beq.n lab4_HAL_TIM_DMABurst_ReadStart
	cmp.w	r3, #2048	 ;  0x800
	bhi.n lab5_HAL_TIM_DMABurst_ReadStart
	cmp.w	r3, #512	 ;  0x200
	beq.n lab6_HAL_TIM_DMABurst_ReadStart
	cmp.w	r3, #1024	 ;  0x400
	beq.n lab7_HAL_TIM_DMABurst_ReadStart
	cmp.w	r3, #256	 ;  0x100
	beq.n lab8_HAL_TIM_DMABurst_ReadStart
	b.n lab9_HAL_TIM_DMABurst_ReadStart
lab5_HAL_TIM_DMABurst_ReadStart: 	cmp.w	r3, #8192	 ;  0x2000
	beq.w lab10_HAL_TIM_DMABurst_ReadStart
	cmp.w	r3, #16384	 ;  0x4000
	beq.w lab11_HAL_TIM_DMABurst_ReadStart
	cmp.w	r3, #4096	 ;  0x1000
	beq.n lab12_HAL_TIM_DMABurst_ReadStart
	b.n lab9_HAL_TIM_DMABurst_ReadStart
lab8_HAL_TIM_DMABurst_ReadStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, [pc, #476]	 ;  (8085ffc <HAL_TIM_DMABurst_ReadStart+0x25e>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, [pc, #472]	 ;  (8086000 <HAL_TIM_DMABurst_ReadStart+0x262>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	ldr	r2, [pc, #468]	 ;  (8086004 <HAL_TIM_DMABurst_ReadStart+0x266>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r1, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.w lab13_HAL_TIM_DMABurst_ReadStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_ReadStart
lab6_HAL_TIM_DMABurst_ReadStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #428]	 ;  (8086008 <HAL_TIM_DMABurst_ReadStart+0x26a>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #424]	 ;  (808600c <HAL_TIM_DMABurst_ReadStart+0x26e>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #408]	 ;  (8086004 <HAL_TIM_DMABurst_ReadStart+0x266>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]	 ;  0x24
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r1, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.w lab14_HAL_TIM_DMABurst_ReadStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_ReadStart
lab7_HAL_TIM_DMABurst_ReadStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #368]	 ;  (8086008 <HAL_TIM_DMABurst_ReadStart+0x26a>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #364]	 ;  (808600c <HAL_TIM_DMABurst_ReadStart+0x26e>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #348]	 ;  (8086004 <HAL_TIM_DMABurst_ReadStart+0x266>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]	 ;  0x28
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r1, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab15_HAL_TIM_DMABurst_ReadStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_ReadStart
lab4_HAL_TIM_DMABurst_ReadStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #308]	 ;  (8086008 <HAL_TIM_DMABurst_ReadStart+0x26a>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #304]	 ;  (808600c <HAL_TIM_DMABurst_ReadStart+0x26e>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #288]	 ;  (8086004 <HAL_TIM_DMABurst_ReadStart+0x266>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]	 ;  0x2c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r1, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab16_HAL_TIM_DMABurst_ReadStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_ReadStart
lab12_HAL_TIM_DMABurst_ReadStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #252]	 ;  (8086008 <HAL_TIM_DMABurst_ReadStart+0x26a>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #248]	 ;  (808600c <HAL_TIM_DMABurst_ReadStart+0x26e>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #232]	 ;  (8086004 <HAL_TIM_DMABurst_ReadStart+0x266>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]	 ;  0x30
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r1, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab17_HAL_TIM_DMABurst_ReadStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_ReadStart
lab10_HAL_TIM_DMABurst_ReadStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #200]	 ;  (8086010 <HAL_TIM_DMABurst_ReadStart+0x272>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #196]	 ;  (8086014 <HAL_TIM_DMABurst_ReadStart+0x276>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #172]	 ;  (8086004 <HAL_TIM_DMABurst_ReadStart+0x266>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r1, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab18_HAL_TIM_DMABurst_ReadStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_ReadStart
lab11_HAL_TIM_DMABurst_ReadStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]	 ;  0x38
	ldr	r2, [pc, #152]	 ;  (8086018 <HAL_TIM_DMABurst_ReadStart+0x27a>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]	 ;  0x38
	ldr	r2, [pc, #148]	 ;  (808601c <HAL_TIM_DMABurst_ReadStart+0x27e>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #56]	 ;  0x38
	ldr	r2, [pc, #116]	 ;  (8086004 <HAL_TIM_DMABurst_ReadStart+0x266>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #76	 ;  0x4c
	mov	r1, r3
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #8
	adds	r3, #1
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab19_HAL_TIM_DMABurst_ReadStart
	movs	r3, #1
	b.n lab1_HAL_TIM_DMABurst_ReadStart
lab13_HAL_TIM_DMABurst_ReadStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_ReadStart
lab14_HAL_TIM_DMABurst_ReadStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_ReadStart
lab15_HAL_TIM_DMABurst_ReadStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_ReadStart
lab16_HAL_TIM_DMABurst_ReadStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_ReadStart
lab17_HAL_TIM_DMABurst_ReadStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_ReadStart
lab18_HAL_TIM_DMABurst_ReadStart: 	nop
	b.n lab9_HAL_TIM_DMABurst_ReadStart
lab19_HAL_TIM_DMABurst_ReadStart: 	nop
lab9_HAL_TIM_DMABurst_ReadStart: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #24]
	orrs	r2, r1
	str	r2, [r3, #72]	 ;  0x48
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
lab1_HAL_TIM_DMABurst_ReadStart: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
	.word	0x08086955
	.word	0x08086979
	.word	0x08086771
	.word	0x08086875
	.word	0x080868e5
	.word	0x0808871d
	.word	0x08088741
	.word	0x0808699d
	.word	0x080869c1
HAL_TIM_DMABurst_ReadStop:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #0
	strb	r3, [r7, #15]
	ldr	r3, [r7, #0]
	cmp.w	r3, #2048	 ;  0x800
	beq.n lab0_HAL_TIM_DMABurst_ReadStop
	cmp.w	r3, #2048	 ;  0x800
	bhi.n lab1_HAL_TIM_DMABurst_ReadStop
	cmp.w	r3, #512	 ;  0x200
	beq.n lab2_HAL_TIM_DMABurst_ReadStop
	cmp.w	r3, #1024	 ;  0x400
	beq.n lab3_HAL_TIM_DMABurst_ReadStop
	cmp.w	r3, #256	 ;  0x100
	beq.n lab4_HAL_TIM_DMABurst_ReadStop
	b.n lab5_HAL_TIM_DMABurst_ReadStop
lab1_HAL_TIM_DMABurst_ReadStop: 	cmp.w	r3, #8192	 ;  0x2000
	beq.n lab6_HAL_TIM_DMABurst_ReadStop
	cmp.w	r3, #16384	 ;  0x4000
	beq.n lab7_HAL_TIM_DMABurst_ReadStop
	cmp.w	r3, #4096	 ;  0x1000
	beq.n lab8_HAL_TIM_DMABurst_ReadStop
	b.n lab5_HAL_TIM_DMABurst_ReadStop
lab4_HAL_TIM_DMABurst_ReadStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_ReadStop
lab2_HAL_TIM_DMABurst_ReadStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_ReadStop
lab3_HAL_TIM_DMABurst_ReadStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_ReadStop
lab0_HAL_TIM_DMABurst_ReadStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_ReadStop
lab8_HAL_TIM_DMABurst_ReadStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_ReadStop
lab6_HAL_TIM_DMABurst_ReadStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	b.n lab5_HAL_TIM_DMABurst_ReadStop
lab7_HAL_TIM_DMABurst_ReadStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	strb	r3, [r7, #15]
	nop
lab5_HAL_TIM_DMABurst_ReadStop: 	ldrb	r3, [r7, #15]
	cmp	r3, #0
	bne.n lab9_HAL_TIM_DMABurst_ReadStop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #0]
	mvns	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ands	r2, r1
	str	r2, [r3, #12]
lab9_HAL_TIM_DMABurst_ReadStop: 	ldrb	r3, [r7, #15]
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_GenerateEvent:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIM_GenerateEvent
	movs	r3, #2
	b.n lab1_HAL_TIM_GenerateEvent
lab0_HAL_TIM_GenerateEvent: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #0]
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIM_GenerateEvent: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_ConfigOCrefClear:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIM_ConfigOCrefClear
	movs	r3, #2
	b.n lab1_HAL_TIM_ConfigOCrefClear
lab0_HAL_TIM_ConfigOCrefClear: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq.n lab2_HAL_TIM_ConfigOCrefClear
	cmp	r3, #1
	beq.n lab3_HAL_TIM_ConfigOCrefClear
	b.n lab4_HAL_TIM_ConfigOCrefClear
lab2_HAL_TIM_ConfigOCrefClear: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #65280	 ;  0xff00
	str	r2, [r3, #8]
	b.n lab4_HAL_TIM_ConfigOCrefClear
lab3_HAL_TIM_ConfigOCrefClear: 	ldr	r3, [r7, #8]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq.n lab5_HAL_TIM_ConfigOCrefClear
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #1
	b.n lab1_HAL_TIM_ConfigOCrefClear
lab5_HAL_TIM_ConfigOCrefClear: 	ldr	r3, [r7, #12]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #8]
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #16]
	bl TIM_ETR_SetConfig
	nop
lab4_HAL_TIM_ConfigOCrefClear: 	ldr	r3, [r7, #4]
	cmp	r3, #12
	bhi.n lab6_HAL_TIM_ConfigOCrefClear
	add	r2, pc, #4	 ;  (adr r2, 80861cc <HAL_TIM_ConfigOCrefClear+0x88>)
	ldr.w	pc, [r2, r3, lsl #2]
	.word	0x08086201
	.word	0x080862b1
	.word	0x080862b1
	.word	0x080862b1
	.word	0x0808622d
	.word	0x080862b1
	.word	0x080862b1
	.word	0x080862b1
	.word	0x08086259
	.word	0x080862b1
	.word	0x080862b1
	.word	0x080862b1
	.word	0x08086285
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq.n lab7_HAL_TIM_ConfigOCrefClear
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #24]
	b.n lab8_HAL_TIM_ConfigOCrefClear
lab7_HAL_TIM_ConfigOCrefClear: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #24]
	b.n lab8_HAL_TIM_ConfigOCrefClear
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq.n lab9_HAL_TIM_ConfigOCrefClear
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #24]
	b.n lab8_HAL_TIM_ConfigOCrefClear
lab9_HAL_TIM_ConfigOCrefClear: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #24]
	b.n lab8_HAL_TIM_ConfigOCrefClear
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq.n lab10_HAL_TIM_ConfigOCrefClear
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #28]
	b.n lab8_HAL_TIM_ConfigOCrefClear
lab10_HAL_TIM_ConfigOCrefClear: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #28]
	b.n lab8_HAL_TIM_ConfigOCrefClear
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq.n lab11_HAL_TIM_ConfigOCrefClear
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #28]
	b.n lab8_HAL_TIM_ConfigOCrefClear
lab11_HAL_TIM_ConfigOCrefClear: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #28]
	b.n lab8_HAL_TIM_ConfigOCrefClear
lab6_HAL_TIM_ConfigOCrefClear: 	nop
lab8_HAL_TIM_ConfigOCrefClear: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIM_ConfigOCrefClear: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_ConfigClockSource:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIM_ConfigClockSource
	movs	r3, #2
	b.n lab1_HAL_TIM_ConfigClockSource
lab0_HAL_TIM_ConfigClockSource: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #119	 ;  0x77
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #65280	 ;  0xff00
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	str	r2, [r3, #8]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	cmp	r3, #64	 ;  0x40
	beq.n lab2_HAL_TIM_ConfigClockSource
	cmp	r3, #64	 ;  0x40
	bhi.n lab3_HAL_TIM_ConfigClockSource
	cmp	r3, #16
	beq.n lab4_HAL_TIM_ConfigClockSource
	cmp	r3, #16
	bhi.n lab5_HAL_TIM_ConfigClockSource
	cmp	r3, #0
	beq.n lab4_HAL_TIM_ConfigClockSource
	b.n lab6_HAL_TIM_ConfigClockSource
lab5_HAL_TIM_ConfigClockSource: 	cmp	r3, #32
	beq.n lab4_HAL_TIM_ConfigClockSource
	cmp	r3, #48	 ;  0x30
	beq.n lab4_HAL_TIM_ConfigClockSource
	b.n lab6_HAL_TIM_ConfigClockSource
lab3_HAL_TIM_ConfigClockSource: 	cmp	r3, #112	 ;  0x70
	beq.n lab7_HAL_TIM_ConfigClockSource
	cmp	r3, #112	 ;  0x70
	bhi.n lab8_HAL_TIM_ConfigClockSource
	cmp	r3, #80	 ;  0x50
	beq.n lab9_HAL_TIM_ConfigClockSource
	cmp	r3, #96	 ;  0x60
	beq.n lab10_HAL_TIM_ConfigClockSource
	b.n lab6_HAL_TIM_ConfigClockSource
lab8_HAL_TIM_ConfigClockSource: 	cmp.w	r3, #4096	 ;  0x1000
	beq.n lab11_HAL_TIM_ConfigClockSource
	cmp.w	r3, #8192	 ;  0x2000
	beq.n lab12_HAL_TIM_ConfigClockSource
	b.n lab6_HAL_TIM_ConfigClockSource
lab7_HAL_TIM_ConfigClockSource: 	ldr	r3, [r7, #4]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #12]
	bl TIM_ETR_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	orr.w	r3, r3, #119	 ;  0x77
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	str	r2, [r3, #8]
	b.n lab6_HAL_TIM_ConfigClockSource
lab12_HAL_TIM_ConfigClockSource: 	ldr	r3, [r7, #4]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #12]
	bl TIM_ETR_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #16384	 ;  0x4000
	str	r2, [r3, #8]
	b.n lab6_HAL_TIM_ConfigClockSource
lab9_HAL_TIM_ConfigClockSource: 	ldr	r3, [r7, #4]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #12]
	mov	r2, r3
	bl TIM_TI1_ConfigInputStage
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r1, #80	 ;  0x50
	mov	r0, r3
	bl TIM_ITRx_SetConfig
	b.n lab6_HAL_TIM_ConfigClockSource
lab10_HAL_TIM_ConfigClockSource: 	ldr	r3, [r7, #4]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #12]
	mov	r2, r3
	bl TIM_TI2_ConfigInputStage
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r1, #96	 ;  0x60
	mov	r0, r3
	bl TIM_ITRx_SetConfig
	b.n lab6_HAL_TIM_ConfigClockSource
lab2_HAL_TIM_ConfigClockSource: 	ldr	r3, [r7, #4]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #12]
	mov	r2, r3
	bl TIM_TI1_ConfigInputStage
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r1, #64	 ;  0x40
	mov	r0, r3
	bl TIM_ITRx_SetConfig
	b.n lab6_HAL_TIM_ConfigClockSource
lab4_HAL_TIM_ConfigClockSource: 	ldr	r3, [r7, #4]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	mov	r1, r3
	mov	r0, r2
	bl TIM_ITRx_SetConfig
	b.n lab6_HAL_TIM_ConfigClockSource
lab11_HAL_TIM_ConfigClockSource: 	nop
lab6_HAL_TIM_ConfigClockSource: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIM_ConfigClockSource: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #85
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
HAL_TIM_ConfigTI1Input:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #128	 ;  0x80
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #0]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	movs	r3, #0
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_SlaveConfigSynchro:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIM_SlaveConfigSynchro
	movs	r3, #2
	b.n lab1_HAL_TIM_SlaveConfigSynchro
lab0_HAL_TIM_SlaveConfigSynchro: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r1, [r7, #0]
	ldr	r0, [r7, #4]
	bl TIM_SlaveTimer_SetConfig
	mov	r3, r0
	cmp	r3, #0
	beq.n lab2_HAL_TIM_SlaveConfigSynchro
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #1
	b.n lab1_HAL_TIM_SlaveConfigSynchro
lab2_HAL_TIM_SlaveConfigSynchro: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #16384	 ;  0x4000
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIM_SlaveConfigSynchro: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_SlaveConfigSynchro_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIM_SlaveConfigSynchro_IT
	movs	r3, #2
	b.n lab1_HAL_TIM_SlaveConfigSynchro_IT
lab0_HAL_TIM_SlaveConfigSynchro_IT: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r1, [r7, #0]
	ldr	r0, [r7, #4]
	bl TIM_SlaveTimer_SetConfig
	mov	r3, r0
	cmp	r3, #0
	beq.n lab2_HAL_TIM_SlaveConfigSynchro_IT
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #1
	b.n lab1_HAL_TIM_SlaveConfigSynchro_IT
lab2_HAL_TIM_SlaveConfigSynchro_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #16384	 ;  0x4000
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIM_SlaveConfigSynchro_IT: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIM_ReadCapturedValue:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	cmp	r3, #12
	bhi.n lab0_HAL_TIM_ReadCapturedValue
	add	r2, pc, #4	 ;  (adr r2, 8086594 <HAL_TIM_ReadCapturedValue+0x1a>)
	ldr.w	pc, [r2, r3, lsl #2]
	.word	0x080865c9
	.word	0x080865f1
	.word	0x080865f1
	.word	0x080865f1
	.word	0x080865d3
	.word	0x080865f1
	.word	0x080865f1
	.word	0x080865f1
	.word	0x080865dd
	.word	0x080865f1
	.word	0x080865f1
	.word	0x080865f1
	.word	0x080865e7
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #52]	 ;  0x34
	str	r3, [r7, #12]
	b.n lab1_HAL_TIM_ReadCapturedValue
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	b.n lab1_HAL_TIM_ReadCapturedValue
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #60]	 ;  0x3c
	str	r3, [r7, #12]
	b.n lab1_HAL_TIM_ReadCapturedValue
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #64]	 ;  0x40
	str	r3, [r7, #12]
	b.n lab1_HAL_TIM_ReadCapturedValue
lab0_HAL_TIM_ReadCapturedValue: 	nop
lab1_HAL_TIM_ReadCapturedValue: 	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_PeriodElapsedCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_PeriodElapsedHalfCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_OC_DelayElapsedCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_IC_CaptureCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_IC_CaptureHalfCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_PWM_PulseFinishedCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_PWM_PulseFinishedHalfCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_TriggerCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_TriggerHalfCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_ErrorCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_Base_GetState:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_OC_GetState:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_PWM_GetState:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_IC_GetState:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_OnePulse_GetState:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIM_Encoder_GetState:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
TIM_DMAError:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r0, [r7, #12]
	bl HAL_TIM_ErrorCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
TIM_DMADelayPulseCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab0_TIM_DMADelayPulseCplt
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMADelayPulseCplt
lab0_TIM_DMADelayPulseCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab2_TIM_DMADelayPulseCplt
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMADelayPulseCplt
lab2_TIM_DMADelayPulseCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab3_TIM_DMADelayPulseCplt
	ldr	r3, [r7, #12]
	movs	r2, #4
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMADelayPulseCplt
lab3_TIM_DMADelayPulseCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab1_TIM_DMADelayPulseCplt
	ldr	r3, [r7, #12]
	movs	r2, #8
	strb	r2, [r3, #28]
lab1_TIM_DMADelayPulseCplt: 	ldr	r0, [r7, #12]
	bl HAL_TIM_PWM_PulseFinishedCallback
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #28]
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
TIM_DMADelayPulseHalfCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab0_TIM_DMADelayPulseHalfCplt
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMADelayPulseHalfCplt
lab0_TIM_DMADelayPulseHalfCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab2_TIM_DMADelayPulseHalfCplt
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMADelayPulseHalfCplt
lab2_TIM_DMADelayPulseHalfCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab3_TIM_DMADelayPulseHalfCplt
	ldr	r3, [r7, #12]
	movs	r2, #4
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMADelayPulseHalfCplt
lab3_TIM_DMADelayPulseHalfCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab1_TIM_DMADelayPulseHalfCplt
	ldr	r3, [r7, #12]
	movs	r2, #8
	strb	r2, [r3, #28]
lab1_TIM_DMADelayPulseHalfCplt: 	ldr	r0, [r7, #12]
	bl HAL_TIM_PWM_PulseFinishedHalfCpltCallback
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #28]
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
TIM_DMACaptureCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab0_TIM_DMACaptureCplt
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMACaptureCplt
lab0_TIM_DMACaptureCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab2_TIM_DMACaptureCplt
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMACaptureCplt
lab2_TIM_DMACaptureCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab3_TIM_DMACaptureCplt
	ldr	r3, [r7, #12]
	movs	r2, #4
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMACaptureCplt
lab3_TIM_DMACaptureCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab1_TIM_DMACaptureCplt
	ldr	r3, [r7, #12]
	movs	r2, #8
	strb	r2, [r3, #28]
lab1_TIM_DMACaptureCplt: 	ldr	r0, [r7, #12]
	bl HAL_TIM_IC_CaptureCallback
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #28]
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
TIM_DMACaptureHalfCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab0_TIM_DMACaptureHalfCplt
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMACaptureHalfCplt
lab0_TIM_DMACaptureHalfCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab2_TIM_DMACaptureHalfCplt
	ldr	r3, [r7, #12]
	movs	r2, #2
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMACaptureHalfCplt
lab2_TIM_DMACaptureHalfCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab3_TIM_DMACaptureHalfCplt
	ldr	r3, [r7, #12]
	movs	r2, #4
	strb	r2, [r3, #28]
	b.n lab1_TIM_DMACaptureHalfCplt
lab3_TIM_DMACaptureHalfCplt: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bne.n lab1_TIM_DMACaptureHalfCplt
	ldr	r3, [r7, #12]
	movs	r2, #8
	strb	r2, [r3, #28]
lab1_TIM_DMACaptureHalfCplt: 	ldr	r0, [r7, #12]
	bl HAL_TIM_IC_CaptureHalfCpltCallback
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb	r2, [r3, #28]
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
TIM_DMAPeriodElapsedCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r0, [r7, #12]
	bl HAL_TIM_PeriodElapsedCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
TIM_DMAPeriodElapsedHalfCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r0, [r7, #12]
	bl HAL_TIM_PeriodElapsedHalfCpltCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
TIM_DMATriggerCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r0, [r7, #12]
	bl HAL_TIM_TriggerCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
TIM_DMATriggerHalfCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r0, [r7, #12]
	bl HAL_TIM_TriggerHalfCpltCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
TIM_Base_SetConfig:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #256]	 ;  (8086af8 <TIM_Base_SetConfig+0x114>)
	cmp	r3, r2
	beq.n lab0_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	cmp.w	r3, #1073741824	 ;  0x40000000
	beq.n lab0_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #244]	 ;  (8086afc <TIM_Base_SetConfig+0x118>)
	cmp	r3, r2
	beq.n lab0_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #240]	 ;  (8086b00 <TIM_Base_SetConfig+0x11c>)
	cmp	r3, r2
	beq.n lab0_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #236]	 ;  (8086b04 <TIM_Base_SetConfig+0x120>)
	cmp	r3, r2
	beq.n lab0_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #232]	 ;  (8086b08 <TIM_Base_SetConfig+0x124>)
	cmp	r3, r2
	bne.n lab1_TIM_Base_SetConfig
lab0_TIM_Base_SetConfig: 	ldr	r3, [r7, #12]
	bic.w	r3, r3, #112	 ;  0x70
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
lab1_TIM_Base_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r2, [pc, #188]	 ;  (8086af8 <TIM_Base_SetConfig+0x114>)
	cmp	r3, r2
	beq.n lab2_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	cmp.w	r3, #1073741824	 ;  0x40000000
	beq.n lab2_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #176]	 ;  (8086afc <TIM_Base_SetConfig+0x118>)
	cmp	r3, r2
	beq.n lab2_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #172]	 ;  (8086b00 <TIM_Base_SetConfig+0x11c>)
	cmp	r3, r2
	beq.n lab2_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #168]	 ;  (8086b04 <TIM_Base_SetConfig+0x120>)
	cmp	r3, r2
	beq.n lab2_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #164]	 ;  (8086b08 <TIM_Base_SetConfig+0x124>)
	cmp	r3, r2
	beq.n lab2_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #160]	 ;  (8086b0c <TIM_Base_SetConfig+0x128>)
	cmp	r3, r2
	beq.n lab2_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #156]	 ;  (8086b10 <TIM_Base_SetConfig+0x12c>)
	cmp	r3, r2
	beq.n lab2_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #152]	 ;  (8086b14 <TIM_Base_SetConfig+0x130>)
	cmp	r3, r2
	beq.n lab2_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #148]	 ;  (8086b18 <TIM_Base_SetConfig+0x134>)
	cmp	r3, r2
	beq.n lab2_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #144]	 ;  (8086b1c <TIM_Base_SetConfig+0x138>)
	cmp	r3, r2
	beq.n lab2_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #140]	 ;  (8086b20 <TIM_Base_SetConfig+0x13c>)
	cmp	r3, r2
	bne.n lab3_TIM_Base_SetConfig
lab2_TIM_Base_SetConfig: 	ldr	r3, [r7, #12]
	bic.w	r3, r3, #768	 ;  0x300
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #12]
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
lab3_TIM_Base_SetConfig: 	ldr	r3, [r7, #12]
	bic.w	r2, r3, #128	 ;  0x80
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #20]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	str	r2, [r3, #44]	 ;  0x2c
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	str	r2, [r3, #40]	 ;  0x28
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #40]	 ;  (8086af8 <TIM_Base_SetConfig+0x114>)
	cmp	r3, r2
	beq.n lab4_TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #48]	 ;  (8086b08 <TIM_Base_SetConfig+0x124>)
	cmp	r3, r2
	bne.n lab5_TIM_Base_SetConfig
lab4_TIM_Base_SetConfig: 	ldr	r3, [r7, #0]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	str	r2, [r3, #48]	 ;  0x30
lab5_TIM_Base_SetConfig: 	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3, #20]
	nop
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x40010000
	.word	0x40000400
	.word	0x40000800
	.word	0x40000c00
	.word	0x40010400
	.word	0x40014000
	.word	0x40014400
	.word	0x40014800
	.word	0x40001800
	.word	0x40001c00
	.word	0x40002000
TIM_OC1_SetConfig:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	bic.w	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #112	 ;  0x70
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #3
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #2
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #8]
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #128]	 ;  (8086bfc <TIM_OC1_SetConfig+0xd8>)
	cmp	r3, r2
	beq.n lab0_TIM_OC1_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #124]	 ;  (8086c00 <TIM_OC1_SetConfig+0xdc>)
	cmp	r3, r2
	bne.n lab1_TIM_OC1_SetConfig
lab0_TIM_OC1_SetConfig: 	ldr	r3, [r7, #20]
	bic.w	r3, r3, #8
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #12]
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #4
	str	r3, [r7, #20]
lab1_TIM_OC1_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r2, [pc, #84]	 ;  (8086bfc <TIM_OC1_SetConfig+0xd8>)
	cmp	r3, r2
	beq.n lab2_TIM_OC1_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #80]	 ;  (8086c00 <TIM_OC1_SetConfig+0xdc>)
	cmp	r3, r2
	bne.n lab3_TIM_OC1_SetConfig
lab2_TIM_OC1_SetConfig: 	ldr	r3, [r7, #16]
	bic.w	r3, r3, #256	 ;  0x100
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #512	 ;  0x200
	str	r3, [r7, #16]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #20]
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #24]
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
lab3_TIM_OC1_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #24]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	str	r2, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #20]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x40010000
	.word	0x40010400
TIM_OC2_SetConfig:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	bic.w	r2, r3, #16
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #28672	 ;  0x7000
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #768	 ;  0x300
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	lsls	r3, r3, #8
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #32
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #8]
	lsls	r3, r3, #4
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #136]	 ;  (8086ce8 <TIM_OC2_SetConfig+0xe4>)
	cmp	r3, r2
	beq.n lab0_TIM_OC2_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #132]	 ;  (8086cec <TIM_OC2_SetConfig+0xe8>)
	cmp	r3, r2
	bne.n lab1_TIM_OC2_SetConfig
lab0_TIM_OC2_SetConfig: 	ldr	r3, [r7, #20]
	bic.w	r3, r3, #128	 ;  0x80
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #12]
	lsls	r3, r3, #4
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #64	 ;  0x40
	str	r3, [r7, #20]
lab1_TIM_OC2_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r2, [pc, #92]	 ;  (8086ce8 <TIM_OC2_SetConfig+0xe4>)
	cmp	r3, r2
	beq.n lab2_TIM_OC2_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #88]	 ;  (8086cec <TIM_OC2_SetConfig+0xe8>)
	cmp	r3, r2
	bne.n lab3_TIM_OC2_SetConfig
lab2_TIM_OC2_SetConfig: 	ldr	r3, [r7, #16]
	bic.w	r3, r3, #1024	 ;  0x400
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #2048	 ;  0x800
	str	r3, [r7, #16]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #20]
	lsls	r3, r3, #2
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #24]
	lsls	r3, r3, #2
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
lab3_TIM_OC2_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #24]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	str	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #20]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x40010000
	.word	0x40010400
TIM_OC3_SetConfig:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	bic.w	r2, r3, #256	 ;  0x100
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #112	 ;  0x70
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #3
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #512	 ;  0x200
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #8]
	lsls	r3, r3, #8
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #132]	 ;  (8086dd0 <TIM_OC3_SetConfig+0xe0>)
	cmp	r3, r2
	beq.n lab0_TIM_OC3_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #128]	 ;  (8086dd4 <TIM_OC3_SetConfig+0xe4>)
	cmp	r3, r2
	bne.n lab1_TIM_OC3_SetConfig
lab0_TIM_OC3_SetConfig: 	ldr	r3, [r7, #20]
	bic.w	r3, r3, #2048	 ;  0x800
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #12]
	lsls	r3, r3, #8
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #1024	 ;  0x400
	str	r3, [r7, #20]
lab1_TIM_OC3_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r2, [pc, #88]	 ;  (8086dd0 <TIM_OC3_SetConfig+0xe0>)
	cmp	r3, r2
	beq.n lab2_TIM_OC3_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #84]	 ;  (8086dd4 <TIM_OC3_SetConfig+0xe4>)
	cmp	r3, r2
	bne.n lab3_TIM_OC3_SetConfig
lab2_TIM_OC3_SetConfig: 	ldr	r3, [r7, #16]
	bic.w	r3, r3, #4096	 ;  0x1000
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #8192	 ;  0x2000
	str	r3, [r7, #16]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #20]
	lsls	r3, r3, #4
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #24]
	lsls	r3, r3, #4
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
lab3_TIM_OC3_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #28]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #20]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	.word	0x40010000
	.word	0x40010400
TIM_OC4_SetConfig:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	bic.w	r2, r3, #4096	 ;  0x1000
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #28672	 ;  0x7000
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #768	 ;  0x300
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	lsls	r3, r3, #8
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #8192	 ;  0x2000
	str	r3, [r7, #16]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #8]
	lsls	r3, r3, #12
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #72]	 ;  (8086e7c <TIM_OC4_SetConfig+0xa4>)
	cmp	r3, r2
	beq.n lab0_TIM_OC4_SetConfig
	ldr	r3, [r7, #4]
	ldr	r2, [pc, #68]	 ;  (8086e80 <TIM_OC4_SetConfig+0xa8>)
	cmp	r3, r2
	bne.n lab1_TIM_OC4_SetConfig
lab0_TIM_OC4_SetConfig: 	ldr	r3, [r7, #20]
	bic.w	r3, r3, #16384	 ;  0x4000
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #20]
	lsls	r3, r3, #6
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
lab1_TIM_OC4_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r2, [r7, #20]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #28]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x40010000
	.word	0x40010400
TIM_SlaveTimer_SetConfig:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #112	 ;  0x70
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #20]
	str	r2, [r3, #8]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	cmp	r3, #48	 ;  0x30
	beq.n lab0_TIM_SlaveTimer_SetConfig
	cmp	r3, #48	 ;  0x30
	bhi.n lab1_TIM_SlaveTimer_SetConfig
	cmp	r3, #16
	beq.n lab0_TIM_SlaveTimer_SetConfig
	cmp	r3, #32
	beq.n lab0_TIM_SlaveTimer_SetConfig
	cmp	r3, #0
	beq.n lab0_TIM_SlaveTimer_SetConfig
	b.n lab2_TIM_SlaveTimer_SetConfig
lab1_TIM_SlaveTimer_SetConfig: 	cmp	r3, #80	 ;  0x50
	beq.n lab3_TIM_SlaveTimer_SetConfig
	cmp	r3, #80	 ;  0x50
	bhi.n lab4_TIM_SlaveTimer_SetConfig
	cmp	r3, #64	 ;  0x40
	beq.n lab5_TIM_SlaveTimer_SetConfig
	b.n lab2_TIM_SlaveTimer_SetConfig
lab4_TIM_SlaveTimer_SetConfig: 	cmp	r3, #96	 ;  0x60
	beq.n lab6_TIM_SlaveTimer_SetConfig
	cmp	r3, #112	 ;  0x70
	beq.n lab7_TIM_SlaveTimer_SetConfig
	b.n lab2_TIM_SlaveTimer_SetConfig
lab7_TIM_SlaveTimer_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #16]
	bl TIM_ETR_SetConfig
	b.n lab2_TIM_SlaveTimer_SetConfig
lab5_TIM_SlaveTimer_SetConfig: 	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	cmp	r3, #5
	bne.n lab8_TIM_SlaveTimer_SetConfig
	movs	r3, #1
	b.n lab9_TIM_SlaveTimer_SetConfig
lab8_TIM_SlaveTimer_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #32]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #24]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #240	 ;  0xf0
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #16]
	lsls	r3, r3, #4
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	str	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	b.n lab2_TIM_SlaveTimer_SetConfig
lab3_TIM_SlaveTimer_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #16]
	mov	r2, r3
	bl TIM_TI1_ConfigInputStage
	b.n lab2_TIM_SlaveTimer_SetConfig
lab6_TIM_SlaveTimer_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #16]
	mov	r2, r3
	bl TIM_TI2_ConfigInputStage
	b.n lab2_TIM_SlaveTimer_SetConfig
lab0_TIM_SlaveTimer_SetConfig: 	nop
lab2_TIM_SlaveTimer_SetConfig: 	movs	r3, #0
lab9_TIM_SlaveTimer_SetConfig: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
TIM_TI1_SetConfig:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic.w	r2, r3, #1
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #24]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [pc, #160]	 ;  (808705c <TIM_TI1_SetConfig+0xcc>)
	cmp	r3, r2
	beq.n lab0_TIM_TI1_SetConfig
	ldr	r3, [r7, #12]
	cmp.w	r3, #1073741824	 ;  0x40000000
	beq.n lab0_TIM_TI1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r2, [pc, #148]	 ;  (8087060 <TIM_TI1_SetConfig+0xd0>)
	cmp	r3, r2
	beq.n lab0_TIM_TI1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r2, [pc, #144]	 ;  (8087064 <TIM_TI1_SetConfig+0xd4>)
	cmp	r3, r2
	beq.n lab0_TIM_TI1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r2, [pc, #140]	 ;  (8087068 <TIM_TI1_SetConfig+0xd8>)
	cmp	r3, r2
	beq.n lab0_TIM_TI1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r2, [pc, #136]	 ;  (808706c <TIM_TI1_SetConfig+0xdc>)
	cmp	r3, r2
	beq.n lab0_TIM_TI1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r2, [pc, #132]	 ;  (8087070 <TIM_TI1_SetConfig+0xe0>)
	cmp	r3, r2
	beq.n lab0_TIM_TI1_SetConfig
	ldr	r3, [r7, #12]
	ldr	r2, [pc, #128]	 ;  (8087074 <TIM_TI1_SetConfig+0xe4>)
	cmp	r3, r2
	bne.n lab1_TIM_TI1_SetConfig
lab0_TIM_TI1_SetConfig: 	movs	r3, #1
	b.n lab2_TIM_TI1_SetConfig
lab1_TIM_TI1_SetConfig: 	movs	r3, #0
lab2_TIM_TI1_SetConfig: 	cmp	r3, #0
	beq.n lab3_TIM_TI1_SetConfig
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #3
	str	r3, [r7, #20]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #20]
	b.n lab4_TIM_TI1_SetConfig
lab3_TIM_TI1_SetConfig: 	ldr	r3, [r7, #20]
	orr.w	r3, r3, #1
	str	r3, [r7, #20]
lab4_TIM_TI1_SetConfig: 	ldr	r3, [r7, #20]
	bic.w	r3, r3, #240	 ;  0xf0
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	lsls	r3, r3, #4
	uxtb	r3, r3
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #10
	str	r3, [r7, #16]
	ldr	r3, [r7, #8]
	and.w	r3, r3, #10
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x40010000
	.word	0x40000400
	.word	0x40000800
	.word	0x40000c00
	.word	0x40010400
	.word	0x40014000
	.word	0x40001800
TIM_TI1_ConfigInputStage:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic.w	r2, r3, #1
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #24]
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #240	 ;  0xf0
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #10
	str	r3, [r7, #20]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #8]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
TIM_TI2_SetConfig:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic.w	r2, r3, #16
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #24]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #768	 ;  0x300
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #8
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #61440	 ;  0xf000
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	lsls	r3, r3, #12
	uxth	r3, r3
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #160	 ;  0xa0
	str	r3, [r7, #16]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #4
	and.w	r3, r3, #160	 ;  0xa0
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
TIM_TI2_ConfigInputStage:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic.w	r2, r3, #16
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #24]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #61440	 ;  0xf000
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #12
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #160	 ;  0xa0
	str	r3, [r7, #16]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #4
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #24]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
TIM_TI3_SetConfig:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic.w	r2, r3, #256	 ;  0x100
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #28]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #3
	str	r3, [r7, #20]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #240	 ;  0xf0
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	lsls	r3, r3, #4
	uxtb	r3, r3
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #2560	 ;  0xa00
	str	r3, [r7, #16]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #8
	and.w	r3, r3, #2560	 ;  0xa00
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
TIM_TI4_SetConfig:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	bic.w	r2, r3, #4096	 ;  0x1000
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #28]
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #32]
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #768	 ;  0x300
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #8
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #61440	 ;  0xf000
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	lsls	r3, r3, #12
	uxth	r3, r3
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	bic.w	r3, r3, #40960	 ;  0xa000
	str	r3, [r7, #16]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #12
	and.w	r3, r3, #40960	 ;  0xa000
	ldr	r2, [r7, #16]
	orrs	r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #28]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
TIM_ITRx_SetConfig:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #112	 ;  0x70
	str	r3, [r7, #12]
	ldr	r2, [r7, #0]
	ldr	r3, [r7, #12]
	orrs	r3, r2
	orr.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #8]
	nop
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
TIM_ETR_SetConfig:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	bic.w	r3, r3, #65280	 ;  0xff00
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	lsls	r2, r3, #8
	ldr	r3, [r7, #4]
	orrs	r2, r3
	ldr	r3, [r7, #8]
	orrs	r3, r2
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #8]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
TIM_CCxChannelCmd:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #8]
	and.w	r3, r3, #31
	movs	r2, #1
	lsl.w	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #32]
	ldr	r3, [r7, #20]
	mvns	r3, r3
	ands	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #32]
	ldr	r3, [r7, #8]
	and.w	r3, r3, #31
	ldr	r1, [r7, #4]
	lsl.w	r3, r1, r3
	orrs	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
HAL_TIMEx_HallSensor_Init:
	push	{r7, lr}
	sub	sp, #40	 ;  0x28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_HallSensor_Init
	movs	r3, #1
	b.n lab1_HAL_TIMEx_HallSensor_Init
lab0_HAL_TIMEx_HallSensor_Init: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #0
	bne.n lab2_HAL_TIMEx_HallSensor_Init
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r0, [r7, #4]
	bl HAL_TIMEx_HallSensor_MspInit
lab2_HAL_TIMEx_HallSensor_Init: 	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	adds	r3, #4
	mov	r1, r3
	mov	r0, r2
	bl TIM_Base_SetConfig
	ldr	r3, [r7, #4]
	ldr	r0, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #8]
	movs	r2, #3
	bl TIM_TI1_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #12
	str	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #24]
	ldr	r3, [r7, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #112	 ;  0x70
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #7
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4
	str	r2, [r3, #8]
	movs	r3, #0
	str	r3, [r7, #28]
	movs	r3, #0
	str	r3, [r7, #32]
	movs	r3, #112	 ;  0x70
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #36]	 ;  0x24
	movs	r3, #0
	str	r3, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #12]
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	add.w	r2, r7, #12
	mov	r1, r2
	mov	r0, r3
	bl TIM_OC2_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #112	 ;  0x70
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #80	 ;  0x50
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
lab1_HAL_TIMEx_HallSensor_Init: 	mov	r0, r3
	adds	r7, #40	 ;  0x28
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_HallSensor_DeInit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_HallSensor_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_HallSensor_DeInit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIMEx_HallSensor_DeInit: 	ldr	r0, [r7, #4]
	bl HAL_TIMEx_HallSensor_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_HallSensor_MspInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIMEx_HallSensor_MspDeInit:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIMEx_HallSensor_Start:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab0_HAL_TIMEx_HallSensor_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIMEx_HallSensor_Start: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_HallSensor_Stop:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_HallSensor_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_HallSensor_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIMEx_HallSensor_Stop: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_HallSensor_Start_IT:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab0_HAL_TIMEx_HallSensor_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIMEx_HallSensor_Start_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_HallSensor_Stop_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_HallSensor_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_HallSensor_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIMEx_HallSensor_Stop_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_HallSensor_Start_DMA:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #2
	bne.n lab0_HAL_TIMEx_HallSensor_Start_DMA
	movs	r3, #2
	b.n lab1_HAL_TIMEx_HallSensor_Start_DMA
lab0_HAL_TIMEx_HallSensor_Start_DMA: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_TIMEx_HallSensor_Start_DMA
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne.n lab3_HAL_TIMEx_HallSensor_Start_DMA
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	beq.n lab3_HAL_TIMEx_HallSensor_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIMEx_HallSensor_Start_DMA
lab3_HAL_TIMEx_HallSensor_Start_DMA: 	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
lab2_HAL_TIMEx_HallSensor_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	movs	r2, #1
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #108]	 ;  (808771c <HAL_TIMEx_HallSensor_Start_DMA+0xc2>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #104]	 ;  (8087720 <HAL_TIMEx_HallSensor_Start_DMA+0xc6>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #100]	 ;  (8087724 <HAL_TIMEx_HallSensor_Start_DMA+0xca>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]	 ;  0x24
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #52	 ;  0x34
	mov	r1, r3
	ldr	r2, [r7, #8]
	ldrh	r3, [r7, #6]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab4_HAL_TIMEx_HallSensor_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIMEx_HallSensor_Start_DMA
lab4_HAL_TIMEx_HallSensor_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq.n lab5_HAL_TIMEx_HallSensor_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab5_HAL_TIMEx_HallSensor_Start_DMA: 	movs	r3, #0
lab1_HAL_TIMEx_HallSensor_Start_DMA: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
	.word	0x08086875
	.word	0x080868e5
	.word	0x08086771
HAL_TIMEx_HallSensor_Stop_DMA:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	movs	r1, #0
	mov	r0, r3
	bl TIM_CCxChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_HallSensor_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_HallSensor_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIMEx_HallSensor_Stop_DMA: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_OCN_Start:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #4
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab0_HAL_TIMEx_OCN_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIMEx_OCN_Start: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_OCN_Stop:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_OCN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_OCN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab0_HAL_TIMEx_OCN_Stop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab1_HAL_TIMEx_OCN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab1_HAL_TIMEx_OCN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab1_HAL_TIMEx_OCN_Stop: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_OCN_Start_IT:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #4
	beq.n lab0_HAL_TIMEx_OCN_Start_IT
	cmp	r3, #8
	beq.n lab1_HAL_TIMEx_OCN_Start_IT
	cmp	r3, #0
	beq.n lab2_HAL_TIMEx_OCN_Start_IT
	b.n lab3_HAL_TIMEx_OCN_Start_IT
lab2_HAL_TIMEx_OCN_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab3_HAL_TIMEx_OCN_Start_IT
lab0_HAL_TIMEx_OCN_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab3_HAL_TIMEx_OCN_Start_IT
lab1_HAL_TIMEx_OCN_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8
	str	r2, [r3, #12]
	nop
lab3_HAL_TIMEx_OCN_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #4
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab4_HAL_TIMEx_OCN_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab4_HAL_TIMEx_OCN_Start_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_OCN_Stop_IT:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #4
	beq.n lab0_HAL_TIMEx_OCN_Stop_IT
	cmp	r3, #8
	beq.n lab1_HAL_TIMEx_OCN_Stop_IT
	cmp	r3, #0
	beq.n lab2_HAL_TIMEx_OCN_Stop_IT
	b.n lab3_HAL_TIMEx_OCN_Stop_IT
lab2_HAL_TIMEx_OCN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab3_HAL_TIMEx_OCN_Stop_IT
lab0_HAL_TIMEx_OCN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab3_HAL_TIMEx_OCN_Stop_IT
lab1_HAL_TIMEx_OCN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8
	str	r2, [r3, #12]
	nop
lab3_HAL_TIMEx_OCN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #32]
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIMEx_OCN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #12]
lab4_HAL_TIMEx_OCN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIMEx_OCN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIMEx_OCN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab5_HAL_TIMEx_OCN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIMEx_OCN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIMEx_OCN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab6_HAL_TIMEx_OCN_Stop_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_OCN_Start_DMA:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strh	r3, [r7, #2]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #2
	bne.n lab0_HAL_TIMEx_OCN_Start_DMA
	movs	r3, #2
	b.n lab1_HAL_TIMEx_OCN_Start_DMA
lab0_HAL_TIMEx_OCN_Start_DMA: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_TIMEx_OCN_Start_DMA
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab3_HAL_TIMEx_OCN_Start_DMA
	ldrh	r3, [r7, #2]
	cmp	r3, #0
	beq.n lab3_HAL_TIMEx_OCN_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIMEx_OCN_Start_DMA
lab3_HAL_TIMEx_OCN_Start_DMA: 	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
lab2_HAL_TIMEx_OCN_Start_DMA: 	ldr	r3, [r7, #8]
	cmp	r3, #4
	beq.n lab4_HAL_TIMEx_OCN_Start_DMA
	cmp	r3, #8
	beq.n lab5_HAL_TIMEx_OCN_Start_DMA
	cmp	r3, #0
	beq.n lab6_HAL_TIMEx_OCN_Start_DMA
	b.n lab7_HAL_TIMEx_OCN_Start_DMA
lab6_HAL_TIMEx_OCN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #284]	 ;  (8087b74 <HAL_TIMEx_OCN_Start_DMA+0x176>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #280]	 ;  (8087b78 <HAL_TIMEx_OCN_Start_DMA+0x17a>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #276]	 ;  (8087b7c <HAL_TIMEx_OCN_Start_DMA+0x17e>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]	 ;  0x24
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #52	 ;  0x34
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab8_HAL_TIMEx_OCN_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIMEx_OCN_Start_DMA
lab8_HAL_TIMEx_OCN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	b.n lab7_HAL_TIMEx_OCN_Start_DMA
lab4_HAL_TIMEx_OCN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #212]	 ;  (8087b74 <HAL_TIMEx_OCN_Start_DMA+0x176>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #208]	 ;  (8087b78 <HAL_TIMEx_OCN_Start_DMA+0x17a>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #204]	 ;  (8087b7c <HAL_TIMEx_OCN_Start_DMA+0x17e>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]	 ;  0x28
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #56	 ;  0x38
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab9_HAL_TIMEx_OCN_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIMEx_OCN_Start_DMA
lab9_HAL_TIMEx_OCN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	b.n lab7_HAL_TIMEx_OCN_Start_DMA
lab5_HAL_TIMEx_OCN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #140]	 ;  (8087b74 <HAL_TIMEx_OCN_Start_DMA+0x176>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #136]	 ;  (8087b78 <HAL_TIMEx_OCN_Start_DMA+0x17a>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #132]	 ;  (8087b7c <HAL_TIMEx_OCN_Start_DMA+0x17e>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]	 ;  0x2c
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #60	 ;  0x3c
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab10_HAL_TIMEx_OCN_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIMEx_OCN_Start_DMA
lab10_HAL_TIMEx_OCN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #12]
	nop
lab7_HAL_TIMEx_OCN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	movs	r2, #4
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq.n lab11_HAL_TIMEx_OCN_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab11_HAL_TIMEx_OCN_Start_DMA: 	movs	r3, #0
lab1_HAL_TIMEx_OCN_Start_DMA: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08086795
	.word	0x08086805
	.word	0x08086771
HAL_TIMEx_OCN_Stop_DMA:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #4
	beq.n lab0_HAL_TIMEx_OCN_Stop_DMA
	cmp	r3, #8
	beq.n lab1_HAL_TIMEx_OCN_Stop_DMA
	cmp	r3, #0
	beq.n lab2_HAL_TIMEx_OCN_Stop_DMA
	b.n lab3_HAL_TIMEx_OCN_Stop_DMA
lab2_HAL_TIMEx_OCN_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab3_HAL_TIMEx_OCN_Stop_DMA
lab0_HAL_TIMEx_OCN_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab3_HAL_TIMEx_OCN_Stop_DMA
lab1_HAL_TIMEx_OCN_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	nop
lab3_HAL_TIMEx_OCN_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIMEx_OCN_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIMEx_OCN_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab4_HAL_TIMEx_OCN_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIMEx_OCN_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIMEx_OCN_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab5_HAL_TIMEx_OCN_Stop_DMA: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_PWMN_Start:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #4
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab0_HAL_TIMEx_PWMN_Start
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab0_HAL_TIMEx_PWMN_Start: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_PWMN_Stop:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_PWMN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_PWMN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab0_HAL_TIMEx_PWMN_Stop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab1_HAL_TIMEx_PWMN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab1_HAL_TIMEx_PWMN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab1_HAL_TIMEx_PWMN_Stop: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_PWMN_Start_IT:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #4
	beq.n lab0_HAL_TIMEx_PWMN_Start_IT
	cmp	r3, #8
	beq.n lab1_HAL_TIMEx_PWMN_Start_IT
	cmp	r3, #0
	beq.n lab2_HAL_TIMEx_PWMN_Start_IT
	b.n lab3_HAL_TIMEx_PWMN_Start_IT
lab2_HAL_TIMEx_PWMN_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab3_HAL_TIMEx_PWMN_Start_IT
lab0_HAL_TIMEx_PWMN_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab3_HAL_TIMEx_PWMN_Start_IT
lab1_HAL_TIMEx_PWMN_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8
	str	r2, [r3, #12]
	nop
lab3_HAL_TIMEx_PWMN_Start_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #4
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #6
	beq.n lab4_HAL_TIMEx_PWMN_Start_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab4_HAL_TIMEx_PWMN_Start_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_PWMN_Stop_IT:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #4
	beq.n lab0_HAL_TIMEx_PWMN_Stop_IT
	cmp	r3, #8
	beq.n lab1_HAL_TIMEx_PWMN_Stop_IT
	cmp	r3, #0
	beq.n lab2_HAL_TIMEx_PWMN_Stop_IT
	b.n lab3_HAL_TIMEx_PWMN_Stop_IT
lab2_HAL_TIMEx_PWMN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2
	str	r2, [r3, #12]
	b.n lab3_HAL_TIMEx_PWMN_Stop_IT
lab0_HAL_TIMEx_PWMN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #12]
	b.n lab3_HAL_TIMEx_PWMN_Stop_IT
lab1_HAL_TIMEx_PWMN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8
	str	r2, [r3, #12]
	nop
lab3_HAL_TIMEx_PWMN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #32]
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIMEx_PWMN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #12]
lab4_HAL_TIMEx_PWMN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIMEx_PWMN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIMEx_PWMN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab5_HAL_TIMEx_PWMN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIMEx_PWMN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab6_HAL_TIMEx_PWMN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab6_HAL_TIMEx_PWMN_Stop_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_PWMN_Start_DMA:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strh	r3, [r7, #2]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #2
	bne.n lab0_HAL_TIMEx_PWMN_Start_DMA
	movs	r3, #2
	b.n lab1_HAL_TIMEx_PWMN_Start_DMA
lab0_HAL_TIMEx_PWMN_Start_DMA: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	cmp	r3, #1
	bne.n lab2_HAL_TIMEx_PWMN_Start_DMA
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab3_HAL_TIMEx_PWMN_Start_DMA
	ldrh	r3, [r7, #2]
	cmp	r3, #0
	beq.n lab3_HAL_TIMEx_PWMN_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIMEx_PWMN_Start_DMA
lab3_HAL_TIMEx_PWMN_Start_DMA: 	ldr	r3, [r7, #12]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
lab2_HAL_TIMEx_PWMN_Start_DMA: 	ldr	r3, [r7, #8]
	cmp	r3, #4
	beq.n lab4_HAL_TIMEx_PWMN_Start_DMA
	cmp	r3, #8
	beq.n lab5_HAL_TIMEx_PWMN_Start_DMA
	cmp	r3, #0
	beq.n lab6_HAL_TIMEx_PWMN_Start_DMA
	b.n lab7_HAL_TIMEx_PWMN_Start_DMA
lab6_HAL_TIMEx_PWMN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #284]	 ;  (8088050 <HAL_TIMEx_PWMN_Start_DMA+0x176>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #280]	 ;  (8088054 <HAL_TIMEx_PWMN_Start_DMA+0x17a>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #36]	 ;  0x24
	ldr	r2, [pc, #276]	 ;  (8088058 <HAL_TIMEx_PWMN_Start_DMA+0x17e>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #36]	 ;  0x24
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #52	 ;  0x34
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab8_HAL_TIMEx_PWMN_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIMEx_PWMN_Start_DMA
lab8_HAL_TIMEx_PWMN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	b.n lab7_HAL_TIMEx_PWMN_Start_DMA
lab4_HAL_TIMEx_PWMN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #212]	 ;  (8088050 <HAL_TIMEx_PWMN_Start_DMA+0x176>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #208]	 ;  (8088054 <HAL_TIMEx_PWMN_Start_DMA+0x17a>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]	 ;  0x28
	ldr	r2, [pc, #204]	 ;  (8088058 <HAL_TIMEx_PWMN_Start_DMA+0x17e>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #40]	 ;  0x28
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #56	 ;  0x38
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab9_HAL_TIMEx_PWMN_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIMEx_PWMN_Start_DMA
lab9_HAL_TIMEx_PWMN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	b.n lab7_HAL_TIMEx_PWMN_Start_DMA
lab5_HAL_TIMEx_PWMN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #140]	 ;  (8088050 <HAL_TIMEx_PWMN_Start_DMA+0x176>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #136]	 ;  (8088054 <HAL_TIMEx_PWMN_Start_DMA+0x17a>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #44]	 ;  0x2c
	ldr	r2, [pc, #132]	 ;  (8088058 <HAL_TIMEx_PWMN_Start_DMA+0x17e>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #44]	 ;  0x2c
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #60	 ;  0x3c
	mov	r2, r3
	ldrh	r3, [r7, #2]
	bl HAL_DMA_Start_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab10_HAL_TIMEx_PWMN_Start_DMA
	movs	r3, #1
	b.n lab1_HAL_TIMEx_PWMN_Start_DMA
lab10_HAL_TIMEx_PWMN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #12]
	nop
lab7_HAL_TIMEx_PWMN_Start_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	movs	r2, #4
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	and.w	r3, r3, #7
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #6
	beq.n lab11_HAL_TIMEx_PWMN_Start_DMA
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #0]
lab11_HAL_TIMEx_PWMN_Start_DMA: 	movs	r3, #0
lab1_HAL_TIMEx_PWMN_Start_DMA: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08086795
	.word	0x08086805
	.word	0x08086771
HAL_TIMEx_PWMN_Stop_DMA:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #0]
	cmp	r3, #4
	beq.n lab0_HAL_TIMEx_PWMN_Stop_DMA
	cmp	r3, #8
	beq.n lab1_HAL_TIMEx_PWMN_Stop_DMA
	cmp	r3, #0
	beq.n lab2_HAL_TIMEx_PWMN_Stop_DMA
	b.n lab3_HAL_TIMEx_PWMN_Stop_DMA
lab2_HAL_TIMEx_PWMN_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #512	 ;  0x200
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]	 ;  0x24
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab3_HAL_TIMEx_PWMN_Stop_DMA
lab0_HAL_TIMEx_PWMN_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1024	 ;  0x400
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	b.n lab3_HAL_TIMEx_PWMN_Stop_DMA
lab1_HAL_TIMEx_PWMN_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #44]	 ;  0x2c
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	nop
lab3_HAL_TIMEx_PWMN_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIMEx_PWMN_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab4_HAL_TIMEx_PWMN_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab4_HAL_TIMEx_PWMN_Stop_DMA: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIMEx_PWMN_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab5_HAL_TIMEx_PWMN_Stop_DMA
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab5_HAL_TIMEx_PWMN_Stop_DMA: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_OnePulseN_Start:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #4
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_OnePulseN_Stop:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_OnePulseN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_OnePulseN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab0_HAL_TIMEx_OnePulseN_Stop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab1_HAL_TIMEx_OnePulseN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab1_HAL_TIMEx_OnePulseN_Stop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab1_HAL_TIMEx_OnePulseN_Stop: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_OnePulseN_Start_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #4
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #4
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_OnePulseN_Stop_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	movs	r2, #0
	ldr	r1, [r7, #0]
	mov	r0, r3
	bl TIM_CCxNChannelCmd
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_OnePulseN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab0_HAL_TIMEx_OnePulseN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32768	 ;  0x8000
	str	r2, [r3, #68]	 ;  0x44
lab0_HAL_TIMEx_OnePulseN_Stop_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #4369	 ;  0x1111
	ands	r3, r2
	cmp	r3, #0
	bne.n lab1_HAL_TIMEx_OnePulseN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #32]
	movw	r3, #1092	 ;  0x444
	ands	r3, r2
	cmp	r3, #0
	bne.n lab1_HAL_TIMEx_OnePulseN_Stop_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #0]
lab1_HAL_TIMEx_OnePulseN_Stop_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_TIMEx_ConfigCommutEvent:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIMEx_ConfigCommutEvent
	movs	r3, #2
	b.n lab1_HAL_TIMEx_ConfigCommutEvent
lab0_HAL_TIMEx_ConfigCommutEvent: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq.n lab2_HAL_TIMEx_ConfigCommutEvent
	ldr	r3, [r7, #8]
	cmp	r3, #16
	beq.n lab2_HAL_TIMEx_ConfigCommutEvent
	ldr	r3, [r7, #8]
	cmp	r3, #32
	beq.n lab2_HAL_TIMEx_ConfigCommutEvent
	ldr	r3, [r7, #8]
	cmp	r3, #48	 ;  0x30
	bne.n lab3_HAL_TIMEx_ConfigCommutEvent
lab2_HAL_TIMEx_ConfigCommutEvent: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #112	 ;  0x70
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #8]
	orrs	r2, r1
	str	r2, [r3, #8]
lab3_HAL_TIMEx_ConfigCommutEvent: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIMEx_ConfigCommutEvent: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIMEx_ConfigCommutEvent_IT:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIMEx_ConfigCommutEvent_IT
	movs	r3, #2
	b.n lab1_HAL_TIMEx_ConfigCommutEvent_IT
lab0_HAL_TIMEx_ConfigCommutEvent_IT: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq.n lab2_HAL_TIMEx_ConfigCommutEvent_IT
	ldr	r3, [r7, #8]
	cmp	r3, #16
	beq.n lab2_HAL_TIMEx_ConfigCommutEvent_IT
	ldr	r3, [r7, #8]
	cmp	r3, #32
	beq.n lab2_HAL_TIMEx_ConfigCommutEvent_IT
	ldr	r3, [r7, #8]
	cmp	r3, #48	 ;  0x30
	bne.n lab3_HAL_TIMEx_ConfigCommutEvent_IT
lab2_HAL_TIMEx_ConfigCommutEvent_IT: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #112	 ;  0x70
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #8]
	orrs	r2, r1
	str	r2, [r3, #8]
lab3_HAL_TIMEx_ConfigCommutEvent_IT: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIMEx_ConfigCommutEvent_IT: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIMEx_ConfigCommutEvent_DMA:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIMEx_ConfigCommutEvent_DMA
	movs	r3, #2
	b.n lab1_HAL_TIMEx_ConfigCommutEvent_DMA
lab0_HAL_TIMEx_ConfigCommutEvent_DMA: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq.n lab2_HAL_TIMEx_ConfigCommutEvent_DMA
	ldr	r3, [r7, #8]
	cmp	r3, #16
	beq.n lab2_HAL_TIMEx_ConfigCommutEvent_DMA
	ldr	r3, [r7, #8]
	cmp	r3, #32
	beq.n lab2_HAL_TIMEx_ConfigCommutEvent_DMA
	ldr	r3, [r7, #8]
	cmp	r3, #48	 ;  0x30
	bne.n lab3_HAL_TIMEx_ConfigCommutEvent_DMA
lab2_HAL_TIMEx_ConfigCommutEvent_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #112	 ;  0x70
	str	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #8]
	orrs	r2, r1
	str	r2, [r3, #8]
lab3_HAL_TIMEx_ConfigCommutEvent_DMA: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #4
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #72]	 ;  (808854c <HAL_TIMEx_ConfigCommutEvent_DMA+0xda>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #68]	 ;  (8088550 <HAL_TIMEx_ConfigCommutEvent_DMA+0xde>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #64]	 ;  (8088554 <HAL_TIMEx_ConfigCommutEvent_DMA+0xe2>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIMEx_ConfigCommutEvent_DMA: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x0808871d
	.word	0x08088741
	.word	0x08086771
HAL_TIMEx_MasterConfigSynchronization:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIMEx_MasterConfigSynchronization
	movs	r3, #2
	b.n lab1_HAL_TIMEx_MasterConfigSynchronization
lab0_HAL_TIMEx_MasterConfigSynchronization: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #8]
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #112	 ;  0x70
	str	r3, [r7, #12]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	bic.w	r3, r3, #128	 ;  0x80
	str	r3, [r7, #8]
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #8]
	orrs	r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #8]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIMEx_MasterConfigSynchronization: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIMEx_ConfigBreakDeadTime:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIMEx_ConfigBreakDeadTime
	movs	r3, #2
	b.n lab1_HAL_TIMEx_ConfigBreakDeadTime
lab0_HAL_TIMEx_ConfigBreakDeadTime: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	bic.w	r2, r3, #255	 ;  0xff
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r2, r3, #768	 ;  0x300
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #8]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r2, r3, #1024	 ;  0x400
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r2, r3, #2048	 ;  0x800
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #0]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r2, r3, #4096	 ;  0x1000
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #16]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r2, r3, #8192	 ;  0x2000
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #20]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r2, r3, #16384	 ;  0x4000
	ldr	r3, [r7, #0]
	ldr	r3, [r3, #28]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	str	r2, [r3, #68]	 ;  0x44
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIMEx_ConfigBreakDeadTime: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIMEx_RemapConfig:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #1
	bne.n lab0_HAL_TIMEx_RemapConfig
	movs	r3, #2
	b.n lab1_HAL_TIMEx_RemapConfig
lab0_HAL_TIMEx_RemapConfig: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #0]
	str	r2, [r3, #80]	 ;  0x50
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #60]	 ;  0x3c
	movs	r3, #0
lab1_HAL_TIMEx_RemapConfig: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIMEx_CommutCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIMEx_CommutHalfCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIMEx_BreakCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_TIMEx_HallSensor_GetState:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #61]	 ;  0x3d
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
TIMEx_DMACommutationCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r0, [r7, #12]
	bl HAL_TIMEx_CommutCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
TIMEx_DMACommutationHalfCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #61]	 ;  0x3d
	ldr	r0, [r7, #12]
	bl HAL_TIMEx_CommutHalfCpltCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
TIM_CCxNChannelCmd:
	push	{r7}
	sub	sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #8]
	and.w	r3, r3, #31
	movs	r2, #4
	lsl.w	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #32]
	ldr	r3, [r7, #20]
	mvns	r3, r3
	ands	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #32]
	ldr	r3, [r7, #8]
	and.w	r3, r3, #31
	ldr	r1, [r7, #4]
	lsl.w	r3, r1, r3
	orrs	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	nop
	adds	r7, #28
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
HAL_UART_Init:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_UART_Init
	movs	r3, #1
	b.n lab1_HAL_UART_Init
lab0_HAL_UART_Init: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #0
	bne.n lab2_HAL_UART_Init
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r0, [r7, #4]
	bl HAL_UART_MspInit
	push{r1, r2}
	mov.w r1, #30
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
lab2_HAL_UART_Init: 	ldr	r3, [r7, #4]
	movs	r2, #36	 ;  0x24
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r0, [r7, #4]
	bl UART_SetConfig
	push{r1, r2}
	mov.w r1, #36
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #18432	 ;  0x4800
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #42	 ;  0x2a
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	movs	r3, #0
lab1_HAL_UART_Init: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #27
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
HAL_HalfDuplex_Init:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_HalfDuplex_Init
	movs	r3, #1
	b.n lab1_HAL_HalfDuplex_Init
lab0_HAL_HalfDuplex_Init: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #0
	bne.n lab2_HAL_HalfDuplex_Init
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r0, [r7, #4]
	bl HAL_UART_MspInit
lab2_HAL_HalfDuplex_Init: 	ldr	r3, [r7, #4]
	movs	r2, #36	 ;  0x24
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r0, [r7, #4]
	bl UART_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #18432	 ;  0x4800
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #34	 ;  0x22
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	movs	r3, #0
lab1_HAL_HalfDuplex_Init: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_LIN_Init:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_LIN_Init
	movs	r3, #1
	b.n lab1_HAL_LIN_Init
lab0_HAL_LIN_Init: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #0
	bne.n lab2_HAL_LIN_Init
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r0, [r7, #4]
	bl HAL_UART_MspInit
lab2_HAL_LIN_Init: 	ldr	r3, [r7, #4]
	movs	r2, #36	 ;  0x24
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r0, [r7, #4]
	bl UART_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #42	 ;  0x2a
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #16384	 ;  0x4000
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #0]
	orrs	r2, r1
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	movs	r3, #0
lab1_HAL_LIN_Init: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_MultiProcessor_Init:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	mov	r3, r1
	str	r2, [r7, #4]
	strb	r3, [r7, #11]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne.n lab0_HAL_MultiProcessor_Init
	movs	r3, #1
	b.n lab1_HAL_MultiProcessor_Init
lab0_HAL_MultiProcessor_Init: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #0
	bne.n lab2_HAL_MultiProcessor_Init
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r0, [r7, #12]
	bl HAL_UART_MspInit
lab2_HAL_MultiProcessor_Init: 	ldr	r3, [r7, #12]
	movs	r2, #36	 ;  0x24
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r0, [r7, #12]
	bl UART_SetConfig
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #18432	 ;  0x4800
	str	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #42	 ;  0x2a
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #15
	str	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #16]
	ldrb	r2, [r7, #11]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2048	 ;  0x800
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	movs	r3, #0
lab1_HAL_MultiProcessor_Init: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_UART_DeInit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne.n lab0_HAL_UART_DeInit
	movs	r3, #1
	b.n lab1_HAL_UART_DeInit
lab0_HAL_UART_DeInit: 	ldr	r3, [r7, #4]
	movs	r2, #36	 ;  0x24
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #8192	 ;  0x2000
	str	r2, [r3, #12]
	ldr	r0, [r7, #4]
	bl HAL_UART_MspDeInit
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	movs	r3, #0
lab1_HAL_UART_DeInit: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_Transmit:
	push	{r7, lr}
	sub	sp, #32
	add	r7, sp, #8
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r3, [r7, #0]
	mov	r3, r2
	strh	r3, [r7, #6]
	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #32
	bne.w lab0_HAL_UART_Transmit
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq.n lab1_HAL_UART_Transmit
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne.n lab2_HAL_UART_Transmit
lab1_HAL_UART_Transmit: 	movs	r3, #1
	b.n lab3_HAL_UART_Transmit
lab2_HAL_UART_Transmit: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab4_HAL_UART_Transmit
	movs	r3, #2
	b.n lab3_HAL_UART_Transmit
lab4_HAL_UART_Transmit: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #33	 ;  0x21
	strb.w	r2, [r3, #57]	 ;  0x39
	bl HAL_GetTick
	str	r0, [r7, #20]
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]
	strh	r2, [r3, #36]	 ;  0x24
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]
	strh	r2, [r3, #38]	 ;  0x26
	b.n lab5_HAL_UART_Transmit
lab10_HAL_UART_Transmit: 	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #38]	 ;  0x26
	uxth	r3, r3
	subs	r3, #1
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	cmp.w	r3, #4096	 ;  0x1000
	bne.n lab6_HAL_UART_Transmit
	ldr	r3, [r7, #0]
	str	r3, [sp, #0]
	ldr	r3, [r7, #20]
	movs	r2, #0
	movs	r1, #128	 ;  0x80
	ldr	r0, [r7, #12]
	push {r1, r2}
	mov.w r1, #131
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl UART_WaitOnFlagUntilTimeout
	push{r1, r2}
	mov.w r1, #131
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	beq.n lab7_HAL_UART_Transmit
	movs	r3, #3
	b.n lab3_HAL_UART_Transmit
lab7_HAL_UART_Transmit: 	ldr	r3, [r7, #8]
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ubfx	r2, r2, #0, #9
	str	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne.n lab8_HAL_UART_Transmit
	ldr	r3, [r7, #8]
	adds	r3, #2
	str	r3, [r7, #8]
	b.n lab5_HAL_UART_Transmit
lab8_HAL_UART_Transmit: 	ldr	r3, [r7, #8]
	adds	r3, #1
	str	r3, [r7, #8]
	b.n lab5_HAL_UART_Transmit
lab6_HAL_UART_Transmit: 	ldr	r3, [r7, #0]
	str	r3, [sp, #0]
	ldr	r3, [r7, #20]
	movs	r2, #0
	movs	r1, #128	 ;  0x80
	ldr	r0, [r7, #12]
	push {r1, r2}
	mov.w r1, #131
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl UART_WaitOnFlagUntilTimeout
	push{r1, r2}
	mov.w r1, #131
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	beq.n lab9_HAL_UART_Transmit
	movs	r3, #3
	b.n lab3_HAL_UART_Transmit
lab9_HAL_UART_Transmit: 	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	str	r2, [r3, #4]
lab5_HAL_UART_Transmit: 	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #38]	 ;  0x26
	uxth	r3, r3
	cmp	r3, #0
	bne.n lab10_HAL_UART_Transmit
	ldr	r3, [r7, #0]
	str	r3, [sp, #0]
	ldr	r3, [r7, #20]
	movs	r2, #0
	movs	r1, #64	 ;  0x40
	ldr	r0, [r7, #12]
	push {r1, r2}
	mov.w r1, #131
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl UART_WaitOnFlagUntilTimeout
	push{r1, r2}
	mov.w r1, #131
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	beq.n lab11_HAL_UART_Transmit
	movs	r3, #3
	b.n lab3_HAL_UART_Transmit
lab11_HAL_UART_Transmit: 	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	movs	r3, #0
	b.n lab3_HAL_UART_Transmit
lab0_HAL_UART_Transmit: 	movs	r3, #2
lab3_HAL_UART_Transmit: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #129
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
HAL_UART_Receive:
	push	{r7, lr}
	sub	sp, #32
	add	r7, sp, #8
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r3, [r7, #0]
	mov	r3, r2
	strh	r3, [r7, #6]
	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #58]	 ;  0x3a
	uxtb	r3, r3
	cmp	r3, #32
	bne.w lab0_HAL_UART_Receive
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq.n lab1_HAL_UART_Receive
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne.n lab2_HAL_UART_Receive
lab1_HAL_UART_Receive: 	movs	r3, #1
	b.n lab3_HAL_UART_Receive
lab2_HAL_UART_Receive: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab4_HAL_UART_Receive
	movs	r3, #2
	b.n lab3_HAL_UART_Receive
lab4_HAL_UART_Receive: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #34	 ;  0x22
	strb.w	r2, [r3, #58]	 ;  0x3a
	bl HAL_GetTick
	str	r0, [r7, #20]
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]
	strh	r2, [r3, #44]	 ;  0x2c
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]
	strh	r2, [r3, #46]	 ;  0x2e
	b.n lab5_HAL_UART_Receive
lab11_HAL_UART_Receive: 	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #46]	 ;  0x2e
	uxth	r3, r3
	subs	r3, #1
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	cmp.w	r3, #4096	 ;  0x1000
	bne.n lab6_HAL_UART_Receive
	ldr	r3, [r7, #0]
	str	r3, [sp, #0]
	ldr	r3, [r7, #20]
	movs	r2, #0
	movs	r1, #32
	ldr	r0, [r7, #12]
	bl UART_WaitOnFlagUntilTimeout
	mov	r3, r0
	cmp	r3, #0
	beq.n lab7_HAL_UART_Receive
	movs	r3, #3
	b.n lab3_HAL_UART_Receive
lab7_HAL_UART_Receive: 	ldr	r3, [r7, #8]
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne.n lab8_HAL_UART_Receive
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	uxth	r3, r3
	ubfx	r3, r3, #0, #9
	uxth	r2, r3
	ldr	r3, [r7, #16]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #8]
	adds	r3, #2
	str	r3, [r7, #8]
	b.n lab5_HAL_UART_Receive
lab8_HAL_UART_Receive: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	uxth	r3, r3
	uxtb	r3, r3
	uxth	r2, r3
	ldr	r3, [r7, #16]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #8]
	adds	r3, #1
	str	r3, [r7, #8]
	b.n lab5_HAL_UART_Receive
lab6_HAL_UART_Receive: 	ldr	r3, [r7, #0]
	str	r3, [sp, #0]
	ldr	r3, [r7, #20]
	movs	r2, #0
	movs	r1, #32
	ldr	r0, [r7, #12]
	bl UART_WaitOnFlagUntilTimeout
	mov	r3, r0
	cmp	r3, #0
	beq.n lab9_HAL_UART_Receive
	movs	r3, #3
	b.n lab3_HAL_UART_Receive
lab9_HAL_UART_Receive: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne.n lab10_HAL_UART_Receive
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	uxtb	r2, r1
	strb	r2, [r3, #0]
	b.n lab5_HAL_UART_Receive
lab10_HAL_UART_Receive: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	uxtb	r2, r3
	ldr	r3, [r7, #8]
	adds	r1, r3, #1
	str	r1, [r7, #8]
	and.w	r2, r2, #127	 ;  0x7f
	uxtb	r2, r2
	strb	r2, [r3, #0]
lab5_HAL_UART_Receive: 	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #46]	 ;  0x2e
	uxth	r3, r3
	cmp	r3, #0
	bne.n lab11_HAL_UART_Receive
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	movs	r3, #0
	b.n lab3_HAL_UART_Receive
lab0_HAL_UART_Receive: 	movs	r3, #2
lab3_HAL_UART_Receive: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
HAL_UART_Transmit_IT:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #32
	bne.n lab0_HAL_UART_Transmit_IT
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq.n lab1_HAL_UART_Transmit_IT
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne.n lab2_HAL_UART_Transmit_IT
lab1_HAL_UART_Transmit_IT: 	movs	r3, #1
	b.n lab3_HAL_UART_Transmit_IT
lab2_HAL_UART_Transmit_IT: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab4_HAL_UART_Transmit_IT
	movs	r3, #2
	b.n lab3_HAL_UART_Transmit_IT
lab4_HAL_UART_Transmit_IT: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #8]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]
	strh	r2, [r3, #36]	 ;  0x24
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #33	 ;  0x21
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #12]
	movs	r3, #0
	b.n lab3_HAL_UART_Transmit_IT
lab0_HAL_UART_Transmit_IT: 	movs	r3, #2
lab3_HAL_UART_Transmit_IT: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_Receive_IT:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #58]	 ;  0x3a
	uxtb	r3, r3
	cmp	r3, #32
	bne.n lab0_HAL_UART_Receive_IT
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq.n lab1_HAL_UART_Receive_IT
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne.n lab2_HAL_UART_Receive_IT
lab1_HAL_UART_Receive_IT: 	movs	r3, #1
	b.n lab3_HAL_UART_Receive_IT
lab2_HAL_UART_Receive_IT: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab4_HAL_UART_Receive_IT
	movs	r3, #2
	b.n lab3_HAL_UART_Receive_IT
lab4_HAL_UART_Receive_IT: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #8]
	str	r2, [r3, #40]	 ;  0x28
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]
	strh	r2, [r3, #44]	 ;  0x2c
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #34	 ;  0x22
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #256	 ;  0x100
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32
	str	r2, [r3, #12]
	movs	r3, #0
	b.n lab3_HAL_UART_Receive_IT
lab0_HAL_UART_Receive_IT: 	movs	r3, #2
lab3_HAL_UART_Receive_IT: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_Transmit_DMA:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #32
	bne.n lab0_HAL_UART_Transmit_DMA
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq.n lab1_HAL_UART_Transmit_DMA
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne.n lab2_HAL_UART_Transmit_DMA
lab1_HAL_UART_Transmit_DMA: 	movs	r3, #1
	b.n lab3_HAL_UART_Transmit_DMA
lab2_HAL_UART_Transmit_DMA: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab4_HAL_UART_Transmit_DMA
	movs	r3, #2
	b.n lab3_HAL_UART_Transmit_DMA
lab4_HAL_UART_Transmit_DMA: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	str	r2, [r3, #32]
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]
	strh	r2, [r3, #36]	 ;  0x24
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #33	 ;  0x21
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #104]	 ;  (8088fa0 <HAL_UART_Transmit_DMA+0xce>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #100]	 ;  (8088fa4 <HAL_UART_Transmit_DMA+0xd2>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #96]	 ;  (8088fa8 <HAL_UART_Transmit_DMA+0xd6>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	add.w	r3, r7, #8
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #48]	 ;  0x30
	ldr	r3, [r7, #20]
	ldr	r1, [r3, #0]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #4
	mov	r2, r3
	ldrh	r3, [r7, #6]
	bl HAL_DMA_Start_IT
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	mvn.w	r2, #64	 ;  0x40
	str	r2, [r3, #0]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
	movs	r3, #0
	b.n lab3_HAL_UART_Transmit_DMA
lab0_HAL_UART_Transmit_DMA: 	movs	r3, #2
lab3_HAL_UART_Transmit_DMA: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08089c41
	.word	0x08089c93
	.word	0x08089d33
HAL_UART_Receive_DMA:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	mov	r3, r2
	strh	r3, [r7, #6]
	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #58]	 ;  0x3a
	uxtb	r3, r3
	cmp	r3, #32
	bne.n lab0_HAL_UART_Receive_DMA
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq.n lab1_HAL_UART_Receive_DMA
	ldrh	r3, [r7, #6]
	cmp	r3, #0
	bne.n lab2_HAL_UART_Receive_DMA
lab1_HAL_UART_Receive_DMA: 	movs	r3, #1
	b.n lab3_HAL_UART_Receive_DMA
lab2_HAL_UART_Receive_DMA: 	ldr	r3, [r7, #12]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab4_HAL_UART_Receive_DMA
	movs	r3, #2
	b.n lab3_HAL_UART_Receive_DMA
lab4_HAL_UART_Receive_DMA: 	ldr	r3, [r7, #12]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	str	r2, [r3, #40]	 ;  0x28
	ldr	r3, [r7, #12]
	ldrh	r2, [r7, #6]
	strh	r2, [r3, #44]	 ;  0x2c
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #34	 ;  0x22
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #148]	 ;  (80890a0 <HAL_UART_Receive_DMA+0xf4>)
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #144]	 ;  (80890a4 <HAL_UART_Receive_DMA+0xf8>)
	str	r2, [r3, #64]	 ;  0x40
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #140]	 ;  (80890a8 <HAL_UART_Receive_DMA+0xfc>)
	str	r2, [r3, #76]	 ;  0x4c
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	add.w	r3, r7, #8
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #52]	 ;  0x34
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	adds	r3, #4
	mov	r1, r3
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #0]
	ldrh	r3, [r7, #6]
	bl HAL_DMA_Start_IT
	movs	r3, #0
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #256	 ;  0x100
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #20]
	movs	r3, #0
	b.n lab3_HAL_UART_Receive_DMA
lab0_HAL_UART_Receive_DMA: 	movs	r3, #2
lab3_HAL_UART_Receive_DMA: 	mov	r0, r3
	adds	r7, #24
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08089caf
	.word	0x08089d17
	.word	0x08089d33
HAL_UART_DMAPause:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab0_HAL_UART_DMAPause
	movs	r3, #2
	b.n lab1_HAL_UART_DMAPause
lab0_HAL_UART_DMAPause: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #128	 ;  0x80
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #33	 ;  0x21
	bne.n lab2_HAL_UART_DMAPause
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq.n lab2_HAL_UART_DMAPause
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
lab2_HAL_UART_DMAPause: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #58]	 ;  0x3a
	uxtb	r3, r3
	cmp	r3, #34	 ;  0x22
	bne.n lab3_HAL_UART_DMAPause
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq.n lab3_HAL_UART_DMAPause
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #256	 ;  0x100
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #20]
lab3_HAL_UART_DMAPause: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	movs	r3, #0
lab1_HAL_UART_DMAPause: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_DMAResume:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab0_HAL_UART_DMAResume
	movs	r3, #2
	b.n lab1_HAL_UART_DMAResume
lab0_HAL_UART_DMAResume: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #33	 ;  0x21
	bne.n lab2_HAL_UART_DMAResume
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
lab2_HAL_UART_DMAResume: 	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #58]	 ;  0x3a
	uxtb	r3, r3
	cmp	r3, #34	 ;  0x22
	bne.n lab3_HAL_UART_DMAResume
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #256	 ;  0x100
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #20]
lab3_HAL_UART_DMAResume: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	movs	r3, #0
lab1_HAL_UART_DMAResume: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_DMAStop:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #128	 ;  0x80
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #33	 ;  0x21
	bne.n lab0_HAL_UART_DMAStop
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq.n lab0_HAL_UART_DMAStop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	cmp	r3, #0
	beq.n lab1_HAL_UART_DMAStop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_Abort
lab1_HAL_UART_DMAStop: 	ldr	r0, [r7, #4]
	bl UART_EndTxTransfer
lab0_HAL_UART_DMAStop: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #58]	 ;  0x3a
	uxtb	r3, r3
	cmp	r3, #34	 ;  0x22
	bne.n lab2_HAL_UART_DMAStop
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq.n lab2_HAL_UART_DMAStop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	cmp	r3, #0
	beq.n lab3_HAL_UART_DMAStop
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	mov	r0, r3
	bl HAL_DMA_Abort
lab3_HAL_UART_DMAStop: 	ldr	r0, [r7, #4]
	bl UART_EndRxTransfer
lab2_HAL_UART_DMAStop: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
HAL_UART_Abort:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #480	 ;  0x1e0
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #128	 ;  0x80
	bne.n lab0_HAL_UART_Abort
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	cmp	r3, #0
	beq.n lab0_HAL_UART_Abort
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_Abort
	mov	r3, r0
	cmp	r3, #0
	beq.n lab0_HAL_UART_Abort
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_GetError
	mov	r3, r0
	cmp	r3, #32
	bne.n lab0_HAL_UART_Abort
	ldr	r3, [r7, #4]
	movs	r2, #16
	str	r2, [r3, #60]	 ;  0x3c
	movs	r3, #3
	b.n lab1_HAL_UART_Abort
lab0_HAL_UART_Abort: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	bne.n lab2_HAL_UART_Abort
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	cmp	r3, #0
	beq.n lab2_HAL_UART_Abort
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	mov	r0, r3
	bl HAL_DMA_Abort
	mov	r3, r0
	cmp	r3, #0
	beq.n lab2_HAL_UART_Abort
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	mov	r0, r3
	bl HAL_DMA_GetError
	mov	r3, r0
	cmp	r3, #32
	bne.n lab2_HAL_UART_Abort
	ldr	r3, [r7, #4]
	movs	r2, #16
	str	r2, [r3, #60]	 ;  0x3c
	movs	r3, #3
	b.n lab1_HAL_UART_Abort
lab2_HAL_UART_Abort: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	movs	r3, #0
lab1_HAL_UART_Abort: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_UART_AbortTransmit:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #192	 ;  0xc0
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #128	 ;  0x80
	bne.n lab0_HAL_UART_AbortTransmit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	cmp	r3, #0
	beq.n lab0_HAL_UART_AbortTransmit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_Abort
	mov	r3, r0
	cmp	r3, #0
	beq.n lab0_HAL_UART_AbortTransmit
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_GetError
	mov	r3, r0
	cmp	r3, #32
	bne.n lab0_HAL_UART_AbortTransmit
	ldr	r3, [r7, #4]
	movs	r2, #16
	str	r2, [r3, #60]	 ;  0x3c
	movs	r3, #3
	b.n lab1_HAL_UART_AbortTransmit
lab0_HAL_UART_AbortTransmit: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	movs	r3, #0
lab1_HAL_UART_AbortTransmit: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_UART_AbortReceive:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #288	 ;  0x120
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	bne.n lab0_HAL_UART_AbortReceive
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	cmp	r3, #0
	beq.n lab0_HAL_UART_AbortReceive
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	mov	r0, r3
	bl HAL_DMA_Abort
	mov	r3, r0
	cmp	r3, #0
	beq.n lab0_HAL_UART_AbortReceive
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	mov	r0, r3
	bl HAL_DMA_GetError
	mov	r3, r0
	cmp	r3, #32
	bne.n lab0_HAL_UART_AbortReceive
	ldr	r3, [r7, #4]
	movs	r2, #16
	str	r2, [r3, #60]	 ;  0x3c
	movs	r3, #3
	b.n lab1_HAL_UART_AbortReceive
lab0_HAL_UART_AbortReceive: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	movs	r3, #0
lab1_HAL_UART_AbortReceive: 	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
HAL_UART_Abort_IT:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #1
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #480	 ;  0x1e0
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	cmp	r3, #0
	beq.n lab0_HAL_UART_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #128	 ;  0x80
	bne.n lab1_HAL_UART_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #248]	 ;  (8089630 <HAL_UART_Abort_IT+0x140>)
	str	r2, [r3, #80]	 ;  0x50
	b.n lab0_HAL_UART_Abort_IT
lab1_HAL_UART_Abort_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
lab0_HAL_UART_Abort_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	cmp	r3, #0
	beq.n lab2_HAL_UART_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	bne.n lab3_HAL_UART_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #212]	 ;  (8089634 <HAL_UART_Abort_IT+0x144>)
	str	r2, [r3, #80]	 ;  0x50
	b.n lab2_HAL_UART_Abort_IT
lab3_HAL_UART_Abort_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
lab2_HAL_UART_Abort_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #128	 ;  0x80
	bne.n lab4_HAL_UART_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	cmp	r3, #0
	beq.n lab4_HAL_UART_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab5_HAL_UART_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	b.n lab4_HAL_UART_Abort_IT
lab5_HAL_UART_Abort_IT: 	movs	r3, #0
	str	r3, [r7, #12]
lab4_HAL_UART_Abort_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	bne.n lab6_HAL_UART_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	cmp	r3, #0
	beq.n lab6_HAL_UART_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab7_HAL_UART_Abort_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	movs	r3, #1
	str	r3, [r7, #12]
	b.n lab6_HAL_UART_Abort_IT
lab7_HAL_UART_Abort_IT: 	movs	r3, #0
	str	r3, [r7, #12]
lab6_HAL_UART_Abort_IT: 	ldr	r3, [r7, #12]
	cmp	r3, #1
	bne.n lab8_HAL_UART_Abort_IT
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r0, [r7, #4]
	bl HAL_UART_AbortCpltCallback
lab8_HAL_UART_Abort_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
	.word	0x08089eeb
	.word	0x08089f45
HAL_UART_AbortTransmit_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #192	 ;  0xc0
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #128	 ;  0x80
	bne.n lab0_HAL_UART_AbortTransmit_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	cmp	r3, #0
	beq.n lab1_HAL_UART_AbortTransmit_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r2, [pc, #88]	 ;  (80896d4 <HAL_UART_AbortTransmit_IT+0x9c>)
	str	r2, [r3, #80]	 ;  0x50
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab2_HAL_UART_AbortTransmit_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r3, [r3, #80]	 ;  0x50
	ldr	r2, [r7, #4]
	ldr	r2, [r2, #48]	 ;  0x30
	mov	r0, r2
	blx r3
	b.n lab2_HAL_UART_AbortTransmit_IT
lab1_HAL_UART_AbortTransmit_IT: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r0, [r7, #4]
	bl HAL_UART_AbortTransmitCpltCallback
	b.n lab2_HAL_UART_AbortTransmit_IT
lab0_HAL_UART_AbortTransmit_IT: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r0, [r7, #4]
	bl HAL_UART_AbortTransmitCpltCallback
lab2_HAL_UART_AbortTransmit_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08089f9f
HAL_UART_AbortReceive_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #288	 ;  0x120
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	bne.n lab0_HAL_UART_AbortReceive_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	cmp	r3, #0
	beq.n lab1_HAL_UART_AbortReceive_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #88]	 ;  (8089784 <HAL_UART_AbortReceive_IT+0xac>)
	str	r2, [r3, #80]	 ;  0x50
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab2_HAL_UART_AbortReceive_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r3, [r3, #80]	 ;  0x50
	ldr	r2, [r7, #4]
	ldr	r2, [r2, #52]	 ;  0x34
	mov	r0, r2
	blx r3
	b.n lab2_HAL_UART_AbortReceive_IT
lab1_HAL_UART_AbortReceive_IT: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r0, [r7, #4]
	bl HAL_UART_AbortReceiveCpltCallback
	b.n lab2_HAL_UART_AbortReceive_IT
lab0_HAL_UART_AbortReceive_IT: 	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r0, [r7, #4]
	bl HAL_UART_AbortReceiveCpltCallback
lab2_HAL_UART_AbortReceive_IT: 	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08089fc9
HAL_UART_IRQHandler:
	push	{r7, lr}
	sub	sp, #32
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	str	r3, [r7, #28]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #28]
	and.w	r3, r3, #15
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	cmp	r3, #0
	bne.n lab0_HAL_UART_IRQHandler
	ldr	r3, [r7, #28]
	and.w	r3, r3, #32
	cmp	r3, #0
	beq.n lab0_HAL_UART_IRQHandler
	ldr	r3, [r7, #24]
	and.w	r3, r3, #32
	cmp	r3, #0
	beq.n lab0_HAL_UART_IRQHandler
	ldr	r0, [r7, #4]
	bl UART_Receive_IT
	b.n lab1_HAL_UART_IRQHandler
lab0_HAL_UART_IRQHandler: 	ldr	r3, [r7, #16]
	cmp	r3, #0
	beq.w lab2_HAL_UART_IRQHandler
	ldr	r3, [r7, #20]
	and.w	r3, r3, #1
	cmp	r3, #0
	bne.n lab3_HAL_UART_IRQHandler
	ldr	r3, [r7, #24]
	and.w	r3, r3, #288	 ;  0x120
	cmp	r3, #0
	beq.w lab2_HAL_UART_IRQHandler
lab3_HAL_UART_IRQHandler: 	ldr	r3, [r7, #28]
	and.w	r3, r3, #1
	cmp	r3, #0
	beq.n lab4_HAL_UART_IRQHandler
	ldr	r3, [r7, #24]
	and.w	r3, r3, #256	 ;  0x100
	cmp	r3, #0
	beq.n lab4_HAL_UART_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]	 ;  0x3c
	orr.w	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #60]	 ;  0x3c
lab4_HAL_UART_IRQHandler: 	ldr	r3, [r7, #28]
	and.w	r3, r3, #4
	cmp	r3, #0
	beq.n lab5_HAL_UART_IRQHandler
	ldr	r3, [r7, #20]
	and.w	r3, r3, #1
	cmp	r3, #0
	beq.n lab5_HAL_UART_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]	 ;  0x3c
	orr.w	r2, r3, #2
	ldr	r3, [r7, #4]
	str	r2, [r3, #60]	 ;  0x3c
lab5_HAL_UART_IRQHandler: 	ldr	r3, [r7, #28]
	and.w	r3, r3, #2
	cmp	r3, #0
	beq.n lab6_HAL_UART_IRQHandler
	ldr	r3, [r7, #20]
	and.w	r3, r3, #1
	cmp	r3, #0
	beq.n lab6_HAL_UART_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]	 ;  0x3c
	orr.w	r2, r3, #4
	ldr	r3, [r7, #4]
	str	r2, [r3, #60]	 ;  0x3c
lab6_HAL_UART_IRQHandler: 	ldr	r3, [r7, #28]
	and.w	r3, r3, #8
	cmp	r3, #0
	beq.n lab7_HAL_UART_IRQHandler
	ldr	r3, [r7, #20]
	and.w	r3, r3, #1
	cmp	r3, #0
	beq.n lab7_HAL_UART_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]	 ;  0x3c
	orr.w	r2, r3, #8
	ldr	r3, [r7, #4]
	str	r2, [r3, #60]	 ;  0x3c
lab7_HAL_UART_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]	 ;  0x3c
	cmp	r3, #0
	beq.n lab8_HAL_UART_IRQHandler
	ldr	r3, [r7, #28]
	and.w	r3, r3, #32
	cmp	r3, #0
	beq.n lab9_HAL_UART_IRQHandler
	ldr	r3, [r7, #24]
	and.w	r3, r3, #32
	cmp	r3, #0
	beq.n lab9_HAL_UART_IRQHandler
	ldr	r0, [r7, #4]
	bl UART_Receive_IT
lab9_HAL_UART_IRQHandler: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]	 ;  0x3c
	and.w	r3, r3, #8
	cmp	r3, #0
	bne.n lab10_HAL_UART_IRQHandler
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq.n lab11_HAL_UART_IRQHandler
lab10_HAL_UART_IRQHandler: 	ldr	r0, [r7, #4]
	bl UART_EndRxTransfer
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	bne.n lab12_HAL_UART_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	cmp	r3, #0
	beq.n lab13_HAL_UART_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r2, [pc, #136]	 ;  (808997c <HAL_UART_IRQHandler+0x1f4>)
	str	r2, [r3, #80]	 ;  0x50
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	mov	r0, r3
	bl HAL_DMA_Abort_IT
	mov	r3, r0
	cmp	r3, #0
	beq.n lab14_HAL_UART_IRQHandler
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r3, [r3, #80]	 ;  0x50
	ldr	r2, [r7, #4]
	ldr	r2, [r2, #52]	 ;  0x34
	mov	r0, r2
	blx r3
	b.n lab14_HAL_UART_IRQHandler
lab13_HAL_UART_IRQHandler: 	ldr	r0, [r7, #4]
	bl HAL_UART_ErrorCallback
	b.n lab14_HAL_UART_IRQHandler
lab12_HAL_UART_IRQHandler: 	ldr	r0, [r7, #4]
	bl HAL_UART_ErrorCallback
	b.n lab14_HAL_UART_IRQHandler
lab11_HAL_UART_IRQHandler: 	ldr	r0, [r7, #4]
	bl HAL_UART_ErrorCallback
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	b.n lab8_HAL_UART_IRQHandler
lab14_HAL_UART_IRQHandler: 	nop
	b.n lab8_HAL_UART_IRQHandler
lab2_HAL_UART_IRQHandler: 	ldr	r3, [r7, #28]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #0
	beq.n lab15_HAL_UART_IRQHandler
	ldr	r3, [r7, #24]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #0
	beq.n lab15_HAL_UART_IRQHandler
	ldr	r0, [r7, #4]
	bl UART_Transmit_IT
	b.n lab1_HAL_UART_IRQHandler
lab15_HAL_UART_IRQHandler: 	ldr	r3, [r7, #28]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #0
	beq.n lab1_HAL_UART_IRQHandler
	ldr	r3, [r7, #24]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #0
	beq.n lab1_HAL_UART_IRQHandler
	ldr	r0, [r7, #4]
	bl UART_EndTransmit_IT
	nop
	b.n lab1_HAL_UART_IRQHandler
lab8_HAL_UART_IRQHandler: 	nop
lab1_HAL_UART_IRQHandler: 	adds	r7, #32
	mov	sp, r7
	pop	{r7, pc}
	nop
	.word	0x08089ec3
HAL_UART_TxCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_TxHalfCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_RxCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_RxHalfCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_ErrorCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_AbortCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_AbortTransmitCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_AbortReceiveCpltCallback:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_LIN_SendBreak:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab0_HAL_LIN_SendBreak
	movs	r3, #2
	b.n lab1_HAL_LIN_SendBreak
lab0_HAL_LIN_SendBreak: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #4]
	movs	r2, #36	 ;  0x24
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #1
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	movs	r3, #0
lab1_HAL_LIN_SendBreak: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_MultiProcessor_EnterMuteMode:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab0_HAL_MultiProcessor_EnterMuteMode
	movs	r3, #2
	b.n lab1_HAL_MultiProcessor_EnterMuteMode
lab0_HAL_MultiProcessor_EnterMuteMode: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #4]
	movs	r2, #36	 ;  0x24
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	movs	r3, #0
lab1_HAL_MultiProcessor_EnterMuteMode: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_MultiProcessor_ExitMuteMode:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab0_HAL_MultiProcessor_ExitMuteMode
	movs	r3, #2
	b.n lab1_HAL_MultiProcessor_ExitMuteMode
lab0_HAL_MultiProcessor_ExitMuteMode: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #4]
	movs	r2, #36	 ;  0x24
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #2
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	movs	r3, #0
lab1_HAL_MultiProcessor_ExitMuteMode: 	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_HalfDuplex_EnableTransmitter:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab0_HAL_HalfDuplex_EnableTransmitter
	movs	r3, #2
	b.n lab1_HAL_HalfDuplex_EnableTransmitter
lab0_HAL_HalfDuplex_EnableTransmitter: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #4]
	movs	r2, #36	 ;  0x24
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #12
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	orr.w	r3, r3, #8
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	movs	r3, #0
lab1_HAL_HalfDuplex_EnableTransmitter: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_HalfDuplex_EnableReceiver:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #56]	 ;  0x38
	cmp	r3, #1
	bne.n lab0_HAL_HalfDuplex_EnableReceiver
	movs	r3, #2
	b.n lab1_HAL_HalfDuplex_EnableReceiver
lab0_HAL_HalfDuplex_EnableReceiver: 	ldr	r3, [r7, #4]
	movs	r2, #1
	strb.w	r2, [r3, #56]	 ;  0x38
	ldr	r3, [r7, #4]
	movs	r2, #36	 ;  0x24
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	bic.w	r3, r3, #12
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	orr.w	r3, r3, #4
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r7, #12]
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	movs	r3, #0
lab1_HAL_HalfDuplex_EnableReceiver: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_GetState:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #58]	 ;  0x3a
	uxtb	r3, r3
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	uxtb	r2, r3
	ldr	r3, [r7, #8]
	uxtb	r3, r3
	orrs	r3, r2
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
HAL_UART_GetError:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]	 ;  0x3c
	mov	r0, r3
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
UART_DMATransmitCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #256	 ;  0x100
	cmp	r3, #0
	bne.n lab0_UART_DMATransmitCplt
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #12]
	b.n lab1_UART_DMATransmitCplt
lab0_UART_DMATransmitCplt: 	ldr	r0, [r7, #12]
	bl HAL_UART_TxCpltCallback
lab1_UART_DMATransmitCplt: 	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
UART_DMATxHalfCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r0, [r7, #12]
	bl HAL_UART_TxHalfCpltCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
UART_DMAReceiveCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and.w	r3, r3, #256	 ;  0x100
	cmp	r3, #0
	bne.n lab0_UART_DMAReceiveCplt
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #256	 ;  0x100
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
lab0_UART_DMAReceiveCplt: 	ldr	r0, [r7, #12]
	bl HAL_UART_RxCpltCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
UART_DMARxHalfCplt:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r0, [r7, #12]
	bl HAL_UART_RxHalfCpltCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
UART_DMAError:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #128	 ;  0x80
	cmp	r3, #128	 ;  0x80
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #33	 ;  0x21
	bne.n lab0_UART_DMAError
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq.n lab0_UART_DMAError
	ldr	r3, [r7, #8]
	movs	r2, #0
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r0, [r7, #8]
	bl UART_EndTxTransfer
lab0_UART_DMAError: 	ldr	r3, [r7, #8]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	and.w	r3, r3, #64	 ;  0x40
	cmp	r3, #64	 ;  0x40
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	ldrb.w	r3, [r3, #58]	 ;  0x3a
	uxtb	r3, r3
	cmp	r3, #34	 ;  0x22
	bne.n lab1_UART_DMAError
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq.n lab1_UART_DMAError
	ldr	r3, [r7, #8]
	movs	r2, #0
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r0, [r7, #8]
	bl UART_EndRxTransfer
lab1_UART_DMAError: 	ldr	r3, [r7, #8]
	ldr	r3, [r3, #60]	 ;  0x3c
	orr.w	r2, r3, #16
	ldr	r3, [r7, #8]
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r0, [r7, #8]
	bl HAL_UART_ErrorCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
UART_WaitOnFlagUntilTimeout:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r3, [r7, #0]
	mov	r3, r2
	strb	r3, [r7, #7]
	b.n lab0_UART_WaitOnFlagUntilTimeout
lab3_UART_WaitOnFlagUntilTimeout: 	ldr	r3, [r7, #24]
	cmp.w	r3, #4294967295	 ;  0xffffffff
	beq.n lab0_UART_WaitOnFlagUntilTimeout
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq.n lab1_UART_WaitOnFlagUntilTimeout
	bl HAL_GetTick
	mov	r2, r0
	ldr	r3, [r7, #0]
	subs	r3, r2, r3
	ldr	r2, [r7, #24]
	cmp	r2, r3
	bcs.n lab0_UART_WaitOnFlagUntilTimeout
lab1_UART_WaitOnFlagUntilTimeout: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #416	 ;  0x1a0
	str	r2, [r3, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r3, [r7, #12]
	movs	r2, #0
	strb.w	r2, [r3, #56]	 ;  0x38
	movs	r3, #3
	b.n lab2_UART_WaitOnFlagUntilTimeout
lab0_UART_WaitOnFlagUntilTimeout: 	ldr	r3, [r7, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #8]
	ands	r3, r2
	ldr	r2, [r7, #8]
	cmp	r2, r3
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldrb	r3, [r7, #7]
	cmp	r2, r3
	beq.n lab3_UART_WaitOnFlagUntilTimeout
	movs	r3, #0
lab2_UART_WaitOnFlagUntilTimeout: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #131
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
	pop	{r7, pc}
UART_EndTxTransfer:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #192	 ;  0xc0
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
UART_EndRxTransfer:
	push	{r7}
	sub	sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #288	 ;  0x120
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	nop
	adds	r7, #12
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
UART_DMAAbortOnError:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r0, [r7, #12]
	bl HAL_UART_ErrorCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
UART_DMATxAbortCallback:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	cmp	r3, #0
	beq.n lab0_UART_DMATxAbortCallback
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	ldr	r3, [r3, #80]	 ;  0x50
	cmp	r3, #0
	bne.n lab1_UART_DMATxAbortCallback
lab0_UART_DMATxAbortCallback: 	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r0, [r7, #12]
	bl HAL_UART_AbortCpltCallback
	b.n lab2_UART_DMATxAbortCallback
lab1_UART_DMATxAbortCallback: 	nop
lab2_UART_DMATxAbortCallback: 	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
UART_DMARxAbortCallback:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #52]	 ;  0x34
	movs	r2, #0
	str	r2, [r3, #80]	 ;  0x50
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	cmp	r3, #0
	beq.n lab0_UART_DMARxAbortCallback
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #48]	 ;  0x30
	ldr	r3, [r3, #80]	 ;  0x50
	cmp	r3, #0
	bne.n lab1_UART_DMARxAbortCallback
lab0_UART_DMARxAbortCallback: 	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #60]	 ;  0x3c
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r0, [r7, #12]
	bl HAL_UART_AbortCpltCallback
	b.n lab2_UART_DMARxAbortCallback
lab1_UART_DMARxAbortCallback: 	nop
lab2_UART_DMARxAbortCallback: 	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
UART_DMATxOnlyAbortCallback:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #38]	 ;  0x26
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r0, [r7, #12]
	bl HAL_UART_AbortTransmitCpltCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
UART_DMARxOnlyAbortCallback:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]	 ;  0x38
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #46]	 ;  0x2e
	ldr	r3, [r7, #12]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r0, [r7, #12]
	bl HAL_UART_AbortReceiveCpltCallback
	nop
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
UART_Transmit_IT:
	push	{r7}
	sub	sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #57]	 ;  0x39
	uxtb	r3, r3
	cmp	r3, #33	 ;  0x21
	bne.n lab0_UART_Transmit_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp.w	r3, #4096	 ;  0x1000
	bne.n lab1_UART_Transmit_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ubfx	r2, r2, #0, #9
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne.n lab2_UART_Transmit_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	adds	r2, r3, #2
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	b.n lab3_UART_Transmit_IT
lab2_UART_Transmit_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	adds	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	b.n lab3_UART_Transmit_IT
lab1_UART_Transmit_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	adds	r1, r3, #1
	ldr	r2, [r7, #4]
	str	r1, [r2, #32]
	ldrb	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	str	r2, [r3, #4]
lab3_UART_Transmit_IT: 	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #38]	 ;  0x26
	uxth	r3, r3
	subs	r3, #1
	uxth	r3, r3
	ldr	r2, [r7, #4]
	mov	r1, r3
	strh	r1, [r2, #38]	 ;  0x26
	cmp	r3, #0
	bne.n lab4_UART_Transmit_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #128	 ;  0x80
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #12]
lab4_UART_Transmit_IT: 	movs	r3, #0
	b.n lab5_UART_Transmit_IT
lab0_UART_Transmit_IT: 	movs	r3, #2
lab5_UART_Transmit_IT: 	mov	r0, r3
	adds	r7, #20
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
UART_EndTransmit_IT:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #57]	 ;  0x39
	ldr	r0, [r7, #4]
	bl HAL_UART_TxCpltCallback
	movs	r3, #0
	mov	r0, r3
	adds	r7, #8
	mov	sp, r7
	pop	{r7, pc}
UART_Receive_IT:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb.w	r3, [r3, #58]	 ;  0x3a
	uxtb	r3, r3
	cmp	r3, #34	 ;  0x22
	bne.n lab0_UART_Receive_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp.w	r3, #4096	 ;  0x1000
	bne.n lab1_UART_Receive_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne.n lab2_UART_Receive_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	uxth	r3, r3
	ubfx	r3, r3, #0, #9
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	adds	r2, r3, #2
	ldr	r3, [r7, #4]
	str	r2, [r3, #40]	 ;  0x28
	b.n lab3_UART_Receive_IT
lab2_UART_Receive_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	uxth	r3, r3
	uxtb	r3, r3
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	adds	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #40]	 ;  0x28
	b.n lab3_UART_Receive_IT
lab1_UART_Receive_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne.n lab4_UART_Receive_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r0, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	adds	r1, r3, #1
	ldr	r2, [r7, #4]
	str	r1, [r2, #40]	 ;  0x28
	uxtb	r2, r0
	strb	r2, [r3, #0]
	b.n lab3_UART_Receive_IT
lab4_UART_Receive_IT: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #40]	 ;  0x28
	adds	r0, r3, #1
	ldr	r1, [r7, #4]
	str	r0, [r1, #40]	 ;  0x28
	and.w	r2, r2, #127	 ;  0x7f
	uxtb	r2, r2
	strb	r2, [r3, #0]
lab3_UART_Receive_IT: 	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #46]	 ;  0x2e
	uxth	r3, r3
	subs	r3, #1
	uxth	r3, r3
	ldr	r2, [r7, #4]
	mov	r1, r3
	strh	r1, [r2, #46]	 ;  0x2e
	cmp	r3, #0
	bne.n lab5_UART_Receive_IT
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #32
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #256	 ;  0x100
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	bic.w	r2, r2, #1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	movs	r2, #32
	strb.w	r2, [r3, #58]	 ;  0x3a
	ldr	r0, [r7, #4]
	bl HAL_UART_RxCpltCallback
	movs	r3, #0
	b.n lab6_UART_Receive_IT
lab5_UART_Receive_IT: 	movs	r3, #0
	b.n lab6_UART_Receive_IT
lab0_UART_Receive_IT: 	movs	r3, #2
lab6_UART_Receive_IT: 	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	pop	{r7, pc}
UART_SetConfig:
	push	{r4, r5, r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	bic.w	r1, r3, #12288	 ;  0x3000
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	orrs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	orrs	r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	bic.w	r3, r3, #38400	 ;  0x9600
	bic.w	r3, r3, #12
	ldr	r2, [r7, #4]
	ldr	r2, [r2, #0]
	ldr	r1, [r7, #12]
	orrs	r3, r1
	str	r3, [r2, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #20]
	bic.w	r1, r3, #768	 ;  0x300
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	orrs	r2, r1
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	cmp.w	r3, #32768	 ;  0x8000
	bne.w lab0_UART_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #684]	 ;  (808a4f4 <UART_SetConfig+0x324>)
	cmp	r3, r2
	beq.n lab1_UART_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #680]	 ;  (808a4f8 <UART_SetConfig+0x328>)
	cmp	r3, r2
	bne.n lab2_UART_SetConfig
	push {r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
lab1_UART_SetConfig: 	bl	HAL_RCC_GetPCLK2Freq 
	push{r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, [pc, #652]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r4, r3, #4
	push {r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK2Freq
	push{r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r5, r2, r3
	push {r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK2Freq
	push{r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, [pc, #588]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100	 ;  0x64
	mul.w	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #3
	adds	r3, #50	 ;  0x32
	ldr	r2, [pc, #568]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r3, r3, #1
	and.w	r3, r3, #496	 ;  0x1f0
	add	r4, r3
	push {r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK2Freq
	push{r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r5, r2, r3
	push {r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK2Freq
	push{r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, [pc, #500]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100	 ;  0x64
	mul.w	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #3
	adds	r3, #50	 ;  0x32
	ldr	r2, [pc, #480]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and.w	r2, r3, #7
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	add	r2, r4
	str	r2, [r3, #8]
	b.n lab3_UART_SetConfig
	push {r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
lab2_UART_SetConfig: 	bl	HAL_RCC_GetPCLK1Freq 
	push{r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, [pc, #432]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r4, r3, #4
	push {r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK1Freq
	push{r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r5, r2, r3
	push {r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK1Freq
	push{r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, [pc, #372]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100	 ;  0x64
	mul.w	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #3
	adds	r3, #50	 ;  0x32
	ldr	r2, [pc, #352]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r3, r3, #1
	and.w	r3, r3, #496	 ;  0x1f0
	add	r4, r3
	push {r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK1Freq
	push{r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r5, r2, r3
	push {r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK1Freq
	push{r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #1
	udiv	r3, r2, r3
	ldr	r2, [pc, #284]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100	 ;  0x64
	mul.w	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #3
	adds	r3, #50	 ;  0x32
	ldr	r2, [pc, #264]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and.w	r2, r3, #7
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	add	r2, r4
	str	r2, [r3, #8]
	b.n lab3_UART_SetConfig
lab0_UART_SetConfig: 	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #228]	 ;  (808a4f4 <UART_SetConfig+0x324>)
	cmp	r3, r2
	beq.n lab4_UART_SetConfig
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #224]	 ;  (808a4f8 <UART_SetConfig+0x328>)
	cmp	r3, r2
	bne.n lab5_UART_SetConfig
	push {r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
lab4_UART_SetConfig: 	bl	HAL_RCC_GetPCLK2Freq 
	push{r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, [pc, #196]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r4, r3, #4
	push {r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK2Freq
	push{r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r5, r2, r3
	push {r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK2Freq
	push{r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, [pc, #132]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100	 ;  0x64
	mul.w	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #4
	adds	r3, #50	 ;  0x32
	ldr	r2, [pc, #112]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and.w	r3, r3, #240	 ;  0xf0
	add	r4, r3
	push {r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK2Freq
	push{r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r5, r2, r3
	push {r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK2Freq
	push{r1, r2}
	mov.w r1, #37
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, [pc, #48]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100	 ;  0x64
	mul.w	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #4
	adds	r3, #50	 ;  0x32
	ldr	r2, [pc, #28]	 ;  (808a4fc <UART_SetConfig+0x32c>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and.w	r2, r3, #15
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	add	r2, r4
	str	r2, [r3, #8]
	b.n lab3_UART_SetConfig
	.word	0x40011000
	.word	0x40011400
	.word	0x51eb851f
	push {r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
lab5_UART_SetConfig: 	bl	HAL_RCC_GetPCLK1Freq 
	push{r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, [pc, #196]	 ;  (808a5e0 <UART_SetConfig+0x410>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	lsls	r4, r3, #4
	push {r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK1Freq
	push{r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r5, r2, r3
	push {r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK1Freq
	push{r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, [pc, #132]	 ;  (808a5e0 <UART_SetConfig+0x410>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100	 ;  0x64
	mul.w	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #4
	adds	r3, #50	 ;  0x32
	ldr	r2, [pc, #112]	 ;  (808a5e0 <UART_SetConfig+0x410>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and.w	r3, r3, #240	 ;  0xf0
	add	r4, r3
	push {r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK1Freq
	push{r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r5, r2, r3
	push {r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl HAL_RCC_GetPCLK1Freq
	push{r1, r2}
	mov.w r1, #47
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r2, r0
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r2
	lsls	r2, r3, #2
	add	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	udiv	r3, r2, r3
	ldr	r2, [pc, #48]	 ;  (808a5e0 <UART_SetConfig+0x410>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	movs	r2, #100	 ;  0x64
	mul.w	r3, r2, r3
	subs	r3, r5, r3
	lsls	r3, r3, #4
	adds	r3, #50	 ;  0x32
	ldr	r2, [pc, #28]	 ;  (808a5e0 <UART_SetConfig+0x410>)
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	and.w	r2, r3, #15
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #0]
	add	r2, r4
	str	r2, [r3, #8]
	b.n lab3_UART_SetConfig
lab3_UART_SetConfig: 	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #35
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r4, r5, r7, pc}
	.word	0x51eb851f
enqueue:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r0, #16
	bl malloc
	push{r1, r2}
	mov.w r1, #90
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	str	r3, [r7, #16]
	ldr	r3, [pc, #92]	 ;  (808a658 <enqueue+0x74>)
	ldr	r3, [r3, #0]
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	cmp	r3, #0
	bne.n lab0_enqueue
	movs	r0, #1
	bl exit
	push{r1, r2}
	mov.w r1, #92
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
lab0_enqueue: 	ldr	r3, [r7, #16]
	ldr	r2, [r7, #12]
	str	r2, [r3, #0]
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #8]
	str	r2, [r3, #4]
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #4]
	str	r2, [r3, #8]
	ldr	r3, [r7, #16]
	movs	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne.n lab1_enqueue
	ldr	r2, [pc, #44]	 ;  (808a658 <enqueue+0x74>)
	ldr	r3, [r7, #16]
	str	r3, [r2, #0]
	b.n lab2_enqueue
lab3_enqueue: 	ldr	r3, [r7, #20]
	ldr	r3, [r3, #12]
	str	r3, [r7, #20]
lab1_enqueue: 	ldr	r3, [r7, #20]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne.n lab3_enqueue
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #16]
	str	r2, [r3, #12]
lab2_enqueue: 	ldr	r3, [pc, #20]	 ;  (808a65c <enqueue+0x78>)
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r2, [pc, #12]	 ;  (808a65c <enqueue+0x78>)
	str	r3, [r2, #0]
	nop
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #87
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
	pop	{r7, pc}
	.word	0x20009ccc
	.word	0x20009cd0
dequeue:
	push	{r7, lr}
	sub	sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [pc, #76]	 ;  (808a6bc <dequeue+0x5c>)
	ldr	r3, [r3, #0]
	str	r3, [r7, #20]
	ldr	r3, [pc, #72]	 ;  (808a6bc <dequeue+0x5c>)
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq.n lab0_dequeue
	ldr	r3, [pc, #64]	 ;  (808a6bc <dequeue+0x5c>)
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, [r7, #12]
	str	r2, [r3, #0]
	ldr	r3, [pc, #52]	 ;  (808a6bc <dequeue+0x5c>)
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	str	r2, [r3, #0]
	ldr	r3, [pc, #44]	 ;  (808a6bc <dequeue+0x5c>)
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	str	r2, [r3, #0]
	ldr	r3, [pc, #32]	 ;  (808a6bc <dequeue+0x5c>)
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #12]
	ldr	r2, [pc, #28]	 ;  (808a6bc <dequeue+0x5c>)
	str	r3, [r2, #0]
	ldr	r0, [r7, #20]
	bl free
	push{r1, r2}
	mov.w r1, #98
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [pc, #20]	 ;  (808a6c0 <dequeue+0x60>)
	ldr	r3, [r3, #0]
	subs	r3, #1
	ldr	r2, [pc, #16]	 ;  (808a6c0 <dequeue+0x60>)
	str	r3, [r2, #0]
lab0_dequeue: 	nop
	adds	r7, #24
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #95
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.word	0x20009ccc
	.word	0x20009cd0
qcount:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, [pc, #12]	 ;  (808a6d8 <qcount+0x14>)
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
	.word	0x20009cd0
dijkstra:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [pc, #296]	 ;  (808a810 <dijkstra+0x134>)
	movs	r2, #0
	str	r2, [r3, #0]
	b.n lab0_dijkstra
lab1_dijkstra: 	ldr	r3, [pc, #288]	 ;  (808a810 <dijkstra+0x134>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #288]	 ;  (808a814 <dijkstra+0x138>)
	movw	r1, #9999	 ;  0x270f
	str.w	r1, [r2, r3, lsl #3]
	ldr	r3, [pc, #272]	 ;  (808a810 <dijkstra+0x134>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #272]	 ;  (808a814 <dijkstra+0x138>)
	lsls	r3, r3, #3
	add	r3, r2
	movw	r2, #9999	 ;  0x270f
	str	r2, [r3, #4]
	ldr	r3, [pc, #256]	 ;  (808a810 <dijkstra+0x134>)
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r2, [pc, #252]	 ;  (808a810 <dijkstra+0x134>)
	str	r3, [r2, #0]
lab0_dijkstra: 	ldr	r3, [pc, #248]	 ;  (808a810 <dijkstra+0x134>)
	ldr	r3, [r3, #0]
	cmp	r3, #99	 ;  0x63
	ble.n lab1_dijkstra
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #0]
	cmp	r2, r3
	beq.n lab2_dijkstra
	ldr	r2, [pc, #236]	 ;  (808a814 <dijkstra+0x138>)
	ldr	r3, [r7, #4]
	movs	r1, #0
	str.w	r1, [r2, r3, lsl #3]
	ldr	r2, [pc, #224]	 ;  (808a814 <dijkstra+0x138>)
	ldr	r3, [r7, #4]
	lsls	r3, r3, #3
	add	r3, r2
	movw	r2, #9999	 ;  0x270f
	str	r2, [r3, #4]
	movw	r2, #9999	 ;  0x270f
	movs	r1, #0
	ldr	r0, [r7, #4]
	push {r1, r2}
	mov.w r1, #87
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl enqueue
	push{r1, r2}
	mov.w r1, #87
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b.n lab3_dijkstra
lab8_dijkstra: 	ldr	r2, [pc, #200]	 ;  (808a818 <dijkstra+0x13c>)
	ldr	r1, [pc, #204]	 ;  (808a81c <dijkstra+0x140>)
	ldr	r0, [pc, #204]	 ;  (808a820 <dijkstra+0x144>)
	bl dequeue
	push{r1, r2}
	mov.w r1, #96
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [pc, #204]	 ;  (808a824 <dijkstra+0x148>)
	movs	r2, #0
	str	r2, [r3, #0]
	b.n lab4_dijkstra
lab7_dijkstra: 	ldr	r3, [pc, #192]	 ;  (808a820 <dijkstra+0x144>)
	ldr	r2, [r3, #0]
	ldr	r3, [pc, #192]	 ;  (808a824 <dijkstra+0x148>)
	ldr	r3, [r3, #0]
	ldr	r1, [pc, #192]	 ;  (808a828 <dijkstra+0x14c>)
	movs	r0, #100	 ;  0x64
	mul.w	r2, r0, r2
	add	r3, r2
	ldr.w	r3, [r1, r3, lsl #2]
	ldr	r2, [pc, #180]	 ;  (808a82c <dijkstra+0x150>)
	str	r3, [r2, #0]
	ldr	r3, [pc, #176]	 ;  (808a82c <dijkstra+0x150>)
	ldr	r3, [r3, #0]
	movw	r2, #9999	 ;  0x270f
	cmp	r3, r2
	beq.n lab5_dijkstra
	ldr	r3, [pc, #156]	 ;  (808a824 <dijkstra+0x148>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #136]	 ;  (808a814 <dijkstra+0x138>)
	ldr.w	r3, [r2, r3, lsl #3]
	movw	r2, #9999	 ;  0x270f
	cmp	r3, r2
	beq.n lab6_dijkstra
	ldr	r3, [pc, #140]	 ;  (808a824 <dijkstra+0x148>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #120]	 ;  (808a814 <dijkstra+0x138>)
	ldr.w	r2, [r2, r3, lsl #3]
	ldr	r3, [pc, #136]	 ;  (808a82c <dijkstra+0x150>)
	ldr	r1, [r3, #0]
	ldr	r3, [pc, #116]	 ;  (808a81c <dijkstra+0x140>)
	ldr	r3, [r3, #0]
	add	r3, r1
	cmp	r2, r3
	ble.n lab5_dijkstra
lab6_dijkstra: 	ldr	r3, [pc, #108]	 ;  (808a81c <dijkstra+0x140>)
	ldr	r1, [r3, #0]
	ldr	r3, [pc, #120]	 ;  (808a82c <dijkstra+0x150>)
	ldr	r2, [r3, #0]
	ldr	r3, [pc, #108]	 ;  (808a824 <dijkstra+0x148>)
	ldr	r3, [r3, #0]
	add	r2, r1
	ldr	r1, [pc, #84]	 ;  (808a814 <dijkstra+0x138>)
	str.w	r2, [r1, r3, lsl #3]
	ldr	r3, [pc, #96]	 ;  (808a824 <dijkstra+0x148>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #88]	 ;  (808a820 <dijkstra+0x144>)
	ldr	r2, [r2, #0]
	ldr	r1, [pc, #72]	 ;  (808a814 <dijkstra+0x138>)
	lsls	r3, r3, #3
	add	r3, r1
	str	r2, [r3, #4]
	ldr	r3, [pc, #80]	 ;  (808a824 <dijkstra+0x148>)
	ldr	r0, [r3, #0]
	ldr	r3, [pc, #68]	 ;  (808a81c <dijkstra+0x140>)
	ldr	r2, [r3, #0]
	ldr	r3, [pc, #80]	 ;  (808a82c <dijkstra+0x150>)
	ldr	r3, [r3, #0]
	adds	r1, r2, r3
	ldr	r3, [pc, #60]	 ;  (808a820 <dijkstra+0x144>)
	ldr	r3, [r3, #0]
	mov	r2, r3
	push {r1, r2}
	mov.w r1, #87
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl enqueue
	push{r1, r2}
	mov.w r1, #87
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
lab5_dijkstra: 	ldr	r3, [pc, #56]	 ;  (808a824 <dijkstra+0x148>)
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r2, [pc, #48]	 ;  (808a824 <dijkstra+0x148>)
	str	r3, [r2, #0]
lab4_dijkstra: 	ldr	r3, [pc, #44]	 ;  (808a824 <dijkstra+0x148>)
	ldr	r3, [r3, #0]
	cmp	r3, #99	 ;  0x63
	ble.n lab7_dijkstra
lab3_dijkstra: 	bl	qcount 
	mov	r3, r0
	cmp	r3, #0
	bgt.n lab8_dijkstra
lab2_dijkstra: 	nop
	adds	r7, #8
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #85
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	nop
	.word	0x2000a19c
	.word	0x20009d68
	.word	0x2000a1a0
	.word	0x2000a108
	.word	0x2000a1a4
	.word	0x2000a190
	.word	0x2000000c
	.word	0x2000a10c
main:
	push	{r7, lr}
	sub	sp, #144	 ;  0x90
	add	r7, sp, #0
	movs	r3, #0
	str.w	r3, [r7, #132]	 ;  0x84
	bl HAL_Init
	push{r1, r2}
	mov.w r1, #2
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl SystemClock_Config
	push{r1, r2}
	mov.w r1, #12
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl MX_GPIO_Init
	bl MX_USART1_UART_Init
	push{r1, r2}
	mov.w r1, #26
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl MX_TIM5_Init
	push{r1, r2}
	mov.w r1, #76
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r3, #0
	str	r3, [r7, #0]
	ldr	r3, [pc, #204]	 ;  (808a924 <main+0xf4>)
	ldr	r3, [r3, #64]	 ;  0x40
	ldr	r2, [pc, #200]	 ;  (808a924 <main+0xf4>)
	orr.w	r3, r3, #8
	str	r3, [r2, #64]	 ;  0x40
	ldr	r3, [pc, #192]	 ;  (808a924 <main+0xf4>)
	ldr	r3, [r3, #64]	 ;  0x40
	and.w	r3, r3, #8
	str	r3, [r7, #0]
	ldr	r3, [r7, #0]
	ldr	r3, [pc, #184]	 ;  (808a928 <main+0xf8>)
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [pc, #180]	 ;  (808a928 <main+0xf8>)
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #32
	str	r2, [r3, #12]
	ldr	r3, [pc, #168]	 ;  (808a928 <main+0xf8>)
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #12]
	ldr	r3, [pc, #164]	 ;  (808a928 <main+0xf8>)
	ldr	r3, [r3, #0]
	orr.w	r2, r2, #64	 ;  0x40
	str	r2, [r3, #12]
	adds	r3, r7, #4
	movs	r2, #128	 ;  0x80
	movs	r1, #0
	mov	r0, r3
	bl memset
	movw	r0, #10000	 ;  0x2710
	bl HAL_Delay
	push{r1, r2}
	mov.w r1, #86
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r0, [pc, #136]	 ;  (808a92c <main+0xfc>)
	bl HAL_TIM_Base_Start
	movs	r3, #0
	str.w	r3, [r7, #140]	 ;  0x8c
	movs	r3, #50	 ;  0x32
	str.w	r3, [r7, #136]	 ;  0x88
	b.n lab0_main
lab1_main: 	ldr.w	r3, [r7, #136]	 ;  0x88
	ldr	r2, [pc, #116]	 ;  (808a930 <main+0x100>)
	smull	r1, r2, r2, r3
	asrs	r1, r2, #5
	asrs	r2, r3, #31
	subs	r2, r1, r2
	movs	r1, #100	 ;  0x64
	mul.w	r2, r1, r2
	subs	r3, r3, r2
	str.w	r3, [r7, #136]	 ;  0x88
	ldr.w	r1, [r7, #136]	 ;  0x88
	ldr.w	r0, [r7, #140]	 ;  0x8c
	bl dijkstra
	push{r1, r2}
	mov.w r1, #86
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr.w	r3, [r7, #140]	 ;  0x8c
	adds	r3, #1
	str.w	r3, [r7, #140]	 ;  0x8c
	ldr.w	r3, [r7, #136]	 ;  0x88
	adds	r3, #1
	str.w	r3, [r7, #136]	 ;  0x88
lab0_main: 	ldr.w	r3, [r7, #140]	 ;  0x8c
	cmp	r3, #19
	ble.n lab1_main
	ldr	r0, [pc, #48]	 ;  (808a92c <main+0xfc>)
	bl HAL_TIM_Base_Stop
	ldr	r3, [pc, #52]	 ;  (808a934 <main+0x104>)
	ldr	r3, [r3, #36]	 ;  0x24
	str.w	r3, [r7, #132]	 ;  0x84
	adds	r3, r7, #4
	ldr.w	r2, [r7, #132]	 ;  0x84
	ldr	r1, [pc, #40]	 ;  (808a938 <main+0x108>)
	mov	r0, r3
	bl siprintf
	push{r1, r2}
	mov.w r1, #100
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	adds	r1, r7, #4
	mov.w	r3, #4294967295	 ;  0xffffffff
	movs	r2, #128	 ;  0x80
	ldr	r0, [pc, #8]	 ;  (808a928 <main+0xf8>)
	bl HAL_UART_Transmit
	push{r1, r2}
	mov.w r1, #130
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
lab2_main: b.n lab2_main
	.word	0x40023800
	.word	0x20009d20
	.word	0x20009ce0
	.word	0x51eb851f
	.word	0x40000c00
	.word	0x0808b6f8
SystemClock_Config:
	push	{r7, lr}
	sub	sp, #80	 ;  0x50
	add	r7, sp, #0
	add.w	r3, r7, #32
	movs	r2, #48	 ;  0x30
	movs	r1, #0
	mov	r0, r3
	bl memset
	add.w	r3, r7, #12
	movs	r2, #0
	str	r2, [r3, #0]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, [pc, #160]	 ;  (808aa08 <SystemClock_Config+0xcc>)
	ldr	r3, [r3, #64]	 ;  0x40
	ldr	r2, [pc, #156]	 ;  (808aa08 <SystemClock_Config+0xcc>)
	orr.w	r3, r3, #268435456	 ;  0x10000000
	str	r3, [r2, #64]	 ;  0x40
	ldr	r3, [pc, #148]	 ;  (808aa08 <SystemClock_Config+0xcc>)
	ldr	r3, [r3, #64]	 ;  0x40
	and.w	r3, r3, #268435456	 ;  0x10000000
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, [pc, #136]	 ;  (808aa0c <SystemClock_Config+0xd0>)
	ldr	r3, [r3, #0]
	bic.w	r3, r3, #49152	 ;  0xc000
	ldr	r2, [pc, #128]	 ;  (808aa0c <SystemClock_Config+0xd0>)
	orr.w	r3, r3, #16384	 ;  0x4000
	str	r3, [r2, #0]
	ldr	r3, [pc, #120]	 ;  (808aa0c <SystemClock_Config+0xd0>)
	ldr	r3, [r3, #0]
	and.w	r3, r3, #49152	 ;  0xc000
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r3, #2
	str	r3, [r7, #32]
	movs	r3, #1
	str	r3, [r7, #44]	 ;  0x2c
	movs	r3, #16
	str	r3, [r7, #48]	 ;  0x30
	movs	r3, #2
	str	r3, [r7, #56]	 ;  0x38
	movs	r3, #0
	str	r3, [r7, #60]	 ;  0x3c
	movs	r3, #16
	str	r3, [r7, #64]	 ;  0x40
	movs	r3, #100	 ;  0x64
	str	r3, [r7, #68]	 ;  0x44
	movs	r3, #2
	str	r3, [r7, #72]	 ;  0x48
	movs	r3, #4
	str	r3, [r7, #76]	 ;  0x4c
	add.w	r3, r7, #32
	mov	r0, r3
	bl HAL_RCC_OscConfig
	push{r1, r2}
	mov.w r1, #14
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	beq.n lab0_SystemClock_Config
	bl Error_Handler
lab0_SystemClock_Config: 	movs	r3, #15
	str	r3, [r7, #12]
	movs	r3, #2
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #20]
	mov.w	r3, #4096	 ;  0x1000
	str	r3, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #28]
	add.w	r3, r7, #12
	movs	r1, #1
	mov	r0, r3
	bl HAL_RCC_ClockConfig
	push{r1, r2}
	mov.w r1, #16
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	cmp	r3, #0
	beq.n lab1_SystemClock_Config
	bl Error_Handler
lab1_SystemClock_Config: 	nop
	adds	r7, #80	 ;  0x50
	mov	sp, r7
	cpsid f
	push {r1, r2}
	mov.w r1, #11
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	.word	0x40023800
	.word	0x40007000
Error_Handler:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	ldr.w	r7, [sp], #4
	bx lr
	nop
memchr:
	and.w	r1, r1, #255	 ;  0xff
	cmp	r2, #16
	blt.n lab0_memchr
	tst.w	r0, #7
	beq.n lab1_memchr
lab4_memchr: 	ldrb.w	r3, [r0], #1
	subs	r2, #1
	cmp	r3, r1
	beq.n lab2_memchr
	tst.w	r0, #7
	cbz r2,lab3_memchr
	bne.n lab4_memchr
lab1_memchr: 	push	{r4, r5, r6, r7}
	orr.w	r1, r1, r1, lsl #8
	orr.w	r1, r1, r1, lsl #16
	bic.w	r4, r2, #7
	mvns.w	r7, #0
	movs	r3, #0
lab6_memchr: 	ldrd	r5, r6, [r0], #8
	subs	r4, #8
	eor.w	r5, r5, r1
	eor.w	r6, r6, r1
	uadd8	r5, r5, r7
	sel	r5, r3, r7
	uadd8	r6, r6, r7
	sel	r6, r5, r7
	cbnz r6,lab5_memchr
	bne.n lab6_memchr
	pop	{r4, r5, r6, r7}
	and.w	r1, r1, #255	 ;  0xff
	and.w	r2, r2, #7
lab0_memchr: 	cbz r2,lab3_memchr
lab7_memchr: 	ldrb.w	r3, [r0], #1
	subs	r2, #1
	eor.w	r3, r3, r1
	cbz r3,lab2_memchr
	bne.n lab7_memchr
lab3_memchr: 	movs	r0, #0
	bx lr
lab2_memchr: 	subs	r0, #1
	bx lr
lab5_memchr: 	cmp	r5, #0
	itte	eq
	moveq	r5, r6
	subeq	r0, #3
	subne	r0, #7
	tst.w	r5, #1
	bne.n lab8_memchr
	adds	r0, #1
	tst.w	r5, #256	 ;  0x100
	ittt	eq
	addeq	r0, #1
	tsteq.w	r5, #98304	 ;  0x18000
	addeq	r0, #1
lab8_memchr: 	pop	{r4, r5, r6, r7}
	subs	r0, #1
	bx lr
	nop
__aeabi_uldivmod:
	cbnz r3,lab0___aeabi_uldivmod
	cbnz r2,lab0___aeabi_uldivmod
	cmp	r1, #0
	it	eq
	cmpeq	r0, #0
	itt	ne
	movne.w	r1, #4294967295	 ;  0xffffffff
	movne.w	r0, #4294967295	 ;  0xffffffff
	b.w __aeabi_idiv0
lab0___aeabi_uldivmod: 	sub.w	ip, sp, #8
	strd	ip, lr, [sp, #-16]!
	bl __udivmoddi4
	push{r1, r2}
	mov.w r1, #22
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr.w	lr, [sp, #4]
	ldrd	r2, r3, [sp, #8]
	add	sp, #16
	cpsid f
	push {r1, r2}
	mov.w r1, #19
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
	bx lr
__udivmoddi4:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r6, [sp, #32]
	mov	r4, r0
	mov	r8, r1
	cmp	r3, #0
	bne.n lab0___udivmoddi4
	cmp	r2, r1
	mov	r5, r2
	bls.n lab1___udivmoddi4
	clz	r2, r2
	cbz r2,lab2___udivmoddi4
	rsb	r7, r2, #32
	lsl.w	r3, r1, r2
	lsr.w	r7, r0, r7
	lsls	r5, r2
	orr.w	r8, r7, r3
	lsls	r4, r2
lab2___udivmoddi4: 	mov.w	lr, r5, lsr #16
	lsrs	r3, r4, #16
	udiv	r7, r8, lr
	uxth.w	ip, r5
	mls	r8, lr, r7, r8
	orr.w	r3, r3, r8, lsl #16
	mul.w	r1, r7, ip
	cmp	r1, r3
	bls.n lab3___udivmoddi4
	adds	r3, r5, r3
	add.w	r0, r7, #4294967295	 ;  0xffffffff
	bcs.w lab4___udivmoddi4
	cmp	r1, r3
	bls.w lab4___udivmoddi4
	subs	r7, #2
	add	r3, r5
lab3___udivmoddi4: 	subs	r3, r3, r1
	uxth	r4, r4
	udiv	r0, r3, lr
	mls	r3, lr, r0, r3
	orr.w	r4, r4, r3, lsl #16
	mul.w	ip, r0, ip
	cmp	ip, r4
	bls.n lab5___udivmoddi4
	adds	r4, r5, r4
	add.w	r3, r0, #4294967295	 ;  0xffffffff
	bcs.w lab6___udivmoddi4
	cmp	ip, r4
	bls.w lab6___udivmoddi4
	subs	r0, #2
	add	r4, r5
lab5___udivmoddi4: 	orr.w	r0, r0, r7, lsl #16
	sub.w	r4, r4, ip
	movs	r7, #0
lab21___udivmoddi4: 	cbz r6,lab7___udivmoddi4
	lsrs	r4, r2
	movs	r3, #0
	strd	r4, r3, [r6]
lab7___udivmoddi4: 	mov	r1, r7
	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
lab0___udivmoddi4: 	cmp	r3, r1
	bls.n lab8___udivmoddi4
	cmp	r6, #0
	beq.w lab9___udivmoddi4
	movs	r7, #0
	strd	r0, r1, [r6]
	mov	r0, r7
	mov	r1, r7
	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
lab8___udivmoddi4: 	clz	r7, r3
	cmp	r7, #0
	bne.n lab10___udivmoddi4
	cmp	r3, r1
	bcc.n lab11___udivmoddi4
	cmp	r2, r0
	bhi.w lab12___udivmoddi4
lab11___udivmoddi4: 	subs	r4, r0, r2
	sbc.w	r3, r1, r3
	movs	r0, #1
	mov	r8, r3
lab35___udivmoddi4: 	cmp	r6, #0
	beq.n lab7___udivmoddi4
	strd	r4, r8, [r6]
	b.n lab7___udivmoddi4
lab1___udivmoddi4: cbnz r2,lab13___udivmoddi4
	udf	#255	 ;  0xff
lab13___udivmoddi4: 	clz	r2, r2
	cmp	r2, #0
	bne.w lab14___udivmoddi4
	subs	r1, r1, r5
	mov.w	lr, r5, lsr #16
	uxth.w	r8, r5
	movs	r7, #1
lab33___udivmoddi4: 	udiv	ip, r1, lr
	lsrs	r3, r4, #16
	mls	r1, lr, ip, r1
	orr.w	r3, r3, r1, lsl #16
	mul.w	r1, r8, ip
	cmp	r1, r3
	bls.n lab15___udivmoddi4
	adds	r3, r5, r3
	add.w	r0, ip, #4294967295	 ;  0xffffffff
	bcs.n lab16___udivmoddi4
	cmp	r1, r3
	bhi.w lab17___udivmoddi4
lab16___udivmoddi4: 	mov	ip, r0
lab15___udivmoddi4: 	subs	r1, r3, r1
	uxth	r3, r4
	udiv	r0, r1, lr
	mls	r4, lr, r0, r1
	orr.w	r4, r3, r4, lsl #16
	mul.w	r8, r8, r0
	cmp	r8, r4
	bls.n lab18___udivmoddi4
	adds	r4, r5, r4
	add.w	r3, r0, #4294967295	 ;  0xffffffff
	bcs.n lab19___udivmoddi4
	cmp	r8, r4
	bhi.w lab20___udivmoddi4
lab19___udivmoddi4: 	mov	r0, r3
lab18___udivmoddi4: 	sub.w	r4, r4, r8
	orr.w	r0, r0, ip, lsl #16
	b.n lab21___udivmoddi4
lab10___udivmoddi4: 	rsb	ip, r7, #32
	lsls	r3, r7
	lsr.w	lr, r2, ip
	orr.w	lr, lr, r3
	lsl.w	r4, r1, r7
	lsr.w	r5, r0, ip
	lsr.w	r3, r1, ip
	mov.w	r8, lr, lsr #16
	orrs	r5, r4
	udiv	r9, r3, r8
	lsrs	r4, r5, #16
	mls	r3, r8, r9, r3
	uxth.w	sl, lr
	orr.w	r3, r4, r3, lsl #16
	mul.w	r4, r9, sl
	cmp	r4, r3
	lsl.w	r2, r2, r7
	lsl.w	r1, r0, r7
	bls.n lab22___udivmoddi4
	adds.w	r3, lr, r3
	add.w	r0, r9, #4294967295	 ;  0xffffffff
	bcs.w lab23___udivmoddi4
	cmp	r4, r3
	bls.w lab23___udivmoddi4
	sub.w	r9, r9, #2
	add	r3, lr
lab22___udivmoddi4: 	subs	r3, r3, r4
	uxth	r5, r5
	udiv	r0, r3, r8
	mls	r3, r8, r0, r3
	orr.w	r4, r5, r3, lsl #16
	mul.w	sl, r0, sl
	cmp	sl, r4
	bls.n lab24___udivmoddi4
	adds.w	r4, lr, r4
	add.w	r3, r0, #4294967295	 ;  0xffffffff
	bcs.n lab25___udivmoddi4
	cmp	sl, r4
	bls.n lab25___udivmoddi4
	subs	r0, #2
	add	r4, lr
lab24___udivmoddi4: 	orr.w	r0, r0, r9, lsl #16
	umull	r8, r9, r0, r2
	sub.w	r4, r4, sl
	cmp	r4, r9
	mov	sl, r8
	mov	r3, r9
	bcc.n lab26___udivmoddi4
	beq.n lab27___udivmoddi4
lab34___udivmoddi4: 	cmp	r6, #0
	beq.n lab28___udivmoddi4
	subs.w	r5, r1, sl
	sbc.w	r4, r4, r3
	lsl.w	ip, r4, ip
	lsrs	r5, r7
	lsrs	r4, r7
	orr.w	r5, ip, r5
	strd	r5, r4, [r6]
	movs	r7, #0
	b.n lab7___udivmoddi4
lab14___udivmoddi4: 	rsb	r3, r2, #32
	lsr.w	r7, r0, r3
	lsls	r5, r2
	lsl.w	r0, r1, r2
	lsr.w	r3, r1, r3
	mov.w	lr, r5, lsr #16
	orrs	r0, r7
	lsrs	r1, r0, #16
	udiv	r7, r3, lr
	uxth.w	r8, r5
	mls	r3, lr, r7, r3
	orr.w	r1, r1, r3, lsl #16
	mul.w	r3, r7, r8
	cmp	r3, r1
	lsl.w	r4, r4, r2
	bls.n lab29___udivmoddi4
	adds	r1, r5, r1
	add.w	ip, r7, #4294967295	 ;  0xffffffff
	bcs.n lab30___udivmoddi4
	cmp	r3, r1
	bls.n lab30___udivmoddi4
	subs	r7, #2
	add	r1, r5
lab29___udivmoddi4: 	subs	r3, r1, r3
	uxth	r1, r0
	udiv	r0, r3, lr
	mls	r3, lr, r0, r3
	orr.w	r1, r1, r3, lsl #16
	mul.w	r3, r0, r8
	cmp	r3, r1
	bls.n lab31___udivmoddi4
	adds	r1, r5, r1
	add.w	ip, r0, #4294967295	 ;  0xffffffff
	bcs.n lab32___udivmoddi4
	cmp	r3, r1
	bls.n lab32___udivmoddi4
	subs	r0, #2
	add	r1, r5
lab31___udivmoddi4: 	subs	r1, r1, r3
	orr.w	r7, r0, r7, lsl #16
	b.n lab33___udivmoddi4
lab9___udivmoddi4: 	mov	r7, r6
	mov	r0, r6
	b.n lab7___udivmoddi4
lab4___udivmoddi4: 	mov	r7, r0
	b.n lab3___udivmoddi4
lab6___udivmoddi4: 	mov	r0, r3
	b.n lab5___udivmoddi4
lab27___udivmoddi4: 	cmp	r1, r8
	bcs.n lab34___udivmoddi4
lab26___udivmoddi4: 	subs.w	sl, r8, r2
	sbc.w	r2, r9, lr
	subs	r0, #1
	mov	r3, r2
	b.n lab34___udivmoddi4
lab32___udivmoddi4: 	mov	r0, ip
	b.n lab31___udivmoddi4
lab25___udivmoddi4: 	mov	r0, r3
	b.n lab24___udivmoddi4
lab30___udivmoddi4: 	mov	r7, ip
	b.n lab29___udivmoddi4
lab23___udivmoddi4: 	mov	r9, r0
	b.n lab22___udivmoddi4
lab20___udivmoddi4: 	subs	r0, #2
	add	r4, r5
	b.n lab18___udivmoddi4
lab17___udivmoddi4: 	sub.w	ip, ip, #2
	add	r3, r5
	b.n lab15___udivmoddi4
lab12___udivmoddi4: 	mov	r0, r7
	b.n lab35___udivmoddi4
lab28___udivmoddi4: 	mov	r7, r6
	cpsid f
	push {r1, r2}
	mov.w r1, #21
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	b.n lab7___udivmoddi4
__aeabi_idiv0:
	bx lr
	nop
Reset_Handler:
	ldr.w	sp, [pc, #52]	 ;  808adf8 <LoopFillZerobss+0x14>
	movs	r1, #0
	b.n LoopCopyDataInit
CopyDataInit:
	ldr	r3, [pc, #48]	 ;  (808adfc <LoopFillZerobss+0x18>)
	ldr	r3, [r3, r1]
	str	r3, [r0, r1]
	adds	r1, #4
LoopCopyDataInit:
	ldr	r0, [pc, #44]	 ;  (808ae00 <LoopFillZerobss+0x1c>)
	ldr	r3, [pc, #48]	 ;  (808ae04 <LoopFillZerobss+0x20>)
	adds	r2, r0, r1
	cmp	r2, r3
	bcc.n CopyDataInit
	ldr	r2, [pc, #44]	 ;  (808ae08 <LoopFillZerobss+0x24>)
	b.n LoopFillZerobss
FillZerobss:
	movs	r3, #0
	str.w	r3, [r2], #4
LoopFillZerobss:
	ldr	r3, [pc, #36]	 ;  (808ae0c <LoopFillZerobss+0x28>)
	cmp	r2, r3
	bcc.n FillZerobss
	bl SystemInit
	bl __libc_init_array
	bl main
	bx lr
	.word	0x20030000
	.word	0x0808b778
	.word	0x20000000
	.word	0x20009cb0
	.word	0x20009cb0
	.word	0x2000a1ac
ADC_IRQHandler:
	b.n ADC_IRQHandler
exit:
	push	{r3, lr}
	ldr	r3, [pc, #28]	 ;  (808ae34 <exit+0x20>)
	mov	r4, r0
	cbz r3,lab0_exit
	movs	r1, #0
	nop.w
lab0_exit: 	ldr	r3, [pc, #20]	 ;  (808ae38 <exit+0x24>)
	ldr	r0, [r3, #0]
	ldr	r3, [r0, #40]	 ;  0x28
	cbz r3,lab1_exit
	blx r3
lab1_exit: 	mov	r0, r4
	bl _exit
	cpsid f
	push {r1, r2}
	mov.w r1, #91
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	push{r1, r2}
	mov.w r1, #94
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	nop
	.word	0x00000000
	.word	0x0808b730
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, [pc, #52]	 ;  (808ae74 <__libc_init_array+0x38>)
	ldr	r4, [pc, #52]	 ;  (808ae78 <__libc_init_array+0x3c>)
	subs	r4, r4, r6
	asrs	r4, r4, #2
	movs	r5, #0
lab2___libc_init_array: 	cmp	r5, r4
	bne.n lab0___libc_init_array
	ldr	r6, [pc, #44]	 ;  (808ae7c <__libc_init_array+0x40>)
	ldr	r4, [pc, #48]	 ;  (808ae80 <__libc_init_array+0x44>)
	bl _init
	subs	r4, r4, r6
	asrs	r4, r4, #2
	movs	r5, #0
lab3___libc_init_array: 	cmp	r5, r4
	bne.n lab1___libc_init_array
	pop	{r4, r5, r6, pc}
lab0___libc_init_array: 	ldr.w	r3, [r6, r5, lsl #2]
	blx r3
	adds	r5, #1
	b.n lab2___libc_init_array
lab1___libc_init_array: 	ldr.w	r3, [r6, r5, lsl #2]
	blx r3
	adds	r5, #1
	b.n lab3___libc_init_array
	.word	0x0808b770
	.word	0x0808b770
	.word	0x0808b770
	.word	0x0808b774
malloc:
	ldr	r3, [pc, #8]	 ;  (808ae90 <malloc+0xc>)
	mov	r1, r0
	ldr	r0, [r3, #0]
	b.w _malloc_r
	cpsid f
	push {r1, r2}
	mov.w r1, #89
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	nop
	.word	0x20009c4c
free:
	ldr	r3, [pc, #8]	 ;  (808aea0 <free+0xc>)
	mov	r1, r0
	ldr	r0, [r3, #0]
	b.w _free_r
	cpsid f
	push {r1, r2}
	mov.w r1, #97
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	nop
	.word	0x20009c4c
memset:
	add	r2, r0
	mov	r3, r0
lab1_memset: 	cmp	r3, r2
	bne.n lab0_memset
	bx lr
lab0_memset: 	strb.w	r1, [r3], #1
	b.n lab1_memset
_free_r:
	push	{r3, r4, r5, lr}
	mov	r5, r0
	cmp	r1, #0
	beq.n lab0__free_r
	ldr.w	r3, [r1, #-4]
	subs	r4, r1, #4
	cmp	r3, #0
	it	lt
	addlt	r4, r4, r3
	bl __malloc_lock
	ldr	r2, [pc, #124]	 ;  (808af4c <_free_r+0x98>)
	ldr	r3, [r2, #0]
	mov	r0, r2
	cbnz r3,lab1__free_r
	str	r3, [r4, #4]
	str	r4, [r2, #0]
lab3__free_r: 	mov	r0, r5
	ldmia.w	sp!, {r3, r4, r5, lr}
	b.w __malloc_unlock
lab1__free_r: 	cmp	r3, r4
	bls.n lab2__free_r
	ldr	r1, [r4, #0]
	adds	r2, r4, r1
	cmp	r3, r2
	itt	eq
	ldreq	r2, [r3, #0]
	ldreq	r3, [r3, #4]
	str	r3, [r4, #4]
	itt	eq
	addeq	r2, r2, r1
	streq	r2, [r4, #0]
	str	r4, [r0, #0]
	b.n lab3__free_r
lab5__free_r: 	mov	r3, r2
lab2__free_r: 	ldr	r2, [r3, #4]
	cbz r2,lab4__free_r
	cmp	r2, r4
	bls.n lab5__free_r
lab4__free_r: 	ldr	r1, [r3, #0]
	adds	r0, r3, r1
	cmp	r0, r4
	bne.n lab6__free_r
	ldr	r0, [r4, #0]
	add	r1, r0
	adds	r0, r3, r1
	cmp	r2, r0
	str	r1, [r3, #0]
	bne.n lab3__free_r
	ldr	r0, [r2, #0]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	add	r1, r0
	str	r1, [r3, #0]
	b.n lab3__free_r
lab6__free_r: 	bls.n	lab7__free_r 808af30
	movs	r3, #12
	str	r3, [r5, #0]
	b.n lab3__free_r
	ldr	r0, [r4, #0]
	adds	r1, r4, r0
	cmp	r2, r1
	itt	eq
	ldreq	r1, [r2, #0]
	ldreq	r2, [r2, #4]
	str	r2, [r4, #4]
	itt	eq
	addeq	r1, r1, r0
	streq	r1, [r4, #0]
	str	r4, [r3, #4]
	b.n lab3__free_r
	cpsid f
	push {r1, r2}
	mov.w r1, #121
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
lab0__free_r: 	pop	{r3, r4, r5, pc}
	nop
	.word	0x20009cd4
_malloc_r:
	push	{r4, r5, r6, lr}
	adds	r5, r1, #3
	bic.w	r5, r5, #3
	adds	r5, #8
	cmp	r5, #12
	it	cc
	movcc	r5, #12
	cmp	r5, #0
	mov	r6, r0
	blt.n lab0__malloc_r
	cmp	r1, r5
	bls.n lab1__malloc_r
lab0__malloc_r: 	movs	r3, #12
	str	r3, [r6, #0]
lab5__malloc_r: 	movs	r0, #0
lab8__malloc_r: 	pop	{r4, r5, r6, pc}
lab1__malloc_r: 	bl	__malloc_lock 
	ldr	r2, [pc, #132]	 ;  (808affc <_malloc_r+0xac>)
	ldr	r4, [r2, #0]
	mov	r1, r4
lab10__malloc_r: 	cbnz r1,lab2__malloc_r
	ldr	r4, [pc, #128]	 ;  (808b000 <_malloc_r+0xb0>)
	ldr	r3, [r4, #0]
	cbnz r3,lab3__malloc_r
	mov	r0, r6
	push {r1, r2}
	mov.w r1, #105
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl _sbrk_r
	push{r1, r2}
	mov.w r1, #105
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r4, #0]
lab3__malloc_r: 	mov	r1, r5
	mov	r0, r6
	push {r1, r2}
	mov.w r1, #105
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl _sbrk_r
	push{r1, r2}
	mov.w r1, #105
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	adds	r3, r0, #1
	bne.n lab4__malloc_r
lab12__malloc_r: 	movs	r3, #12
	str	r3, [r6, #0]
	mov	r0, r6
	bl __malloc_unlock
	b.n lab5__malloc_r
lab2__malloc_r: 	ldr	r3, [r1, #0]
	subs	r3, r3, r5
	bmi.n lab6__malloc_r
	cmp	r3, #11
	bls.n lab7__malloc_r
	str	r3, [r1, #0]
	str	r5, [r1, r3]
	adds	r4, r1, r3
lab9__malloc_r: 	mov	r0, r6
	bl __malloc_unlock
	add.w	r0, r4, #11
	adds	r3, r4, #4
	bic.w	r0, r0, #7
	subs	r3, r0, r3
	beq.n lab8__malloc_r
	negs	r2, r3
	str	r2, [r4, r3]
	b.n lab8__malloc_r
lab7__malloc_r: 	cmp	r4, r1
	ldr	r3, [r1, #4]
	itet	ne
	strne	r3, [r4, #4]
	streq	r3, [r2, #0]
	movne	r4, r1
	b.n lab9__malloc_r
lab6__malloc_r: 	mov	r4, r1
	ldr	r1, [r1, #4]
	b.n lab10__malloc_r
lab4__malloc_r: 	adds	r4, r0, #3
	bic.w	r4, r4, #3
	cmp	r0, r4
	beq.n lab11__malloc_r
	subs	r1, r4, r0
	mov	r0, r6
	push {r1, r2}
	mov.w r1, #105
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl _sbrk_r
	push{r1, r2}
	mov.w r1, #105
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	adds	r0, #1
	beq.n lab12__malloc_r
lab11__malloc_r: 	str	r5, [r4, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #103
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
	b.n lab9__malloc_r
	.word	0x20009cd4
	.word	0x20009cd8
_sbrk_r:
	push	{r3, r4, r5, lr}
	ldr	r4, [pc, #24]	 ;  (808b020 <_sbrk_r+0x1c>)
	movs	r3, #0
	mov	r5, r0
	mov	r0, r1
	str	r3, [r4, #0]
	bl _sbrk
	adds	r3, r0, #1
	bne.n lab0__sbrk_r
	ldr	r3, [r4, #0]
	cbz r3,lab0__sbrk_r
	str	r3, [r5, #0]
	cpsid f
	push {r1, r2}
	mov.w r1, #105
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
lab0__sbrk_r: 	pop	{r3, r4, r5, pc}
	.word	0x2000a1a8
siprintf:
	push	{r1, r2, r3}
	push	{lr}
	sub	sp, #112	 ;  0x70
	add	r3, sp, #116	 ;  0x74
	str	r0, [sp, #8]
	str	r0, [sp, #24]
	mvn.w	r1, #2147483648	 ;  0x80000000
	ldr	r0, [pc, #36]	 ;  (808b05c <siprintf+0x38>)
	str	r1, [sp, #28]
	str	r1, [sp, #16]
	ldr	r1, [pc, #36]	 ;  (808b060 <siprintf+0x3c>)
	ldr.w	r2, [r3], #4
	str	r1, [sp, #20]
	ldr	r0, [r0, #0]
	str	r3, [sp, #4]
	add	r1, sp, #8
	bl _svfiprintf_r
	push{r1, r2}
	mov.w r1, #102
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [sp, #8]
	movs	r2, #0
	strb	r2, [r3, #0]
	add	sp, #112	 ;  0x70
	ldr.w	lr, [sp], #4
	add	sp, #12
	cpsid f
	push {r1, r2}
	mov.w r1, #99
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	bx lr
	.word	0x20009c4c
	.word	0xffff0208
__malloc_lock:
	bx lr
__malloc_unlock:
	bx lr
__ssputs_r:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r6, [r1, #8]
	cmp	r6, r3
	mov	sl, r0
	mov	r4, r1
	mov	r8, r2
	mov	r9, r3
	bhi.n lab0___ssputs_r
	ldrh	r2, [r1, #12]
	tst.w	r2, #1152	 ;  0x480
	beq.n lab1___ssputs_r
	ldr	r5, [r4, #0]
	ldr	r1, [r1, #16]
	subs	r7, r5, r1
	ldr	r5, [r4, #20]
	movs	r3, #2
	add.w	r5, r5, r5, lsl #1
	sdiv	r5, r5, r3
	add.w	r3, r9, #1
	add	r3, r7
	cmp	r5, r3
	it	cc
	movcc	r5, r3
	lsls	r3, r2, #21
	bpl.n lab2___ssputs_r
	mov	r1, r5
	push {r1, r2}
	mov.w r1, #103
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl _malloc_r
	push{r1, r2}
	mov.w r1, #103
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r6, r0
	cbnz r0,lab3___ssputs_r
lab7___ssputs_r: 	movs	r3, #12
	str.w	r3, [sl]
	ldrh	r3, [r4, #12]
	orr.w	r3, r3, #64	 ;  0x40
	strh	r3, [r4, #12]
	mov.w	r0, #4294967295	 ;  0xffffffff
lab5___ssputs_r: 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
lab3___ssputs_r: 	mov	r2, r7
	ldr	r1, [r4, #16]
	push {r1, r2}
	mov.w r1, #115
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl memcpy
	push{r1, r2}
	mov.w r1, #115
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldrh	r3, [r4, #12]
	bic.w	r3, r3, #1152	 ;  0x480
	orr.w	r3, r3, #128	 ;  0x80
	strh	r3, [r4, #12]
lab6___ssputs_r: 	str	r6, [r4, #16]
	str	r5, [r4, #20]
	add	r6, r7
	subs	r5, r5, r7
	str	r6, [r4, #0]
	str	r5, [r4, #8]
	mov	r6, r9
lab1___ssputs_r: 	cmp	r6, r9
	bls.n lab4___ssputs_r
lab0___ssputs_r: 	mov	r6, r9
lab4___ssputs_r: 	mov	r2, r6
	mov	r1, r8
	ldr	r0, [r4, #0]
	bl memmove
	push{r1, r2}
	mov.w r1, #118
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r4, #8]
	subs	r3, r3, r6
	str	r3, [r4, #8]
	ldr	r3, [r4, #0]
	add	r6, r3
	str	r6, [r4, #0]
	movs	r0, #0
	b.n lab5___ssputs_r
lab2___ssputs_r: 	mov	r2, r5
	bl _realloc_r
	push{r1, r2}
	mov.w r1, #120
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r6, r0
	cmp	r0, #0
	bne.n lab6___ssputs_r
	ldr	r1, [r4, #16]
	mov	r0, sl
	push {r1, r2}
	mov.w r1, #121
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl _free_r
	cpsid f
	push {r1, r2}
	mov.w r1, #111
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	push{r1, r2}
	mov.w r1, #121
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b.n lab7___ssputs_r
_svfiprintf_r:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r5, r3
	ldrh	r3, [r1, #12]
	lsls	r7, r3, #24
	sub	sp, #116	 ;  0x74
	mov	r8, r0
	mov	r4, r1
	mov	r6, r2
	bpl.n lab0__svfiprintf_r
	ldr	r3, [r1, #16]
	cbnz r3,lab0__svfiprintf_r
	movs	r1, #64	 ;  0x40
	push {r1, r2}
	mov.w r1, #103
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl _malloc_r
	push{r1, r2}
	mov.w r1, #103
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r4, #0]
	str	r0, [r4, #16]
	cbnz r0,lab1__svfiprintf_r
	movs	r3, #12
	str.w	r3, [r8]
lab25__svfiprintf_r: 	mov.w	r0, #4294967295	 ;  0xffffffff
	b.n lab2__svfiprintf_r
lab1__svfiprintf_r: 	movs	r3, #64	 ;  0x40
	str	r3, [r4, #20]
lab0__svfiprintf_r: 	movs	r3, #0
	str	r3, [sp, #36]	 ;  0x24
	movs	r3, #32
	strb.w	r3, [sp, #41]	 ;  0x29
	movs	r3, #48	 ;  0x30
	strb.w	r3, [sp, #42]	 ;  0x2a
	str	r5, [sp, #12]
	mov.w	fp, #1
lab20__svfiprintf_r: 	mov	r7, r6
lab12__svfiprintf_r: 	mov	r5, r7
	ldrb.w	r3, [r5], #1
	cbz r3,lab3__svfiprintf_r
	cmp	r3, #37	 ;  0x25
	bne.n lab4__svfiprintf_r
lab3__svfiprintf_r: 	subs.w	sl, r7, r6
	beq.n lab5__svfiprintf_r
	mov	r3, sl
	mov	r2, r6
	mov	r1, r4
	mov	r0, r8
	bl __ssputs_r
	push{r1, r2}
	mov.w r1, #112
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	adds	r0, #1
	beq.w lab6__svfiprintf_r
	ldr	r3, [sp, #36]	 ;  0x24
	add	r3, sl
	str	r3, [sp, #36]	 ;  0x24
lab5__svfiprintf_r: 	ldrb	r3, [r7, #0]
	cmp	r3, #0
	beq.w lab6__svfiprintf_r
	movs	r3, #0
	mov.w	r2, #4294967295	 ;  0xffffffff
	strd	r2, r3, [sp, #20]
	str	r3, [sp, #16]
	str	r3, [sp, #28]
	strb.w	r3, [sp, #83]	 ;  0x53
	str	r3, [sp, #104]	 ;  0x68
lab13__svfiprintf_r: 	mov	r7, r5
	movs	r2, #5
	ldrb.w	r1, [r7], #1
	ldr	r0, [pc, #320]	 ;  (808b2f8 <_svfiprintf_r+0x1dc>)
	bl memchr
	ldr	r3, [sp, #16]
	cbnz r0,lab7__svfiprintf_r
	lsls	r1, r3, #27
	itt	mi
	movmi	r2, #32
	strbmi.w	r2, [sp, #83]	 ;  0x53
	lsls	r2, r3, #28
	itt	mi
	r2, #43	 ;  0x2b
	strbmi.w	r2, [sp, #83]	 ;  0x53
	ldrb	r2, [r5, #0]
	cmp	r2, #42	 ;  0x2a
	beq.n lab8__svfiprintf_r
	ldr	r2, [sp, #28]
	mov	r7, r5
	movs	r0, #0
	movs	r5, #10
lab21__svfiprintf_r: 	mov	r1, r7
	ldrb.w	r3, [r1], #1
	subs	r3, #48	 ;  0x30
	cmp	r3, #9
	bls.n lab9__svfiprintf_r
	cbz r0,lab10__svfiprintf_r
	b.n lab11__svfiprintf_r
lab4__svfiprintf_r: 	mov	r7, r5
	b.n lab12__svfiprintf_r
lab7__svfiprintf_r: 	ldr	r2, [pc, #256]	 ;  (808b2f8 <_svfiprintf_r+0x1dc>)
	subs	r0, r0, r2
	lsl.w	r0, fp, r0
	orrs	r0, r3
	str	r0, [sp, #16]
	mov	r5, r7
	b.n lab13__svfiprintf_r
lab8__svfiprintf_r: 	ldr	r2, [sp, #12]
	adds	r1, r2, #4
	ldr	r2, [r2, #0]
	str	r1, [sp, #12]
	cmp	r2, #0
	blt.n lab14__svfiprintf_r
lab11__svfiprintf_r: 	str	r2, [sp, #28]
	b.n lab10__svfiprintf_r
lab14__svfiprintf_r: 	negs	r2, r2
	orr.w	r3, r3, #2
	str	r2, [sp, #28]
	str	r3, [sp, #16]
lab10__svfiprintf_r: 	ldrb	r3, [r7, #0]
	cmp	r3, #46	 ;  0x2e
	bne.n lab15__svfiprintf_r
	ldrb	r3, [r7, #1]
	cmp	r3, #42	 ;  0x2a
	bne.n lab16__svfiprintf_r
	ldr	r3, [sp, #12]
	adds	r2, r3, #4
	ldr	r3, [r3, #0]
	str	r2, [sp, #12]
	cmp	r3, #0
	it	lt
	movlt.w	r3, #4294967295	 ;  0xffffffff
	adds	r7, #2
	str	r3, [sp, #20]
lab15__svfiprintf_r: 	ldr	r5, [pc, #184]	 ;  (808b2fc <_svfiprintf_r+0x1e0>)
	ldrb	r1, [r7, #0]
	movs	r2, #3
	mov	r0, r5
	bl memchr
	cbz r0,lab17__svfiprintf_r
	movs	r3, #64	 ;  0x40
	subs	r0, r0, r5
	lsl.w	r0, r3, r0
	ldr	r3, [sp, #16]
	orrs	r3, r0
	adds	r7, #1
	str	r3, [sp, #16]
lab17__svfiprintf_r: 	ldrb	r1, [r7, #0]
	ldr	r0, [pc, #156]	 ;  (808b300 <_svfiprintf_r+0x1e4>)
	strb.w	r1, [sp, #40]	 ;  0x28
	movs	r2, #6
	adds	r6, r7, #1
	bl memchr
	cmp	r0, #0
	beq.n lab18__svfiprintf_r
	ldr	r3, [pc, #144]	 ;  (808b304 <_svfiprintf_r+0x1e8>)
	cbnz r3,lab19__svfiprintf_r
	ldr	r3, [sp, #12]
	adds	r3, #7
	bic.w	r3, r3, #7
	adds	r3, #8
	str	r3, [sp, #12]
lab24__svfiprintf_r: 	ldr	r3, [sp, #36]	 ;  0x24
	add	r3, r9
	str	r3, [sp, #36]	 ;  0x24
	b.n lab20__svfiprintf_r
lab9__svfiprintf_r: 	mla	r2, r5, r2, r3
	movs	r0, #1
	mov	r7, r1
	b.n lab21__svfiprintf_r
lab16__svfiprintf_r: 	movs	r3, #0
	adds	r7, #1
	str	r3, [sp, #20]
	mov	r1, r3
	movs	r5, #10
lab23__svfiprintf_r: 	mov	r0, r7
	ldrb.w	r2, [r0], #1
	subs	r2, #48	 ;  0x30
	cmp	r2, #9
	bls.n lab22__svfiprintf_r
	cmp	r3, #0
	beq.n lab15__svfiprintf_r
	str	r1, [sp, #20]
	b.n lab15__svfiprintf_r
lab22__svfiprintf_r: 	mla	r1, r5, r1, r2
	movs	r3, #1
	mov	r7, r0
	b.n lab23__svfiprintf_r
lab19__svfiprintf_r: 	add	r3, sp, #12
	str	r3, [sp, #0]
	mov	r2, r4
	ldr	r3, [pc, #68]	 ;  (808b308 <_svfiprintf_r+0x1ec>)
	add	r1, sp, #16
	mov	r0, r8
	nop.w
lab26__svfiprintf_r: 	cmp.w	r0, #4294967295	 ;  0xffffffff
	mov	r9, r0
	bne.n lab24__svfiprintf_r
lab6__svfiprintf_r: 	ldrh	r3, [r4, #12]
	lsls	r3, r3, #25
	bmi.w lab25__svfiprintf_r
	ldr	r0, [sp, #36]	 ;  0x24
lab2__svfiprintf_r: 	add	sp, #116	 ;  0x74
	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
lab18__svfiprintf_r: 	add	r3, sp, #12
	str	r3, [sp, #0]
	mov	r2, r4
	ldr	r3, [pc, #28]	 ;  (808b308 <_svfiprintf_r+0x1ec>)
	add	r1, sp, #16
	mov	r0, r8
	bl _printf_i
	cpsid f
	push {r1, r2}
	mov.w r1, #101
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	b.n lab26__svfiprintf_r
	nop
	.word	0x0808b734
	.word	0x0808b73a
	.word	0x0808b73e
	.word	0x00000000
	.word	0x0808b069
_printf_common:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	mov	r9, r2
	mov	r7, r3
	ldr	r2, [r1, #8]
	ldr	r3, [r1, #16]
	ldr.w	r8, [sp, #32]
	cmp	r3, r2
	it	lt
	movlt	r3, r2
	str.w	r3, [r9]
	ldrb.w	r2, [r1, #67]	 ;  0x43
	mov	r6, r0
	mov	r4, r1
	cbz r2,lab0__printf_common
	adds	r3, #1
	str.w	r3, [r9]
lab0__printf_common: 	ldr	r3, [r4, #0]
	lsls	r1, r3, #26
	ittt	mi
	ldrmi.w	r3, [r9]
	addmi	r3, #2
	strmi.w	r3, [r9]
	ldr	r5, [r4, #0]
	ands.w	r5, r5, #6
	bne.n lab1__printf_common
	add.w	sl, r4, #25
lab8__printf_common: 	ldr	r3, [r4, #12]
	ldr.w	r2, [r9]
	subs	r3, r3, r2
	cmp	r3, r5
	bgt.n lab2__printf_common
lab1__printf_common: 	ldrb.w	r3, [r4, #67]	 ;  0x43
	ldr	r2, [r4, #0]
	adds	r3, #0
	it	ne
	movne	r3, #1
	lsls	r2, r2, #26
	bmi.n lab3__printf_common
lab9__printf_common: 	add.w	r2, r4, #67	 ;  0x43
	mov	r1, r7
	mov	r0, r6
	blx r8
	adds	r0, #1
	beq.n lab4__printf_common
	ldr	r3, [r4, #0]
	ldr	r5, [r4, #12]
	ldr.w	r2, [r9]
	and.w	r3, r3, #6
	cmp	r3, #4
	it	eq
	subeq	r5, r5, r2
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #16]
	ite	eq
	biceq.w	r5, r5, r5, asr #31
	movne	r5, #0
	cmp	r3, r2
	itt	gt
	subgt	r3, r3, r2
	addgt	r5, r5, r3
	mov.w	r9, #0
	adds	r4, #26
lab10__printf_common: 	cmp	r5, r9
	bne.n lab5__printf_common
	movs	r0, #0
	b.n lab6__printf_common
lab2__printf_common: 	movs	r3, #1
	mov	r2, sl
	mov	r1, r7
	mov	r0, r6
	blx r8
	adds	r0, #1
	bne.n lab7__printf_common
lab4__printf_common: 	mov.w	r0, #4294967295	 ;  0xffffffff
lab6__printf_common: 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
lab7__printf_common: 	adds	r5, #1
	b.n lab8__printf_common
lab3__printf_common: 	adds	r1, r4, r3
	adds	r2, r3, #1
	movs	r0, #48	 ;  0x30
	strb.w	r0, [r1, #67]	 ;  0x43
	add	r2, r4
	ldrb.w	r1, [r4, #69]	 ;  0x45
	strb.w	r1, [r2, #67]	 ;  0x43
	adds	r3, #2
	b.n lab9__printf_common
lab5__printf_common: 	movs	r3, #1
	mov	r2, r4
	mov	r1, r7
	mov	r0, r6
	blx r8
	adds	r0, #1
	beq.n lab4__printf_common
	add.w	r9, r9, #1
	b.n lab10__printf_common
_printf_i:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
	add.w	ip, r1, #67	 ;  0x43
	mov	r4, r1
	ldrb	r1, [r1, #24]
	sub	sp, #20
	cmp	r1, #110	 ;  0x6e
	mov	r7, r2
	mov	r6, r0
	mov	r8, r3
	ldr	r2, [sp, #48]	 ;  0x30
	beq.w lab0__printf_i
	bhi.n lab1__printf_i
	cmp	r1, #99	 ;  0x63
	beq.n lab2__printf_i
	bhi.n lab3__printf_i
	cmp	r1, #0
	beq.w lab4__printf_i
	cmp	r1, #88	 ;  0x58
	beq.w lab5__printf_i
lab8__printf_i: 	add.w	r5, r4, #66	 ;  0x42
	strb.w	r1, [r4, #66]	 ;  0x42
	b.n lab6__printf_i
lab3__printf_i: 	cmp	r1, #100	 ;  0x64
	beq.n lab7__printf_i
	cmp	r1, #105	 ;  0x69
	bne.n lab8__printf_i
lab7__printf_i: 	ldr	r0, [r4, #0]
	ldr	r3, [r2, #0]
	lsls	r5, r0, #24
	add.w	r1, r3, #4
	bpl.n lab9__printf_i
	ldr	r3, [r3, #0]
	str	r1, [r2, #0]
lab18__printf_i: 	cmp	r3, #0
	bge.n lab10__printf_i
	movs	r2, #45	 ;  0x2d
	negs	r3, r3
	strb.w	r2, [r4, #67]	 ;  0x43
lab10__printf_i: 	ldr	r0, [pc, #444]	 ;  (808b614 <_printf_i+0x21c>)
	movs	r2, #10
	b.n lab11__printf_i
lab1__printf_i: 	cmp	r1, #115	 ;  0x73
	beq.w lab12__printf_i
	bhi.n lab13__printf_i
	cmp	r1, #111	 ;  0x6f
	beq.n lab14__printf_i
	cmp	r1, #112	 ;  0x70
	bne.n lab8__printf_i
	ldr	r3, [r4, #0]
	orr.w	r3, r3, #32
	str	r3, [r4, #0]
	b.n lab15__printf_i
lab13__printf_i: 	cmp	r1, #117	 ;  0x75
	beq.n lab14__printf_i
	cmp	r1, #120	 ;  0x78
	bne.n lab8__printf_i
lab15__printf_i: 	movs	r3, #120	 ;  0x78
	strb.w	r3, [r4, #69]	 ;  0x45
	ldr	r0, [pc, #400]	 ;  (808b618 <_printf_i+0x220>)
	b.n lab16__printf_i
lab2__printf_i: 	ldr	r3, [r2, #0]
	adds	r1, r3, #4
	ldr	r3, [r3, #0]
	str	r1, [r2, #0]
	add.w	r5, r4, #66	 ;  0x42
	strb.w	r3, [r4, #66]	 ;  0x42
lab6__printf_i: 	movs	r3, #1
	b.n lab17__printf_i
lab9__printf_i: 	ldr	r3, [r3, #0]
	str	r1, [r2, #0]
	tst.w	r0, #64	 ;  0x40
	it	ne
	sxthne	r3, r3
	b.n lab18__printf_i
lab14__printf_i: 	ldr	r3, [r2, #0]
	ldr	r5, [r4, #0]
	adds	r0, r3, #4
	str	r0, [r2, #0]
	lsls	r0, r5, #24
	bpl.n lab19__printf_i
lab21__printf_i: 	ldr	r3, [r3, #0]
	b.n lab20__printf_i
lab19__printf_i: 	lsls	r0, r5, #25
	bpl.n lab21__printf_i
	ldrh	r3, [r3, #0]
lab20__printf_i: 	ldr	r0, [pc, #336]	 ;  (808b614 <_printf_i+0x21c>)
	cmp	r1, #111	 ;  0x6f
	ite	ne
	movne	r2, #10
	moveq	r2, #8
lab29__printf_i: 	movs	r1, #0
	strb.w	r1, [r4, #67]	 ;  0x43
lab11__printf_i: 	ldr	r5, [r4, #4]
	str	r5, [r4, #8]
	cmp	r5, #0
	blt.w lab22__printf_i
	ldr	r1, [r4, #0]
	bic.w	r1, r1, #4
	str	r1, [r4, #0]
	cmp	r3, #0
	bne.n lab23__printf_i
	cmp	r5, #0
	bne.w lab24__printf_i
	mov	r5, ip
lab32__printf_i: 	cmp	r2, #8
	bne.n lab25__printf_i
	ldr	r3, [r4, #0]
	lsls	r3, r3, #31
	bpl.n lab25__printf_i
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #4]
	cmp	r2, r3
	ittt	le
	r3, #48	 ;  0x30
	strble.w	r3, [r5, #-1]
	addle.w	r5, r5, #4294967295	 ;  0xffffffff
lab25__printf_i: 	sub.w	r3, ip, r5
	str	r3, [r4, #16]
lab35__printf_i: 	str.w	r8, [sp]
	mov	r3, r7
	add	r2, sp, #12
	mov	r1, r4
	mov	r0, r6
	bl _printf_common
	adds	r0, #1
	bne.n lab26__printf_i
lab37__printf_i: 	mov.w	r0, #4294967295	 ;  0xffffffff
lab39__printf_i: 	add	sp, #20
	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
lab5__printf_i: 	ldr	r0, [pc, #228]	 ;  (808b614 <_printf_i+0x21c>)
	strb.w	r1, [r4, #69]	 ;  0x45
lab16__printf_i: 	ldr	r3, [r2, #0]
	ldr	r1, [r4, #0]
	adds	r5, r3, #4
	ldr	r3, [r3, #0]
	str	r5, [r2, #0]
	lsls	r2, r1, #24
	bpl.n lab27__printf_i
lab30__printf_i: 	lsls	r2, r1, #31
	itt	mi
	orrmi.w	r1, r1, #32
	strmi	r1, [r4, #0]
	cbnz r3,lab28__printf_i
	ldr	r2, [r4, #0]
	bic.w	r2, r2, #32
	str	r2, [r4, #0]
lab28__printf_i: 	movs	r2, #16
	b.n lab29__printf_i
lab27__printf_i: 	lsls	r5, r1, #25
	it	mi
	uxthmi	r3, r3
	b.n lab30__printf_i
lab23__printf_i: 	mov	r5, ip
lab31__printf_i: 	udiv	r1, r3, r2
	mls	r3, r2, r1, r3
	ldrb	r3, [r0, r3]
	strb.w	r3, [r5, #-1]!
	mov	r3, r1
	cmp	r1, #0
	bne.n lab31__printf_i
	b.n lab32__printf_i
lab0__printf_i: 	ldr	r3, [r2, #0]
	ldr	r5, [r4, #0]
	ldr	r1, [r4, #20]
	adds	r0, r3, #4
	str	r0, [r2, #0]
	lsls	r0, r5, #24
	ldr	r3, [r3, #0]
	bpl.n lab33__printf_i
lab34__printf_i: 	str	r1, [r3, #0]
	b.n lab4__printf_i
lab33__printf_i: 	lsls	r2, r5, #25
	bpl.n lab34__printf_i
	strh	r1, [r3, #0]
lab4__printf_i: 	movs	r3, #0
	str	r3, [r4, #16]
	mov	r5, ip
	b.n lab35__printf_i
lab12__printf_i: 	ldr	r3, [r2, #0]
	adds	r1, r3, #4
	str	r1, [r2, #0]
	ldr	r5, [r3, #0]
	ldr	r2, [r4, #4]
	movs	r1, #0
	mov	r0, r5
	bl memchr
	cbz r0,lab36__printf_i
	subs	r0, r0, r5
	str	r0, [r4, #4]
lab36__printf_i: 	ldr	r3, [r4, #4]
lab17__printf_i: 	str	r3, [r4, #16]
	movs	r3, #0
	strb.w	r3, [r4, #67]	 ;  0x43
	b.n lab35__printf_i
lab26__printf_i: 	ldr	r3, [r4, #16]
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	blx r8
	adds	r0, #1
	beq.n lab37__printf_i
	ldr	r3, [r4, #0]
	lsls	r3, r3, #30
	bmi.n lab38__printf_i
lab41__printf_i: 	ldr	r0, [r4, #12]
	ldr	r3, [sp, #12]
	cmp	r0, r3
	it	lt
	movlt	r0, r3
	b.n lab39__printf_i
lab40__printf_i: 	movs	r3, #1
	mov	r2, r9
	mov	r1, r7
	mov	r0, r6
	blx r8
	adds	r0, #1
	beq.n lab37__printf_i
	adds	r5, #1
lab42__printf_i: 	ldr	r3, [r4, #12]
	ldr	r2, [sp, #12]
	subs	r3, r3, r2
	cmp	r3, r5
	bgt.n lab40__printf_i
	b.n lab41__printf_i
lab38__printf_i: 	movs	r5, #0
	add.w	r9, r4, #25
	b.n lab42__printf_i
lab22__printf_i: 	cmp	r3, #0
	bne.n lab23__printf_i
lab24__printf_i: 	ldrb	r3, [r0, #0]
	strb.w	r3, [r4, #66]	 ;  0x42
	add.w	r5, r4, #66	 ;  0x42
	b.n lab32__printf_i
	.word	0x0808b745
	.word	0x0808b756
memcpy:
	push	{r4, lr}
	subs	r3, r0, #1
	add	r2, r1
lab1_memcpy: 	cmp	r1, r2
	bne.n lab0_memcpy
	pop	{r4, pc}
lab0_memcpy: 	ldrb.w	r4, [r1], #1
	strb.w	r4, [r3, #1]!
	cpsid f
	push {r1, r2}
	mov.w r1, #115
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#6]
	pop {r1, r2}
	b.n lab1_memcpy
memmove:
	cmp	r0, r1
	push	{r4, lr}
	add.w	r3, r1, r2
	bhi.n lab0_memmove
lab3_memmove: 	subs	r2, r0, #1
lab2_memmove: 	cmp	r1, r3
	beq.n lab1_memmove
	ldrb.w	r4, [r1], #1
	strb.w	r4, [r2, #1]!
	b.n lab2_memmove
lab0_memmove: 	cmp	r3, r0
	bls.n lab3_memmove
	adds	r1, r0, r2
	subs	r2, r2, r3
lab5_memmove: 	cmn	r3, r2
	bne.n lab4_memmove
lab1_memmove: 	pop	{r4, pc}
lab4_memmove: 	ldrb.w	r4, [r3, #-1]!
	strb.w	r4, [r1, #-1]!
	cpsid f
	push {r1, r2}
	mov.w r1, #117
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	b.n lab5_memmove
_realloc_r:
	push	{r3, r4, r5, r6, r7, lr}
	mov	r7, r0
	mov	r4, r2
	mov	r6, r1
	cbnz r1,lab0__realloc_r
	mov	r1, r2
	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
	b.w _malloc_r
lab0__realloc_r: cbnz r2,lab1__realloc_r
	push {r1, r2}
	mov.w r1, #121
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl _free_r
	push{r1, r2}
	mov.w r1, #121
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r5, r4
lab3__realloc_r: 	mov	r0, r5
	pop	{r3, r4, r5, r6, r7, pc}
lab1__realloc_r: 	bl	_malloc_usable_size_r 
	cmp	r0, r4
	bcs.n lab2__realloc_r
	mov	r1, r4
	mov	r0, r7
	push {r1, r2}
	mov.w r1, #103
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl _malloc_r
	push{r1, r2}
	mov.w r1, #103
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r5, r0
	cmp	r0, #0
	beq.n lab3__realloc_r
	mov	r1, r6
	mov	r2, r4
	push {r1, r2}
	mov.w r1, #115
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl memcpy
	push{r1, r2}
	mov.w r1, #115
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r1, r6
	mov	r0, r7
	push {r1, r2}
	mov.w r1, #121
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2,#4]
	pop {r1, r2}
	bl _free_r
	push{r1, r2}
	mov.w r1, #121
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	b.n lab3__realloc_r
lab2__realloc_r: 	mov	r5, r6
	cpsid f
	push {r1, r2}
	mov.w r1, #119
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	b.n lab3__realloc_r
_malloc_usable_size_r:
	ldr.w	r3, [r1, #-4]
	subs	r0, r3, #4
	cmp	r3, #0
	itt	lt
	ldrlt	r3, [r1, r0]
	addlt	r0, r0, r3
	bx lr
_sbrk:
	ldr	r3, [pc, #16]	 ;  (808b6d4 <_sbrk+0x14>)
	ldr	r1, [r3, #0]
	mov	r2, r0
	cbnz r1,lab0__sbrk
	ldr	r1, [pc, #12]	 ;  (808b6d8 <_sbrk+0x18>)
	str	r1, [r3, #0]
lab0__sbrk: 	ldr	r0, [r3, #0]
	add	r2, r0
	str	r2, [r3, #0]
	bx lr
	.word	0x20009cdc
	.word	0x2000a1b0
_exit:
	cpsid f
	push {r1, r2}
	mov.w r1, #93
	mov.w r2, #1610612736 ; 0x60000000
	strh r1, [r2, #0]
	pop {r1, r2}
	b.n _exit
_init:
	push	{r3, r4, r5, r6, r7, lr}
	nop
	pop	{r3, r4, r5, r6, r7}
	pop	{r3}
	mov	lr, r3
	bx lr
_fini:
	push	{r3, r4, r5, r6, r7, lr}
	nop
	pop	{r3, r4, r5, r6, r7}
	pop	{r3}
	mov	lr, r3
	bx lr
