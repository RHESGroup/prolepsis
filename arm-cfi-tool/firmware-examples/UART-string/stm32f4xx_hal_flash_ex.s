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
	.file	"stm32f4xx_hal_flash_ex.c"
	.text
	.align	1
	.global	HAL_FLASHEx_Erase
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASHEx_Erase, %function
HAL_FLASHEx_Erase:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #1
	strb	r3, [r7, #15]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, .L10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L2
	movs	r3, #2
	b	.L3
.L2:
	ldr	r3, .L10
	movs	r2, #1
	strb	r2, [r3, #24]
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r7]
	mov	r2, #-1
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L5
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	mov	r1, r3
	mov	r0, r2
	bl	FLASH_MassErase
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #15]
	ldr	r3, .L10+4
	ldr	r3, [r3, #16]
	ldr	r2, .L10+4
	bic	r3, r3, #32768
	bic	r3, r3, #4
	str	r3, [r2, #16]
	b	.L6
.L5:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	str	r3, [r7, #8]
	b	.L7
.L9:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	uxtb	r3, r3
	mov	r1, r3
	ldr	r0, [r7, #8]
	bl	FLASH_Erase_Sector
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #15]
	ldr	r3, .L10+4
	ldr	r3, [r3, #16]
	ldr	r2, .L10+4
	bic	r3, r3, #250
	str	r3, [r2, #16]
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L8
	ldr	r3, [r7]
	ldr	r2, [r7, #8]
	str	r2, [r3]
	b	.L6
.L8:
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L7:
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	add	r3, r3, r2
	ldr	r2, [r7, #8]
	cmp	r2, r3
	bcc	.L9
.L6:
	bl	FLASH_FlushCaches
.L4:
	ldr	r3, .L10
	movs	r2, #0
	strb	r2, [r3, #24]
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
.L3:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L11:
	.align	2
.L10:
	.word	pFlash
	.word	1073888256
	.size	HAL_FLASHEx_Erase, .-HAL_FLASHEx_Erase
	.align	1
	.global	HAL_FLASHEx_Erase_IT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASHEx_Erase_IT, %function
HAL_FLASHEx_Erase_IT:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	strb	r3, [r7, #15]
	ldr	r3, .L17
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L13
	movs	r3, #2
	b	.L14
.L13:
	ldr	r3, .L17
	movs	r2, #1
	strb	r2, [r3, #24]
	ldr	r3, .L17+4
	ldr	r3, [r3, #16]
	ldr	r2, .L17+4
	orr	r3, r3, #16777216
	str	r3, [r2, #16]
	ldr	r3, .L17+4
	ldr	r3, [r3, #16]
	ldr	r2, .L17+4
	orr	r3, r3, #33554432
	str	r3, [r2, #16]
	ldr	r3, .L17+4
	movs	r2, #243
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L15
	ldr	r3, .L17
	movs	r2, #2
	strb	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r2, .L17
	str	r3, [r2, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	mov	r1, r3
	mov	r0, r2
	bl	FLASH_MassErase
	b	.L16
.L15:
	ldr	r3, .L17
	movs	r2, #1
	strb	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, .L17
	str	r3, [r2, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	ldr	r2, .L17
	str	r3, [r2, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	uxtb	r2, r3
	ldr	r3, .L17
	strb	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	uxtb	r3, r3
	mov	r1, r3
	mov	r0, r2
	bl	FLASH_Erase_Sector
.L16:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
.L14:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L18:
	.align	2
.L17:
	.word	pFlash
	.word	1073888256
	.size	HAL_FLASHEx_Erase_IT, .-HAL_FLASHEx_Erase_IT
	.align	1
	.global	HAL_FLASHEx_OBProgram
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASHEx_OBProgram, %function
HAL_FLASHEx_OBProgram:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #1
	strb	r3, [r7, #15]
	ldr	r3, .L27
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L20
	movs	r3, #2
	b	.L21
.L20:
	ldr	r3, .L27
	movs	r2, #1
	strb	r2, [r3, #24]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L22
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #1
	bne	.L23
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	mov	r1, r3
	mov	r0, r2
	bl	FLASH_OB_EnableWRP
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L22
.L23:
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	mov	r1, r3
	mov	r0, r2
	bl	FLASH_OB_DisableWRP
	mov	r3, r0
	strb	r3, [r7, #15]
.L22:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L24
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	uxtb	r3, r3
	mov	r0, r3
	bl	FLASH_OB_RDP_LevelConfig
	mov	r3, r0
	strb	r3, [r7, #15]
.L24:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L25
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	and	r3, r3, #32
	uxtb	r0, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	and	r3, r3, #64
	uxtb	r1, r3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	bic	r3, r3, #127
	uxtb	r3, r3
	mov	r2, r3
	bl	FLASH_OB_UserConfig
	mov	r3, r0
	strb	r3, [r7, #15]
.L25:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L26
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	uxtb	r3, r3
	mov	r0, r3
	bl	FLASH_OB_BOR_LevelConfig
	mov	r3, r0
	strb	r3, [r7, #15]
.L26:
	ldr	r3, .L27
	movs	r2, #0
	strb	r2, [r3, #24]
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
.L21:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L28:
	.align	2
.L27:
	.word	pFlash
	.size	HAL_FLASHEx_OBProgram, .-HAL_FLASHEx_OBProgram
	.align	1
	.global	HAL_FLASHEx_OBGetConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASHEx_OBGetConfig, %function
HAL_FLASHEx_OBGetConfig:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #15
	str	r2, [r3]
	bl	FLASH_OB_GetWRP
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	bl	FLASH_OB_GetRDP
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #16]
	bl	FLASH_OB_GetUser
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #24]
	bl	FLASH_OB_GetBOR
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_FLASHEx_OBGetConfig, .-HAL_FLASHEx_OBGetConfig
	.align	1
	.global	HAL_FLASHEx_AdvOBProgram
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASHEx_AdvOBProgram, %function
HAL_FLASHEx_AdvOBProgram:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #1
	strb	r3, [r7, #15]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L31
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #1
	bne	.L32
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	mov	r0, r3
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #14]
	mov	r1, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	mov	r2, r3
	bl	FLASH_OB_EnablePCROP
	mov	r3, r0
	strb	r3, [r7, #15]
	b	.L31
.L32:
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	mov	r0, r3
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #14]
	mov	r1, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	mov	r2, r3
	bl	FLASH_OB_DisablePCROP
	mov	r3, r0
	strb	r3, [r7, #15]
.L31:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L33
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	mov	r0, r3
	bl	FLASH_OB_BootConfig
	mov	r3, r0
	strb	r3, [r7, #15]
.L33:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	HAL_FLASHEx_AdvOBProgram, .-HAL_FLASHEx_AdvOBProgram
	.align	1
	.global	HAL_FLASHEx_AdvOBGetConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASHEx_AdvOBGetConfig, %function
HAL_FLASHEx_AdvOBGetConfig:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L36
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #12]	@ movhi
	ldr	r3, .L36+4
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #14]	@ movhi
	ldr	r3, .L36+8
	ldrb	r3, [r3]
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #16]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L37:
	.align	2
.L36:
	.word	1073888278
	.word	1073888282
	.word	1073888276
	.size	HAL_FLASHEx_AdvOBGetConfig, .-HAL_FLASHEx_AdvOBGetConfig
	.align	1
	.global	HAL_FLASHEx_OB_SelectPCROP
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASHEx_OB_SelectPCROP, %function
HAL_FLASHEx_OB_SelectPCROP:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #255
	strb	r3, [r7, #7]
	ldr	r3, .L40
	ldrb	r3, [r3]
	uxtb	r3, r3
	and	r3, r3, #127
	strb	r3, [r7, #7]
	ldr	r2, .L40
	ldrb	r3, [r7, #7]
	orn	r3, r3, #127
	uxtb	r3, r3
	strb	r3, [r2]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L41:
	.align	2
.L40:
	.word	1073888279
	.size	HAL_FLASHEx_OB_SelectPCROP, .-HAL_FLASHEx_OB_SelectPCROP
	.align	1
	.global	HAL_FLASHEx_OB_DeSelectPCROP
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASHEx_OB_DeSelectPCROP, %function
HAL_FLASHEx_OB_DeSelectPCROP:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #255
	strb	r3, [r7, #7]
	ldr	r3, .L44
	ldrb	r3, [r3]
	uxtb	r3, r3
	and	r3, r3, #127
	strb	r3, [r7, #7]
	ldr	r2, .L44
	ldrb	r3, [r7, #7]
	strb	r3, [r2]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L45:
	.align	2
.L44:
	.word	1073888279
	.size	HAL_FLASHEx_OB_DeSelectPCROP, .-HAL_FLASHEx_OB_DeSelectPCROP
	.align	1
	.global	HAL_FLASHEx_OB_GetBank2WRP
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_FLASHEx_OB_GetBank2WRP, %function
HAL_FLASHEx_OB_GetBank2WRP:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L48
	ldrh	r3, [r3]	@ movhi
	uxth	r3, r3
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L49:
	.align	2
.L48:
	.word	1073888282
	.size	HAL_FLASHEx_OB_GetBank2WRP, .-HAL_FLASHEx_OB_GetBank2WRP
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_MassErase, %function
FLASH_MassErase:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	str	r1, [r7]
	strb	r3, [r7, #7]
	ldr	r3, .L54
	ldr	r3, [r3, #16]
	ldr	r2, .L54
	bic	r3, r3, #768
	str	r3, [r2, #16]
	ldr	r3, [r7]
	cmp	r3, #3
	bne	.L51
	ldr	r3, .L54
	ldr	r3, [r3, #16]
	ldr	r2, .L54
	orr	r3, r3, #32768
	orr	r3, r3, #4
	str	r3, [r2, #16]
	b	.L52
.L51:
	ldr	r3, [r7]
	cmp	r3, #1
	bne	.L53
	ldr	r3, .L54
	ldr	r3, [r3, #16]
	ldr	r2, .L54
	orr	r3, r3, #4
	str	r3, [r2, #16]
	b	.L52
.L53:
	ldr	r3, .L54
	ldr	r3, [r3, #16]
	ldr	r2, .L54
	orr	r3, r3, #32768
	str	r3, [r2, #16]
.L52:
	ldr	r3, .L54
	ldr	r2, [r3, #16]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	lsls	r3, r3, #8
	orrs	r3, r3, r2
	ldr	r2, .L54
	orr	r3, r3, #65536
	str	r3, [r2, #16]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L55:
	.align	2
.L54:
	.word	1073888256
	.size	FLASH_MassErase, .-FLASH_MassErase
	.align	1
	.global	FLASH_Erase_Sector
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_Erase_Sector, %function
FLASH_Erase_Sector:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strb	r3, [r7, #3]
	movs	r3, #0
	str	r3, [r7, #12]
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L57
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L58
.L57:
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L59
	mov	r3, #256
	str	r3, [r7, #12]
	b	.L58
.L59:
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L60
	mov	r3, #512
	str	r3, [r7, #12]
	b	.L58
.L60:
	mov	r3, #768
	str	r3, [r7, #12]
.L58:
	ldr	r3, [r7, #4]
	cmp	r3, #11
	bls	.L61
	ldr	r3, [r7, #4]
	adds	r3, r3, #4
	str	r3, [r7, #4]
.L61:
	ldr	r3, .L62
	ldr	r3, [r3, #16]
	ldr	r2, .L62
	bic	r3, r3, #768
	str	r3, [r2, #16]
	ldr	r3, .L62
	ldr	r2, [r3, #16]
	ldr	r1, .L62
	ldr	r3, [r7, #12]
	orrs	r3, r3, r2
	str	r3, [r1, #16]
	ldr	r3, .L62
	ldr	r3, [r3, #16]
	ldr	r2, .L62
	bic	r3, r3, #248
	str	r3, [r2, #16]
	ldr	r3, .L62
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #3
	orrs	r3, r3, r2
	ldr	r2, .L62
	orr	r3, r3, #2
	str	r3, [r2, #16]
	ldr	r3, .L62
	ldr	r3, [r3, #16]
	ldr	r2, .L62
	orr	r3, r3, #65536
	str	r3, [r2, #16]
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L63:
	.align	2
.L62:
	.word	1073888256
	.size	FLASH_Erase_Sector, .-FLASH_Erase_Sector
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_EnableWRP, %function
FLASH_OB_EnableWRP:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	strb	r3, [r7, #15]
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L65
	ldr	r3, [r7, #4]
	ldr	r2, .L73
	cmp	r3, r2
	bne	.L66
	ldr	r3, [r7]
	cmp	r3, #1
	beq	.L67
	ldr	r3, [r7]
	cmp	r3, #3
	beq	.L67
.L66:
	ldr	r3, [r7, #4]
	cmp	r3, #4096
	bcs	.L68
.L67:
	ldr	r3, [r7, #4]
	ldr	r2, .L73
	cmp	r3, r2
	bne	.L69
	ldr	r3, .L73+4
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #12
	uxth	r3, r3
	mvns	r3, r3
	uxth	r3, r3
	ldr	r1, .L73+4
	ands	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
	b	.L71
.L69:
	ldr	r3, .L73+4
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #4]
	uxth	r3, r3
	mvns	r3, r3
	uxth	r3, r3
	ldr	r1, .L73+4
	ands	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
	b	.L71
.L68:
	ldr	r3, .L73+8
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #12
	uxth	r3, r3
	mvns	r3, r3
	uxth	r3, r3
	ldr	r1, .L73+8
	ands	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
.L71:
	ldr	r3, [r7, #4]
	ldr	r2, .L73
	cmp	r3, r2
	bne	.L65
	ldr	r3, [r7]
	cmp	r3, #3
	bne	.L65
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L65
	ldr	r3, .L73+8
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #12
	uxth	r3, r3
	mvns	r3, r3
	uxth	r3, r3
	ldr	r1, .L73+8
	ands	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
.L65:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L74:
	.align	2
.L73:
	.word	16773120
	.word	1073888278
	.word	1073888282
	.size	FLASH_OB_EnableWRP, .-FLASH_OB_EnableWRP
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_DisableWRP, %function
FLASH_OB_DisableWRP:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	strb	r3, [r7, #15]
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L76
	ldr	r3, [r7, #4]
	ldr	r2, .L84
	cmp	r3, r2
	bne	.L77
	ldr	r3, [r7]
	cmp	r3, #1
	beq	.L78
	ldr	r3, [r7]
	cmp	r3, #3
	beq	.L78
.L77:
	ldr	r3, [r7, #4]
	cmp	r3, #4096
	bcs	.L79
.L78:
	ldr	r3, [r7, #4]
	ldr	r2, .L84
	cmp	r3, r2
	bne	.L80
	ldr	r3, .L84+4
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #12
	uxth	r3, r3
	ldr	r1, .L84+4
	orrs	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
	b	.L82
.L80:
	ldr	r3, .L84+4
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #4]
	uxth	r3, r3
	ldr	r1, .L84+4
	orrs	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
	b	.L82
.L79:
	ldr	r3, .L84+8
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #12
	uxth	r3, r3
	ldr	r1, .L84+8
	orrs	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
.L82:
	ldr	r3, [r7, #4]
	ldr	r2, .L84
	cmp	r3, r2
	bne	.L76
	ldr	r3, [r7]
	cmp	r3, #3
	bne	.L76
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L76
	ldr	r3, .L84+8
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #12
	uxth	r3, r3
	ldr	r1, .L84+8
	orrs	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
.L76:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L85:
	.align	2
.L84:
	.word	16773120
	.word	1073888278
	.word	1073888282
	.size	FLASH_OB_DisableWRP, .-FLASH_OB_DisableWRP
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_BootConfig, %function
FLASH_OB_BootConfig:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	movs	r3, #0
	strb	r3, [r7, #15]
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L87
	ldr	r3, .L89
	ldrb	r3, [r3]
	uxtb	r3, r3
	ldr	r2, .L89
	bic	r3, r3, #16
	uxtb	r3, r3
	strb	r3, [r2]
	ldr	r3, .L89
	ldrb	r3, [r3]
	uxtb	r2, r3
	ldr	r1, .L89
	ldrb	r3, [r7, #7]
	orrs	r3, r3, r2
	uxtb	r3, r3
	strb	r3, [r1]
.L87:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L90:
	.align	2
.L89:
	.word	1073888276
	.size	FLASH_OB_BootConfig, .-FLASH_OB_BootConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_EnablePCROP, %function
FLASH_OB_EnablePCROP:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #0
	strb	r3, [r7, #23]
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L92
	ldr	r3, [r7, #4]
	cmp	r3, #1
	beq	.L93
	ldr	r3, [r7, #4]
	cmp	r3, #3
	bne	.L94
.L93:
	ldr	r3, .L97
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #12]
	uxth	r3, r3
	ldr	r1, .L97
	orrs	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
	b	.L95
.L94:
	ldr	r3, .L97+4
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #8]
	uxth	r3, r3
	ldr	r1, .L97+4
	orrs	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
.L95:
	ldr	r3, [r7, #4]
	cmp	r3, #3
	bne	.L92
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L92
	ldr	r3, .L97+4
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #8]
	uxth	r3, r3
	ldr	r1, .L97+4
	orrs	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
.L92:
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L98:
	.align	2
.L97:
	.word	1073888278
	.word	1073888282
	.size	FLASH_OB_EnablePCROP, .-FLASH_OB_EnablePCROP
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_DisablePCROP, %function
FLASH_OB_DisablePCROP:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #0
	strb	r3, [r7, #23]
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L100
	ldr	r3, [r7, #4]
	cmp	r3, #1
	beq	.L101
	ldr	r3, [r7, #4]
	cmp	r3, #3
	bne	.L102
.L101:
	ldr	r3, .L105
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #12]
	uxth	r3, r3
	mvns	r3, r3
	uxth	r3, r3
	ldr	r1, .L105
	ands	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
	b	.L103
.L102:
	ldr	r3, .L105+4
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #8]
	uxth	r3, r3
	mvns	r3, r3
	uxth	r3, r3
	ldr	r1, .L105+4
	ands	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
.L103:
	ldr	r3, [r7, #4]
	cmp	r3, #3
	bne	.L100
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L100
	ldr	r3, .L105+4
	ldrh	r3, [r3]	@ movhi
	uxth	r2, r3
	ldr	r3, [r7, #8]
	uxth	r3, r3
	mvns	r3, r3
	uxth	r3, r3
	ldr	r1, .L105+4
	ands	r3, r3, r2
	uxth	r3, r3
	strh	r3, [r1]	@ movhi
.L100:
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L106:
	.align	2
.L105:
	.word	1073888278
	.word	1073888282
	.size	FLASH_OB_DisablePCROP, .-FLASH_OB_DisablePCROP
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_RDP_LevelConfig, %function
FLASH_OB_RDP_LevelConfig:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	movs	r3, #0
	strb	r3, [r7, #15]
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L108
	ldr	r2, .L110
	ldrb	r3, [r7, #7]
	strb	r3, [r2]
.L108:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L111:
	.align	2
.L110:
	.word	1073888277
	.size	FLASH_OB_RDP_LevelConfig, .-FLASH_OB_RDP_LevelConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_UserConfig, %function
FLASH_OB_UserConfig:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	mov	r3, r1
	strb	r3, [r7, #6]
	mov	r3, r2
	strb	r3, [r7, #5]
	movs	r3, #255
	strb	r3, [r7, #15]
	movs	r3, #0
	strb	r3, [r7, #14]
	movw	r0, #50000
	bl	FLASH_WaitForLastOperation
	mov	r3, r0
	strb	r3, [r7, #14]
	ldrb	r3, [r7, #14]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L113
	ldr	r3, .L115
	ldrb	r3, [r3]
	uxtb	r3, r3
	and	r3, r3, #31
	strb	r3, [r7, #15]
	ldrb	r2, [r7, #6]
	ldrb	r3, [r7, #15]
	orrs	r3, r3, r2
	uxtb	r2, r3
	ldrb	r3, [r7, #5]
	orrs	r3, r3, r2
	uxtb	r2, r3
	ldr	r1, .L115
	ldrb	r3, [r7, #7]
	orrs	r3, r3, r2
	uxtb	r3, r3
	strb	r3, [r1]
.L113:
	ldrb	r3, [r7, #14]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L116:
	.align	2
.L115:
	.word	1073888276
	.size	FLASH_OB_UserConfig, .-FLASH_OB_UserConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_BOR_LevelConfig, %function
FLASH_OB_BOR_LevelConfig:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldr	r3, .L119
	ldrb	r3, [r3]
	uxtb	r3, r3
	ldr	r2, .L119
	bic	r3, r3, #12
	uxtb	r3, r3
	strb	r3, [r2]
	ldr	r3, .L119
	ldrb	r3, [r3]
	uxtb	r2, r3
	ldr	r1, .L119
	ldrb	r3, [r7, #7]
	orrs	r3, r3, r2
	uxtb	r3, r3
	strb	r3, [r1]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L120:
	.align	2
.L119:
	.word	1073888276
	.size	FLASH_OB_BOR_LevelConfig, .-FLASH_OB_BOR_LevelConfig
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_GetUser, %function
FLASH_OB_GetUser:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L123
	ldr	r3, [r3, #20]
	uxtb	r3, r3
	bic	r3, r3, #31
	uxtb	r3, r3
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L124:
	.align	2
.L123:
	.word	1073888256
	.size	FLASH_OB_GetUser, .-FLASH_OB_GetUser
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_GetWRP, %function
FLASH_OB_GetWRP:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L127
	ldrh	r3, [r3]	@ movhi
	uxth	r3, r3
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L128:
	.align	2
.L127:
	.word	1073888278
	.size	FLASH_OB_GetWRP, .-FLASH_OB_GetWRP
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_GetRDP, %function
FLASH_OB_GetRDP:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #170
	strb	r3, [r7, #7]
	ldr	r3, .L134
	ldrb	r3, [r3]
	uxtb	r3, r3
	cmp	r3, #204
	bne	.L130
	movs	r3, #204
	strb	r3, [r7, #7]
	b	.L131
.L130:
	ldr	r3, .L134
	ldrb	r3, [r3]
	uxtb	r3, r3
	cmp	r3, #170
	bne	.L132
	movs	r3, #170
	strb	r3, [r7, #7]
	b	.L131
.L132:
	movs	r3, #85
	strb	r3, [r7, #7]
.L131:
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L135:
	.align	2
.L134:
	.word	1073888277
	.size	FLASH_OB_GetRDP, .-FLASH_OB_GetRDP
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_OB_GetBOR, %function
FLASH_OB_GetBOR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L138
	ldrb	r3, [r3]
	uxtb	r3, r3
	and	r3, r3, #12
	uxtb	r3, r3
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L139:
	.align	2
.L138:
	.word	1073888276
	.size	FLASH_OB_GetBOR, .-FLASH_OB_GetBOR
	.align	1
	.global	FLASH_FlushCaches
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	FLASH_FlushCaches, %function
FLASH_FlushCaches:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L144
	ldr	r3, [r3]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L141
	ldr	r3, .L144
	ldr	r3, [r3]
	ldr	r2, .L144
	bic	r3, r3, #512
	str	r3, [r2]
	ldr	r3, .L144
	ldr	r3, [r3]
	ldr	r2, .L144
	orr	r3, r3, #2048
	str	r3, [r2]
	ldr	r3, .L144
	ldr	r3, [r3]
	ldr	r2, .L144
	bic	r3, r3, #2048
	str	r3, [r2]
	ldr	r3, .L144
	ldr	r3, [r3]
	ldr	r2, .L144
	orr	r3, r3, #512
	str	r3, [r2]
.L141:
	ldr	r3, .L144
	ldr	r3, [r3]
	and	r3, r3, #1024
	cmp	r3, #0
	beq	.L143
	ldr	r3, .L144
	ldr	r3, [r3]
	ldr	r2, .L144
	bic	r3, r3, #1024
	str	r3, [r2]
	ldr	r3, .L144
	ldr	r3, [r3]
	ldr	r2, .L144
	orr	r3, r3, #4096
	str	r3, [r2]
	ldr	r3, .L144
	ldr	r3, [r3]
	ldr	r2, .L144
	bic	r3, r3, #4096
	str	r3, [r2]
	ldr	r3, .L144
	ldr	r3, [r3]
	ldr	r2, .L144
	orr	r3, r3, #1024
	str	r3, [r2]
.L143:
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L145:
	.align	2
.L144:
	.word	1073888256
	.size	FLASH_FlushCaches, .-FLASH_FlushCaches
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
