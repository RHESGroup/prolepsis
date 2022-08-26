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
	.file	"stm32f4xx_hal_gpio.c"
	.text
	.align	1
	.global	HAL_GPIO_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GPIO_Init, %function
HAL_GPIO_Init:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #36
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #28]
	b	.L2
.L32:
	movs	r2, #1
	ldr	r3, [r7, #28]
	lsl	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	ands	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	bne	.L3
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	cmp	r3, #2
	beq	.L4
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	cmp	r3, #18
	bne	.L5
.L4:
	ldr	r3, [r7, #28]
	lsrs	r2, r3, #3
	ldr	r3, [r7, #4]
	adds	r2, r2, #8
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	and	r3, r3, #7
	lsls	r3, r3, #2
	movs	r2, #15
	lsl	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #28]
	and	r3, r3, #7
	lsls	r3, r3, #2
	lsl	r3, r2, r3
	ldr	r2, [r7, #24]
	orrs	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	lsrs	r2, r3, #3
	ldr	r3, [r7, #4]
	adds	r2, r2, #8
	ldr	r1, [r7, #24]
	str	r1, [r3, r2, lsl #2]
.L5:
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	movs	r2, #3
	lsl	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	and	r2, r3, #3
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	lsl	r3, r2, r3
	ldr	r2, [r7, #24]
	orrs	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #24]
	str	r2, [r3]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	cmp	r3, #1
	beq	.L6
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	cmp	r3, #2
	beq	.L6
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	cmp	r3, #17
	beq	.L6
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	cmp	r3, #18
	bne	.L7
.L6:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	movs	r2, #3
	lsl	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	lsl	r3, r2, r3
	ldr	r2, [r7, #24]
	orrs	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #24]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #24]
	movs	r2, #1
	ldr	r3, [r7, #28]
	lsl	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #4
	and	r2, r3, #1
	ldr	r3, [r7, #28]
	lsl	r3, r2, r3
	ldr	r2, [r7, #24]
	orrs	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #24]
	str	r2, [r3, #4]
.L7:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	movs	r2, #3
	lsl	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #28]
	lsls	r3, r3, #1
	lsl	r3, r2, r3
	ldr	r2, [r7, #24]
	orrs	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #24]
	str	r2, [r3, #12]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	and	r3, r3, #268435456
	cmp	r3, #0
	beq	.L3
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, .L33
	ldr	r3, [r3, #68]
	ldr	r2, .L33
	orr	r3, r3, #16384
	str	r3, [r2, #68]
	ldr	r3, .L33
	ldr	r3, [r3, #68]
	and	r3, r3, #16384
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	ldr	r2, .L33+4
	ldr	r3, [r7, #28]
	lsrs	r3, r3, #2
	adds	r3, r3, #2
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	and	r3, r3, #3
	lsls	r3, r3, #2
	movs	r2, #15
	lsl	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	ldr	r2, .L33+8
	cmp	r3, r2
	beq	.L8
	ldr	r3, [r7, #4]
	ldr	r2, .L33+12
	cmp	r3, r2
	beq	.L9
	ldr	r3, [r7, #4]
	ldr	r2, .L33+16
	cmp	r3, r2
	beq	.L10
	ldr	r3, [r7, #4]
	ldr	r2, .L33+20
	cmp	r3, r2
	beq	.L11
	ldr	r3, [r7, #4]
	ldr	r2, .L33+24
	cmp	r3, r2
	beq	.L12
	ldr	r3, [r7, #4]
	ldr	r2, .L33+28
	cmp	r3, r2
	beq	.L13
	ldr	r3, [r7, #4]
	ldr	r2, .L33+32
	cmp	r3, r2
	beq	.L14
	ldr	r3, [r7, #4]
	ldr	r2, .L33+36
	cmp	r3, r2
	beq	.L15
	ldr	r3, [r7, #4]
	ldr	r2, .L33+40
	cmp	r3, r2
	beq	.L16
	ldr	r3, [r7, #4]
	ldr	r2, .L33+44
	cmp	r3, r2
	bne	.L17
	movs	r3, #9
	b	.L27
.L17:
	movs	r3, #10
	b	.L27
.L16:
	movs	r3, #8
	b	.L27
.L15:
	movs	r3, #7
	b	.L27
.L14:
	movs	r3, #6
	b	.L27
.L13:
	movs	r3, #5
	b	.L27
.L12:
	movs	r3, #4
	b	.L27
.L11:
	movs	r3, #3
	b	.L27
.L10:
	movs	r3, #2
	b	.L27
.L9:
	movs	r3, #1
	b	.L27
.L8:
	movs	r3, #0
.L27:
	ldr	r2, [r7, #28]
	and	r2, r2, #3
	lsls	r2, r2, #2
	lsls	r3, r3, r2
	ldr	r2, [r7, #24]
	orrs	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r1, .L33+4
	ldr	r3, [r7, #28]
	lsrs	r3, r3, #2
	adds	r3, r3, #2
	ldr	r2, [r7, #24]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L33+48
	ldr	r3, [r3]
	str	r3, [r7, #24]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	and	r3, r3, #65536
	cmp	r3, #0
	beq	.L28
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #24]
.L28:
	ldr	r2, .L33+48
	ldr	r3, [r7, #24]
	str	r3, [r2]
	ldr	r3, .L33+48
	ldr	r3, [r3, #4]
	str	r3, [r7, #24]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	and	r3, r3, #131072
	cmp	r3, #0
	beq	.L29
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #24]
.L29:
	ldr	r2, .L33+48
	ldr	r3, [r7, #24]
	str	r3, [r2, #4]
	ldr	r3, .L33+48
	ldr	r3, [r3, #8]
	str	r3, [r7, #24]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	and	r3, r3, #1048576
	cmp	r3, #0
	beq	.L30
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #24]
.L30:
	ldr	r2, .L33+48
	ldr	r3, [r7, #24]
	str	r3, [r2, #8]
	ldr	r3, .L33+48
	ldr	r3, [r3, #12]
	str	r3, [r7, #24]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	ldr	r2, [r7, #24]
	ands	r3, r3, r2
	str	r3, [r7, #24]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	and	r3, r3, #2097152
	cmp	r3, #0
	beq	.L31
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #16]
	orrs	r3, r3, r2
	str	r3, [r7, #24]
.L31:
	ldr	r2, .L33+48
	ldr	r3, [r7, #24]
	str	r3, [r2, #12]
.L3:
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
.L2:
	ldr	r3, [r7, #28]
	cmp	r3, #15
	bls	.L32
	nop
	adds	r7, r7, #36
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L34:
	.align	2
.L33:
	.word	1073887232
	.word	1073821696
	.word	1073872896
	.word	1073873920
	.word	1073874944
	.word	1073875968
	.word	1073876992
	.word	1073878016
	.word	1073879040
	.word	1073880064
	.word	1073881088
	.word	1073882112
	.word	1073822720
	.size	HAL_GPIO_Init, .-HAL_GPIO_Init
	.align	1
	.global	HAL_GPIO_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GPIO_DeInit, %function
HAL_GPIO_DeInit:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L36
.L59:
	movs	r2, #1
	ldr	r3, [r7, #20]
	lsl	r3, r2, r3
	str	r3, [r7, #16]
	ldr	r2, [r7]
	ldr	r3, [r7, #16]
	ands	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	bne	.L37
	ldr	r2, .L60
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #2
	adds	r3, r3, #2
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r7, #8]
	ldr	r3, [r7, #20]
	and	r3, r3, #3
	lsls	r3, r3, #2
	movs	r2, #15
	lsl	r3, r2, r3
	ldr	r2, [r7, #8]
	ands	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	ldr	r2, .L60+4
	cmp	r3, r2
	beq	.L38
	ldr	r3, [r7, #4]
	ldr	r2, .L60+8
	cmp	r3, r2
	beq	.L39
	ldr	r3, [r7, #4]
	ldr	r2, .L60+12
	cmp	r3, r2
	beq	.L40
	ldr	r3, [r7, #4]
	ldr	r2, .L60+16
	cmp	r3, r2
	beq	.L41
	ldr	r3, [r7, #4]
	ldr	r2, .L60+20
	cmp	r3, r2
	beq	.L42
	ldr	r3, [r7, #4]
	ldr	r2, .L60+24
	cmp	r3, r2
	beq	.L43
	ldr	r3, [r7, #4]
	ldr	r2, .L60+28
	cmp	r3, r2
	beq	.L44
	ldr	r3, [r7, #4]
	ldr	r2, .L60+32
	cmp	r3, r2
	beq	.L45
	ldr	r3, [r7, #4]
	ldr	r2, .L60+36
	cmp	r3, r2
	beq	.L46
	ldr	r3, [r7, #4]
	ldr	r2, .L60+40
	cmp	r3, r2
	bne	.L47
	movs	r3, #9
	b	.L57
.L47:
	movs	r3, #10
	b	.L57
.L46:
	movs	r3, #8
	b	.L57
.L45:
	movs	r3, #7
	b	.L57
.L44:
	movs	r3, #6
	b	.L57
.L43:
	movs	r3, #5
	b	.L57
.L42:
	movs	r3, #4
	b	.L57
.L41:
	movs	r3, #3
	b	.L57
.L40:
	movs	r3, #2
	b	.L57
.L39:
	movs	r3, #1
	b	.L57
.L38:
	movs	r3, #0
.L57:
	ldr	r2, [r7, #20]
	and	r2, r2, #3
	lsls	r2, r2, #2
	lsls	r3, r3, r2
	ldr	r2, [r7, #8]
	cmp	r2, r3
	bne	.L58
	ldr	r3, [r7, #20]
	and	r3, r3, #3
	lsls	r3, r3, #2
	movs	r2, #15
	lsl	r3, r2, r3
	str	r3, [r7, #8]
	ldr	r2, .L60
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #2
	adds	r3, r3, #2
	ldr	r1, [r2, r3, lsl #2]
	ldr	r3, [r7, #8]
	mvns	r2, r3
	ldr	r0, .L60
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #2
	ands	r2, r2, r1
	adds	r3, r3, #2
	str	r2, [r0, r3, lsl #2]
	ldr	r3, .L60+44
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	mvns	r3, r3
	ldr	r1, .L60+44
	ands	r3, r3, r2
	str	r3, [r1]
	ldr	r3, .L60+44
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	mvns	r3, r3
	ldr	r1, .L60+44
	ands	r3, r3, r2
	str	r3, [r1, #4]
	ldr	r3, .L60+44
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	mvns	r3, r3
	ldr	r1, .L60+44
	ands	r3, r3, r2
	str	r3, [r1, #8]
	ldr	r3, .L60+44
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #12]
	mvns	r3, r3
	ldr	r1, .L60+44
	ands	r3, r3, r2
	str	r3, [r1, #12]
.L58:
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	movs	r1, #3
	lsl	r3, r1, r3
	mvns	r3, r3
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	ldr	r3, [r7, #20]
	lsrs	r2, r3, #3
	ldr	r3, [r7, #4]
	adds	r2, r2, #8
	ldr	r1, [r3, r2, lsl #2]
	ldr	r3, [r7, #20]
	and	r3, r3, #7
	lsls	r3, r3, #2
	movs	r2, #15
	lsl	r3, r2, r3
	mvns	r3, r3
	ldr	r2, [r7, #20]
	lsrs	r2, r2, #3
	ands	r1, r1, r3
	ldr	r3, [r7, #4]
	adds	r2, r2, #8
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	movs	r1, #3
	lsl	r3, r1, r3
	mvns	r3, r3
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	movs	r1, #1
	ldr	r3, [r7, #20]
	lsl	r3, r1, r3
	mvns	r3, r3
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	movs	r1, #3
	lsl	r3, r1, r3
	mvns	r3, r3
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L37:
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L36:
	ldr	r3, [r7, #20]
	cmp	r3, #15
	bls	.L59
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L61:
	.align	2
.L60:
	.word	1073821696
	.word	1073872896
	.word	1073873920
	.word	1073874944
	.word	1073875968
	.word	1073876992
	.word	1073878016
	.word	1073879040
	.word	1073880064
	.word	1073881088
	.word	1073882112
	.word	1073822720
	.size	HAL_GPIO_DeInit, .-HAL_GPIO_DeInit
	.align	1
	.global	HAL_GPIO_ReadPin
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GPIO_ReadPin, %function
HAL_GPIO_ReadPin:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strh	r3, [r7, #2]	@ movhi
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #16]
	ldrh	r3, [r7, #2]
	ands	r3, r3, r2
	cmp	r3, #0
	beq	.L63
	movs	r3, #1
	strb	r3, [r7, #15]
	b	.L64
.L63:
	movs	r3, #0
	strb	r3, [r7, #15]
.L64:
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_GPIO_ReadPin, .-HAL_GPIO_ReadPin
	.align	1
	.global	HAL_GPIO_WritePin
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GPIO_WritePin, %function
HAL_GPIO_WritePin:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strh	r3, [r7, #2]	@ movhi
	mov	r3, r2
	strb	r3, [r7, #1]
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L67
	ldrh	r2, [r7, #2]
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
	b	.L69
.L67:
	ldrh	r3, [r7, #2]
	lsls	r2, r3, #16
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
.L69:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_GPIO_WritePin, .-HAL_GPIO_WritePin
	.align	1
	.global	HAL_GPIO_TogglePin
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GPIO_TogglePin, %function
HAL_GPIO_TogglePin:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strh	r3, [r7, #2]	@ movhi
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #20]
	ldrh	r3, [r7, #2]
	ands	r2, r2, r3
	ldrh	r3, [r7, #2]
	cmp	r2, r3
	bne	.L71
	ldrh	r3, [r7, #2]
	lsls	r2, r3, #16
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
	b	.L73
.L71:
	ldrh	r2, [r7, #2]
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
.L73:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_GPIO_TogglePin, .-HAL_GPIO_TogglePin
	.align	1
	.global	HAL_GPIO_LockPin
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GPIO_LockPin, %function
HAL_GPIO_LockPin:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, r1
	strh	r3, [r7, #2]	@ movhi
	mov	r3, #65536
	str	r3, [r7, #12]
	ldrh	r2, [r7, #2]
	ldr	r3, [r7, #12]
	orrs	r3, r3, r2
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
	and	r3, r3, #65536
	cmp	r3, #0
	beq	.L75
	movs	r3, #0
	b	.L76
.L75:
	movs	r3, #1
.L76:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_GPIO_LockPin, .-HAL_GPIO_LockPin
	.align	1
	.global	HAL_GPIO_EXTI_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GPIO_EXTI_IRQHandler, %function
HAL_GPIO_EXTI_IRQHandler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, .L80
	ldr	r2, [r3, #20]
	ldrh	r3, [r7, #6]
	ands	r3, r3, r2
	cmp	r3, #0
	beq	.L79
	ldr	r2, .L80
	ldrh	r3, [r7, #6]
	str	r3, [r2, #20]
	ldrh	r3, [r7, #6]
	mov	r0, r3
	bl	HAL_GPIO_EXTI_Callback
.L79:
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L81:
	.align	2
.L80:
	.word	1073822720
	.size	HAL_GPIO_EXTI_IRQHandler, .-HAL_GPIO_EXTI_IRQHandler
	.align	1
	.weak	HAL_GPIO_EXTI_Callback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HAL_GPIO_EXTI_Callback, %function
HAL_GPIO_EXTI_Callback:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strh	r3, [r7, #6]	@ movhi
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	HAL_GPIO_EXTI_Callback, .-HAL_GPIO_EXTI_Callback
	.ident	"GCC: (GNU Tools for STM32 7-2018-q2-update.20190328-1800) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
