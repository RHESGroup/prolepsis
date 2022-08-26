	.text

entrypoint:
	cflc0 30(a3)
	cflc1 30(a1)
	cflc2 30(a1)
	cflc3 30(a1)
	cflc4 30(a1)
	cflc5 30(a1)
	cflc6 30(a1)
	cflc7 30(a1)
	cflc8 30(a1)
	cflc9 30(a1)
	j _start

exit:
	addi	sp,sp,-16
	li	a1,0
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	jal	ra,__call_exitprocs
	cfed 0xd7403
	lw	a0,-984(gp) # 12438 <_global_impure_ptr>
	lw	a5,60(a0)
	beqz	a5,lab0
	jalr	a5
lab0: 	mv	a0,s0
	jal	ra,_exit
register_fini:
	li	a5,0
	beqz	a5,lab1
	lui	a0,0x12
	addi	a0,a0,-528 # 11df0 <__libc_fini_array>
	j	atexit
lab1: 	ret
_start:
	auipc	gp,0x2
	addi	gp,gp,1844 # 12810 <__global_pointer$>
	addi	a0,gp,-976 # 12440 <tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy>
	addi	a2,gp,-700 # 12554 <__BSS_END__>
	sub	a2,a2,a0
	li	a1,0
	jal	ra,memset
	auipc	a0,0x2
	addi	a0,a0,-684 # 11e4c <atexit>
	beqz	a0,lab2
	auipc	a0,0x2
	addi	a0,a0,-788 # 11df0 <__libc_fini_array>
	jal	ra,atexit
lab2: 	jal	ra,__libc_init_array
	cfed 0xf990e
	lw	a0,0(sp)
	addi	a1,sp,4
	li	a2,0
	jal	ra,main
	cfed 0x21a8c
	j	exit
__do_global_dtors_aux:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lbu	a5,-792(gp) # 124f8 <completed.1>
	sw	ra,12(sp)
	bnez	a5,lab3
	li	a5,0
	beqz	a5,lab4
	lui	a0,0x12
	mv	a0,a0
	auipc	ra,0x0
	jalr	zero # 0 <exit-0x10094>
lab4: 	li	a5,1
	sb	a5,-792(gp) # 124f8 <completed.1>
lab3: 	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0x24709
	ret
frame_dummy:
	li	a5,0
	beqz	a5,lab5
	lui	a0,0x12
	addi	a1,gp,-788 # 124fc <object.0>
	mv	a0,a0
	auipc	t1,0x0
	jr	zero # 0 <exit-0x10094>
lab5: 	ret
interface:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,4(a5)
	beqz	a5,lab6
	lw	a4,-816(gp) # 124e0 <time>
	sw	a4,-968(gp) # 12448 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL>
lab6: 	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,4(a5)
	bnez	a5,lab7
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,6(a5)
	beqz	a5,lab8
lab7: 	lw	a4,-816(gp) # 124e0 <time>
	sw	a4,-972(gp) # 12444 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL>
lab8: 	lw	a5,-964(gp) # 1244c <sc_FH_TUERMODUL_CTRL_2375_2>
	beqz	a5,lab9
	lw	a4,-816(gp) # 124e0 <time>
	lw	a5,-964(gp) # 1244c <sc_FH_TUERMODUL_CTRL_2375_2>
	beq	a4,a5,lab9
	sb	zero,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	sw	zero,-964(gp) # 1244c <sc_FH_TUERMODUL_CTRL_2375_2>
lab9: 	lw	a5,-960(gp) # 12450 <sc_FH_TUERMODUL_CTRL_2352_1>
	beqz	a5,lab10
	lw	a4,-816(gp) # 124e0 <time>
	lw	a5,-960(gp) # 12450 <sc_FH_TUERMODUL_CTRL_2352_1>
	beq	a4,a5,lab10
	sb	zero,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	sw	zero,-960(gp) # 12450 <sc_FH_TUERMODUL_CTRL_2352_1>
lab10: 	lw	a5,-956(gp) # 12454 <sc_FH_TUERMODUL_CTRL_2329_1>
	beqz	a5,lab11
	lw	a4,-816(gp) # 124e0 <time>
	lw	a5,-956(gp) # 12454 <sc_FH_TUERMODUL_CTRL_2329_1>
	beq	a4,a5,lab11
	sb	zero,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	sw	zero,-956(gp) # 12454 <sc_FH_TUERMODUL_CTRL_2329_1>
lab11: 	lw	a5,-940(gp) # 12464 <sc_FH_TUERMODUL_CTRL_1781_10>
	beqz	a5,lab12
	lw	a4,-816(gp) # 124e0 <time>
	lw	a5,-940(gp) # 12464 <sc_FH_TUERMODUL_CTRL_1781_10>
	beq	a4,a5,lab12
	sw	zero,-940(gp) # 12464 <sc_FH_TUERMODUL_CTRL_1781_10>
lab12: 	lw	a5,-936(gp) # 12468 <sc_FH_TUERMODUL_CTRL_1739_10>
	beqz	a5,lab13
	lw	a4,-816(gp) # 124e0 <time>
	lw	a5,-936(gp) # 12468 <sc_FH_TUERMODUL_CTRL_1739_10>
	beq	a4,a5,lab13
	sw	zero,-936(gp) # 12468 <sc_FH_TUERMODUL_CTRL_1739_10>
lab13: 	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,0(a5)
	bnez	a5,lab14
	lw	a4,-892(gp) # 12494 <BLOCK_ERKENNUNG_CTRL__N>
	lw	a5,-884(gp) # 1249c <BLOCK_ERKENNUNG_CTRL__N_old>
	beq	a4,a5,lab15
lab14: 	lw	a4,-816(gp) # 124e0 <time>
	sw	a4,-976(gp) # 12440 <tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy>
lab15: 	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
init:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	sw	zero,-976(gp) # 12440 <tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy>
	sw	zero,-972(gp) # 12444 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL>
	sw	zero,-968(gp) # 12448 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL>
	sb	zero,-810(gp) # 124e6 <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
	sb	zero,-809(gp) # 124e7 <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
	sb	zero,-808(gp) # 124e8 <MEC_KINDERSICHERUNG_CTRL_next_state>
	sb	zero,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	sb	zero,-806(gp) # 124ea <B_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-805(gp) # 124eb <A_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-804(gp) # 124ec <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-802(gp) # 124ee <TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-801(gp) # 124ef <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-800(gp) # 124f0 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-799(gp) # 124f1 <SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-798(gp) # 124f2 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
	sb	zero,-797(gp) # 124f3 <EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state>
	sb	zero,-796(gp) # 124f4 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
	sb	zero,-795(gp) # 124f5 <BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state>
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
generic_KINDERSICHERUNG_CTRL:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,10(a5)
	beqz	a5,lab16
	lbu	a5,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	li	a4,3
	beq	a5,a4,lab17
	li	a4,3
	blt	a4,a5,lab18
	li	a4,1
	beq	a5,a4,lab19
	li	a4,2
	beq	a5,a4,lab20
	j	lab18
lab19: 	lbu	a5,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	bnez	a5,lab21
	lbu	a5,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	bnez	a5,lab21
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-861(gp) # 124b3 <FH_TUERMODUL__SFHZ_copy>
	sb	zero,-858(gp) # 124b6 <FH_TUERMODUL__SFHA_copy>
	li	a4,3
	sb	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	sb	zero,-809(gp) # 124e7 <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
	j	lab16
lab21: 	lbu	a5,-809(gp) # 124e7 <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
	mv	a4,a5
	li	a5,1
	bne	a4,a5,lab22
	lbu	a5,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	beqz	a5,lab23
	lbu	a5,-870(gp) # 124aa <FH_TUERMODUL__SFHA_ZENTRAL_old>
	bnez	a5,lab23
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-858(gp) # 124b6 <FH_TUERMODUL__SFHA_copy>
	li	a4,1
	sb	a4,-809(gp) # 124e7 <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
	j	lab24
lab23: 	lbu	a5,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	beqz	a5,lab25
	lbu	a5,-874(gp) # 124a6 <FH_TUERMODUL__SFHZ_ZENTRAL_old>
	bnez	a5,lab25
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-861(gp) # 124b3 <FH_TUERMODUL__SFHZ_copy>
	li	a4,1
	sb	a4,-809(gp) # 124e7 <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
	j	lab24
lab25: 	lbu	a5,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	bnez	a5,lab26
	lbu	a5,-870(gp) # 124aa <FH_TUERMODUL__SFHA_ZENTRAL_old>
	beqz	a5,lab26
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-858(gp) # 124b6 <FH_TUERMODUL__SFHA_copy>
	li	a4,1
	sb	a4,-809(gp) # 124e7 <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
	j	lab24
lab26: 	lbu	a5,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	bnez	a5,lab27
	lbu	a5,-874(gp) # 124a6 <FH_TUERMODUL__SFHZ_ZENTRAL_old>
	beqz	a5,lab27
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-861(gp) # 124b3 <FH_TUERMODUL__SFHZ_copy>
	li	a4,1
	sb	a4,-809(gp) # 124e7 <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
	j	lab24
lab22: 	sb	zero,-812(gp) # 124e4 <stable>
	j	lab24
lab27: 	nop
lab24: 	j	lab16
lab20: 	lbu	a5,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	bnez	a5,lab28
	lbu	a5,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	bnez	a5,lab28
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-861(gp) # 124b3 <FH_TUERMODUL__SFHZ_copy>
	sb	zero,-858(gp) # 124b6 <FH_TUERMODUL__SFHA_copy>
	li	a4,3
	sb	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	sb	zero,-808(gp) # 124e8 <MEC_KINDERSICHERUNG_CTRL_next_state>
	j	lab16
lab28: 	lbu	a5,-808(gp) # 124e8 <MEC_KINDERSICHERUNG_CTRL_next_state>
	mv	a4,a5
	li	a5,1
	bne	a4,a5,lab29
	lbu	a5,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	beqz	a5,lab30
	lbu	a5,-868(gp) # 124ac <FH_TUERMODUL__SFHA_MEC_old>
	bnez	a5,lab30
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-858(gp) # 124b6 <FH_TUERMODUL__SFHA_copy>
	li	a4,1
	sb	a4,-808(gp) # 124e8 <MEC_KINDERSICHERUNG_CTRL_next_state>
	j	lab31
lab30: 	lbu	a5,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	beqz	a5,lab32
	lbu	a5,-872(gp) # 124a8 <FH_TUERMODUL__SFHZ_MEC_old>
	bnez	a5,lab32
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-861(gp) # 124b3 <FH_TUERMODUL__SFHZ_copy>
	li	a4,1
	sb	a4,-808(gp) # 124e8 <MEC_KINDERSICHERUNG_CTRL_next_state>
	j	lab31
lab32: 	lbu	a5,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	bnez	a5,lab33
	lbu	a5,-868(gp) # 124ac <FH_TUERMODUL__SFHA_MEC_old>
	beqz	a5,lab33
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-858(gp) # 124b6 <FH_TUERMODUL__SFHA_copy>
	li	a4,1
	sb	a4,-808(gp) # 124e8 <MEC_KINDERSICHERUNG_CTRL_next_state>
	j	lab31
lab33: 	lbu	a5,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	bnez	a5,lab34
	lbu	a5,-872(gp) # 124a8 <FH_TUERMODUL__SFHZ_MEC_old>
	beqz	a5,lab34
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-861(gp) # 124b3 <FH_TUERMODUL__SFHZ_copy>
	li	a4,1
	sb	a4,-808(gp) # 124e8 <MEC_KINDERSICHERUNG_CTRL_next_state>
	j	lab31
lab29: 	sb	zero,-812(gp) # 124e4 <stable>
	j	lab31
lab34: 	nop
lab31: 	j	lab16
lab17: 	lbu	a5,-867(gp) # 124ad <FH_TUERMODUL__KL_50>
	bnez	a5,lab35
	lbu	a5,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	beqz	a5,lab35
	lbu	a5,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	beqz	a5,lab35
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-861(gp) # 124b3 <FH_TUERMODUL__SFHZ_copy>
	li	a4,1
	sb	a4,-858(gp) # 124b6 <FH_TUERMODUL__SFHA_copy>
	li	a4,2
	sb	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	j	lab16
lab35: 	lbu	a5,-867(gp) # 124ad <FH_TUERMODUL__KL_50>
	bnez	a5,lab36
	lbu	a5,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	beqz	a5,lab36
	lbu	a5,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	bnez	a5,lab36
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-861(gp) # 124b3 <FH_TUERMODUL__SFHZ_copy>
	li	a4,2
	sb	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	j	lab16
lab36: 	lbu	a5,-867(gp) # 124ad <FH_TUERMODUL__KL_50>
	bnez	a5,lab37
	lbu	a5,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	bnez	a5,lab37
	lbu	a5,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	beqz	a5,lab37
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-858(gp) # 124b6 <FH_TUERMODUL__SFHA_copy>
	li	a4,2
	sb	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	j	lab16
lab37: 	lbu	a5,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	bnez	a5,lab38
	lbu	a5,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	beqz	a5,lab38
	lbu	a5,-867(gp) # 124ad <FH_TUERMODUL__KL_50>
	bnez	a5,lab38
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-858(gp) # 124b6 <FH_TUERMODUL__SFHA_copy>
	li	a4,1
	sb	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	j	lab16
lab38: 	lbu	a5,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	beqz	a5,lab39
	lbu	a5,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	beqz	a5,lab39
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-858(gp) # 124b6 <FH_TUERMODUL__SFHA_copy>
	li	a4,1
	sb	a4,-861(gp) # 124b3 <FH_TUERMODUL__SFHZ_copy>
	li	a4,1
	sb	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	j	lab16
lab39: 	lbu	a5,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	beqz	a5,lab40
	lbu	a5,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	bnez	a5,lab40
	lbu	a5,-867(gp) # 124ad <FH_TUERMODUL__KL_50>
	bnez	a5,lab40
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-861(gp) # 124b3 <FH_TUERMODUL__SFHZ_copy>
	li	a4,1
	sb	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	j	lab16
lab18: 	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,3
	sb	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	j	lab16
lab40: 	nop
lab16: 	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
generic_FH_TUERMODUL_CTRL:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,13(a5)
	bnez	a5,lab41
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,15(a5)
	beqz	a5,lab41
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,14(a5)
	bnez	a5,lab41
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,4(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,6(a5)
lab41: 	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,13(a5)
	beqz	a5,lab42
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,10(a5)
	bnez	a5,lab43
	li	a4,3
	sb	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
lab43: 	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,11(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,19(a5)
	bnez	a5,lab44
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,0(a5)
	li	a4,1
	sb	a4,-795(gp) # 124f5 <BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state>
lab44: 	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,20(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,11(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,20(a5)
	lbu	a5,-806(gp) # 124ea <B_FH_TUERMODUL_CTRL_next_state>
	li	a4,3
	beq	a5,a4,lab45
	li	a4,3
	blt	a4,a5,lab46
	li	a4,1
	beq	a5,a4,lab47
	li	a4,2
	beq	a5,a4,lab48
	j	lab46
lab47: 	lw	a4,-952(gp) # 12458 <FH_TUERMODUL_CTRL__N>
	li	a5,59
	bne	a4,a5,lab49
	lw	a4,-944(gp) # 12460 <FH_TUERMODUL_CTRL__N_old>
	li	a5,59
	beq	a4,a5,lab49
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,3
	sb	a4,-806(gp) # 124ea <B_FH_TUERMODUL_CTRL_next_state>
	li	a4,3
	sb	a4,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	j	lab50
lab48: 	lbu	a5,-866(gp) # 124ae <FH_TUERMODUL__BLOCK>
	beqz	a5,lab51
	lbu	a5,-864(gp) # 124b0 <FH_TUERMODUL__BLOCK_old>
	bnez	a5,lab51
	lbu	a5,-856(gp) # 124b8 <FH_TUERMODUL__MFHZ>
	beqz	a5,lab51
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	lw	a4,-816(gp) # 124e0 <time>
	sw	a4,-956(gp) # 12454 <sc_FH_TUERMODUL_CTRL_2329_1>
	li	a4,3
	sb	a4,-806(gp) # 124ea <B_FH_TUERMODUL_CTRL_next_state>
	li	a4,3
	sb	a4,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	j	lab50
lab51: 	lbu	a5,-810(gp) # 124e6 <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
	li	a4,3
	beq	a5,a4,lab52
	li	a4,3
	blt	a4,a5,lab53
	li	a4,1
	beq	a5,a4,lab54
	li	a4,2
	beq	a5,a4,lab55
	j	lab53
lab54: 	lbu	a5,-862(gp) # 124b2 <FH_TUERMODUL__SFHZ>
	bnez	a5,lab56
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	li	a4,3
	sb	a4,-810(gp) # 124e6 <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
	j	lab57
lab55: 	lbu	a5,-859(gp) # 124b5 <FH_TUERMODUL__SFHA>
	bnez	a5,lab58
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	li	a4,3
	sb	a4,-810(gp) # 124e6 <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
	j	lab57
lab52: 	lbu	a5,-859(gp) # 124b5 <FH_TUERMODUL__SFHA>
	beqz	a5,lab59
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	li	a4,2
	sb	a4,-810(gp) # 124e6 <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
	j	lab57
lab59: 	lbu	a5,-862(gp) # 124b2 <FH_TUERMODUL__SFHZ>
	beqz	a5,lab60
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	li	a4,1
	sb	a4,-810(gp) # 124e6 <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
	j	lab57
lab53: 	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,3
	sb	a4,-810(gp) # 124e6 <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
	j	lab57
lab56: 	nop
	j	lab50
lab58: 	nop
	j	lab50
lab60: 	nop
lab57: 	j	lab50
lab45: 	lw	a4,-952(gp) # 12458 <FH_TUERMODUL_CTRL__N>
	li	a5,60
	bge	a5,a4,lab61
	lw	a4,-944(gp) # 12460 <FH_TUERMODUL_CTRL__N_old>
	li	a5,60
	blt	a5,a4,lab61
	lbu	a5,-878(gp) # 124a2 <FH_TUERMODUL_CTRL__INREVERS1>
	bnez	a5,lab61
	lbu	a5,-880(gp) # 124a0 <FH_TUERMODUL_CTRL__INREVERS2>
	bnez	a5,lab61
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	sb	zero,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	li	a4,1
	sb	a4,-806(gp) # 124ea <B_FH_TUERMODUL_CTRL_next_state>
	j	lab50
lab61: 	lbu	a5,-866(gp) # 124ae <FH_TUERMODUL__BLOCK>
	beqz	a5,lab62
	lbu	a5,-864(gp) # 124b0 <FH_TUERMODUL__BLOCK_old>
	bnez	a5,lab62
	lbu	a5,-853(gp) # 124bb <FH_TUERMODUL__MFHA>
	beqz	a5,lab62
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	lw	a4,-816(gp) # 124e0 <time>
	sw	a4,-964(gp) # 1244c <sc_FH_TUERMODUL_CTRL_2375_2>
	li	a4,2
	sb	a4,-806(gp) # 124ea <B_FH_TUERMODUL_CTRL_next_state>
	li	a4,3
	sb	a4,-810(gp) # 124e6 <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
	j	lab50
lab62: 	lbu	a5,-866(gp) # 124ae <FH_TUERMODUL__BLOCK>
	beqz	a5,lab63
	lbu	a5,-864(gp) # 124b0 <FH_TUERMODUL__BLOCK_old>
	bnez	a5,lab63
	lbu	a5,-856(gp) # 124b8 <FH_TUERMODUL__MFHZ>
	beqz	a5,lab63
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	lw	a4,-816(gp) # 124e0 <time>
	sw	a4,-960(gp) # 12450 <sc_FH_TUERMODUL_CTRL_2352_1>
	li	a4,2
	sb	a4,-806(gp) # 124ea <B_FH_TUERMODUL_CTRL_next_state>
	li	a4,3
	sb	a4,-810(gp) # 124e6 <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
	j	lab50
lab63: 	lbu	a5,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	li	a4,3
	beq	a5,a4,lab64
	li	a4,3
	blt	a4,a5,lab65
	li	a4,1
	beq	a5,a4,lab66
	li	a4,2
	beq	a5,a4,lab67
	j	lab65
lab66: 	lw	a4,-932(gp) # 1246c <FH_TUERMODUL__POSITION>
	li	a5,404
	bge	a5,a4,lab68
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	li	a4,3
	sb	a4,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	j	lab69
lab68: 	lbu	a5,-800(gp) # 124f0 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
	li	a4,1
	beq	a5,a4,lab70
	li	a4,2
	beq	a5,a4,lab71
	j	lab72
lab70: 	lbu	a5,-862(gp) # 124b2 <FH_TUERMODUL__SFHZ>
	beqz	a5,lab73
	lbu	a5,-860(gp) # 124b4 <FH_TUERMODUL__SFHZ_old>
	beqz	a5,lab74
lab73: 	lbu	a5,-859(gp) # 124b5 <FH_TUERMODUL__SFHA>
	beqz	a5,lab75
	lbu	a5,-857(gp) # 124b7 <FH_TUERMODUL__SFHA_old>
	bnez	a5,lab75
lab74: 	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	li	a4,3
	sb	a4,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-800(gp) # 124f0 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
	j	lab76
lab71: 	lbu	a5,-862(gp) # 124b2 <FH_TUERMODUL__SFHZ>
	beqz	a5,lab77
	lbu	a5,-860(gp) # 124b4 <FH_TUERMODUL__SFHZ_old>
	bnez	a5,lab77
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-800(gp) # 124f0 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
	j	lab76
lab77: 	lbu	a5,-859(gp) # 124b5 <FH_TUERMODUL__SFHA>
	bnez	a5,lab78
	lbu	a5,-857(gp) # 124b7 <FH_TUERMODUL__SFHA_old>
	beqz	a5,lab78
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	li	a4,3
	sb	a4,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-800(gp) # 124f0 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
	j	lab76
lab72: 	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,2
	sb	a4,-800(gp) # 124f0 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
	j	lab76
lab75: 	nop
	j	lab69
lab78: 	nop
lab76: 	j	lab69
lab67: 	lw	a5,-932(gp) # 1246c <FH_TUERMODUL__POSITION>
	bgtz	a5,lab79
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	li	a4,3
	sb	a4,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	j	lab69
lab79: 	lbu	a5,-799(gp) # 124f1 <SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	li	a4,1
	beq	a5,a4,lab80
	li	a4,2
	beq	a5,a4,lab81
	j	lab82
lab80: 	lbu	a5,-859(gp) # 124b5 <FH_TUERMODUL__SFHA>
	beqz	a5,lab83
	lbu	a5,-857(gp) # 124b7 <FH_TUERMODUL__SFHA_old>
	beqz	a5,lab84
lab83: 	lbu	a5,-862(gp) # 124b2 <FH_TUERMODUL__SFHZ>
	beqz	a5,lab85
	lbu	a5,-860(gp) # 124b4 <FH_TUERMODUL__SFHZ_old>
	bnez	a5,lab85
lab84: 	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	li	a4,3
	sb	a4,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	j	lab86
lab85: 	lbu	a5,-802(gp) # 124ee <TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	li	a4,1
	beq	a5,a4,lab87
	li	a4,2
	beq	a5,a4,lab88
	j	lab89
lab87: 	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,23(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,22(a5)
	beqz	a5,lab90
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	sb	zero,-879(gp) # 124a1 <FH_TUERMODUL_CTRL__INREVERS2_copy>
	li	a4,2
	sb	a4,-802(gp) # 124ee <TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,17(a5)
	j	lab91
lab88: 	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,24(a5)
	beqz	a5,lab92
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-879(gp) # 124a1 <FH_TUERMODUL_CTRL__INREVERS2_copy>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,23(a5)
	li	a4,1
	sb	a4,-802(gp) # 124ee <TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,17(a5)
	sb	zero,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	lw	a4,-816(gp) # 124e0 <time>
	sw	a4,-940(gp) # 12464 <sc_FH_TUERMODUL_CTRL_1781_10>
	li	a4,1
	sb	a4,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	j	lab91
lab89: 	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,2
	sb	a4,-802(gp) # 124ee <TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,17(a5)
	j	lab91
lab90: 	nop
	j	lab86
lab92: 	nop
lab91: 	j	lab86
lab81: 	lbu	a5,-862(gp) # 124b2 <FH_TUERMODUL__SFHZ>
	bnez	a5,lab93
	lbu	a5,-860(gp) # 124b4 <FH_TUERMODUL__SFHZ_old>
	beqz	a5,lab93
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	li	a4,3
	sb	a4,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	j	lab86
lab93: 	lbu	a5,-801(gp) # 124ef <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	li	a4,1
	beq	a5,a4,lab94
	li	a4,2
	beq	a5,a4,lab95
	j	lab96
lab94: 	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,23(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,22(a5)
	beqz	a5,lab97
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-877(gp) # 124a3 <FH_TUERMODUL_CTRL__INREVERS1_copy>
	li	a4,2
	sb	a4,-801(gp) # 124ef <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,17(a5)
	li	a4,1
	sb	a4,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	j	lab98
lab95: 	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,24(a5)
	beqz	a5,lab99
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	li	a4,1
	sb	a4,-877(gp) # 124a3 <FH_TUERMODUL_CTRL__INREVERS1_copy>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,23(a5)
	li	a4,1
	sb	a4,-801(gp) # 124ef <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,17(a5)
	lw	a4,-816(gp) # 124e0 <time>
	sw	a4,-936(gp) # 12468 <sc_FH_TUERMODUL_CTRL_1739_10>
	li	a4,1
	sb	a4,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	j	lab98
lab99: 	lbu	a5,-859(gp) # 124b5 <FH_TUERMODUL__SFHA>
	beqz	a5,lab100
	lbu	a5,-857(gp) # 124b7 <FH_TUERMODUL__SFHA_old>
	bnez	a5,lab100
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-799(gp) # 124f1 <SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	sb	zero,-801(gp) # 124ef <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	j	lab98
lab96: 	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,2
	sb	a4,-801(gp) # 124ef <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,17(a5)
	li	a4,1
	sb	a4,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	j	lab98
lab97: 	nop
	j	lab86
lab100: 	nop
lab98: 	j	lab86
lab82: 	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,2
	sb	a4,-799(gp) # 124f1 <SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	li	a4,2
	sb	a4,-801(gp) # 124ef <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,17(a5)
	li	a4,1
	sb	a4,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	nop
lab86: 	j	lab69
lab64: 	lbu	a5,-862(gp) # 124b2 <FH_TUERMODUL__SFHZ>
	beqz	a5,lab101
	lbu	a5,-860(gp) # 124b4 <FH_TUERMODUL__SFHZ_old>
	bnez	a5,lab101
	lw	a5,-932(gp) # 1246c <FH_TUERMODUL__POSITION>
	blez	a5,lab101
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,2
	sb	a4,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	li	a4,2
	sb	a4,-799(gp) # 124f1 <SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	li	a4,2
	sb	a4,-801(gp) # 124ef <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,17(a5)
	li	a4,1
	sb	a4,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	j	lab69
lab101: 	lbu	a5,-859(gp) # 124b5 <FH_TUERMODUL__SFHA>
	beqz	a5,lab102
	lbu	a5,-857(gp) # 124b7 <FH_TUERMODUL__SFHA_old>
	bnez	a5,lab102
	lw	a4,-932(gp) # 1246c <FH_TUERMODUL__POSITION>
	li	a5,404
	blt	a5,a4,lab102
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	li	a4,1
	sb	a4,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	li	a4,2
	sb	a4,-800(gp) # 124f0 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
	j	lab69
lab65: 	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,3
	sb	a4,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	j	lab69
lab102: 	nop
lab69: 	j	lab50
lab46: 	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,2
	sb	a4,-806(gp) # 124ea <B_FH_TUERMODUL_CTRL_next_state>
	j	lab50
lab49: 	nop
lab50: 	lbu	a5,-805(gp) # 124eb <A_FH_TUERMODUL_CTRL_next_state>
	mv	a4,a5
	li	a5,1
	bne	a4,a5,lab103
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,5(a5)
	lbu	a4,-811(gp) # 124e5 <step>
	li	a5,1
	bne	a4,a5,lab104
	lw	a5,-972(gp) # 12444 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL>
	beqz	a5,lab104
	lw	a4,-816(gp) # 124e0 <time>
	lw	a5,-972(gp) # 12444 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL>
	sub	a4,a4,a5
	li	a5,1
	bne	a4,a5,lab104
	lbu	a5,-856(gp) # 124b8 <FH_TUERMODUL__MFHZ>
	bnez	a5,lab105
	lbu	a5,-853(gp) # 124bb <FH_TUERMODUL__MFHA>
	beqz	a5,lab104
lab105: 	sb	zero,-812(gp) # 124e4 <stable>
	lw	a5,-952(gp) # 12458 <FH_TUERMODUL_CTRL__N>
	addi	a4,a5,1
	sw	a4,-952(gp) # 12458 <FH_TUERMODUL_CTRL__N>
	li	a4,1
	sb	a4,-805(gp) # 124eb <A_FH_TUERMODUL_CTRL_next_state>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,5(a5)
	li	a4,1
	sb	a4,-804(gp) # 124ec <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
	j	lab106
lab104: 	lbu	a5,-804(gp) # 124ec <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
	mv	a4,a5
	li	a5,1
	bne	a4,a5,lab107
	lbu	a4,-811(gp) # 124e5 <step>
	li	a5,1
	bne	a4,a5,lab108
	lw	a5,-968(gp) # 12448 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL>
	beqz	a5,lab108
	lw	a4,-816(gp) # 124e0 <time>
	lw	a5,-968(gp) # 12448 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL>
	sub	a4,a4,a5
	li	a5,3
	bne	a4,a5,lab108
	lbu	a5,-856(gp) # 124b8 <FH_TUERMODUL__MFHZ>
	bnez	a5,lab108
	lbu	a5,-853(gp) # 124bb <FH_TUERMODUL__MFHA>
	bnez	a5,lab108
	lw	a5,-952(gp) # 12458 <FH_TUERMODUL_CTRL__N>
	blez	a5,lab108
	sb	zero,-812(gp) # 124e4 <stable>
	lw	a5,-952(gp) # 12458 <FH_TUERMODUL_CTRL__N>
	addi	a4,a5,-1
	sw	a4,-952(gp) # 12458 <FH_TUERMODUL_CTRL__N>
	li	a4,1
	sb	a4,-804(gp) # 124ec <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
	j	lab109
lab107: 	sb	zero,-812(gp) # 124e4 <stable>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,5(a5)
	li	a4,1
	sb	a4,-804(gp) # 124ec <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
	j	lab109
lab108: 	nop
lab109: 	j	lab106
lab103: 	sb	zero,-812(gp) # 124e4 <stable>
	sw	zero,-952(gp) # 12458 <FH_TUERMODUL_CTRL__N>
	li	a4,1
	sb	a4,-805(gp) # 124eb <A_FH_TUERMODUL_CTRL_next_state>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,5(a5)
	li	a4,1
	sb	a4,-804(gp) # 124ec <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
	nop
lab106: 	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a4,4(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	a4,5(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a4,6(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	a4,7(a5)
lab42: 	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
generic_EINKLEMMSCHUTZ_CTRL:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,16(a5)
	beqz	a5,lab110
	lbu	a5,-797(gp) # 124f3 <EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state>
	li	a4,1
	beq	a5,a4,lab111
	li	a4,2
	beq	a5,a4,lab112
	j	lab113
lab111: 	lbu	a5,-850(gp) # 124be <FH_TUERMODUL__EKS_LEISTE_AKTIV>
	beqz	a5,lab114
	lbu	a5,-849(gp) # 124bf <FH_TUERMODUL__EKS_LEISTE_AKTIV_old>
	bnez	a5,lab114
	lbu	a5,-862(gp) # 124b2 <FH_TUERMODUL__SFHZ>
	beqz	a5,lab115
	lbu	a5,-859(gp) # 124b5 <FH_TUERMODUL__SFHA>
	bnez	a5,lab114
lab115: 	sb	zero,-812(gp) # 124e4 <stable>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,24(a5)
	li	a4,2
	sb	a4,-797(gp) # 124f3 <EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state>
	j	lab110
lab112: 	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,24(a5)
	lbu	a5,-850(gp) # 124be <FH_TUERMODUL__EKS_LEISTE_AKTIV>
	bnez	a5,lab116
	lbu	a5,-849(gp) # 124bf <FH_TUERMODUL__EKS_LEISTE_AKTIV_old>
	beqz	a5,lab116
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-797(gp) # 124f3 <EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state>
	j	lab110
lab113: 	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-797(gp) # 124f3 <EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state>
	j	lab110
lab114: 	nop
	j	lab110
lab116: 	nop
lab110: 	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
generic_BLOCK_ERKENNUNG_CTRL:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,19(a5)
	bnez	a5,lab117
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,21(a5)
	beqz	a5,lab117
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,20(a5)
	bnez	a5,lab117
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,0(a5)
lab117: 	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,19(a5)
	beqz	a5,lab118
	lbu	a5,-795(gp) # 124f5 <BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state>
	li	a4,1
	beq	a5,a4,lab119
	li	a4,2
	beq	a5,a4,lab120
	j	lab121
lab119: 	lw	a4,-928(gp) # 12470 <FH_TUERMODUL__I_EIN>
	lw	a5,-924(gp) # 12474 <FH_TUERMODUL__I_EIN_old>
	beq	a4,a5,lab122
	lw	a5,-928(gp) # 12470 <FH_TUERMODUL__I_EIN>
	blez	a5,lab122
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-865(gp) # 124af <FH_TUERMODUL__BLOCK_copy>
	li	a4,2
	sb	a4,-795(gp) # 124f5 <BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state>
	sw	zero,-892(gp) # 12494 <BLOCK_ERKENNUNG_CTRL__N>
	li	a4,2
	sw	a4,-900(gp) # 1248c <BLOCK_ERKENNUNG_CTRL__I_EIN_MAX>
	li	a4,3
	sb	a4,-796(gp) # 124f4 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,0(a5)
	j	lab118
lab120: 	lbu	a5,-853(gp) # 124bb <FH_TUERMODUL__MFHA>
	bnez	a5,lab123
	lbu	a5,-851(gp) # 124bd <FH_TUERMODUL__MFHA_old>
	bnez	a5,lab124
lab123: 	lbu	a5,-856(gp) # 124b8 <FH_TUERMODUL__MFHZ>
	bnez	a5,lab125
	lbu	a5,-854(gp) # 124ba <FH_TUERMODUL__MFHZ_old>
	beqz	a5,lab125
lab124: 	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-795(gp) # 124f5 <BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state>
	sb	zero,-796(gp) # 124f4 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
	j	lab118
lab125: 	lbu	a5,-796(gp) # 124f4 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
	li	a4,3
	beq	a5,a4,lab126
	li	a4,3
	blt	a4,a5,lab127
	li	a4,1
	beq	a5,a4,lab128
	li	a4,2
	bne	a5,a4,lab127
	lw	a5,-900(gp) # 1248c <BLOCK_ERKENNUNG_CTRL__I_EIN_MAX>
	addi	a4,a5,-1
	lw	a5,-928(gp) # 12470 <FH_TUERMODUL__I_EIN>
	blt	a5,a4,lab129
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-865(gp) # 124af <FH_TUERMODUL__BLOCK_copy>
	li	a4,1
	sb	a4,-796(gp) # 124f4 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
	j	lab130
lab126: 	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,0(a5)
	lw	a4,-892(gp) # 12494 <BLOCK_ERKENNUNG_CTRL__N>
	li	a5,11
	bne	a4,a5,lab131
	lw	a4,-884(gp) # 1249c <BLOCK_ERKENNUNG_CTRL__N_old>
	li	a5,11
	beq	a4,a5,lab131
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,2
	sb	a4,-796(gp) # 124f4 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
	j	lab130
lab127: 	sb	zero,-812(gp) # 124e4 <stable>
	sw	zero,-892(gp) # 12494 <BLOCK_ERKENNUNG_CTRL__N>
	li	a4,2
	sw	a4,-900(gp) # 1248c <BLOCK_ERKENNUNG_CTRL__I_EIN_MAX>
	li	a4,3
	sb	a4,-796(gp) # 124f4 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,0(a5)
	j	lab130
lab128: 	nop
	j	lab118
lab129: 	nop
	j	lab118
lab131: 	nop
lab130: 	j	lab118
lab121: 	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,1
	sb	a4,-795(gp) # 124f5 <BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state>
	j	lab118
lab122: 	nop
lab118: 	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
FH_DU:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a4,1
	sw	a4,-816(gp) # 124e0 <time>
	sb	zero,-812(gp) # 124e4 <stable>
	sb	zero,-811(gp) # 124e5 <step>
	j	lab132
lab150: 	sb	a4,-812(gp) # 124e4 <stable>
	lbu	a5,-811(gp) # 124e5 <step>
	addi	a5,a5,1
	zext.b	a4,a5
	sb	a4,-811(gp) # 124e5 <step>
	lbu	a5,-798(gp) # 124f2 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
	li	a4,3
	beq	a5,a4,lab133
	li	a4,3
	blt	a4,a5,lab134
	li	a4,1
	beq	a5,a4,lab135
	li	a4,2
	beq	a5,a4,lab136
	j	lab134
lab135: 	lbu	a5,-824(gp) # 124d8 <FH_DU__MFHZ>
	bnez	a5,lab137
	lbu	a5,-822(gp) # 124da <FH_DU__MFHZ_old>
	beqz	a5,lab137
	sb	zero,-812(gp) # 124e4 <stable>
	sw	zero,-920(gp) # 12478 <FH_DU__MFH>
	li	a4,2
	sb	a4,-798(gp) # 124f2 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
	j	lab138
lab136: 	lbu	a5,-824(gp) # 124d8 <FH_DU__MFHZ>
	beqz	a5,lab139
	lbu	a5,-822(gp) # 124da <FH_DU__MFHZ_old>
	bnez	a5,lab139
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,-100
	sw	a4,-920(gp) # 12478 <FH_DU__MFH>
	li	a4,1
	sb	a4,-798(gp) # 124f2 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
	j	lab138
lab139: 	lbu	a5,-821(gp) # 124db <FH_DU__MFHA>
	beqz	a5,lab140
	lbu	a5,-819(gp) # 124dd <FH_DU__MFHA_old>
	bnez	a5,lab140
	sb	zero,-812(gp) # 124e4 <stable>
	li	a4,100
	sw	a4,-920(gp) # 12478 <FH_DU__MFH>
	li	a4,3
	sb	a4,-798(gp) # 124f2 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
	j	lab138
lab133: 	lbu	a5,-821(gp) # 124db <FH_DU__MFHA>
	bnez	a5,lab141
	lbu	a5,-819(gp) # 124dd <FH_DU__MFHA_old>
	beqz	a5,lab141
	sb	zero,-812(gp) # 124e4 <stable>
	sw	zero,-920(gp) # 12478 <FH_DU__MFH>
	li	a4,2
	sb	a4,-798(gp) # 124f2 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
	j	lab138
lab134: 	sb	zero,-812(gp) # 124e4 <stable>
	sw	zero,-920(gp) # 12478 <FH_DU__MFH>
	li	a4,2
	sb	a4,-798(gp) # 124f2 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
	j	lab138
lab137: 	nop
	j	lab138
lab140: 	nop
	j	lab138
lab141: 	nop
lab138: 	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,10(a5)
	bnez	a5,lab142
	li	a4,3
	sb	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
lab142: 	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,11(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,16(a5)
	bnez	a5,lab143
	li	a4,1
	sb	a4,-797(gp) # 124f3 <EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state>
lab143: 	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,17(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,19(a5)
	bnez	a5,lab144
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,0(a5)
	li	a4,1
	sb	a4,-795(gp) # 124f5 <BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state>
lab144: 	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,20(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a5,13(a5)
	bnez	a5,lab145
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,4(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,6(a5)
	li	a4,2
	sb	a4,-806(gp) # 124ea <B_FH_TUERMODUL_CTRL_next_state>
	sw	zero,-952(gp) # 12458 <FH_TUERMODUL_CTRL__N>
	li	a4,1
	sb	a4,-805(gp) # 124eb <A_FH_TUERMODUL_CTRL_next_state>
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,5(a5)
	li	a4,1
	sb	a4,-804(gp) # 124ec <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
lab145: 	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	zero,14(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,11(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,17(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,20(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	li	a4,1
	sb	a4,14(a5)
	lbu	a4,-837(gp) # 124cb <FH_DU__S_FH_TMBFZUCAN>
	lbu	a5,-835(gp) # 124cd <FH_DU__S_FH_TMBFZUCAN_old>
	beq	a4,a5,lab146
	lbu	a5,-828(gp) # 124d4 <FH_DU__DOOR_ID>
	bnez	a5,lab146
	lbu	a4,-837(gp) # 124cb <FH_DU__S_FH_TMBFZUCAN>
	sb	a4,-845(gp) # 124c3 <FH_DU__S_FH_FTZU>
lab146: 	lbu	a4,-834(gp) # 124ce <FH_DU__S_FH_TMBFZUDISC>
	lbu	a5,-833(gp) # 124cf <FH_DU__S_FH_TMBFZUDISC_old>
	beq	a4,a5,lab147
	lbu	a5,-828(gp) # 124d4 <FH_DU__DOOR_ID>
	beqz	a5,lab147
	lbu	a4,-834(gp) # 124ce <FH_DU__S_FH_TMBFZUDISC>
	sb	a4,-837(gp) # 124cb <FH_DU__S_FH_TMBFZUCAN>
lab147: 	lbu	a4,-840(gp) # 124c8 <FH_DU__S_FH_TMBFAUFCAN>
	lbu	a5,-838(gp) # 124ca <FH_DU__S_FH_TMBFAUFCAN_old>
	beq	a4,a5,lab148
	lbu	a5,-828(gp) # 124d4 <FH_DU__DOOR_ID>
	bnez	a5,lab148
	lbu	a4,-840(gp) # 124c8 <FH_DU__S_FH_TMBFAUFCAN>
	sb	a4,-844(gp) # 124c4 <FH_DU__S_FH_FTAUF>
lab148: 	lbu	a4,-832(gp) # 124d0 <FH_DU__S_FH_TMBFAUFDISC>
	lbu	a5,-831(gp) # 124d1 <FH_DU__S_FH_TMBFAUFDISC_old>
	beq	a4,a5,lab149
	lbu	a5,-828(gp) # 124d4 <FH_DU__DOOR_ID>
	beqz	a5,lab149
	lbu	a4,-832(gp) # 124d0 <FH_DU__S_FH_TMBFAUFDISC>
	sb	a4,-840(gp) # 124c8 <FH_DU__S_FH_TMBFAUFCAN>
lab149: 	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a4,12(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	a4,10(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a4,15(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	a4,13(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a4,18(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	a4,16(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a4,21(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	a4,19(a5)
	lbu	a4,-829(gp) # 124d3 <FH_DU__S_FH_AUFDISC>
	sb	a4,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	lbu	a4,-844(gp) # 124c4 <FH_DU__S_FH_FTAUF>
	sb	a4,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	lbu	a4,-830(gp) # 124d2 <FH_DU__S_FH_ZUDISC>
	sb	a4,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	lbu	a4,-845(gp) # 124c3 <FH_DU__S_FH_FTZU>
	sb	a4,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	jal	ra,generic_KINDERSICHERUNG_CTRL
	lbu	a4,-853(gp) # 124bb <FH_TUERMODUL__MFHA>
	sb	a4,-821(gp) # 124db <FH_DU__MFHA>
	lbu	a4,-856(gp) # 124b8 <FH_TUERMODUL__MFHZ>
	sb	a4,-824(gp) # 124d8 <FH_DU__MFHZ>
	lw	a4,-928(gp) # 12470 <FH_TUERMODUL__I_EIN>
	sw	a4,-908(gp) # 12484 <FH_DU__I_EIN>
	lbu	a4,-850(gp) # 124be <FH_TUERMODUL__EKS_LEISTE_AKTIV>
	sb	a4,-842(gp) # 124c6 <FH_DU__EKS_LEISTE_AKTIV>
	lw	a4,-932(gp) # 1246c <FH_TUERMODUL__POSITION>
	sw	a4,-912(gp) # 12480 <FH_DU__POSITION>
	lbu	a4,-863(gp) # 124b1 <FH_TUERMODUL__FT>
	sb	a4,-843(gp) # 124c5 <FH_DU__FT>
	lbu	a4,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	sb	a4,-829(gp) # 124d3 <FH_DU__S_FH_AUFDISC>
	lbu	a4,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	sb	a4,-844(gp) # 124c4 <FH_DU__S_FH_FTAUF>
	lbu	a4,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	sb	a4,-830(gp) # 124d2 <FH_DU__S_FH_ZUDISC>
	lbu	a4,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	sb	a4,-845(gp) # 124c3 <FH_DU__S_FH_FTZU>
	lbu	a4,-867(gp) # 124ad <FH_TUERMODUL__KL_50>
	sb	a4,-846(gp) # 124c2 <FH_DU__KL_50>
	lbu	a4,-866(gp) # 124ae <FH_TUERMODUL__BLOCK>
	sb	a4,-827(gp) # 124d5 <FH_DU__BLOCK>
	lbu	a4,-829(gp) # 124d3 <FH_DU__S_FH_AUFDISC>
	sb	a4,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	lbu	a4,-844(gp) # 124c4 <FH_DU__S_FH_FTAUF>
	sb	a4,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	lbu	a4,-830(gp) # 124d2 <FH_DU__S_FH_ZUDISC>
	sb	a4,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	lbu	a4,-845(gp) # 124c3 <FH_DU__S_FH_FTZU>
	sb	a4,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	jal	ra,generic_FH_TUERMODUL_CTRL
	lbu	a4,-853(gp) # 124bb <FH_TUERMODUL__MFHA>
	sb	a4,-821(gp) # 124db <FH_DU__MFHA>
	lbu	a4,-856(gp) # 124b8 <FH_TUERMODUL__MFHZ>
	sb	a4,-824(gp) # 124d8 <FH_DU__MFHZ>
	lw	a4,-928(gp) # 12470 <FH_TUERMODUL__I_EIN>
	sw	a4,-908(gp) # 12484 <FH_DU__I_EIN>
	lbu	a4,-850(gp) # 124be <FH_TUERMODUL__EKS_LEISTE_AKTIV>
	sb	a4,-842(gp) # 124c6 <FH_DU__EKS_LEISTE_AKTIV>
	lw	a4,-932(gp) # 1246c <FH_TUERMODUL__POSITION>
	sw	a4,-912(gp) # 12480 <FH_DU__POSITION>
	lbu	a4,-863(gp) # 124b1 <FH_TUERMODUL__FT>
	sb	a4,-843(gp) # 124c5 <FH_DU__FT>
	lbu	a4,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	sb	a4,-829(gp) # 124d3 <FH_DU__S_FH_AUFDISC>
	lbu	a4,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	sb	a4,-844(gp) # 124c4 <FH_DU__S_FH_FTAUF>
	lbu	a4,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	sb	a4,-830(gp) # 124d2 <FH_DU__S_FH_ZUDISC>
	lbu	a4,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	sb	a4,-845(gp) # 124c3 <FH_DU__S_FH_FTZU>
	lbu	a4,-867(gp) # 124ad <FH_TUERMODUL__KL_50>
	sb	a4,-846(gp) # 124c2 <FH_DU__KL_50>
	lbu	a4,-866(gp) # 124ae <FH_TUERMODUL__BLOCK>
	sb	a4,-827(gp) # 124d5 <FH_DU__BLOCK>
	lbu	a4,-829(gp) # 124d3 <FH_DU__S_FH_AUFDISC>
	sb	a4,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	lbu	a4,-844(gp) # 124c4 <FH_DU__S_FH_FTAUF>
	sb	a4,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	lbu	a4,-830(gp) # 124d2 <FH_DU__S_FH_ZUDISC>
	sb	a4,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	lbu	a4,-845(gp) # 124c3 <FH_DU__S_FH_FTZU>
	sb	a4,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	jal	ra,generic_EINKLEMMSCHUTZ_CTRL
	lbu	a4,-853(gp) # 124bb <FH_TUERMODUL__MFHA>
	sb	a4,-821(gp) # 124db <FH_DU__MFHA>
	lbu	a4,-856(gp) # 124b8 <FH_TUERMODUL__MFHZ>
	sb	a4,-824(gp) # 124d8 <FH_DU__MFHZ>
	lw	a4,-928(gp) # 12470 <FH_TUERMODUL__I_EIN>
	sw	a4,-908(gp) # 12484 <FH_DU__I_EIN>
	lbu	a4,-850(gp) # 124be <FH_TUERMODUL__EKS_LEISTE_AKTIV>
	sb	a4,-842(gp) # 124c6 <FH_DU__EKS_LEISTE_AKTIV>
	lw	a4,-932(gp) # 1246c <FH_TUERMODUL__POSITION>
	sw	a4,-912(gp) # 12480 <FH_DU__POSITION>
	lbu	a4,-863(gp) # 124b1 <FH_TUERMODUL__FT>
	sb	a4,-843(gp) # 124c5 <FH_DU__FT>
	lbu	a4,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	sb	a4,-829(gp) # 124d3 <FH_DU__S_FH_AUFDISC>
	lbu	a4,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	sb	a4,-844(gp) # 124c4 <FH_DU__S_FH_FTAUF>
	lbu	a4,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	sb	a4,-830(gp) # 124d2 <FH_DU__S_FH_ZUDISC>
	lbu	a4,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	sb	a4,-845(gp) # 124c3 <FH_DU__S_FH_FTZU>
	lbu	a4,-867(gp) # 124ad <FH_TUERMODUL__KL_50>
	sb	a4,-846(gp) # 124c2 <FH_DU__KL_50>
	lbu	a4,-866(gp) # 124ae <FH_TUERMODUL__BLOCK>
	sb	a4,-827(gp) # 124d5 <FH_DU__BLOCK>
	lbu	a4,-829(gp) # 124d3 <FH_DU__S_FH_AUFDISC>
	sb	a4,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	lbu	a4,-844(gp) # 124c4 <FH_DU__S_FH_FTAUF>
	sb	a4,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	lbu	a4,-830(gp) # 124d2 <FH_DU__S_FH_ZUDISC>
	sb	a4,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	lbu	a4,-845(gp) # 124c3 <FH_DU__S_FH_FTZU>
	sb	a4,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	jal	ra,generic_BLOCK_ERKENNUNG_CTRL
	lbu	a4,-853(gp) # 124bb <FH_TUERMODUL__MFHA>
	sb	a4,-821(gp) # 124db <FH_DU__MFHA>
	lbu	a4,-856(gp) # 124b8 <FH_TUERMODUL__MFHZ>
	sb	a4,-824(gp) # 124d8 <FH_DU__MFHZ>
	lw	a4,-928(gp) # 12470 <FH_TUERMODUL__I_EIN>
	sw	a4,-908(gp) # 12484 <FH_DU__I_EIN>
	lbu	a4,-850(gp) # 124be <FH_TUERMODUL__EKS_LEISTE_AKTIV>
	sb	a4,-842(gp) # 124c6 <FH_DU__EKS_LEISTE_AKTIV>
	lw	a4,-932(gp) # 1246c <FH_TUERMODUL__POSITION>
	sw	a4,-912(gp) # 12480 <FH_DU__POSITION>
	lbu	a4,-863(gp) # 124b1 <FH_TUERMODUL__FT>
	sb	a4,-843(gp) # 124c5 <FH_DU__FT>
	lbu	a4,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	sb	a4,-829(gp) # 124d3 <FH_DU__S_FH_AUFDISC>
	lbu	a4,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	sb	a4,-844(gp) # 124c4 <FH_DU__S_FH_FTAUF>
	lbu	a4,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	sb	a4,-830(gp) # 124d2 <FH_DU__S_FH_ZUDISC>
	lbu	a4,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	sb	a4,-845(gp) # 124c3 <FH_DU__S_FH_FTZU>
	lbu	a4,-867(gp) # 124ad <FH_TUERMODUL__KL_50>
	sb	a4,-846(gp) # 124c2 <FH_DU__KL_50>
	lbu	a4,-866(gp) # 124ae <FH_TUERMODUL__BLOCK>
	sb	a4,-827(gp) # 124d5 <FH_DU__BLOCK>
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a4,10(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	a4,11(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a4,13(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	a4,14(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a4,16(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	a4,17(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	lbu	a4,19(a5)
	addi	a5,gp,-764 # 12514 <Bitlist>
	sb	a4,20(a5)
	lw	a4,-952(gp) # 12458 <FH_TUERMODUL_CTRL__N>
	sw	a4,-944(gp) # 12460 <FH_TUERMODUL_CTRL__N_old>
	lw	a4,-928(gp) # 12470 <FH_TUERMODUL__I_EIN>
	sw	a4,-924(gp) # 12474 <FH_TUERMODUL__I_EIN_old>
	lw	a4,-916(gp) # 1247c <FH_DU__MFH_copy>
	sw	a4,-920(gp) # 12478 <FH_DU__MFH>
	lw	a4,-908(gp) # 12484 <FH_DU__I_EIN>
	sw	a4,-904(gp) # 12488 <FH_DU__I_EIN_old>
	lw	a4,-892(gp) # 12494 <BLOCK_ERKENNUNG_CTRL__N>
	sw	a4,-884(gp) # 1249c <BLOCK_ERKENNUNG_CTRL__N_old>
	lbu	a4,-875(gp) # 124a5 <FH_TUERMODUL__SFHZ_ZENTRAL>
	sb	a4,-874(gp) # 124a6 <FH_TUERMODUL__SFHZ_ZENTRAL_old>
	lbu	a4,-873(gp) # 124a7 <FH_TUERMODUL__SFHZ_MEC>
	sb	a4,-872(gp) # 124a8 <FH_TUERMODUL__SFHZ_MEC_old>
	lbu	a4,-871(gp) # 124a9 <FH_TUERMODUL__SFHA_ZENTRAL>
	sb	a4,-870(gp) # 124aa <FH_TUERMODUL__SFHA_ZENTRAL_old>
	lbu	a4,-869(gp) # 124ab <FH_TUERMODUL__SFHA_MEC>
	sb	a4,-868(gp) # 124ac <FH_TUERMODUL__SFHA_MEC_old>
	lbu	a4,-865(gp) # 124af <FH_TUERMODUL__BLOCK_copy>
	sb	a4,-866(gp) # 124ae <FH_TUERMODUL__BLOCK>
	lbu	a4,-866(gp) # 124ae <FH_TUERMODUL__BLOCK>
	sb	a4,-864(gp) # 124b0 <FH_TUERMODUL__BLOCK_old>
	lbu	a4,-861(gp) # 124b3 <FH_TUERMODUL__SFHZ_copy>
	sb	a4,-862(gp) # 124b2 <FH_TUERMODUL__SFHZ>
	lbu	a4,-862(gp) # 124b2 <FH_TUERMODUL__SFHZ>
	sb	a4,-860(gp) # 124b4 <FH_TUERMODUL__SFHZ_old>
	lbu	a4,-858(gp) # 124b6 <FH_TUERMODUL__SFHA_copy>
	sb	a4,-859(gp) # 124b5 <FH_TUERMODUL__SFHA>
	lbu	a4,-859(gp) # 124b5 <FH_TUERMODUL__SFHA>
	sb	a4,-857(gp) # 124b7 <FH_TUERMODUL__SFHA_old>
	lbu	a4,-855(gp) # 124b9 <FH_TUERMODUL__MFHZ_copy>
	sb	a4,-856(gp) # 124b8 <FH_TUERMODUL__MFHZ>
	lbu	a4,-856(gp) # 124b8 <FH_TUERMODUL__MFHZ>
	sb	a4,-854(gp) # 124ba <FH_TUERMODUL__MFHZ_old>
	lbu	a4,-852(gp) # 124bc <FH_TUERMODUL__MFHA_copy>
	sb	a4,-853(gp) # 124bb <FH_TUERMODUL__MFHA>
	lbu	a4,-853(gp) # 124bb <FH_TUERMODUL__MFHA>
	sb	a4,-851(gp) # 124bd <FH_TUERMODUL__MFHA_old>
	lbu	a4,-850(gp) # 124be <FH_TUERMODUL__EKS_LEISTE_AKTIV>
	sb	a4,-849(gp) # 124bf <FH_TUERMODUL__EKS_LEISTE_AKTIV_old>
	lbu	a4,-842(gp) # 124c6 <FH_DU__EKS_LEISTE_AKTIV>
	sb	a4,-841(gp) # 124c7 <FH_DU__EKS_LEISTE_AKTIV_old>
	lbu	a4,-840(gp) # 124c8 <FH_DU__S_FH_TMBFAUFCAN>
	sb	a4,-838(gp) # 124ca <FH_DU__S_FH_TMBFAUFCAN_old>
	lbu	a4,-837(gp) # 124cb <FH_DU__S_FH_TMBFZUCAN>
	sb	a4,-835(gp) # 124cd <FH_DU__S_FH_TMBFZUCAN_old>
	lbu	a4,-834(gp) # 124ce <FH_DU__S_FH_TMBFZUDISC>
	sb	a4,-833(gp) # 124cf <FH_DU__S_FH_TMBFZUDISC_old>
	lbu	a4,-832(gp) # 124d0 <FH_DU__S_FH_TMBFAUFDISC>
	sb	a4,-831(gp) # 124d1 <FH_DU__S_FH_TMBFAUFDISC_old>
	lbu	a4,-826(gp) # 124d6 <FH_DU__BLOCK_copy>
	sb	a4,-827(gp) # 124d5 <FH_DU__BLOCK>
	lbu	a4,-827(gp) # 124d5 <FH_DU__BLOCK>
	sb	a4,-825(gp) # 124d7 <FH_DU__BLOCK_old>
	lbu	a4,-823(gp) # 124d9 <FH_DU__MFHZ_copy>
	sb	a4,-824(gp) # 124d8 <FH_DU__MFHZ>
	lbu	a4,-824(gp) # 124d8 <FH_DU__MFHZ>
	sb	a4,-822(gp) # 124da <FH_DU__MFHZ_old>
	lbu	a4,-820(gp) # 124dc <FH_DU__MFHA_copy>
	sb	a4,-821(gp) # 124db <FH_DU__MFHA>
	lbu	a4,-821(gp) # 124db <FH_DU__MFHA>
	sb	a4,-819(gp) # 124dd <FH_DU__MFHA_old>
lab132: 	lbu	a5,-812(gp) # 124e4 <stable>
	beqz	a5,lab150
	nop
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0xc36d3
	ret
warm_caches:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a0,-36(s0)
	jal	ra,benchmark_body
	cfed 0xc6c5d
	sw	a0,-20(s0)
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0xd1689
	ret
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a0,1964
	jal	ra,benchmark_body
	cfed 0xe671c
	mv	a5,a0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0x354c6
	ret
benchmark_body:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	j	lab151
lab152: 	li	a1,0
	addi	a0,gp,-764 # 12514 <Bitlist>
	jal	ra,memset
	jal	ra,init
	jal	ra,interface
	jal	ra,FH_DU
	cfed 0x28331
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab151: 	lw	a4,-20(s0)
	lw	a5,-36(s0)
	blt	a4,a5,lab152
	li	a5,0
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x092e9
	ret
initialise_benchmark:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
verify_benchmark:
	addi	sp,sp,-112
	sw	ra,108(sp)
	sw	s0,104(sp)
	addi	s0,sp,112
	sw	a0,-100(s0)
	lui	a5,0x12
	addi	a4,a5,-208 # 11f30 <__errno+0x8>
	addi	a5,s0,-84
	mv	a3,a4
	li	a4,64
	mv	a2,a4
	mv	a1,a3
	mv	a0,a5
	jal	ra,memcpy
	sw	zero,-20(s0)
	j	lab153
lab156: 	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a5,-68(a5)
	beq	a4,a5,lab154
	li	a5,0
	j	lab155
lab154: 	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab153: 	lw	a4,-20(s0)
	li	a5,63
	bge	a5,a4,lab156
	lw	a5,-976(gp) # 12440 <tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy>
	bnez	a5,lab157
	lw	a5,-972(gp) # 12444 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL>
	bnez	a5,lab157
	lw	a5,-968(gp) # 12448 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL>
	bnez	a5,lab157
	lbu	a5,-810(gp) # 124e6 <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
	bnez	a5,lab157
	lbu	a5,-809(gp) # 124e7 <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
	bnez	a5,lab157
	lbu	a5,-808(gp) # 124e8 <MEC_KINDERSICHERUNG_CTRL_next_state>
	bnez	a5,lab157
	lbu	a4,-807(gp) # 124e9 <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
	li	a5,3
	bne	a4,a5,lab157
	lbu	a4,-806(gp) # 124ea <B_FH_TUERMODUL_CTRL_next_state>
	li	a5,2
	bne	a4,a5,lab157
	lbu	a4,-805(gp) # 124eb <A_FH_TUERMODUL_CTRL_next_state>
	li	a5,1
	bne	a4,a5,lab157
	lbu	a4,-804(gp) # 124ec <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
	li	a5,1
	bne	a4,a5,lab157
	lbu	a5,-803(gp) # 124ed <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
	bnez	a5,lab157
	lbu	a5,-802(gp) # 124ee <TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	bnez	a5,lab157
	lbu	a5,-801(gp) # 124ef <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	bnez	a5,lab157
	lbu	a5,-800(gp) # 124f0 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
	bnez	a5,lab157
	lbu	a5,-799(gp) # 124f1 <SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
	bnez	a5,lab157
	lbu	a4,-798(gp) # 124f2 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
	li	a5,2
	bne	a4,a5,lab157
	lbu	a4,-797(gp) # 124f3 <EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state>
	li	a5,1
	bne	a4,a5,lab157
	lbu	a5,-796(gp) # 124f4 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
	bnez	a5,lab157
	lbu	a4,-795(gp) # 124f5 <BLOCK_ERKENNUNG_CTRL_BLOCK_ERKENNUNG_CTRL_next_state>
	li	a5,1
	beq	a4,a5,lab158
lab157: 	li	a5,0
	j	lab155
lab158: 	li	a5,1
lab155: 	mv	a0,a5
	lw	ra,108(sp)
	lw	s0,104(sp)
	addi	sp,sp,112
	cfes 0x4d473
	ret
initialise_board:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a0,0
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
start_trigger:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a0,0
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
stop_trigger:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a0,0
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
main:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	jal	ra,initialise_board
	jal	ra,initialise_benchmark
	li	a0,1
	jal	ra,warm_caches
	cfed 0x2712f
	jal	ra,start_trigger
	jal	ra,benchmark
	cfed 0xb8103
	mv	a5,a0
	sw	a5,-24(s0)
	jal	ra,stop_trigger
	lw	a5,-24(s0)
	mv	a0,a5
	jal	ra,verify_benchmark
	cfed 0x20156
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	seqz	a5,a5
	zext.b	a5,a5
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x56d2c
	ret
__libc_init_array:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s2,0(sp)
	lui	s0,0x12
	lui	s2,0x12
	addi	a5,s0,4 # 12004 <__init_array_start>
	addi	s2,s2,4 # 12004 <__init_array_start>
	sub	s2,s2,a5
	sw	ra,12(sp)
	sw	s1,4(sp)
	srai	s2,s2,0x2
	beqz	s2,lab159
	addi	s0,s0,4
	li	s1,0
lab160: 	addi	s1,s1,1
	addi	s0,s0,4
	jalr	a5
	bne	s2,s1,lab160
lab159: 	lui	s0,0x12
	lui	s2,0x12
	addi	a5,s0,4 # 12004 <__init_array_start>
	addi	s2,s2,12 # 1200c <__do_global_dtors_aux_fini_array_entry>
	sub	s2,s2,a5
	srai	s2,s2,0x2
	beqz	s2,lab161
	addi	s0,s0,4
	li	s1,0
lab162: 	addi	s1,s1,1
	addi	s0,s0,4
	jalr	a5
	bne	s2,s1,lab162
lab161: 	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lw	s2,0(sp)
	addi	sp,sp,16
	cfes 0x01ed5
	ret
memcpy:
	xor	a5,a0,a1
	andi	a5,a5,3
	add	a7,a0,a2
	bnez	a5,lab163
	li	a5,3
	bgeu	a5,a2,lab163
	andi	a5,a0,3
	mv	a4,a0
	bnez	a5,lab164
lab171: 	sub	a3,a2,a4
	li	a5,32
	li	t0,32
	blt	a5,a3,lab165
lab170: 	mv	a5,a4
	bgeu	a4,a2,lab166
lab167: 	addi	a5,a5,4
	addi	a3,a3,4
	sw	a6,-4(a5)
	bltu	a5,a2,lab167
	addi	a5,a2,-1
	sub	a5,a5,a4
	andi	a5,a5,-4
	addi	a5,a5,4
	add	a4,a4,a5
	add	a1,a1,a5
lab166: 	bltu	a4,a7,lab168
lab169: lab163: 	mv	a4,a0
	bgeu	a0,a7,lab169
lab168: 	lbu	a5,0(a1)
	addi	a4,a4,1
	addi	a1,a1,1
	sb	a5,-1(a4)
	bltu	a4,a7,lab168
	ret
lab165: 	lw	a3,4(a1)
	lw	a5,28(a1)
	lw	t6,0(a1)
	lw	t5,8(a1)
	lw	t4,12(a1)
	lw	t3,16(a1)
	lw	t1,20(a1)
	lw	a6,24(a1)
	sw	a3,4(a4)
	lw	a3,32(a1)
	sw	t6,0(a4)
	sw	t5,8(a4)
	sw	t4,12(a4)
	sw	t3,16(a4)
	sw	t1,20(a4)
	sw	a6,24(a4)
	sw	a5,28(a4)
	addi	a4,a4,36
	sub	a5,a2,a4
	sw	a3,-4(a4)
	addi	a1,a1,36
	blt	t0,a5,lab165
	j	lab170
lab164: 	lbu	a3,0(a1)
	addi	a4,a4,1
	andi	a5,a4,3
	sb	a3,-1(a4)
	addi	a1,a1,1
	beqz	a5,lab171
	lbu	a3,0(a1)
	addi	a4,a4,1
	andi	a5,a4,3
	sb	a3,-1(a4)
	addi	a1,a1,1
	bnez	a5,lab164
	j	lab171
memset:
	li	t1,15
	mv	a4,a0
	bgeu	t1,a2,lab172
	andi	a5,a4,15
	bnez	a5,lab173
lab177: lab176: 	andi	a2,a2,15
	add	a3,a3,a4
lab175: 	sw	a1,4(a4)
	sw	a1,8(a4)
	sw	a1,12(a4)
	addi	a4,a4,16
	bltu	a4,a3,lab175
	bnez	a2,lab172
	ret
lab172: 	sub	a3,t1,a2
	slli	a3,a3,0x2
	auipc	t0,0x0
	add	a3,a3,t0
	jr	12(a3)
	sb	a1,14(a4)
	sb	a1,13(a4)
	sb	a1,12(a4)
	sb	a1,11(a4)
	sb	a1,10(a4)
	sb	a1,9(a4)
	sb	a1,8(a4)
	sb	a1,7(a4)
	sb	a1,6(a4)
	sb	a1,5(a4)
	sb	a1,4(a4)
	sb	a1,3(a4)
	sb	a1,2(a4)
	sb	a1,1(a4)
	sb	a1,0(a4)
	ret
lab174: 	zext.b	a1,a1
	slli	a3,a1,0x8
	or	a1,a1,a3
	slli	a3,a1,0x10
	or	a1,a1,a3
	j	lab176
lab173: 	slli	a3,a5,0x2
	auipc	t0,0x0
	add	a3,a3,t0
	mv	t0,ra
	jalr	-96(a3)
	mv	ra,t0
	addi	a5,a5,-16
	sub	a4,a4,a5
	add	a2,a2,a5
	bgeu	t1,a2,lab172
	j	lab177
__call_exitprocs:
	addi	sp,sp,-48
	sw	s4,24(sp)
	lw	s4,-984(gp) # 12438 <_global_impure_ptr>
	sw	s2,32(sp)
	sw	ra,44(sp)
	lw	s2,328(s4)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s3,28(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	beqz	s2,lab178
	mv	s6,a0
	mv	s7,a1
	li	s5,1
	li	s3,-1
lab185: 	addi	s0,s1,-1
	bltz	s0,lab178
	slli	s1,s1,0x2
	add	s1,s2,s1
lab180: 	lw	a5,260(s1)
	beq	a5,s7,lab179
lab182: 	addi	s1,s1,-4
	bne	s0,s3,lab180
lab178: 	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	lw	s8,8(sp)
	addi	sp,sp,48
	cfes 0x039b7
	ret
lab179: 	lw	a5,4(s2)
	lw	a3,4(s1)
	addi	a5,a5,-1
	beq	a5,s0,lab181
	sw	zero,4(s1)
lab188: 	lw	a5,392(s2)
	sll	a4,s5,s0
	lw	s8,4(s2)
	and	a5,a4,a5
	bnez	a5,lab183
	jalr	a3
lab187: 	lw	a5,328(s4)
	bne	a4,s8,lab184
	beq	a5,s2,lab182
lab184: 	beqz	a5,lab178
	mv	s2,a5
	j	lab185
lab183: 	lw	a5,396(s2)
	lw	a1,132(s1)
	and	a4,a4,a5
	bnez	a4,lab186
	mv	a0,s6
	jalr	a3
	j	lab187
lab181: 	sw	s0,4(s2)
	j	lab188
lab186: 	mv	a0,a1
	jalr	a3
	j	lab187
__libc_fini_array:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lui	a5,0x12
	lui	s0,0x12
	addi	a5,a5,12 # 1200c <__do_global_dtors_aux_fini_array_entry>
	addi	s0,s0,16 # 12010 <impure_data>
	sub	s0,s0,a5
	sw	s1,4(sp)
	sw	ra,12(sp)
	srai	s1,s0,0x2
	beqz	s1,lab189
	addi	s0,s0,-4
	add	s0,s0,a5
lab190: 	addi	s1,s1,-1
	addi	s0,s0,-4
	jalr	a5
	cfed 0xc31ee
	bnez	s1,lab190
lab189: 	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	ret
atexit:
	mv	a1,a0
	li	a3,0
	li	a2,0
	li	a0,0
	j	__register_exitproc
__register_exitproc:
	lw	a4,-984(gp) # 12438 <_global_impure_ptr>
	lw	a5,328(a4)
	beqz	a5,lab191
lab195: 	li	a6,31
	blt	a6,a4,lab192
	slli	a6,a4,0x2
	beqz	a0,lab193
	add	t1,a5,a6
	sw	a2,136(t1) # 10208 <interface+0x7c>
	lw	a7,392(a5)
	li	a2,1
	sll	a2,a2,a4
	or	a7,a7,a2
	sw	a7,392(a5)
	sw	a3,264(t1)
	li	a3,2
	beq	a0,a3,lab194
lab193: 	addi	a4,a4,1
	sw	a4,4(a5)
	add	a5,a5,a6
	sw	a1,8(a5)
	li	a0,0
	ret
lab191: 	addi	a5,a4,332
	sw	a5,328(a4)
	j	lab195
lab194: 	lw	a3,396(a5)
	addi	a4,a4,1
	sw	a4,4(a5)
	or	a3,a3,a2
	sw	a3,396(a5)
	add	a5,a5,a6
	sw	a1,8(a5)
	li	a0,0
	ret
lab192: 	li	a0,-1
	ret
_exit:
	li	a7,93
	ecall
	bltz	a0,lab196
lab197: lab196: 	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	sw	ra,12(sp)
	neg	s0,s0
	jal	ra,__errno
	sw	s0,0(a0) # 12000 <__FRAME_END__>
lab198: __errno:
	lw	a0,-980(gp) # 1243c <_impure_ptr>
	ret


	.section .rodata

start_rodata:
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x100
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000


	.data

impure_data:
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x22fc
	.2byte	0x1
	.2byte	0x2364
	.2byte	0x1
	.2byte	0x23cc
	.2byte	0x1
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x1
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x330e
	.2byte	0xabcd
	.2byte	0x1234
	.2byte	0xe66d
	.2byte	0xdeec
	.2byte	0x5
	.4byte	0xb
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000


	.bss

completed.1:
	.4byte	0x0000
	.4byte	0x0000
object.0:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
Bitlist:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
