	.cpu cortex-m4
	.text
	.thumb
	.syntax unified

_start:
b _mainCRTStartup

_init:
	push	{r3, r4, r5, r6, r7, lr}
	nop
	pop	{r3, r4, r5, r6, r7}
	pop	{r3}
	mov	lr, r3
	bx	lr
exit:
	push	{r3, lr}
	movs	r1, #0
	mov	r4, r0
	bl	__call_exitprocs
	ldr	r3, =_global_impure_ptr	
	ldr	r0, [r3, #0]
	ldr	r3, [r0, #60]	
	cbz	r3, lab0
	blx	r3
lab0: 	mov	r0, r4
	bl	_exit
	nop
	.ltorg
register_fini:	push {r1, r2}
	ldr r1, =0x4ea4f
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =0x00000000	
	cbz	r3, lab1
	ldr	r0, =0x00009b85	
	b	atexit
lab1: 	bx	lr
	.ltorg
__do_global_dtors_aux:	push {r1, r2}
	ldr r1, =0xaa9eb
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	push	{r4, lr}
	ldr	r4, =__bss_start	
	ldrb	r3, [r4, #0]
	cbnz	r3, lab2
	ldr	r3, =0x00000000	
	cbz	r3, lab3
	ldr	r0, =0x00009ca0	
	nop
lab3: 	movs	r3, #1
	strb	r3, [r4, #0]
lab2:	cpsid f
	push {r1, r2}
	ldr r1, =0x681e8
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, pc}
	.ltorg
frame_dummy:
	push	{r3, lr}
	ldr	r3, =0x00000000	
	cbz	r3, lab4
	ldr	r1, =object.0	
	ldr	r0, =0x00009ca0	
	nop
lab4: 	pop	{r3, pc}
	.ltorg
_stack_init:
	sub	sl, r3, #65536	
	bx	lr
	nop
_mainCRTStartup:
	ldr	r3, =0x00000000	
	cmp	r3, #0
	it	eq
	ldreq	r3, =0x00080000	
	mov	sp, r3
	bl	_stack_init
	movs	r1, #0
	mov	fp, r1
	mov	r7, r1
	ldr	r0, =__bss_start	
	ldr	r2, =0x0001a1f4	
	subs	r2, r2, r0
push {r1, r2}
	ldr r1, =0x0be26
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
	push {r1, r2}
	ldr r1, =0x0be26
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, =0x00000000	
	cmp	r3, #0
	beq	lab5
	blx	r3
lab5: 	ldr	r3, =0x00000000	
	cmp	r3, #0
	beq	lab6
	blx	r3
lab6: 	movs	r0, #0
	movs	r1, #0
	movs	r4, r0
	movs	r5, r1
	ldr	r0, =0x00009b79	
	cmp	r0, #0
	beq	lab7
	ldr	r0, =0x00009b85	
push {r1, r2}
	ldr r1, =0x646da
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	atexit
lab7:	push {r1, r2}
	ldr r1, =0x646da
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
 	bl	__libc_init_array
	push {r1, r2}
	ldr r1, =0x405d9
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	movs	r0, r4
	movs	r1, r5
	bl	main
	push {r1, r2}
	ldr r1, =0x2936f
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	exit
	nop
	.ltorg
interface:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #4]
	cmp	r3, #0
	beq	lab8
	ldr	r3, =time	
	ldr	r3, [r3, #0]
	ldr	r2, =tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL	
	str	r3, [r2, #0]
lab8: 	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #4]
	cmp	r3, #0
	bne	lab9
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #6]
	cmp	r3, #0
	beq	lab10
lab9: 	ldr	r3, =time	
	ldr	r3, [r3, #0]
	ldr	r2, =tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL	
	str	r3, [r2, #0]
lab10: 	ldr	r3, =sc_FH_TUERMODUL_CTRL_2375_2	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	lab11
	ldr	r3, =time	
	ldr	r2, [r3, #0]
	ldr	r3, =sc_FH_TUERMODUL_CTRL_2375_2	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab11
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =sc_FH_TUERMODUL_CTRL_2375_2	
	movs	r2, #0
	str	r2, [r3, #0]
lab11: 	ldr	r3, =sc_FH_TUERMODUL_CTRL_2352_1	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	lab12
	ldr	r3, =time	
	ldr	r2, [r3, #0]
	ldr	r3, =sc_FH_TUERMODUL_CTRL_2352_1	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab12
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =sc_FH_TUERMODUL_CTRL_2352_1	
	movs	r2, #0
	str	r2, [r3, #0]
lab12: 	ldr	r3, =sc_FH_TUERMODUL_CTRL_2329_1	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	lab13
	ldr	r3, =time	
	ldr	r2, [r3, #0]
	ldr	r3, =sc_FH_TUERMODUL_CTRL_2329_1	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab13
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =sc_FH_TUERMODUL_CTRL_2329_1	
	movs	r2, #0
	str	r2, [r3, #0]
lab13: 	ldr	r3, =sc_FH_TUERMODUL_CTRL_1781_10	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	lab14
	ldr	r3, =time	
	ldr	r2, [r3, #0]
	ldr	r3, =sc_FH_TUERMODUL_CTRL_1781_10	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab14
	ldr	r3, =sc_FH_TUERMODUL_CTRL_1781_10	
	movs	r2, #0
	str	r2, [r3, #0]
lab14: 	ldr	r3, =sc_FH_TUERMODUL_CTRL_1739_10	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	lab15
	ldr	r3, =time	
	ldr	r2, [r3, #0]
	ldr	r3, =sc_FH_TUERMODUL_CTRL_1739_10	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab15
	ldr	r3, =sc_FH_TUERMODUL_CTRL_1739_10	
	movs	r2, #0
	str	r2, [r3, #0]
lab15: 	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab16
	ldr	r3, =BLOCK_ERKENNUNG_CTRL__N	
	ldr	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL__N_old	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab17
lab16: 	ldr	r3, =time	
	ldr	r3, [r3, #0]
	ldr	r2, =tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy	
	str	r3, [r2, #0]
lab17: 	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
init:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =ZENTRAL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =MEC_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =B_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =A_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =OEFFNEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
generic_KINDERSICHERUNG_CTRL:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #10]
	cmp	r3, #0
	beq	lab18
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #3
	beq	lab19
	cmp	r3, #3
	bgt	lab20
	cmp	r3, #1
	beq	lab21
	cmp	r3, #2
	beq	lab22
	b	lab20
lab21: 	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab23
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab23
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	ldr	r3, =ZENTRAL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab24
lab23: 	ldr	r3, =ZENTRAL_KINDERSICHERUNG_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab25
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab26
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab26
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =ZENTRAL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab27
lab26: 	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab28
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab28
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =ZENTRAL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab27
lab28: 	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab29
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab29
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =ZENTRAL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab27
lab29: 	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab30
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab30
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =ZENTRAL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab27
lab25: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab27
lab30: 	nop
lab27: 	b	lab24
lab22: 	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab31
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab31
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	ldr	r3, =MEC_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab24
lab31: 	ldr	r3, =MEC_KINDERSICHERUNG_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab32
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab33
	ldr	r3, =FH_TUERMODUL__SFHA_MEC_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab33
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =MEC_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab34
lab33: 	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab35
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab35
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =MEC_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab34
lab35: 	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab36
	ldr	r3, =FH_TUERMODUL__SFHA_MEC_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab36
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =MEC_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab34
lab36: 	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab37
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab37
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =MEC_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab34
lab32: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab34
lab37: 	nop
lab34: 	b	lab24
lab19: 	ldr	r3, =FH_TUERMODUL__KL_50	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab38
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab38
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab38
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab24
lab38: 	ldr	r3, =FH_TUERMODUL__KL_50	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab39
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab39
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab39
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab24
lab39: 	ldr	r3, =FH_TUERMODUL__KL_50	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab40
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab40
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab40
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab24
	nop
	.ltorg
lab40: 	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab41
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab41
	ldr	r3, =FH_TUERMODUL__KL_50	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab41
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab24
lab41: 	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab42
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab42
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab24
lab42: 	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab43
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab43
	ldr	r3, =FH_TUERMODUL__KL_50	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab43
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab24
lab20: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab24
lab18: 	nop
	b	lab24
lab43: 	nop
lab24: 	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
generic_FH_TUERMODUL_CTRL:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #13]
	cmp	r3, #0
	bne	lab44
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #15]
	cmp	r3, #0
	beq	lab44
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #14]
	cmp	r3, #0
	bne	lab44
	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #6]
lab44: 	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #13]
	cmp	r3, #0
	beq	lab45
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #10]
	cmp	r3, #0
	bne	lab46
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
lab46: 	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #11]
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #19]
	cmp	r3, #0
	bne	lab47
	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
lab47: 	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #20]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #11]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #20]
	ldr	r3, =B_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #3
	beq	lab48
	cmp	r3, #3
	bgt	lab49
	cmp	r3, #1
	beq	lab50
	cmp	r3, #2
	beq	lab51
	b	lab49
lab50: 	ldr	r3, =FH_TUERMODUL_CTRL__N	
	ldr	r3, [r3, #0]
	cmp	r3, #59	
	bne	lab52
	ldr	r3, =FH_TUERMODUL_CTRL__N_old	
	ldr	r3, [r3, #0]
	cmp	r3, #59	
	beq	lab52
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =B_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab53
lab51: 	ldr	r3, =FH_TUERMODUL__BLOCK	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab54
	ldr	r3, =FH_TUERMODUL__BLOCK_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab54
	ldr	r3, =FH_TUERMODUL__MFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab54
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =time	
	ldr	r3, [r3, #0]
	ldr	r2, =sc_FH_TUERMODUL_CTRL_2329_1	
	str	r3, [r2, #0]
	ldr	r3, =B_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab53
lab54: 	ldr	r3, =NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #3
	beq	lab55
	cmp	r3, #3
	bgt	lab56
	cmp	r3, #1
	beq	lab57
	cmp	r3, #2
	beq	lab58
	b	lab56
lab57: 	ldr	r3, =FH_TUERMODUL__SFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab59
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab60
lab58: 	ldr	r3, =FH_TUERMODUL__SFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab61
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab60
lab55: 	ldr	r3, =FH_TUERMODUL__SFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab62
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab60
lab62: 	ldr	r3, =FH_TUERMODUL__SFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab63
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab60
lab56: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab60
lab59: 	nop
	b	lab53
lab61: 	nop
	b	lab53
lab63: 	nop
lab60: 	b	lab53
lab48: 	ldr	r3, =FH_TUERMODUL_CTRL__N	
	ldr	r3, [r3, #0]
	cmp	r3, #60	
	ble	lab64
	ldr	r3, =FH_TUERMODUL_CTRL__N_old	
	ldr	r3, [r3, #0]
	cmp	r3, #60	
	bgt	lab64
	ldr	r3, =FH_TUERMODUL_CTRL__INREVERS1	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab64
	ldr	r3, =FH_TUERMODUL_CTRL__INREVERS2	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab64
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =B_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab53
lab64: 	ldr	r3, =FH_TUERMODUL__BLOCK	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab65
	ldr	r3, =FH_TUERMODUL__BLOCK_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab65
	ldr	r3, =FH_TUERMODUL__MFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab65
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =time	
	ldr	r3, [r3, #0]
	ldr	r2, =sc_FH_TUERMODUL_CTRL_2375_2	
	str	r3, [r2, #0]
	ldr	r3, =B_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab53
lab65: 	ldr	r3, =FH_TUERMODUL__BLOCK	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab66
	ldr	r3, =FH_TUERMODUL__BLOCK_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab66
	ldr	r3, =FH_TUERMODUL__MFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab66
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =time	
	ldr	r3, [r3, #0]
	ldr	r2, =sc_FH_TUERMODUL_CTRL_2352_1	
	str	r3, [r2, #0]
	ldr	r3, =B_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab53
lab66: 	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #3
	beq	lab67
	cmp	r3, #3
	bgt	lab68
	cmp	r3, #1
	beq	lab69
	cmp	r3, #2
	beq	lab70
	b	lab68
	nop
	.ltorg
lab69: 	ldr	r3, =FH_TUERMODUL__POSITION	
	ldr	r3, [r3, #0]
	cmp	r3, #404	
	ble	lab71
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab72
lab71: 	ldr	r3, =OEFFNEN_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	beq	lab73
	cmp	r3, #2
	beq	lab74
	b	lab75
lab73: 	ldr	r3, =FH_TUERMODUL__SFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab76
	ldr	r3, =FH_TUERMODUL__SFHZ_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab77
lab76: 	ldr	r3, =FH_TUERMODUL__SFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab78
	ldr	r3, =FH_TUERMODUL__SFHA_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab78
lab77: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	ldr	r3, =OEFFNEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab79
lab74: 	ldr	r3, =FH_TUERMODUL__SFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab80
	ldr	r3, =FH_TUERMODUL__SFHZ_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab80
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =OEFFNEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab79
lab80: 	ldr	r3, =FH_TUERMODUL__SFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab81
	ldr	r3, =FH_TUERMODUL__SFHA_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab81
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	ldr	r3, =OEFFNEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab79
lab75: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =OEFFNEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab79
lab78: 	nop
	b	lab72
lab81: 	nop
lab79: 	b	lab72
lab70: 	ldr	r3, =FH_TUERMODUL__POSITION	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bgt	lab82
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab72
lab82: 	ldr	r3, =SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	beq	lab83
	cmp	r3, #2
	beq	lab84
	b	lab85
lab83: 	ldr	r3, =FH_TUERMODUL__SFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab86
	ldr	r3, =FH_TUERMODUL__SFHA_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab87
lab86: 	ldr	r3, =FH_TUERMODUL__SFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab88
	ldr	r3, =FH_TUERMODUL__SFHZ_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab88
lab87: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab89
lab88: 	ldr	r3, =TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	beq	lab90
	cmp	r3, #2
	beq	lab91
	b	lab92
lab90: 	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #23]
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #22]
	cmp	r3, #0
	beq	lab93
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL_CTRL__INREVERS2_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #17]
	b	lab94
lab91: 	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #24]
	cmp	r3, #0
	beq	lab95
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL_CTRL__INREVERS2_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #23]
	ldr	r3, =TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #17]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =time	
	ldr	r3, [r3, #0]
	ldr	r2, =sc_FH_TUERMODUL_CTRL_1781_10	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab94
lab92: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #17]
	b	lab94
lab93: 	nop
	b	lab89
lab95: 	nop
lab94: 	b	lab89
lab84: 	ldr	r3, =FH_TUERMODUL__SFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab96
	ldr	r3, =FH_TUERMODUL__SFHZ_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab96
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab89
lab96: 	ldr	r3, =MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	beq	lab97
	cmp	r3, #2
	beq	lab98
	b	lab99
lab97: 	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #23]
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #22]
	cmp	r3, #0
	beq	lab100
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL_CTRL__INREVERS1_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #17]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab101
lab98: 	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #24]
	cmp	r3, #0
	beq	lab102
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL_CTRL__INREVERS1_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #23]
	ldr	r3, =MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #17]
	ldr	r3, =time	
	ldr	r3, [r3, #0]
	ldr	r2, =sc_FH_TUERMODUL_CTRL_1739_10	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab101
	nop
	.ltorg
lab102: 	ldr	r3, =FH_TUERMODUL__SFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab103
	ldr	r3, =FH_TUERMODUL__SFHA_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab103
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab101
lab99: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #17]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab101
lab100: 	nop
	b	lab89
lab103: 	nop
lab101: 	b	lab89
lab85: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #17]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	nop
lab89: 	b	lab72
lab67: 	ldr	r3, =FH_TUERMODUL__SFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab104
	ldr	r3, =FH_TUERMODUL__SFHZ_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab104
	ldr	r3, =FH_TUERMODUL__POSITION	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	lab104
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #17]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab72
lab104: 	ldr	r3, =FH_TUERMODUL__SFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab105
	ldr	r3, =FH_TUERMODUL__SFHA_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab105
	ldr	r3, =FH_TUERMODUL__POSITION	
	ldr	r3, [r3, #0]
	cmp	r3, #404	
	bgt	lab105
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =OEFFNEN_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab72
lab68: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab72
lab105: 	nop
lab72: 	b	lab53
lab49: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =B_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab53
lab52: 	nop
lab53: 	ldr	r3, =A_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab106
	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #5]
	ldr	r3, =step	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab107
	ldr	r3, =tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	lab107
	ldr	r3, =time	
	ldr	r2, [r3, #0]
	ldr	r3, =tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL	
	ldr	r3, [r3, #0]
	subs	r3, r2, r3
	cmp	r3, #1
	bne	lab107
	ldr	r3, =FH_TUERMODUL__MFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab108
	ldr	r3, =FH_TUERMODUL__MFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab107
lab108: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL_CTRL__N	
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r2, =FH_TUERMODUL_CTRL__N	
	str	r3, [r2, #0]
	ldr	r3, =A_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #5]
	ldr	r3, =WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab109
lab107: 	ldr	r3, =WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab110
	ldr	r3, =step	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab111
	ldr	r3, =tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	lab111
	ldr	r3, =time	
	ldr	r2, [r3, #0]
	ldr	r3, =tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL	
	ldr	r3, [r3, #0]
	subs	r3, r2, r3
	cmp	r3, #3
	bne	lab111
	ldr	r3, =FH_TUERMODUL__MFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab111
	ldr	r3, =FH_TUERMODUL__MFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab111
	ldr	r3, =FH_TUERMODUL_CTRL__N	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	lab111
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL_CTRL__N	
	ldr	r3, [r3, #0]
	subs	r3, #1
	ldr	r2, =FH_TUERMODUL_CTRL__N	
	str	r3, [r2, #0]
	ldr	r3, =WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab112
lab110: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #5]
	ldr	r3, =WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab112
lab111: 	nop
lab112: 	b	lab109
lab106: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL_CTRL__N	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =A_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #5]
	ldr	r3, =WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	nop
lab109: 	ldr	r3, =Bitlist	
	ldrb	r2, [r3, #4]
	ldr	r3, =Bitlist	
	strb	r2, [r3, #5]
	ldr	r3, =Bitlist	
	ldrb	r2, [r3, #6]
	ldr	r3, =Bitlist	
	strb	r2, [r3, #7]
lab45: 	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
generic_EINKLEMMSCHUTZ_CTRL:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #16]
	cmp	r3, #0
	beq	lab113
	ldr	r3, =EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	beq	lab114
	cmp	r3, #2
	beq	lab115
	b	lab116
lab114: 	ldr	r3, =FH_TUERMODUL__EKS_LEISTE_AKTIV	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab117
	ldr	r3, =FH_TUERMODUL__EKS_LEISTE_AKTIV_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab117
	ldr	r3, =FH_TUERMODUL__SFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab118
	ldr	r3, =FH_TUERMODUL__SFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab117
lab118: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #24]
	ldr	r3, =EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab119
lab115: 	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #24]
	ldr	r3, =FH_TUERMODUL__EKS_LEISTE_AKTIV	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab120
	ldr	r3, =FH_TUERMODUL__EKS_LEISTE_AKTIV_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab120
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab119
lab116: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab119
lab113: 	nop
	b	lab119
lab117: 	nop
	b	lab119
lab120: 	nop
lab119: 	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
generic_BLOCK_ERKENNUNG_CTRL:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #19]
	cmp	r3, #0
	bne	lab121
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #21]
	cmp	r3, #0
	beq	lab121
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #20]
	cmp	r3, #0
	bne	lab121
	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #0]
lab121: 	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #19]
	cmp	r3, #0
	beq	lab122
	ldr	r3, =BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	beq	lab123
	cmp	r3, #2
	beq	lab124
	b	lab125
lab123: 	ldr	r3, =FH_TUERMODUL__I_EIN	
	ldr	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__I_EIN_old	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	lab126
	ldr	r3, =FH_TUERMODUL__I_EIN	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	lab126
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__BLOCK_copy	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL__N	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL__I_EIN_MAX	
	movs	r2, #2
	str	r2, [r3, #0]
	ldr	r3, =BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab127
lab124: 	ldr	r3, =FH_TUERMODUL__MFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab128
	ldr	r3, =FH_TUERMODUL__MFHA_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab129
lab128: 	ldr	r3, =FH_TUERMODUL__MFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab130
	ldr	r3, =FH_TUERMODUL__MFHZ_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab130
lab129: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab127
lab130: 	ldr	r3, =BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #3
	beq	lab131
	cmp	r3, #3
	bgt	lab132
	cmp	r3, #1
	beq	lab133
	cmp	r3, #2
	bne	lab132
	ldr	r3, =BLOCK_ERKENNUNG_CTRL__I_EIN_MAX	
	ldr	r3, [r3, #0]
	subs	r2, r3, #1
	ldr	r3, =FH_TUERMODUL__I_EIN	
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bgt	lab134
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__BLOCK_copy	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab135
lab131: 	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL__N	
	ldr	r3, [r3, #0]
	cmp	r3, #11
	bne	lab136
	ldr	r3, =BLOCK_ERKENNUNG_CTRL__N_old	
	ldr	r3, [r3, #0]
	cmp	r3, #11
	beq	lab136
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab135
lab132: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL__N	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL__I_EIN_MAX	
	movs	r2, #2
	str	r2, [r3, #0]
	ldr	r3, =BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab135
lab133: 	nop
	b	lab127
lab134: 	nop
	b	lab127
lab136: 	nop
lab135: 	b	lab127
lab125: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab127
lab122: 	nop
	b	lab127
lab126: 	nop
lab127: 	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
FH_DU:
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, =time	
	movs	r2, #1
	str	r2, [r3, #0]
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =step	
	movs	r2, #0
	strb	r2, [r3, #0]
	b	lab137
lab156: 	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =step	
	ldrb	r3, [r3, #0]
	adds	r3, #1
	uxtb	r2, r3
	ldr	r3, =step	
	strb	r2, [r3, #0]
	ldr	r3, =FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #3
	beq	lab138
	cmp	r3, #3
	bgt	lab139
	cmp	r3, #1
	beq	lab140
	cmp	r3, #2
	beq	lab141
	b	lab139
lab140: 	ldr	r3, =FH_DU__MFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab142
	ldr	r3, =FH_DU__MFHZ_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab142
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFH	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab143
lab141: 	ldr	r3, =FH_DU__MFHZ	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab144
	ldr	r3, =FH_DU__MFHZ_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab144
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFH	
	mvn	r2, #99	
	str	r2, [r3, #0]
	ldr	r3, =FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	b	lab143
lab144: 	ldr	r3, =FH_DU__MFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab145
	ldr	r3, =FH_DU__MFHA_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab145
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFH	
	movs	r2, #100	
	str	r2, [r3, #0]
	ldr	r3, =FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
	b	lab143
lab138: 	ldr	r3, =FH_DU__MFHA	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab146
	ldr	r3, =FH_DU__MFHA_old	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab146
	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFH	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab143
lab139: 	ldr	r3, =stable	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFH	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	b	lab143
lab142: 	nop
	b	lab143
lab145: 	nop
	b	lab143
	nop
	.ltorg
lab146: 	nop
lab143: 	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #10]
	cmp	r3, #0
	bne	lab147
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	movs	r2, #3
	strb	r2, [r3, #0]
lab147: 	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #11]
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #16]
	cmp	r3, #0
	bne	lab148
	ldr	r3, =EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
lab148: 	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #17]
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #19]
	cmp	r3, #0
	bne	lab149
	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
lab149: 	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #20]
	ldr	r3, =Bitlist	
	ldrb	r3, [r3, #13]
	cmp	r3, #0
	bne	lab150
	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #6]
	ldr	r3, =B_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #2
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL_CTRL__N	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =A_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #5]
	ldr	r3, =WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state	
	movs	r2, #1
	strb	r2, [r3, #0]
lab150: 	ldr	r3, =Bitlist	
	movs	r2, #0
	strb	r2, [r3, #14]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #11]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #17]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #20]
	ldr	r3, =Bitlist	
	movs	r2, #1
	strb	r2, [r3, #14]
	ldr	r3, =FH_DU__S_FH_TMBFZUCAN	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFZUCAN_old	
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab151
	ldr	r3, =FH_DU__DOOR_ID	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab151
	ldr	r3, =FH_DU__S_FH_TMBFZUCAN	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTZU	
	strb	r2, [r3, #0]
lab151: 	ldr	r3, =FH_DU__S_FH_TMBFZUDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFZUDISC_old	
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab152
	ldr	r3, =FH_DU__DOOR_ID	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab152
	ldr	r3, =FH_DU__S_FH_TMBFZUDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFZUCAN	
	strb	r2, [r3, #0]
lab152: 	ldr	r3, =FH_DU__S_FH_TMBFAUFCAN	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFAUFCAN_old	
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab153
	ldr	r3, =FH_DU__DOOR_ID	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab153
	ldr	r3, =FH_DU__S_FH_TMBFAUFCAN	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTAUF	
	strb	r2, [r3, #0]
lab153: 	ldr	r3, =FH_DU__S_FH_TMBFAUFDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFAUFDISC_old	
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab154
	ldr	r3, =FH_DU__DOOR_ID	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab154
	ldr	r3, =FH_DU__S_FH_TMBFAUFDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFAUFCAN	
	strb	r2, [r3, #0]
lab154: 	ldr	r3, =Bitlist	
	ldrb	r2, [r3, #12]
	ldr	r3, =Bitlist	
	strb	r2, [r3, #10]
	ldr	r3, =Bitlist	
	ldrb	r2, [r3, #15]
	ldr	r3, =Bitlist	
	strb	r2, [r3, #13]
	ldr	r3, =Bitlist	
	ldrb	r2, [r3, #18]
	ldr	r3, =Bitlist	
	strb	r2, [r3, #16]
	ldr	r3, =Bitlist	
	ldrb	r2, [r3, #21]
	ldr	r3, =Bitlist	
	strb	r2, [r3, #19]
	ldr	r3, =FH_DU__S_FH_AUFDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTAUF	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_ZUDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTZU	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	strb	r2, [r3, #0]
	bl	generic_KINDERSICHERUNG_CTRL
	ldr	r3, =FH_TUERMODUL__MFHA	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHA	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHZ	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__I_EIN	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_DU__I_EIN	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__EKS_LEISTE_AKTIV	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__EKS_LEISTE_AKTIV	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__POSITION	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_DU__POSITION	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__FT	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__FT	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_AUFDISC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTAUF	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_ZUDISC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTZU	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__KL_50	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__KL_50	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__BLOCK	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__BLOCK	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_AUFDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTAUF	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_ZUDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTZU	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	strb	r2, [r3, #0]
	bl	generic_FH_TUERMODUL_CTRL
	ldr	r3, =FH_TUERMODUL__MFHA	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHA	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHZ	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__I_EIN	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_DU__I_EIN	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__EKS_LEISTE_AKTIV	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__EKS_LEISTE_AKTIV	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__POSITION	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_DU__POSITION	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__FT	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__FT	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_AUFDISC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTAUF	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_ZUDISC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTZU	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__KL_50	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__KL_50	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__BLOCK	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__BLOCK	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_AUFDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTAUF	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_ZUDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTZU	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	strb	r2, [r3, #0]
	bl	generic_EINKLEMMSCHUTZ_CTRL
	b	lab155
	nop
	.ltorg
lab155: 	ldr	r3, =FH_TUERMODUL__MFHA	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHA	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHZ	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__I_EIN	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_DU__I_EIN	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__EKS_LEISTE_AKTIV	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__EKS_LEISTE_AKTIV	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__POSITION	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_DU__POSITION	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__FT	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__FT	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_AUFDISC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTAUF	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_ZUDISC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTZU	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__KL_50	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__KL_50	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__BLOCK	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__BLOCK	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_AUFDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTAUF	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_ZUDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTZU	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	strb	r2, [r3, #0]
	bl	generic_BLOCK_ERKENNUNG_CTRL
	ldr	r3, =FH_TUERMODUL__MFHA	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHA	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHZ	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__I_EIN	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_DU__I_EIN	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__EKS_LEISTE_AKTIV	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__EKS_LEISTE_AKTIV	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__POSITION	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_DU__POSITION	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__FT	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__FT	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_AUFDISC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTAUF	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_ZUDISC	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_FTZU	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__KL_50	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__KL_50	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__BLOCK	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__BLOCK	
	strb	r2, [r3, #0]
	ldr	r3, =Bitlist	
	ldrb	r2, [r3, #10]
	ldr	r3, =Bitlist	
	strb	r2, [r3, #11]
	ldr	r3, =Bitlist	
	ldrb	r2, [r3, #13]
	ldr	r3, =Bitlist	
	strb	r2, [r3, #14]
	ldr	r3, =Bitlist	
	ldrb	r2, [r3, #16]
	ldr	r3, =Bitlist	
	strb	r2, [r3, #17]
	ldr	r3, =Bitlist	
	ldrb	r2, [r3, #19]
	ldr	r3, =Bitlist	
	strb	r2, [r3, #20]
	ldr	r3, =FH_TUERMODUL_CTRL__N	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_TUERMODUL_CTRL__N_old	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__I_EIN	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_TUERMODUL__I_EIN_old	
	str	r3, [r2, #0]
	ldr	r3, =FH_DU__MFH_copy	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_DU__MFH	
	str	r3, [r2, #0]
	ldr	r3, =FH_DU__I_EIN	
	ldr	r3, [r3, #0]
	ldr	r2, =FH_DU__I_EIN_old	
	str	r3, [r2, #0]
	ldr	r3, =BLOCK_ERKENNUNG_CTRL__N	
	ldr	r3, [r3, #0]
	ldr	r2, =BLOCK_ERKENNUNG_CTRL__N_old	
	str	r3, [r2, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_ZENTRAL_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_MEC_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_ZENTRAL_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_MEC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_MEC_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__BLOCK_copy	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__BLOCK	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__BLOCK	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__BLOCK_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_copy	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHZ_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_copy	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__SFHA_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_copy	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHZ_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_copy	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__MFHA_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__EKS_LEISTE_AKTIV	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_TUERMODUL__EKS_LEISTE_AKTIV_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__EKS_LEISTE_AKTIV	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__EKS_LEISTE_AKTIV_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFAUFCAN	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFAUFCAN_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFZUCAN	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFZUCAN_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFZUDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFZUDISC_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFAUFDISC	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__S_FH_TMBFAUFDISC_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__BLOCK_copy	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__BLOCK	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__BLOCK	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__BLOCK_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHZ_copy	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHZ	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHZ	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHZ_old	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHA_copy	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHA	
	strb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHA	
	ldrb	r2, [r3, #0]
	ldr	r3, =FH_DU__MFHA_old	
	strb	r2, [r3, #0]
lab137: 	ldr	r3, =stable	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	beq	lab156
	nop
	nop
	cpsid f
	push {r1, r2}
	ldr r1, =0x01e81
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	.ltorg
warm_caches:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
push {r1, r2}
	ldr r1, =0x0b0a6
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x0b0a6
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	str	r0, [r7, #12]
	nop
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x641d8
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
benchmark:
	push	{r7, lr}
	add	r7, sp, #0
	movw	r0, #1964	
push {r1, r2}
	ldr r1, =0x86d8d
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	benchmark_body
	push {r1, r2}
	ldr r1, =0x86d8d
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	mov	r0, r3
	cpsid f
	push {r1, r2}
	ldr r1, =0x035f2
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
benchmark_body:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	lab157
lab158: 	movs	r1, #0
	ldr	r0, =Bitlist	
push {r1, r2}
	ldr r1, =0x8be26
	mov.w r2, #1610612736 
	strh r1, [r2,#4]
	pop {r1, r2}
	bl	memset
	push {r1, r2}
	ldr r1, =0x8be26
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	init
	bl	interface
	bl	FH_DU
	push {r1, r2}
	ldr r1, =0xede7d
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	ldr	r3, [r7, #12]
	adds	r3, #1
	str	r3, [r7, #12]
lab157: 	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	lab158
	movs	r3, #0
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0xe8f71
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	.ltorg
initialise_benchmark:
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
verify_benchmark:
	push	{r4, r5, r7}
	sub	sp, #84	
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, =_global_impure_ptr_2	
	add	r4, r7, #12
	mov	r5, r3
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5, {r0, r1, r2, r3}
	stmia	r4, {r0, r1, r2, r3}
	movs	r3, #0
	str	r3, [r7, #76]	
	b	lab159
lab162: 	ldr	r3, [r7, #76]	
	add	r3, r2
	ldrb	r2, [r3, #0]
	add	r1, r7, #12
	ldr	r3, [r7, #76]	
	add	r3, r1
	ldrb	r3, [r3, #0]
	cmp	r2, r3
	beq	lab160
	movs	r3, #0
	b	lab161
lab160: 	ldr	r3, [r7, #76]	
	adds	r3, #1
	str	r3, [r7, #76]	
lab159: 	ldr	r3, [r7, #76]	
	cmp	r3, #63	
	ble	lab162
	ldr	r3, =tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL	
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =ZENTRAL_KINDERSICHERUNG_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =MEC_KINDERSICHERUNG_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #3
	bne	lab163
	ldr	r3, =B_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #2
	bne	lab163
	ldr	r3, =A_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab163
	ldr	r3, =WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab163
	ldr	r3, =INITIALISIERT_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =OEFFNEN_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =SCHLIESSEN_FH_TUERMODUL_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #2
	bne	lab163
	ldr	r3, =EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	bne	lab163
	ldr	r3, =BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #0
	bne	lab163
	ldr	r3, =BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state	
	ldrb	r3, [r3, #0]
	cmp	r3, #1
	beq	lab164
lab163: 	movs	r3, #0
	b	lab161
lab164: 	movs	r3, #1
lab161: 	mov	r0, r3
	adds	r7, #84	
	mov	sp, r7
	pop	{r4, r5, r7}
	bx	lr
	.ltorg
initialise_board:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =0xe000edfc	
	ldr	r3, [r3, #0]
	ldr	r2, =0xe000edfc	
	orr	r3, r3, #16777216	
	str	r3, [r2, #0]
	ldr	r3, =0xe0001004	
	movs	r2, #0
	str	r2, [r3, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
start_trigger:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =0xe0001000	
	ldr	r3, [r3, #0]
	ldr	r2, =0xe0001000	
	orr	r3, r3, #1
	str	r3, [r2, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	.ltorg
stop_trigger:
	push	{r7}
	add	r7, sp, #0
	ldr	r3, =0xe0001004	
	movs	r2, #0
	str	r2, [r3, #0]
	ldr	r3, =0xe0001000	
	ldr	r3, [r3, #0]
	ldr	r2, =0xe0001000	
	bic	r3, r3, #1
	str	r3, [r2, #0]
	nop
	mov	sp, r7
	pop	{r7}
	bx	lr
	nop
	.ltorg
main:
	push	{r7, lr}
	sub	sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	bl	initialise_board
	bl	initialise_benchmark
	movs	r0, #1
	bl	warm_caches
	push {r1, r2}
	ldr r1, =0x83ae8
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bl	start_trigger
	bl	benchmark
	push {r1, r2}
	ldr r1, =0xdcb08
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	mov	r3, r0
	str	r3, [r7, #8]
	bl	stop_trigger
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	verify_benchmark
	str	r0, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, #16
	mov	sp, r7
	cpsid f
	push {r1, r2}
	ldr r1, =0x3e951
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	pop	{r7, pc}
	movs	r0, r0
__libc_init_array:
	push	{r4, r5, r6, lr}
	ldr	r6, =0x00019ca4	
	ldr	r5, =0x00019ca4	
	subs	r6, r6, r5
	asrs	r6, r6, #2
	beq	lab165
	movs	r4, #0
lab166: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x1822e
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0xe46da
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab166
lab165: 	ldr	r6, =0x00019cac	
	ldr	r5, =0x00019ca4	
	subs	r6, r6, r5
	bl	_init
	asrs	r6, r6, #2
	beq	lab167
	movs	r4, #0
lab168: 	adds	r4, #1
	cpsid f
	push {r1, r2}
	ldr r1, =0x9822e
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r6, r4
	push {r1, r2}
	ldr r1, =0x4a5a9
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab168
lab167:	cpsid f
	push {r1, r2}
	ldr r1, =0x3d5ab
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, r6, pc}
	.ltorg
memset:
	lsls	r3, r0, #30
	push	{r4, r5, lr}
	beq	lab169
	subs	r4, r2, #1
	cmp	r2, #0
	beq	lab170
	uxtb	r2, r1
	mov	r3, r0
	b	lab171
lab172: 	bcc	lab170
lab171: 	strb	r2, [r3], #1
	lsls	r5, r3, #30
	bne	lab172
lab180: 	bls	lab173
	uxtb	r5, r1
	orr	r5, r5, r5, lsl #8
	cmp	r4, #15
	orr	r5, r5, r5, lsl #16
	bls	lab174
	sub	r2, r4, #16
	bic	ip, r2, #15
	add	lr, r3, #32
	add	lr, ip
	mov	ip, r2, lsr #4
	add	r2, r3, #16
lab175: 	strd	r5, r5, [r2, #-8]
	adds	r2, #16
	cmp	r2, lr
	bne	lab175
	add	r2, ip, #1
	tst	r4, #12
	add	r2, r3, r2, lsl #4
	and	ip, r4, #15
	beq	lab176
lab181: 	bic	r3, r3, #3
	adds	r3, #4
	add	r3, r2
lab177: 	cmp	r3, r2
	bne	lab177
	and	r4, ip, #3
lab173: 	cbz	r4, lab170
lab179: 	add	r4, r3
lab178: 	cmp	r4, r3
	bne	lab178
lab170:	cpsid f
	push {r1, r2}
	ldr r1, =0x65ef3
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 	pop	{r4, r5, pc}
lab176: 	mov	r4, ip
	mov	r3, r2
	cmp	r4, #0
	bne	lab179
	b	lab170
lab169: 	mov	r3, r0
	mov	r4, r2
	b	lab180
lab174: 	mov	r2, r3
	mov	ip, r4
	b	lab181
__call_exitprocs:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, =__atexit_recursive_mutex	
	sub	sp, #12
	mov	fp, r0
	ldr	r0, [r3, #0]
	str	fp, [sp, #4]
	mov	r7, r1
	bl	__retarget_lock_acquire_recursive
	ldr	r3, =_global_impure_ptr	
	ldr	r8, [r3]
	ldr	r6, [r8, #328]	
	cbz	r6, lab182
	mov	r9, #1
	mov	sl, #0
lab188: 	subs	r5, r4, #1
	bmi	lab182
	adds	r4, #1
	add	r4, r6, r4, lsl #2
lab184: 	ldr	r3, [r4, #256]	
	cmp	r3, r7
	beq	lab183
lab185: 	adds	r3, r5, #1
	sub	r4, r4, #4
	bne	lab184
lab182: 	ldr	r3, =__atexit_recursive_mutex	
	ldr	r0, [r3, #0]
	add	sp, #12
	ldmia	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	__retarget_lock_release_recursive
lab183: 	ldr	r3, [r6, #4]
	ldr	r2, [r4, #0]
	subs	r3, #1
	cmp	r3, r5
	ite	eq
	streq	r5, [r6, #4]
	strne	sl, [r4]
	cmp	r2, #0
	beq	lab185
	ldr	r0, [r6, #392]	
	ldr	fp, [r6, #4]
	lsl	r1, r9, r5
	tst	r1, r0
	bne	lab186
	blx	r2
lab191: 	cmp	r2, fp
	bne	lab187
lab190: 	cmp	r3, r6
	beq	lab185
	mov	r6, r3
	cmp	r6, #0
	bne	lab188
	b	lab182
lab186: 	ldr	r0, [r6, #396]	
	tst	r1, r0
	bne	lab189
	ldr	r1, [r4, #128]	
	ldr	r0, [sp, #4]
	blx	r2
	ldr	r2, [r6, #4]
	cmp	r2, fp
	beq	lab190
lab187: 	ldr	r6, [r8, #328]	
	cmp	r6, #0
	bne	lab188
	b	lab182
lab189: 	ldr	r0, [r4, #128]	
	blx	r2
	b	lab191
	.ltorg
atexit:
	movs	r3, #0
	mov	r1, r0
	mov	r2, r3
	mov	r0, r3
	b	__register_exitproc
__libc_fini_array:
	push	{r3, r4, r5, lr}
	ldr	r3, =impure_data	
	ldr	r5, =0x00019cac	
	subs	r3, r3, r5
	asrs	r4, r3, #2
	beq	lab192
	subs	r3, #4
	add	r5, r3
lab193: 	ldr	r3, [r5], #-4
	cpsid f
	push {r1, r2}
	ldr r1, =0x53199
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
	blx	r3
	cmp	r4, #0
	push {r1, r2}
	ldr r1, =0x0be2f
	mov.w r2, #1610612736 
	strh r1, [r2, #2]
	pop {r1, r2}
	cpsie f
	bne	lab193
lab192: 	ldmia	sp!, {r3, r4, r5, lr}
	b	_fini
	.ltorg
__retarget_lock_acquire_recursive:
	bx	lr
	nop
__retarget_lock_release_recursive:
	bx	lr
	nop
__register_exitproc:
	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, =__atexit_recursive_mutex	
	mov	r6, r0
	ldr	r0, [sl]
	mov	r8, r3
	mov	r7, r1
	mov	r9, r2
	bl	__retarget_lock_acquire_recursive
	ldr	r3, =_global_impure_ptr	
	ldr	r3, [r3, #0]
	ldr	r4, [r3, #328]	
	cbz	r4, lab194
lab198: 	cmp	r5, #31
	bgt	lab195
	cbnz	r6, lab196
lab197: 	adds	r5, #2
	ldr	r0, [sl]
	str	r3, [r4, #4]
	str	r7, [r4, r5, lsl #2]
	bl	__retarget_lock_release_recursive
	movs	r0, #0
lab199:	cpsid f
	push {r1, r2}
	ldr r1, =0x15b51
	mov.w r2, #1610612736 
	strh r1, [r2, #0]
	pop {r1, r2}
 lab196: 	add	r1, r4, r5, lsl #2
	movs	r3, #1
	str	r9, [r1, #136]	
	ldr	r2, [r4, #392]	
	lsls	r3, r5
	orrs	r2, r3
	cmp	r6, #2
	str	r2, [r4, #392]	
	str	r8, [r1, #264]	
	bne	lab197
	ldr	r2, [r4, #396]	
	orrs	r3, r2
	str	r3, [r4, #396]	
	b	lab197
lab194: 	add	r4, r3, #332	
	str	r4, [r3, #328]	
	b	lab198
lab195: 	ldr	r0, [sl]
	bl	__retarget_lock_release_recursive
	mov	r0, #4294967295	
	b	lab199
	.ltorg
_exit:
	b	_exit
	nop
_fini:
	push	{r3, r4, r5, r6, r7, lr}
	nop
	pop	{r3, r4, r5, r6, r7}
	pop	{r3}
	mov	lr, r3
	bx	lr


	.section .rodata

_global_impure_ptr_2:
	.word	0x00000000
	.word	0x00000100
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
_global_impure_ptr:
	.word	0x00019cb0


	.data

impure_data:
	.word	0x00000000
	.word	0x00019f9c
	.word	0x0001a004
	.word	0x0001a06c
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000001
	.word	0x00000000
	.word	0xabcd330e
	.word	0xe66d1234
	.word	0x0005deec
	.word	0x0000000b
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
__atexit_recursive_mutex:
	.word	0x0001a1f0


	.bss

__bss_start:
	.word	0x00000000
object.0:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
Bitlist:
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
	.word	0x00000000
tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy:
	.word	0x00000000
tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL:
	.word	0x00000000
tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL:
	.word	0x00000000
sc_FH_TUERMODUL_CTRL_2375_2:
	.word	0x00000000
sc_FH_TUERMODUL_CTRL_2352_1:
	.word	0x00000000
sc_FH_TUERMODUL_CTRL_2329_1:
	.word	0x00000000
FH_TUERMODUL_CTRL__N:
	.word	0x00000000
FH_TUERMODUL_CTRL__N_copy:
	.word	0x00000000
FH_TUERMODUL_CTRL__N_old:
	.word	0x00000000
sc_FH_TUERMODUL_CTRL_1781_10:
	.word	0x00000000
sc_FH_TUERMODUL_CTRL_1739_10:
	.word	0x00000000
FH_TUERMODUL__POSITION:
	.word	0x00000000
FH_TUERMODUL__I_EIN:
	.word	0x00000000
FH_TUERMODUL__I_EIN_old:
	.word	0x00000000
FH_DU__MFH:
	.word	0x00000000
FH_DU__MFH_copy:
	.word	0x00000000
FH_DU__POSITION:
	.word	0x00000000
FH_DU__I_EIN:
	.word	0x00000000
FH_DU__I_EIN_old:
	.word	0x00000000
BLOCK_ERKENNUNG_CTRL__I_EIN_MAX:
	.word	0x00000000
BLOCK_ERKENNUNG_CTRL__I_EIN_MAX_copy:
	.word	0x00000000
BLOCK_ERKENNUNG_CTRL__N:
	.word	0x00000000
BLOCK_ERKENNUNG_CTRL__N_copy:
	.word	0x00000000
BLOCK_ERKENNUNG_CTRL__N_old:
	.word	0x00000000
FH_TUERMODUL_CTRL__INREVERS2:
	.word	0x00000000
FH_TUERMODUL_CTRL__INREVERS2_copy:
	.word	0x00000000
FH_TUERMODUL_CTRL__INREVERS1:
	.word	0x00000000
FH_TUERMODUL_CTRL__INREVERS1_copy:
	.word	0x00000000
FH_TUERMODUL_CTRL__FT:
	.word	0x00000000
FH_TUERMODUL__SFHZ_ZENTRAL:
	.word	0x00000000
FH_TUERMODUL__SFHZ_ZENTRAL_old:
	.word	0x00000000
FH_TUERMODUL__SFHZ_MEC:
	.word	0x00000000
FH_TUERMODUL__SFHZ_MEC_old:
	.word	0x00000000
FH_TUERMODUL__SFHA_ZENTRAL:
	.word	0x00000000
FH_TUERMODUL__SFHA_ZENTRAL_old:
	.word	0x00000000
FH_TUERMODUL__SFHA_MEC:
	.word	0x00000000
FH_TUERMODUL__SFHA_MEC_old:
	.word	0x00000000
FH_TUERMODUL__KL_50:
	.word	0x00000000
FH_TUERMODUL__BLOCK:
	.word	0x00000000
FH_TUERMODUL__BLOCK_copy:
	.word	0x00000000
FH_TUERMODUL__BLOCK_old:
	.word	0x00000000
FH_TUERMODUL__FT:
	.word	0x00000000
FH_TUERMODUL__SFHZ:
	.word	0x00000000
FH_TUERMODUL__SFHZ_copy:
	.word	0x00000000
FH_TUERMODUL__SFHZ_old:
	.word	0x00000000
FH_TUERMODUL__SFHA:
	.word	0x00000000
FH_TUERMODUL__SFHA_copy:
	.word	0x00000000
FH_TUERMODUL__SFHA_old:
	.word	0x00000000
FH_TUERMODUL__MFHZ:
	.word	0x00000000
FH_TUERMODUL__MFHZ_copy:
	.word	0x00000000
FH_TUERMODUL__MFHZ_old:
	.word	0x00000000
FH_TUERMODUL__MFHA:
	.word	0x00000000
FH_TUERMODUL__MFHA_copy:
	.word	0x00000000
FH_TUERMODUL__MFHA_old:
	.word	0x00000000
FH_TUERMODUL__EKS_LEISTE_AKTIV:
	.word	0x00000000
FH_TUERMODUL__EKS_LEISTE_AKTIV_old:
	.word	0x00000000
FH_TUERMODUL__COM_OPEN:
	.word	0x00000000
FH_TUERMODUL__COM_CLOSE:
	.word	0x00000000
FH_DU__KL_50:
	.word	0x00000000
FH_DU__S_FH_FTZU:
	.word	0x00000000
FH_DU__S_FH_FTAUF:
	.word	0x00000000
FH_DU__FT:
	.word	0x00000000
FH_DU__EKS_LEISTE_AKTIV:
	.word	0x00000000
FH_DU__EKS_LEISTE_AKTIV_old:
	.word	0x00000000
FH_DU__S_FH_TMBFAUFCAN:
	.word	0x00000000
FH_DU__S_FH_TMBFAUFCAN_copy:
	.word	0x00000000
FH_DU__S_FH_TMBFAUFCAN_old:
	.word	0x00000000
FH_DU__S_FH_TMBFZUCAN:
	.word	0x00000000
FH_DU__S_FH_TMBFZUCAN_copy:
	.word	0x00000000
FH_DU__S_FH_TMBFZUCAN_old:
	.word	0x00000000
FH_DU__S_FH_TMBFZUDISC:
	.word	0x00000000
FH_DU__S_FH_TMBFZUDISC_old:
	.word	0x00000000
FH_DU__S_FH_TMBFAUFDISC:
	.word	0x00000000
FH_DU__S_FH_TMBFAUFDISC_old:
	.word	0x00000000
FH_DU__S_FH_ZUDISC:
	.word	0x00000000
FH_DU__S_FH_AUFDISC:
	.word	0x00000000
FH_DU__DOOR_ID:
	.word	0x00000000
FH_DU__BLOCK:
	.word	0x00000000
FH_DU__BLOCK_copy:
	.word	0x00000000
FH_DU__BLOCK_old:
	.word	0x00000000
FH_DU__MFHZ:
	.word	0x00000000
FH_DU__MFHZ_copy:
	.word	0x00000000
FH_DU__MFHZ_old:
	.word	0x00000000
FH_DU__MFHA:
	.word	0x00000000
FH_DU__MFHA_copy:
	.word	0x00000000
FH_DU__MFHA_old:
	.word	0x00000000
time:
	.word	0x00000000
stable:
	.word	0x00000000
step:
	.word	0x00000000
NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state:
	.word	0x00000000
ZENTRAL_KINDERSICHERUNG_CTRL_next_state:
	.word	0x00000000
MEC_KINDERSICHERUNG_CTRL_next_state:
	.word	0x00000000
KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state:
	.word	0x00000000
B_FH_TUERMODUL_CTRL_next_state:
	.word	0x00000000
A_FH_TUERMODUL_CTRL_next_state:
	.word	0x00000000
WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state:
	.word	0x00000000
INITIALISIERT_FH_TUERMODUL_CTRL_next_state:
	.word	0x00000000
TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state:
	.word	0x00000000
MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state:
	.word	0x00000000
OEFFNEN_FH_TUERMODUL_CTRL_next_state:
	.word	0x00000000
SCHLIESSEN_FH_TUERMODUL_CTRL_next_state:
	.word	0x00000000
FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state:
	.word	0x00000000
EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state:
	.word	0x00000000
BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state:
	.word	0x00000000
BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state:
	.word	0x00000000
__lock___atexit_recursive_mutex:
	.word	0x00000000
