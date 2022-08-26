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
	.file	"sha.c"
	.text
	.global	read_counter
	.section	.bss.read_counter,"aw",%nobits
	.align	2
	.type	read_counter, %object
	.size	read_counter, 4
read_counter:
	.space	4
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sha_transform, %function
sha_transform:
	@ args = 0, pretend = 0, frame = 360
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #364
	add	r7, sp, #0
	adds	r3, r7, #4
	str	r0, [r3]
	movs	r3, #0
	str	r3, [r7, #356]
	b	.L2
.L3:
	adds	r3, r7, #4
	ldr	r2, [r3]
	ldr	r3, [r7, #356]
	adds	r3, r3, #6
	lsls	r3, r3, #2
	add	r3, r3, r2
	ldr	r1, [r3, #4]
	add	r3, r7, #12
	ldr	r2, [r7, #356]
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [r7, #356]
	adds	r3, r3, #1
	str	r3, [r7, #356]
.L2:
	ldr	r3, [r7, #356]
	cmp	r3, #15
	ble	.L3
	movs	r3, #16
	str	r3, [r7, #356]
	b	.L4
.L5:
	ldr	r3, [r7, #356]
	subs	r2, r3, #3
	add	r3, r7, #12
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [r7, #356]
	sub	r1, r3, #8
	add	r3, r7, #12
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r2, r3
	ldr	r3, [r7, #356]
	sub	r1, r3, #14
	add	r3, r7, #12
	ldr	r3, [r3, r1, lsl #2]
	eors	r2, r2, r3
	ldr	r3, [r7, #356]
	sub	r1, r3, #16
	add	r3, r7, #12
	ldr	r3, [r3, r1, lsl #2]
	eor	r1, r2, r3
	add	r3, r7, #12
	ldr	r2, [r7, #356]
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [r7, #356]
	adds	r3, r3, #1
	str	r3, [r7, #356]
.L4:
	ldr	r3, [r7, #356]
	cmp	r3, #79
	ble	.L5
	adds	r3, r7, #4
	ldr	r3, [r3]
	ldr	r3, [r3]
	str	r3, [r7, #352]
	adds	r3, r7, #4
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	str	r3, [r7, #348]
	adds	r3, r7, #4
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	str	r3, [r7, #344]
	adds	r3, r7, #4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	str	r3, [r7, #340]
	adds	r3, r7, #4
	ldr	r3, [r3]
	ldr	r3, [r3, #16]
	str	r3, [r7, #336]
	movs	r3, #0
	str	r3, [r7, #356]
	b	.L6
.L7:
	ldr	r3, [r7, #352]
	ror	r2, r3, #27
	ldr	r1, [r7, #348]
	ldr	r3, [r7, #344]
	ands	r1, r1, r3
	ldr	r3, [r7, #348]
	mvns	r0, r3
	ldr	r3, [r7, #340]
	ands	r3, r3, r0
	orrs	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [r7, #336]
	add	r2, r2, r3
	add	r3, r7, #12
	ldr	r1, [r7, #356]
	ldr	r3, [r3, r1, lsl #2]
	add	r2, r2, r3
	ldr	r3, .L14
	add	r3, r3, r2
	str	r3, [r7, #332]
	ldr	r3, [r7, #340]
	str	r3, [r7, #336]
	ldr	r3, [r7, #344]
	str	r3, [r7, #340]
	ldr	r3, [r7, #348]
	ror	r3, r3, #2
	str	r3, [r7, #344]
	ldr	r3, [r7, #352]
	str	r3, [r7, #348]
	ldr	r3, [r7, #332]
	str	r3, [r7, #352]
	ldr	r3, [r7, #356]
	adds	r3, r3, #1
	str	r3, [r7, #356]
.L6:
	ldr	r3, [r7, #356]
	cmp	r3, #19
	ble	.L7
	movs	r3, #20
	str	r3, [r7, #356]
	b	.L8
.L9:
	ldr	r3, [r7, #352]
	ror	r2, r3, #27
	ldr	r1, [r7, #348]
	ldr	r3, [r7, #344]
	eors	r1, r1, r3
	ldr	r3, [r7, #340]
	eors	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [r7, #336]
	add	r2, r2, r3
	add	r3, r7, #12
	ldr	r1, [r7, #356]
	ldr	r3, [r3, r1, lsl #2]
	add	r2, r2, r3
	ldr	r3, .L14+4
	add	r3, r3, r2
	str	r3, [r7, #332]
	ldr	r3, [r7, #340]
	str	r3, [r7, #336]
	ldr	r3, [r7, #344]
	str	r3, [r7, #340]
	ldr	r3, [r7, #348]
	ror	r3, r3, #2
	str	r3, [r7, #344]
	ldr	r3, [r7, #352]
	str	r3, [r7, #348]
	ldr	r3, [r7, #332]
	str	r3, [r7, #352]
	ldr	r3, [r7, #356]
	adds	r3, r3, #1
	str	r3, [r7, #356]
.L8:
	ldr	r3, [r7, #356]
	cmp	r3, #39
	ble	.L9
	movs	r3, #40
	str	r3, [r7, #356]
	b	.L10
.L11:
	ldr	r3, [r7, #352]
	ror	r2, r3, #27
	ldr	r1, [r7, #344]
	ldr	r3, [r7, #340]
	orrs	r1, r1, r3
	ldr	r3, [r7, #348]
	ands	r1, r1, r3
	ldr	r0, [r7, #344]
	ldr	r3, [r7, #340]
	ands	r3, r3, r0
	orrs	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [r7, #336]
	add	r2, r2, r3
	add	r3, r7, #12
	ldr	r1, [r7, #356]
	ldr	r3, [r3, r1, lsl #2]
	add	r2, r2, r3
	ldr	r3, .L14+8
	add	r3, r3, r2
	str	r3, [r7, #332]
	ldr	r3, [r7, #340]
	str	r3, [r7, #336]
	ldr	r3, [r7, #344]
	str	r3, [r7, #340]
	ldr	r3, [r7, #348]
	ror	r3, r3, #2
	str	r3, [r7, #344]
	ldr	r3, [r7, #352]
	str	r3, [r7, #348]
	ldr	r3, [r7, #332]
	str	r3, [r7, #352]
	ldr	r3, [r7, #356]
	adds	r3, r3, #1
	str	r3, [r7, #356]
.L10:
	ldr	r3, [r7, #356]
	cmp	r3, #59
	ble	.L11
	movs	r3, #60
	str	r3, [r7, #356]
	b	.L12
.L13:
	ldr	r3, [r7, #352]
	ror	r2, r3, #27
	ldr	r1, [r7, #348]
	ldr	r3, [r7, #344]
	eors	r1, r1, r3
	ldr	r3, [r7, #340]
	eors	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [r7, #336]
	add	r2, r2, r3
	add	r3, r7, #12
	ldr	r1, [r7, #356]
	ldr	r3, [r3, r1, lsl #2]
	add	r2, r2, r3
	ldr	r3, .L14+12
	add	r3, r3, r2
	str	r3, [r7, #332]
	ldr	r3, [r7, #340]
	str	r3, [r7, #336]
	ldr	r3, [r7, #344]
	str	r3, [r7, #340]
	ldr	r3, [r7, #348]
	ror	r3, r3, #2
	str	r3, [r7, #344]
	ldr	r3, [r7, #352]
	str	r3, [r7, #348]
	ldr	r3, [r7, #332]
	str	r3, [r7, #352]
	ldr	r3, [r7, #356]
	adds	r3, r3, #1
	str	r3, [r7, #356]
.L12:
	ldr	r3, [r7, #356]
	cmp	r3, #79
	ble	.L13
	adds	r3, r7, #4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #352]
	add	r2, r2, r3
	adds	r3, r7, #4
	ldr	r3, [r3]
	str	r2, [r3]
	adds	r3, r7, #4
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #348]
	add	r2, r2, r3
	adds	r3, r7, #4
	ldr	r3, [r3]
	str	r2, [r3, #4]
	adds	r3, r7, #4
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #344]
	add	r2, r2, r3
	adds	r3, r7, #4
	ldr	r3, [r3]
	str	r2, [r3, #8]
	adds	r3, r7, #4
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #340]
	add	r2, r2, r3
	adds	r3, r7, #4
	ldr	r3, [r3]
	str	r2, [r3, #12]
	adds	r3, r7, #4
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #336]
	add	r2, r2, r3
	adds	r3, r7, #4
	ldr	r3, [r3]
	str	r2, [r3, #16]
	nop
	add	r7, r7, #364
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	1518500249
	.word	1859775393
	.word	-1894007588
	.word	-899497514
	.size	sha_transform, .-sha_transform
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	byte_reverse, %function
byte_reverse:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	lsrs	r3, r3, #2
	str	r3, [r7]
	ldr	r3, [r7, #4]
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L17
.L18:
	ldr	r3, [r7, #16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	strb	r3, [r7, #12]
	ldr	r3, [r7, #16]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	strb	r3, [r7, #13]
	ldr	r3, [r7, #16]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	strb	r3, [r7, #14]
	ldr	r3, [r7, #16]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	strb	r3, [r7, #15]
	ldrb	r2, [r7, #15]	@ zero_extendqisi2
	ldr	r3, [r7, #16]
	strb	r2, [r3]
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	ldrb	r2, [r7, #14]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [r7, #16]
	adds	r3, r3, #2
	ldrb	r2, [r7, #13]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [r7, #16]
	adds	r3, r3, #3
	ldrb	r2, [r7, #12]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [r7, #16]
	adds	r3, r3, #4
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L17:
	ldr	r2, [r7, #20]
	ldr	r3, [r7]
	cmp	r2, r3
	blt	.L18
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	byte_reverse, .-byte_reverse
	.align	1
	.global	sha_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sha_init, %function
sha_init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r2, .L20
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r2, .L20+4
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, .L20+8
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r2, .L20+12
	str	r2, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r2, .L20+16
	str	r2, [r3, #16]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #20]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #24]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L21:
	.align	2
.L20:
	.word	1732584193
	.word	-271733879
	.word	-1732584194
	.word	271733878
	.word	-1009589776
	.size	sha_init, .-sha_init
	.align	1
	.global	sha_update
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sha_update, %function
sha_update:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #20]
	cmp	r2, r3
	bcs	.L23
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #24]
	adds	r2, r3, #1
	ldr	r3, [r7, #12]
	str	r2, [r3, #24]
.L23:
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #20]
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #24]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #29
	add	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #24]
	b	.L24
.L25:
	ldr	r3, [r7, #12]
	adds	r3, r3, #28
	movs	r2, #64
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	memcpy @secure
	ldr	r3, [r7, #12]
	adds	r3, r3, #28
	movs	r1, #64
	mov	r0, r3
	bl	byte_reverse @secure
	ldr	r0, [r7, #12]
	bl	sha_transform @secure
	ldr	r3, [r7, #8]
	adds	r3, r3, #64
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	subs	r3, r3, #64
	str	r3, [r7, #4]
.L24:
	ldr	r3, [r7, #4]
	cmp	r3, #63
	bgt	.L25
	ldr	r3, [r7, #12]
	adds	r3, r3, #28
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	memcpy @secure
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #44 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
	.size	sha_update, .-sha_update
	.align	1
	.global	sha_final
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sha_final, %function
sha_final:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #3
	and	r3, r3, #63
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	add	r2, r3, #28
	ldr	r3, [r7, #12]
	adds	r1, r3, #1
	str	r1, [r7, #12]
	add	r3, r3, r2
	movs	r2, #128
	strb	r2, [r3]
	ldr	r3, [r7, #12]
	cmp	r3, #56
	ble	.L27
	ldr	r3, [r7, #4]
	add	r2, r3, #28
	ldr	r3, [r7, #12]
	adds	r0, r2, r3
	ldr	r3, [r7, #12]
	rsb	r3, r3, #64
	mov	r2, r3
	movs	r1, #0
	bl	memset @secure
	ldr	r3, [r7, #4]
	adds	r3, r3, #28
	movs	r1, #64
	mov	r0, r3
	bl	byte_reverse @secure
	ldr	r0, [r7, #4]
	bl	sha_transform @secure
	ldr	r3, [r7, #4]
	adds	r3, r3, #28
	movs	r2, #56
	movs	r1, #0
	mov	r0, r3
	bl	memset @secure
	b	.L28
.L27:
	ldr	r3, [r7, #4]
	add	r2, r3, #28
	ldr	r3, [r7, #12]
	adds	r0, r2, r3
	ldr	r3, [r7, #12]
	rsb	r3, r3, #56
	mov	r2, r3
	movs	r1, #0
	bl	memset @secure
.L28:
	ldr	r3, [r7, #4]
	adds	r3, r3, #28
	movs	r1, #64
	mov	r0, r3
	bl	byte_reverse @secure
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	str	r2, [r3, #84]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #20]
	str	r2, [r3, #88]
	ldr	r0, [r7, #4]
	bl	sha_transform @secure
	nop
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #46 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
	.size	sha_final, .-sha_final
	.align	1
	.global	sha_stream
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sha_stream, %function
sha_stream:
	@ args = 0, pretend = 0, frame = 8208
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8192
	sub	sp, sp, #16
	add	r7, sp, #0
	add	r3, r7, #16
	subs	r3, r3, #12
	str	r0, [r3]
	add	r3, r7, #16
	subs	r3, r3, #16
	str	r1, [r3]
	add	r3, r7, #16
	subs	r3, r3, #12
	ldr	r0, [r3]
	bl	sha_init @secure
	b	.L30
.L33:
	ldr	r3, .L34
	ldr	r3, [r3]
	add	r3, r3, #8192
	cmp	r3, #102400
	bcs	.L31
	ldr	r3, .L34
	ldr	r2, [r3]
	add	r3, r7, #16
	subs	r3, r3, #16
	ldr	r3, [r3]
	add	r2, r2, r3
	add	r3, r7, #16
	subs	r3, r3, #4
	mov	r0, r3
	mov	r1, r2
	mov	r3, #8192
	mov	r2, r3
	bl	memcpy @secure
	mov	r3, #8192
	add	r2, r7, #8192
	add	r2, r2, #12
	str	r3, [r2]
	b	.L32
.L31:
	ldr	r3, .L34
	ldr	r2, [r3]
	add	r3, r7, #16
	subs	r3, r3, #16
	ldr	r3, [r3]
	adds	r1, r3, r2
	ldr	r3, .L34
	ldr	r3, [r3]
	rsb	r2, r3, #102400
	add	r3, r7, #16
	subs	r3, r3, #4
	mov	r0, r3
	bl	memcpy @secure
	ldr	r3, .L34
	ldr	r3, [r3]
	rsb	r3, r3, #102400
	add	r2, r7, #8192
	add	r2, r2, #12
	str	r3, [r2]
.L32:
	add	r1, r7, #16
	subs	r1, r1, #4
	add	r3, r7, #16
	subs	r3, r3, #12
	add	r2, r7, #8192
	add	r2, r2, #12
	ldr	r2, [r2]
	ldr	r0, [r3]
	bl	sha_update 
	PUSH {R1, R2}
	MOV R1, #45 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	ldr	r3, .L34
	ldr	r3, [r3]
	add	r3, r3, #8192
	ldr	r2, .L34
	str	r3, [r2]
.L30:
	ldr	r3, .L34
	ldr	r3, [r3]
	cmp	r3, #102400
	bcc	.L33
	add	r3, r7, #16
	subs	r3, r3, #12
	ldr	r0, [r3]
	bl	sha_final 
	PUSH {R1, R2}
	MOV R1, #47 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000     
	STRH R1, [R2, #2] 	
	POP {R1, R2}
	CPSIE f 				@ riabilita tutti gli interrupt e i fault handlers
	nop
	add	r7, r7, #8192
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	CPSID f 				@ disabilita tutti gli interrupt e i fault handlers					
	PUSH {R1, R2}
	MOV R1, #42 			@ label = hash sicuro della posizione 
	MOV.W R2, #0x60000000    
	STRH R1, [R2]
	POP {R1, R2}
	pop	{r7, pc}
.L35:
	.align	2
.L34:
	.word	read_counter
	.size	sha_stream, .-sha_stream
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
