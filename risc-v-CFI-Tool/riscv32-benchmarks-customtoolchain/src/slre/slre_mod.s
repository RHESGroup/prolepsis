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
	cfed 0x21472
	lw	a0,-920(gp) # 13b50 <_global_impure_ptr>
	lw	a5,60(a0)
	beqz	a5,lab0
	jalr	a5
lab0: 	mv	a0,s0
	jal	ra,_exit
register_fini:
	li	a5,0
	beqz	a5,lab1
	lui	a0,0x12
	addi	a0,a0,1108 # 12454 <__libc_fini_array>
	j	atexit
lab1: 	ret
_start:
	auipc	gp,0x4
	addi	gp,gp,-500 # 13ee8 <__global_pointer$>
	addi	a0,gp,-908 # 13b5c <completed.1>
	addi	a2,gp,-880 # 13b78 <__BSS_END__>
	sub	a2,a2,a0
	li	a1,0
	jal	ra,memset
	auipc	a0,0x2
	addi	a0,a0,952 # 124b0 <atexit>
	beqz	a0,lab2
	auipc	a0,0x2
	addi	a0,a0,848 # 12454 <__libc_fini_array>
	jal	ra,atexit
lab2: 	jal	ra,__libc_init_array
	cfed 0xa0ca2
	lw	a0,0(sp)
	addi	a1,sp,4
	li	a2,0
	jal	ra,main
	cfed 0x76e2a
	j	exit
__do_global_dtors_aux:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lbu	a5,-908(gp) # 13b5c <completed.1>
	sw	ra,12(sp)
	bnez	a5,lab3
	li	a5,0
	beqz	a5,lab4
	lui	a0,0x13
	addi	a0,a0,1752 # 136d8 <__FRAME_END__>
	auipc	ra,0x0
	jalr	zero # 0 <exit-0x10094>
lab4: 	li	a5,1
	sb	a5,-908(gp) # 13b5c <completed.1>
lab3: 	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0x45262
	ret
frame_dummy:
	li	a5,0
	beqz	a5,lab5
	lui	a0,0x13
	addi	a1,gp,-904 # 13b60 <object.0>
	addi	a0,a0,1752 # 136d8 <__FRAME_END__>
	auipc	t1,0x0
	jr	zero # 0 <exit-0x10094>
lab5: 	ret
is_metacharacter:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a4,-916(gp) # 13b54 <metacharacters.0>
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,strchr
	mv	a5,a0
	snez	a5,a5
	zext.b	a5,a5
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0xebd0a
	ret
op_len:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	lbu	a4,0(a5)
	li	a5,92
	bne	a4,a5,lab6
	lw	a5,-20(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	li	a5,120
	beq	a4,a5,lab7
lab6: 	lw	a5,-20(s0)
	lbu	a4,0(a5)
	li	a5,92
	bne	a4,a5,lab8
	li	a5,2
	j	lab9
lab8: 	li	a5,1
	j	lab9
lab7: 	li	a5,4
lab9: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
set_len:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	j	lab10
lab12: 	lw	a4,-36(s0)
	add	a5,a4,a5
	mv	a0,a5
	jal	ra,op_len
	mv	a4,a0
	lw	a5,-20(s0)
	add	a5,a5,a4
	sw	a5,-20(s0)
lab10: 	lw	a4,-20(s0)
	lw	a5,-40(s0)
	bge	a4,a5,lab11
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,93
	bne	a4,a5,lab12
lab11: 	lw	a4,-20(s0)
	lw	a5,-40(s0)
	blt	a5,a4,lab13
	lw	a5,-20(s0)
	addi	a5,a5,1
	j	lab14
lab13: 	li	a5,-1
lab14: 	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x4fe08
	ret
get_op_len:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-20(s0)
	lbu	a4,0(a5)
	li	a5,91
	bne	a4,a5,lab15
	lw	a5,-20(s0)
	addi	a4,a5,1
	lw	a5,-24(s0)
	addi	a5,a5,-1
	mv	a1,a5
	mv	a0,a4
	jal	ra,set_len
	cfed 0x2921e
	mv	a5,a0
	addi	a5,a5,1
	j	lab16
lab15: 	lw	a0,-20(s0)
	jal	ra,op_len
	mv	a5,a0
lab16: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0xab052
	ret
is_quantifier:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	lbu	a4,0(a5)
	li	a5,42
	beq	a4,a5,lab17
	lw	a5,-20(s0)
	lbu	a4,0(a5)
	li	a5,43
	beq	a4,a5,lab17
	lw	a5,-20(s0)
	lbu	a4,0(a5)
	li	a5,63
	bne	a4,a5,lab18
lab17: 	li	a5,1
	j	lab19
lab18: 	li	a5,0
lab19: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
toi:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	addi	a4,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a5,a5,4
	beqz	a5,lab20
	lw	a5,-20(s0)
	addi	a5,a5,-48
	j	lab21
lab20: 	lw	a5,-20(s0)
	addi	a5,a5,-87
lab21: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
hextoi:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	lbu	a5,0(a5)
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	addi	a4,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a4,a5,3
	li	a5,1
	bne	a4,a5,lab22
	lbu	a5,-17(s0)
	addi	a5,a5,32
	j	lab23
lab22: 	lbu	a5,-17(s0)
lab23: 	mv	a0,a5
	jal	ra,toi
	mv	a5,a0
	slli	s1,a5,0x4
	lw	a5,-36(s0)
	addi	a5,a5,1
	lbu	a5,0(a5)
	sb	a5,-18(s0)
	lbu	a5,-18(s0)
	addi	a4,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a4,a5,3
	li	a5,1
	bne	a4,a5,lab24
	lbu	a5,-18(s0)
	addi	a5,a5,32
	j	lab25
lab24: 	lbu	a5,-18(s0)
lab25: 	mv	a0,a5
	jal	ra,toi
	mv	a5,a0
	or	a5,s1,a5
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	cfes 0x14573
	ret
match_op:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	zero,-20(s0)
	lw	a5,-36(s0)
	lbu	a5,0(a5)
	li	a4,124
	beq	a5,a4,lab26
	li	a4,124
	blt	a4,a5,lab27
	li	a4,92
	beq	a5,a4,lab28
	li	a4,92
	blt	a4,a5,lab27
	li	a4,36
	beq	a5,a4,lab29
	li	a4,46
	beq	a5,a4,lab30
	j	lab27
lab28: 	lw	a5,-36(s0)
	addi	a5,a5,1
	lbu	a5,0(a5)
	li	a4,120
	beq	a5,a4,lab31
	li	a4,120
	blt	a4,a5,lab32
	li	a4,115
	beq	a5,a4,lab33
	li	a4,115
	blt	a4,a5,lab32
	li	a4,83
	beq	a5,a4,lab34
	li	a4,100
	beq	a5,a4,lab35
	j	lab32
lab34: 	lw	a5,-40(s0)
	lbu	a5,0(a5)
	addi	a4,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a5,a5,8
	beqz	a5,lab36
	li	a5,-1
	j	lab37
lab36: 	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	lab38
lab33: 	lw	a5,-40(s0)
	lbu	a5,0(a5)
	addi	a4,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a5,a5,8
	bnez	a5,lab39
	li	a5,-1
	j	lab37
lab39: 	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	lab38
lab35: 	lw	a5,-40(s0)
	lbu	a5,0(a5)
	addi	a4,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a5,a5,4
	bnez	a5,lab40
	li	a5,-1
	j	lab37
lab40: 	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	lab38
lab31: 	lw	a5,-36(s0)
	addi	a5,a5,2
	mv	a0,a5
	jal	ra,hextoi
	cfed 0x5d57a
	mv	a4,a0
	lw	a5,-40(s0)
	lbu	a5,0(a5)
	beq	a4,a5,lab41
	li	a5,-1
	j	lab37
lab41: 	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	lab38
lab32: 	lw	a5,-36(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	lw	a5,-40(s0)
	lbu	a5,0(a5)
	beq	a4,a5,lab42
	li	a5,-1
	j	lab37
lab42: 	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	nop
lab38: 	j	lab43
lab26: 	li	a5,-4
	j	lab37
lab29: 	li	a5,-1
	j	lab37
lab30: 	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	lab43
lab27: 	lw	a4,-44(s0)
	lui	a5,0x1
	add	a5,a4,a5
	lw	a5,-1680(a5) # 970 <exit-0xf724>
	andi	a5,a5,1
	beqz	a5,lab44
	lw	a5,-36(s0)
	lbu	a5,0(a5)
	sb	a5,-21(s0)
	lbu	a5,-21(s0)
	addi	a4,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a4,a5,3
	li	a5,1
	bne	a4,a5,lab45
	lbu	a5,-21(s0)
	addi	a4,a5,32
	j	lab46
lab45: 	lbu	a4,-21(s0)
lab46: 	lw	a5,-40(s0)
	lbu	a5,0(a5)
	sb	a5,-22(s0)
	lbu	a5,-22(s0)
	addi	a3,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a3,a5
	lbu	a5,0(a5)
	andi	a3,a5,3
	li	a5,1
	bne	a3,a5,lab47
	lbu	a5,-22(s0)
	addi	a5,a5,32
	j	lab48
lab47: 	lbu	a5,-22(s0)
lab48: 	beq	a4,a5,lab49
	li	a5,-1
	j	lab37
lab44: 	lw	a5,-36(s0)
	lbu	a4,0(a5)
	lw	a5,-40(s0)
	lbu	a5,0(a5)
	beq	a4,a5,lab49
	li	a5,-1
	j	lab37
lab49: 	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	nop
lab43: 	lw	a5,-20(s0)
lab37: 	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x70e56
	ret
match_set:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	sw	a3,-64(s0)
	sw	zero,-20(s0)
	li	a5,-1
	sw	a5,-24(s0)
	lw	a5,-52(s0)
	lbu	a5,0(a5)
	addi	a5,a5,-94
	seqz	a5,a5
	zext.b	a5,a5
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	beqz	a5,lab50
	lw	a5,-52(s0)
	addi	a5,a5,1
	sw	a5,-52(s0)
	lw	a5,-56(s0)
	addi	a5,a5,-1
	sw	a5,-56(s0)
	j	lab50
lab65: 	lw	a4,-52(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,45
	beq	a4,a5,lab51
	lw	a5,-20(s0)
	addi	a5,a5,1
	lw	a4,-52(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,45
	bne	a4,a5,lab51
	lw	a5,-20(s0)
	addi	a5,a5,2
	lw	a4,-52(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,93
	beq	a4,a5,lab51
	lw	a5,-20(s0)
	addi	a5,a5,2
	lw	a4,-52(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	beqz	a5,lab51
	lw	a4,-64(s0)
	lui	a5,0x1
	add	a5,a4,a5
	lw	a5,-1680(a5) # 970 <exit-0xf724>
	beqz	a5,lab52
	lw	a5,-60(s0)
	lbu	a4,0(a5)
	lw	a5,-20(s0)
	lw	a3,-52(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	bltu	a4,a5,lab53
	lw	a5,-60(s0)
	lbu	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,2
	lw	a3,-52(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	bltu	a5,a4,lab53
	li	a5,1
	j	lab54
lab53: 	li	a5,0
	j	lab54
lab52: 	lw	a5,-60(s0)
	lbu	a5,0(a5)
	sw	a5,-32(s0)
	lw	a5,-32(s0)
	addi	a4,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a4,a5,3
	li	a5,1
	bne	a4,a5,lab55
	lw	a5,-32(s0)
	addi	a4,a5,32
	j	lab56
lab55: 	lw	a4,-32(s0)
lab56: 	lw	a5,-20(s0)
	lw	a3,-52(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	addi	a3,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a3,a5
	lbu	a5,0(a5)
	andi	a3,a5,3
	li	a5,1
	bne	a3,a5,lab57
	lw	a5,-36(s0)
	addi	a5,a5,32
	j	lab58
lab57: 	lw	a5,-36(s0)
lab58: 	blt	a4,a5,lab59
	lw	a5,-60(s0)
	lbu	a5,0(a5)
	sw	a5,-40(s0)
	lw	a5,-40(s0)
	addi	a4,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a4,a5,3
	li	a5,1
	bne	a4,a5,lab60
	lw	a5,-40(s0)
	addi	a4,a5,32
	j	lab61
lab60: 	lw	a4,-40(s0)
lab61: 	lw	a5,-20(s0)
	addi	a5,a5,2
	lw	a3,-52(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	sw	a5,-44(s0)
	lw	a5,-44(s0)
	addi	a3,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a3,a5
	lbu	a5,0(a5)
	andi	a3,a5,3
	li	a5,1
	bne	a3,a5,lab62
	lw	a5,-44(s0)
	addi	a5,a5,32
	j	lab63
lab62: 	lw	a5,-44(s0)
lab63: 	blt	a5,a4,lab59
	li	a5,1
	j	lab54
lab59: 	li	a5,0
lab54: 	sw	a5,-24(s0)
	lw	a5,-20(s0)
	addi	a5,a5,3
	sw	a5,-20(s0)
	j	lab50
lab51: 	lw	a5,-20(s0)
	lw	a4,-52(s0)
	add	a5,a4,a5
	lw	a2,-64(s0)
	lw	a1,-60(s0)
	mv	a0,a5
	jal	ra,match_op
	cfed 0x40c97
	sw	a0,-24(s0)
	lw	a5,-20(s0)
	lw	a4,-52(s0)
	add	a5,a4,a5
	mv	a0,a5
	jal	ra,op_len
	mv	a4,a0
	lw	a5,-20(s0)
	add	a5,a5,a4
	sw	a5,-20(s0)
lab50: 	lw	a4,-20(s0)
	lw	a5,-56(s0)
	blt	a5,a4,lab64
	lw	a5,-20(s0)
	lw	a4,-52(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,93
	beq	a4,a5,lab64
	lw	a5,-24(s0)
	blez	a5,lab65
lab64: 	lw	a5,-28(s0)
	bnez	a5,lab66
	lw	a5,-24(s0)
	bgtz	a5,lab67
lab66: 	lw	a5,-28(s0)
	beqz	a5,lab68
	lw	a5,-24(s0)
	bgtz	a5,lab68
lab67: 	li	a5,1
	j	lab69
lab68: 	li	a5,-1
lab69: 	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	cfes 0x18aae
	ret
bar:
	addi	sp,sp,-96
	sw	ra,92(sp)
	sw	s0,88(sp)
	addi	s0,sp,96
	sw	a0,-68(s0)
	sw	a1,-72(s0)
	sw	a2,-76(s0)
	sw	a3,-80(s0)
	sw	a4,-84(s0)
	sw	a5,-88(s0)
	sw	zero,-24(s0)
	lw	a5,-24(s0)
	sw	a5,-20(s0)
	j	lab70
lab111: 	lw	a4,-68(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,40
	bne	a4,a5,lab71
	lw	a5,-88(s0)
	addi	a5,a5,1
	lw	a4,-84(s0)
	slli	a5,a5,0x4
	add	a5,a4,a5
	lw	a5,4(a5)
	addi	a5,a5,2
	j	lab72
lab71: 	lw	a5,-20(s0)
	lw	a4,-68(s0)
	add	a3,a4,a5
	lw	a4,-72(s0)
	lw	a5,-20(s0)
	sub	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,get_op_len
	cfed 0x4dfd4
	mv	a5,a0
lab72: 	sw	a5,-56(s0)
	lw	a5,-20(s0)
	lw	a4,-68(s0)
	add	a5,a4,a5
	mv	a0,a5
	jal	ra,is_quantifier
	mv	a5,a0
	beqz	a5,lab73
	li	a5,-2
	j	lab74
lab73: 	lw	a5,-56(s0)
	bgtz	a5,lab75
	li	a5,-5
	j	lab74
lab75: 	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	lw	a4,-72(s0)
	bge	a5,a4,lab76
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	lw	a4,-68(s0)
	add	a5,a4,a5
	mv	a0,a5
	jal	ra,is_quantifier
	mv	a5,a0
	beqz	a5,lab76
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,-68(s0)
	add	a5,a5,a4
	lbu	a4,0(a5)
	li	a5,63
	bne	a4,a5,lab77
	lw	a5,-20(s0)
	lw	a4,-68(s0)
	add	a0,a4,a5
	lw	a5,-24(s0)
	lw	a4,-76(s0)
	add	a2,a4,a5
	lw	a4,-80(s0)
	lw	a5,-24(s0)
	sub	a3,a4,a5
	lw	a5,-88(s0)
	lw	a4,-84(s0)
	lw	a1,-56(s0)
	jal	ra,bar
	cfed 0x1bcba
	sw	a0,-64(s0)
	lw	a5,-64(s0)
	bgez	a5,lab78
	li	a5,0
lab78: 	lw	a4,-24(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	lab79
lab77: 	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,-68(s0)
	add	a5,a5,a4
	lbu	a4,0(a5)
	li	a5,43
	beq	a4,a5,lab80
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,-68(s0)
	add	a5,a5,a4
	lbu	a4,0(a5)
	li	a5,42
	bne	a4,a5,lab79
lab80: 	lw	a5,-24(s0)
	sw	a5,-32(s0)
	lw	a5,-24(s0)
	sw	a5,-36(s0)
	li	a5,-1
	sw	a5,-40(s0)
	sw	zero,-48(s0)
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	addi	a5,a5,1
	sw	a5,-44(s0)
	lw	a4,-44(s0)
	lw	a5,-72(s0)
	bge	a4,a5,lab81
	lw	a5,-44(s0)
	lw	a4,-68(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,63
	bne	a4,a5,lab81
	li	a5,1
	sw	a5,-48(s0)
	lw	a5,-44(s0)
	addi	a5,a5,1
	sw	a5,-44(s0)
lab81: 	lw	a5,-20(s0)
	lw	a4,-68(s0)
	add	a0,a4,a5
	lw	a5,-32(s0)
	lw	a4,-76(s0)
	add	a2,a4,a5
	lw	a4,-80(s0)
	lw	a5,-32(s0)
	sub	a3,a4,a5
	lw	a5,-88(s0)
	lw	a4,-84(s0)
	lw	a1,-56(s0)
	jal	ra,bar
	cfed 0x5bcba
	sw	a0,-60(s0)
	lw	a5,-60(s0)
	blez	a5,lab82
	lw	a4,-32(s0)
	lw	a5,-60(s0)
	add	a5,a4,a5
	sw	a5,-32(s0)
lab82: 	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,-68(s0)
	add	a5,a5,a4
	lbu	a4,0(a5)
	li	a5,43
	bne	a4,a5,lab83
	lw	a5,-60(s0)
	bltz	a5,lab84
lab83: 	lw	a4,-44(s0)
	lw	a5,-72(s0)
	blt	a4,a5,lab85
	lw	a5,-32(s0)
	sw	a5,-36(s0)
	j	lab86
lab85: 	lw	a5,-44(s0)
	lw	a4,-68(s0)
	add	a0,a4,a5
	lw	a4,-72(s0)
	lw	a5,-44(s0)
	sub	a1,a4,a5
	lw	a5,-32(s0)
	lw	a4,-76(s0)
	add	a2,a4,a5
	lw	a4,-80(s0)
	lw	a5,-32(s0)
	sub	a3,a4,a5
	lw	a5,-88(s0)
	lw	a4,-84(s0)
	jal	ra,bar
	cfed 0x9bcba
	sw	a0,-40(s0)
	lw	a5,-40(s0)
	bltz	a5,lab86
	lw	a4,-32(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	sw	a5,-36(s0)
lab86: 	lw	a4,-36(s0)
	lw	a5,-24(s0)
	bge	a5,a4,lab87
	lw	a5,-48(s0)
	bnez	a5,lab88
lab87: 	lw	a5,-60(s0)
	bgtz	a5,lab81
	j	lab89
lab84: 	nop
	j	lab89
lab88: 	nop
lab89: 	lw	a5,-60(s0)
	bgez	a5,lab90
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,-68(s0)
	add	a5,a5,a4
	lbu	a4,0(a5)
	li	a5,42
	bne	a4,a5,lab90
	lw	a5,-44(s0)
	lw	a4,-68(s0)
	add	a0,a4,a5
	lw	a4,-72(s0)
	lw	a5,-44(s0)
	sub	a1,a4,a5
	lw	a5,-24(s0)
	lw	a4,-76(s0)
	add	a2,a4,a5
	lw	a4,-80(s0)
	lw	a5,-24(s0)
	sub	a3,a4,a5
	lw	a5,-88(s0)
	lw	a4,-84(s0)
	jal	ra,bar
	cfed 0xe6e91
	sw	a0,-40(s0)
	lw	a5,-40(s0)
	blez	a5,lab90
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	sw	a5,-36(s0)
lab90: 	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,-68(s0)
	add	a5,a5,a4
	lbu	a4,0(a5)
	li	a5,43
	bne	a4,a5,lab91
	lw	a4,-36(s0)
	lw	a5,-24(s0)
	bne	a4,a5,lab91
	li	a5,-1
	j	lab74
lab91: 	lw	a4,-36(s0)
	lw	a5,-24(s0)
	bne	a4,a5,lab92
	lw	a4,-44(s0)
	lw	a5,-72(s0)
	bge	a4,a5,lab92
	lw	a5,-40(s0)
	bgez	a5,lab92
	li	a5,-1
	j	lab74
lab92: 	lw	a5,-36(s0)
	j	lab74
lab76: 	lw	a5,-20(s0)
	lw	a4,-68(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,91
	bne	a4,a5,lab93
	lw	a5,-20(s0)
	addi	a5,a5,1
	lw	a4,-68(s0)
	add	a0,a4,a5
	lw	a5,-20(s0)
	addi	a5,a5,2
	lw	a4,-72(s0)
	sub	a1,a4,a5
	lw	a5,-24(s0)
	lw	a4,-76(s0)
	add	a5,a4,a5
	lw	a3,-84(s0)
	mv	a2,a5
	jal	ra,match_set
	cfed 0x1bd9e
	sw	a0,-28(s0)
	lw	a5,-28(s0)
	bgtz	a5,lab94
	li	a5,-1
	j	lab74
lab94: 	lw	a4,-24(s0)
	lw	a5,-28(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	j	lab95
lab93: 	lw	a5,-20(s0)
	lw	a4,-68(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,40
	bne	a4,a5,lab96
	li	a5,-1
	sw	a5,-28(s0)
	lw	a5,-88(s0)
	addi	a5,a5,1
	sw	a5,-88(s0)
	lw	a5,-84(s0)
	lw	a5,1600(a5)
	lw	a4,-88(s0)
	blt	a4,a5,lab97
	li	a5,-4
	j	lab74
lab97: 	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	lw	a4,-72(s0)
	sub	a5,a4,a5
	bgtz	a5,lab98
	lw	a5,-24(s0)
	lw	a4,-76(s0)
	add	a0,a4,a5
	lw	a4,-80(s0)
	lw	a5,-24(s0)
	sub	a5,a4,a5
	lw	a3,-88(s0)
	lw	a2,-84(s0)
	mv	a1,a5
	jal	ra,doh
	cfed 0x9e46d
	sw	a0,-28(s0)
	j	lab99
lab98: 	sw	zero,-52(s0)
	j	lab100
lab103: 	lw	a4,-76(s0)
	add	a0,a4,a5
	lw	a4,-24(s0)
	lw	a5,-52(s0)
	add	a5,a4,a5
	lw	a4,-80(s0)
	sub	a5,a4,a5
	lw	a3,-88(s0)
	lw	a2,-84(s0)
	mv	a1,a5
	jal	ra,doh
	cfed 0xdb004
	sw	a0,-28(s0)
	lw	a5,-28(s0)
	bltz	a5,lab101
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	lw	a4,-68(s0)
	add	a0,a4,a5
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	lw	a4,-72(s0)
	sub	a1,a4,a5
	lw	a4,-24(s0)
	lw	a5,-28(s0)
	add	a5,a4,a5
	lw	a4,-76(s0)
	add	a2,a4,a5
	lw	a4,-24(s0)
	lw	a5,-28(s0)
	add	a5,a4,a5
	lw	a4,-80(s0)
	sub	a3,a4,a5
	lw	a5,-88(s0)
	lw	a4,-84(s0)
	jal	ra,bar
	cfed 0x26e91
	mv	a5,a0
	bgez	a5,lab102
lab101: 	lw	a5,-52(s0)
	addi	a5,a5,1
	sw	a5,-52(s0)
lab100: 	lw	a4,-80(s0)
	lw	a5,-24(s0)
	sub	a5,a4,a5
	lw	a4,-52(s0)
	bge	a5,a4,lab103
	j	lab99
lab102: 	nop
lab99: 	lw	a5,-28(s0)
	bgez	a5,lab104
	lw	a5,-28(s0)
	j	lab74
lab104: 	lw	a4,-84(s0)
	lui	a5,0x1
	add	a5,a4,a5
	lw	a5,-1688(a5) # 968 <exit-0xf72c>
	beqz	a5,lab105
	lw	a4,-24(s0)
	lw	a3,-84(s0)
	lui	a5,0x1
	add	a5,a3,a5
	lw	a3,-1688(a5) # 968 <exit-0xf72c>
	lw	a2,-88(s0)
	lui	a5,0x20000
	addi	a5,a5,-1 # 1fffffff <__global_pointer$+0x1ffec117>
	add	a5,a2,a5
	slli	a5,a5,0x3
	add	a5,a3,a5
	lw	a3,-76(s0)
	add	a4,a3,a4
	sw	a4,0(a5)
	lw	a4,-84(s0)
	lui	a5,0x1
	add	a5,a4,a5
	lw	a4,-1688(a5) # 968 <exit-0xf72c>
	lw	a3,-88(s0)
	lui	a5,0x20000
	addi	a5,a5,-1 # 1fffffff <__global_pointer$+0x1ffec117>
	add	a5,a3,a5
	slli	a5,a5,0x3
	add	a5,a4,a5
	lw	a4,-28(s0)
	sw	a4,4(a5)
lab105: 	lw	a4,-24(s0)
	lw	a5,-28(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	j	lab95
lab96: 	lw	a5,-20(s0)
	lw	a4,-68(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,94
	bne	a4,a5,lab106
	lw	a5,-24(s0)
	beqz	a5,lab95
	li	a5,-1
	j	lab74
lab106: 	lw	a5,-20(s0)
	lw	a4,-68(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,36
	bne	a4,a5,lab107
	lw	a4,-24(s0)
	lw	a5,-80(s0)
	beq	a4,a5,lab95
	li	a5,-1
	j	lab74
lab107: 	lw	a4,-24(s0)
	lw	a5,-80(s0)
	blt	a4,a5,lab108
	li	a5,-1
	j	lab74
lab108: 	lw	a5,-20(s0)
	lw	a4,-68(s0)
	add	a3,a4,a5
	lw	a5,-24(s0)
	lw	a4,-76(s0)
	add	a5,a4,a5
	lw	a2,-84(s0)
	mv	a1,a5
	mv	a0,a3
	jal	ra,match_op
	cfed 0x80c97
	sw	a0,-28(s0)
	lw	a5,-28(s0)
	bgtz	a5,lab109
	lw	a5,-28(s0)
	j	lab74
lab109: 	lw	a4,-24(s0)
	lw	a5,-28(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	j	lab95
lab79: 	nop
lab95: 	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
lab70: 	lw	a4,-20(s0)
	lw	a5,-72(s0)
	bge	a4,a5,lab110
	lw	a4,-24(s0)
	lw	a5,-80(s0)
	bge	a5,a4,lab111
lab110: 	lw	a5,-24(s0)
lab74: 	mv	a0,a5
	lw	ra,92(sp)
	lw	s0,88(sp)
	addi	sp,sp,96
	cfes 0x58b92
	ret
doh:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	sw	a3,-64(s0)
	lw	a5,-64(s0)
	slli	a5,a5,0x4
	lw	a4,-60(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	sw	zero,-20(s0)
lab118: 	bnez	a5,lab112
	lw	a5,-24(s0)
	lw	a5,0(a5)
	j	lab113
lab112: 	lw	a5,-24(s0)
	lw	a4,8(a5)
	lw	a5,-20(s0)
	add	a5,a4,a5
	addi	a5,a5,-1
	lw	a4,-60(s0)
	addi	a5,a5,200
	slli	a5,a5,0x3
	add	a5,a4,a5
	lw	a5,8(a5)
	addi	a5,a5,1
lab113: 	sw	a5,-28(s0)
	lw	a5,-24(s0)
	lw	a5,12(a5)
	bnez	a5,lab114
	lw	a5,-24(s0)
	lw	a5,4(a5)
	j	lab115
lab114: 	lw	a5,-24(s0)
	lw	a5,12(a5)
	lw	a4,-20(s0)
	bne	a4,a5,lab116
	lw	a5,-24(s0)
	lw	a5,0(a5)
	lw	a4,-24(s0)
	lw	a4,4(a4)
	add	a4,a5,a4
	lw	a5,-28(s0)
	sub	a5,a4,a5
	j	lab115
lab116: 	lw	a5,-24(s0)
	lw	a4,8(a5)
	lw	a5,-20(s0)
	add	a5,a4,a5
	lw	a4,-60(s0)
	addi	a5,a5,200
	slli	a5,a5,0x3
	add	a5,a4,a5
	lw	a4,8(a5)
	lw	a5,-28(s0)
	sub	a5,a4,a5
lab115: 	sw	a5,-32(s0)
	lw	a5,-64(s0)
	lw	a4,-60(s0)
	lw	a3,-56(s0)
	lw	a2,-52(s0)
	lw	a1,-32(s0)
	lw	a0,-28(s0)
	jal	ra,bar
	cfed 0x66e91
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	bgtz	a5,lab117
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	lw	a4,-24(s0)
	lw	a4,12(a4)
	blt	a5,a4,lab118
lab117: 	lw	a5,-36(s0)
	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	cfes 0x615b6
	ret
baz:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	li	a5,-1
	sw	a5,-24(s0)
	lw	a5,-44(s0)
	lw	a5,0(a5)
	lbu	a5,0(a5)
	addi	a5,a5,-94
	seqz	a5,a5
	zext.b	a5,a5
	sw	a5,-28(s0)
	sw	zero,-20(s0)
	j	lab119
lab123: 	lw	a4,-36(s0)
	add	a0,a4,a5
	lw	a4,-40(s0)
	lw	a5,-20(s0)
	sub	a5,a4,a5
	li	a3,0
	lw	a2,-44(s0)
	mv	a1,a5
	jal	ra,doh
	cfed 0x1b004
	sw	a0,-24(s0)
	lw	a5,-24(s0)
	bltz	a5,lab120
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	j	lab121
lab120: 	lw	a5,-28(s0)
	bnez	a5,lab122
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab119: 	lw	a4,-20(s0)
	lw	a5,-40(s0)
	bge	a5,a4,lab123
	j	lab121
lab122: 	nop
lab121: 	lw	a5,-24(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x6df88
	ret
setup_branch_points:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	j	lab124
lab128: 	addi	a5,a5,1
	sw	a5,-24(s0)
	j	lab125
lab127: 	lw	a5,-20(s0)
	addi	a5,a5,200
	slli	a5,a5,0x3
	add	a5,a4,a5
	lw	a4,4(a5)
	lw	a3,-36(s0)
	lw	a5,-24(s0)
	addi	a5,a5,200
	slli	a5,a5,0x3
	add	a5,a3,a5
	lw	a5,4(a5)
	bge	a5,a4,lab126
	lw	a4,-36(s0)
	lw	a5,-20(s0)
	addi	a5,a5,200
	slli	a5,a5,0x3
	add	a5,a4,a5
	lw	a4,4(a5)
	sw	a4,-32(s0)
	lw	a5,8(a5)
	sw	a5,-28(s0)
	lw	a4,-36(s0)
	lw	a5,-20(s0)
	addi	a5,a5,200
	slli	a5,a5,0x3
	add	a5,a4,a5
	lw	a3,-36(s0)
	lw	a4,-24(s0)
	addi	a4,a4,200
	slli	a4,a4,0x3
	add	a4,a3,a4
	lw	a3,4(a4)
	sw	a3,4(a5)
	lw	a4,8(a4)
	sw	a4,8(a5)
	lw	a4,-36(s0)
	lw	a5,-24(s0)
	addi	a5,a5,200
	slli	a5,a5,0x3
	add	a5,a4,a5
	lw	a4,-32(s0)
	sw	a4,4(a5)
	lw	a4,-28(s0)
	sw	a4,8(a5)
lab126: 	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
lab125: 	lw	a4,-36(s0)
	lui	a5,0x1
	add	a5,a4,a5
	lw	a5,-1692(a5) # 964 <exit-0xf730>
	lw	a4,-24(s0)
	blt	a4,a5,lab127
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab124: 	lw	a4,-36(s0)
	lui	a5,0x1
	add	a5,a4,a5
	lw	a5,-1692(a5) # 964 <exit-0xf730>
	lw	a4,-20(s0)
	blt	a4,a5,lab128
	sw	zero,-24(s0)
	lw	a5,-24(s0)
	sw	a5,-20(s0)
	j	lab129
lab133: 	lw	a5,-20(s0)
	slli	a5,a5,0x4
	add	a5,a4,a5
	sw	zero,12(a5)
	lw	a4,-36(s0)
	lw	a5,-20(s0)
	slli	a5,a5,0x4
	add	a5,a4,a5
	lw	a4,-24(s0)
	sw	a4,8(a5)
	j	lab130
lab132: 	lw	a5,-20(s0)
	slli	a5,a5,0x4
	add	a5,a4,a5
	lw	a5,12(a5)
	addi	a4,a5,1
	lw	a3,-36(s0)
	lw	a5,-20(s0)
	slli	a5,a5,0x4
	add	a5,a3,a5
	sw	a4,12(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
lab130: 	lw	a4,-36(s0)
	lui	a5,0x1
	add	a5,a4,a5
	lw	a5,-1692(a5) # 964 <exit-0xf730>
	lw	a4,-24(s0)
	bge	a4,a5,lab131
	lw	a4,-36(s0)
	lw	a5,-24(s0)
	addi	a5,a5,200
	slli	a5,a5,0x3
	add	a5,a4,a5
	lw	a5,4(a5)
	lw	a4,-20(s0)
	beq	a4,a5,lab132
lab131: 	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab129: 	lw	a5,-36(s0)
	lw	a5,1600(a5)
	lw	a4,-20(s0)
	blt	a4,a5,lab133
	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	ret
foo:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	sw	a4,-52(s0)
	sw	zero,-24(s0)
	lw	a5,-52(s0)
	lw	a4,-36(s0)
	sw	a4,0(a5)
	lw	a5,-52(s0)
	lw	a4,-40(s0)
	sw	a4,4(a5)
	lw	a5,-52(s0)
	li	a4,1
	sw	a4,1600(a5)
	sw	zero,-20(s0)
	j	lab134
lab151: 	lw	a4,-36(s0)
	add	a3,a4,a5
	lw	a4,-40(s0)
	lw	a5,-20(s0)
	sub	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,get_op_len
	cfed 0x86a9b
	sw	a0,-28(s0)
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,124
	bne	a4,a5,lab135
	lw	a4,-52(s0)
	lui	a5,0x1
	add	a5,a4,a5
	lw	a4,-1692(a5) # 964 <exit-0xf730>
	li	a5,99
	bge	a5,a4,lab136
	li	a5,-8
	j	lab137
lab136: 	lw	a5,-52(s0)
	lw	a5,1600(a5)
	addi	a5,a5,-1
	lw	a4,-52(s0)
	slli	a5,a5,0x4
	add	a5,a4,a5
	lw	a4,4(a5)
	li	a5,-1
	bne	a4,a5,lab138
	lw	a5,-52(s0)
	lw	a5,1600(a5)
	addi	a4,a5,-1
	j	lab139
lab138: 	lw	a4,-24(s0)
lab139: 	lw	a3,-52(s0)
	lui	a5,0x1
	add	a5,a3,a5
	lw	a5,-1692(a5) # 964 <exit-0xf730>
	lw	a3,-52(s0)
	addi	a5,a5,200
	slli	a5,a5,0x3
	add	a5,a3,a5
	sw	a4,4(a5)
	lw	a4,-20(s0)
	lw	a3,-52(s0)
	lui	a5,0x1
	add	a5,a3,a5
	lw	a5,-1692(a5) # 964 <exit-0xf730>
	lw	a3,-36(s0)
	add	a4,a3,a4
	lw	a3,-52(s0)
	addi	a5,a5,200
	slli	a5,a5,0x3
	add	a5,a3,a5
	sw	a4,8(a5)
	lw	a4,-52(s0)
	lui	a5,0x1
	add	a5,a4,a5
	lw	a5,-1692(a5) # 964 <exit-0xf730>
	addi	a4,a5,1
	lw	a3,-52(s0)
	lui	a5,0x1
	add	a5,a3,a5
	sw	a4,-1692(a5) # 964 <exit-0xf730>
	j	lab140
lab135: 	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,92
	bne	a4,a5,lab141
	lw	a5,-40(s0)
	addi	a5,a5,-1
	lw	a4,-20(s0)
	blt	a4,a5,lab142
	li	a5,-6
	j	lab137
lab142: 	lw	a5,-20(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,120
	bne	a4,a5,lab143
	lw	a5,-20(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,120
	bne	a4,a5,lab144
	lw	a5,-40(s0)
	addi	a5,a5,-3
	lw	a4,-20(s0)
	blt	a4,a5,lab144
	li	a5,-6
	j	lab137
lab144: 	lw	a5,-20(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,120
	bne	a4,a5,lab140
	lw	a5,-20(s0)
	addi	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	addi	a4,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a5,a5,68
	beqz	a5,lab145
	lw	a5,-20(s0)
	addi	a5,a5,3
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	addi	a4,a5,1
	lui	a5,0x12
	addi	a5,a5,1492 # 125d4 <_ctype_>
	add	a5,a4,a5
	lbu	a5,0(a5)
	andi	a5,a5,68
	bnez	a5,lab140
lab145: 	li	a5,-6
	j	lab137
lab143: 	lw	a5,-20(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a5,a4,a5
	mv	a0,a5
	jal	ra,is_metacharacter
	cfed 0x04315
	mv	a5,a0
	bnez	a5,lab140
	li	a5,-6
	j	lab137
lab141: 	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,40
	bne	a4,a5,lab146
	lw	a5,-52(s0)
	lw	a4,1600(a5)
	li	a5,99
	bge	a5,a4,lab147
	li	a5,-9
	j	lab137
lab147: 	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	addi	a4,a5,1
	lw	a5,-52(s0)
	lw	a5,1600(a5)
	lw	a3,-36(s0)
	add	a4,a3,a4
	lw	a3,-52(s0)
	slli	a5,a5,0x4
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,-52(s0)
	lw	a5,1600(a5)
	lw	a4,-52(s0)
	slli	a5,a5,0x4
	add	a5,a4,a5
	li	a4,-1
	sw	a4,4(a5)
	lw	a5,-52(s0)
	lw	a5,1600(a5)
	addi	a4,a5,1
	lw	a5,-52(s0)
	sw	a4,1600(a5)
	lw	a4,-52(s0)
	lui	a5,0x1
	add	a5,a4,a5
	lw	a5,-1684(a5) # 96c <exit-0xf728>
	blez	a5,lab140
	lw	a5,-52(s0)
	lw	a5,1600(a5)
	addi	a4,a5,-1
	lw	a3,-52(s0)
	lui	a5,0x1
	add	a5,a3,a5
	lw	a5,-1684(a5) # 96c <exit-0xf728>
	bge	a5,a4,lab140
	li	a5,-7
	j	lab137
lab146: 	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,41
	bne	a4,a5,lab140
	lw	a5,-52(s0)
	lw	a5,1600(a5)
	addi	a5,a5,-1
	lw	a4,-52(s0)
	slli	a5,a5,0x4
	add	a5,a4,a5
	lw	a4,4(a5)
	li	a5,-1
	bne	a4,a5,lab148
	lw	a5,-52(s0)
	lw	a5,1600(a5)
	addi	a5,a5,-1
	j	lab149
lab148: 	lw	a5,-24(s0)
lab149: 	sw	a5,-32(s0)
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a4,a4,a5
	lw	a3,-52(s0)
	lw	a5,-32(s0)
	slli	a5,a5,0x4
	add	a5,a3,a5
	lw	a5,0(a5)
	sub	a4,a4,a5
	lw	a3,-52(s0)
	lw	a5,-32(s0)
	slli	a5,a5,0x4
	add	a5,a3,a5
	sw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	bgez	a5,lab150
	li	a5,-3
	j	lab137
lab150: 	lw	a5,-20(s0)
	blez	a5,lab140
	lw	a5,-20(s0)
	addi	a5,a5,-1
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,40
	bne	a4,a5,lab140
	li	a5,-1
	j	lab137
lab140: 	lw	a4,-20(s0)
	lw	a5,-28(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
lab134: 	lw	a4,-20(s0)
	lw	a5,-40(s0)
	blt	a4,a5,lab151
	lw	a5,-24(s0)
	beqz	a5,lab152
	li	a5,-3
	j	lab137
lab152: 	lw	a0,-52(s0)
	jal	ra,setup_branch_points
	lw	a2,-52(s0)
	lw	a1,-48(s0)
	lw	a0,-44(s0)
	jal	ra,baz
	cfed 0x4e632
	mv	a5,a0
lab137: 	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	cfes 0x94b80
	ret
slre_match:
	addi	sp,sp,-2032
	sw	ra,2028(sp)
	sw	s0,2024(sp)
	addi	s0,sp,2032
	addi	sp,sp,-448
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a5,a5,s0
	sw	a0,1660(a5)
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a5,a5,s0
	sw	a1,1656(a5)
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a5,a5,s0
	sw	a2,1652(a5)
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a5,a5,s0
	sw	a3,1648(a5)
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a5,a5,s0
	sw	a4,1644(a5)
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a4,a5,s0
	lui	a5,0x1
	add	a5,a4,a5
	sw	zero,-16(a5) # ff0 <exit-0xf0a4>
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a4,a5,s0
	lui	a5,0x1
	add	a5,a4,a5
	lw	a4,-16(a5) # ff0 <exit-0xf0a4>
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a3,a5,s0
	lui	a5,0x1
	add	a5,a3,a5
	sw	a4,-820(a5) # ccc <exit-0xf3c8>
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a4,a5,s0
	lui	a5,0x1
	add	a5,a4,a5
	lw	a4,-820(a5) # ccc <exit-0xf3c8>
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a3,a5,s0
	lui	a5,0x1
	add	a5,a3,a5
	sw	a4,-4(a5) # ffc <exit-0xf098>
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a4,a5,s0
	lui	a5,0x1
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a4,a4,s0
	lw	a4,1644(a4)
	sw	a4,-8(a5) # ff8 <exit-0xf09c>
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a4,a5,s0
	lui	a5,0x1
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a4,a4,s0
	lw	a4,1648(a4)
	sw	a4,-12(a5) # ff4 <exit-0xf0a0>
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a5,a5,s0
	li	a2,4
	lui	a4,0x12
	addi	a1,a4,1428 # 12594 <__errno+0x8>
	lw	a0,1660(a5)
	jal	ra,memcmp
	mv	a5,a0
	bnez	a5,lab153
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a4,a5,s0
	lui	a5,0x1
	add	a5,a4,a5
	lw	a5,-4(a5) # ffc <exit-0xf098>
	ori	a4,a5,1
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a3,a5,s0
	lui	a5,0x1
	add	a5,a3,a5
	sw	a4,-4(a5) # ffc <exit-0xf098>
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a4,a4,s0
	lw	a4,1660(a4)
	addi	a4,a4,4
	sw	a4,1660(a5)
lab153: 	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a5,a5,s0
	lw	a0,1660(a5)
	jal	ra,strlen
	mv	a5,a0
	mv	a1,a5
	lui	a5,0xfffff
	addi	a5,a5,1676 # fffff68c <__global_pointer$+0xfffeb7a4>
	addi	a5,a5,-16
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a3,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a2,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__global_pointer$+0xfffeb108>
	add	a5,a5,s0
	lw	a3,1652(a3)
	lw	a2,1656(a2)
	lw	a0,1660(a5)
	jal	ra,foo
	cfed 0x67a3a
	mv	a5,a0
	mv	a0,a5
	addi	sp,sp,448
	lw	ra,2028(sp)
	lw	s0,2024(sp)
	addi	sp,sp,2032
	cfes 0xfb37b
	ret
initialise_benchmark:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
warm_caches:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a0,-36(s0)
	jal	ra,benchmark_body
	cfed 0x0345f
	sw	a0,-20(s0)
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x1e537
	ret
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a0,110
	jal	ra,benchmark_body
	cfed 0x4345f
	mv	a5,a0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0x06590
	ret
benchmark_body:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	zero,-20(s0)
	j	lab154
lab157: 	addi	a0,a5,1768 # 136e8 <text>
	jal	ra,strlen
	mv	a5,a0
	sw	a5,-28(s0)
	sw	zero,-32(s0)
	sw	zero,-24(s0)
	j	lab155
lab156: 	lw	a5,-24(s0)
	slli	a5,a5,0x2
	add	a5,a4,a5
	lw	a0,0(a5)
	addi	a5,s0,-40
	li	a4,1
	mv	a3,a5
	lw	a2,-28(s0)
	lui	a5,0x13
	addi	a1,a5,1768 # 136e8 <text>
	jal	ra,slre_match
	cfed 0x00e8e
	mv	a4,a0
	lw	a5,-32(s0)
	add	a5,a4,a5
	sw	a5,-32(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
lab155: 	lw	a4,-24(s0)
	li	a5,3
	bge	a5,a4,lab156
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab154: 	lw	a4,-20(s0)
	lw	a5,-52(s0)
	blt	a4,a5,lab157
	lw	a5,-32(s0)
	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	cfes 0x38daa
	ret
verify_benchmark:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	addi	a5,a5,-102
	seqz	a5,a5
	zext.b	a5,a5
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
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
	cfed 0xe0da1
	jal	ra,start_trigger
	jal	ra,benchmark
	cfed 0x78d48
	mv	a5,a0
	sw	a5,-24(s0)
	jal	ra,stop_trigger
	lw	a5,-24(s0)
	mv	a0,a5
	jal	ra,verify_benchmark
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	seqz	a5,a5
	zext.b	a5,a5
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x484ae
	ret
__libc_init_array:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s2,0(sp)
	lui	s0,0x13
	lui	s2,0x13
	addi	a5,s0,1756 # 136dc <__init_array_start>
	addi	s2,s2,1756 # 136dc <__init_array_start>
	sub	s2,s2,a5
	sw	ra,12(sp)
	sw	s1,4(sp)
	srai	s2,s2,0x2
	beqz	s2,lab158
	addi	s0,s0,1756
	li	s1,0
lab159: 	addi	s1,s1,1
	addi	s0,s0,4
	jalr	a5
	bne	s2,s1,lab159
lab158: 	lui	s0,0x13
	lui	s2,0x13
	addi	a5,s0,1756 # 136dc <__init_array_start>
	addi	s2,s2,1764 # 136e4 <__do_global_dtors_aux_fini_array_entry>
	sub	s2,s2,a5
	srai	s2,s2,0x2
	beqz	s2,lab160
	addi	s0,s0,1756
	li	s1,0
lab161: 	addi	s1,s1,1
	addi	s0,s0,4
	jalr	a5
	bne	s2,s1,lab161
lab160: 	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lw	s2,0(sp)
	addi	sp,sp,16
	cfes 0x1b567
	ret
memcmp:
	li	a5,3
	bgeu	a5,a2,lab162
	or	a5,a0,a1
	andi	a5,a5,3
	li	a3,3
	bnez	a5,lab163
lab164: 	lw	a5,0(a1)
	bne	a4,a5,lab163
	addi	a2,a2,-4
	addi	a0,a0,4
	addi	a1,a1,4
	bltu	a3,a2,lab164
lab162: 	addi	a3,a2,-1
	beqz	a2,lab165
lab168: 	add	a3,a0,a3
	j	lab166
lab167: lab166: 	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,lab167
	sub	a0,a5,a4
	ret
lab165: 	li	a0,0
	ret
lab163: 	addi	a3,a2,-1
	j	lab168
memset:
	li	t1,15
	mv	a4,a0
	bgeu	t1,a2,lab169
	andi	a5,a4,15
	bnez	a5,lab170
lab174: lab173: 	andi	a2,a2,15
	add	a3,a3,a4
lab172: 	sw	a1,4(a4)
	sw	a1,8(a4)
	sw	a1,12(a4)
	addi	a4,a4,16
	bltu	a4,a3,lab172
	bnez	a2,lab169
	ret
lab169: 	sub	a3,t1,a2
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
lab171: 	zext.b	a1,a1
	slli	a3,a1,0x8
	or	a1,a1,a3
	slli	a3,a1,0x10
	or	a1,a1,a3
	j	lab173
lab170: 	slli	a3,a5,0x2
	auipc	t0,0x0
	add	a3,a3,t0
	mv	t0,ra
	jalr	-96(a3)
	mv	ra,t0
	addi	a5,a5,-16
	sub	a4,a4,a5
	add	a2,a2,a5
	bgeu	t1,a2,lab169
	j	lab174
strchr:
	zext.b	a3,a1
	andi	a5,a0,3
	beqz	a3,lab175
	beqz	a5,lab176
lab179: 	beqz	a5,lab177
	beq	a5,a3,lab178
	addi	a0,a0,1
	andi	a5,a0,3
	bnez	a5,lab179
lab176: 	zext.b	a1,a1
	slli	a5,a1,0x8
	or	a1,a1,a5
	lw	a4,0(a0)
	slli	t1,a1,0x10
	or	t1,t1,a1
	lui	a6,0xfeff0
	xor	a2,t1,a4
	addi	a6,a6,-257 # fefefeff <__global_pointer$+0xfefdc017>
	add	a5,a2,a6
	add	a1,a4,a6
	not	a2,a2
	not	a4,a4
	and	a5,a5,a2
	and	a4,a1,a4
	lui	a7,0x80808
	or	a5,a5,a4
	addi	a7,a7,128 # 80808080 <__global_pointer$+0x807f4198>
	and	a5,a5,a7
	bnez	a5,lab180
lab181: 	addi	a0,a0,4
	xor	a2,a4,t1
	add	a5,a4,a6
	add	a1,a2,a6
	not	a4,a4
	not	a2,a2
	and	a5,a5,a4
	and	a4,a1,a2
	or	a5,a5,a4
	and	a5,a5,a7
	beqz	a5,lab181
lab180: 	lbu	a5,0(a0)
	beqz	a5,lab177
lab183: 	lbu	a5,1(a0)
	addi	a0,a0,1
	bnez	a5,lab183
lab177: 	li	a0,0
lab178: 	ret
lab175: 	beqz	a5,lab184
lab185: 	beqz	a5,lab178
	addi	a0,a0,1
	andi	a5,a0,3
	bnez	a5,lab185
lab184: 	lw	a4,0(a0)
	lui	a2,0xfeff0
	addi	a2,a2,-257 # fefefeff <__global_pointer$+0xfefdc017>
	add	a5,a4,a2
	lui	a3,0x80808
	not	a4,a4
	and	a5,a5,a4
	addi	a3,a3,128 # 80808080 <__global_pointer$+0x807f4198>
	and	a5,a5,a3
	bnez	a5,lab186
lab187: 	addi	a0,a0,4
	add	a5,a4,a2
	not	a4,a4
	and	a5,a5,a4
	and	a5,a5,a3
	beqz	a5,lab187
lab186: 	lbu	a5,0(a0)
	beqz	a5,lab178
lab188: 	addi	a0,a0,1
	bnez	a5,lab188
	ret
lab182: 	ret
strlen:
	andi	a5,a0,3
	mv	a4,a0
	bnez	a5,lab189
lab193: 	addi	a3,a3,-129 # 7f7f7f7f <__global_pointer$+0x7f7e4097>
	li	a1,-1
lab190: 	addi	a4,a4,4
	and	a5,a2,a3
	add	a5,a5,a3
	or	a5,a5,a2
	or	a5,a5,a3
	beq	a5,a1,lab190
	lbu	a3,-4(a4)
	sub	a5,a4,a0
	beqz	a3,lab191
	lbu	a3,-3(a4)
	beqz	a3,lab192
	lbu	a0,-2(a4)
	snez	a0,a0
	add	a0,a0,a5
	addi	a0,a0,-2
	ret
lab194: lab189: 	lbu	a5,0(a4)
	addi	a4,a4,1
	andi	a3,a4,3
	bnez	a5,lab194
	sub	a4,a4,a0
	addi	a0,a4,-1
	ret
lab192: 	addi	a0,a5,-3
	ret
lab191: 	addi	a0,a5,-4
	ret
__call_exitprocs:
	addi	sp,sp,-48
	sw	s4,24(sp)
	lw	s4,-920(gp) # 13b50 <_global_impure_ptr>
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
	beqz	s2,lab195
	mv	s6,a0
	mv	s7,a1
	li	s5,1
	li	s3,-1
lab202: 	addi	s0,s1,-1
	bltz	s0,lab195
	slli	s1,s1,0x2
	add	s1,s2,s1
lab197: 	lw	a5,260(s1)
	beq	a5,s7,lab196
lab199: 	addi	s1,s1,-4
	bne	s0,s3,lab197
lab195: 	lw	ra,44(sp)
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
	cfes 0x1de66
	ret
lab196: 	lw	a5,4(s2)
	lw	a3,4(s1)
	addi	a5,a5,-1
	beq	a5,s0,lab198
	sw	zero,4(s1)
lab205: 	lw	a5,392(s2)
	sll	a4,s5,s0
	lw	s8,4(s2)
	and	a5,a4,a5
	bnez	a5,lab200
	jalr	a3
lab204: 	lw	a5,328(s4)
	bne	a4,s8,lab201
	beq	a5,s2,lab199
lab201: 	beqz	a5,lab195
	mv	s2,a5
	j	lab202
lab200: 	lw	a5,396(s2)
	lw	a1,132(s1)
	and	a4,a4,a5
	bnez	a4,lab203
	mv	a0,s6
	jalr	a3
	j	lab204
lab198: 	sw	s0,4(s2)
	j	lab205
lab203: 	mv	a0,a1
	jalr	a3
	j	lab204
__libc_fini_array:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lui	a5,0x13
	lui	s0,0x13
	addi	a5,a5,1764 # 136e4 <__do_global_dtors_aux_fini_array_entry>
	addi	s0,s0,1768 # 136e8 <text>
	sub	s0,s0,a5
	sw	s1,4(sp)
	sw	ra,12(sp)
	srai	s1,s0,0x2
	beqz	s1,lab206
	addi	s0,s0,-4
	add	s0,s0,a5
lab207: 	addi	s1,s1,-1
	addi	s0,s0,-4
	jalr	a5
	cfed 0x2adbd
	bnez	s1,lab207
lab206: 	lw	ra,12(sp)
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
	lw	a4,-920(gp) # 13b50 <_global_impure_ptr>
	lw	a5,328(a4)
	beqz	a5,lab208
lab212: 	li	a6,31
	blt	a6,a4,lab209
	slli	a6,a4,0x2
	beqz	a0,lab210
	add	t1,a5,a6
	sw	a2,136(t1) # 10208 <op_len+0x30>
	lw	a7,392(a5)
	li	a2,1
	sll	a2,a2,a4
	or	a7,a7,a2
	sw	a7,392(a5)
	sw	a3,264(t1)
	li	a3,2
	beq	a0,a3,lab211
lab210: 	addi	a4,a4,1
	sw	a4,4(a5)
	add	a5,a5,a6
	sw	a1,8(a5)
	li	a0,0
	ret
lab208: 	addi	a5,a4,332
	sw	a5,328(a4)
	j	lab212
lab211: 	lw	a3,396(a5)
	addi	a4,a4,1
	sw	a4,4(a5)
	or	a3,a3,a2
	sw	a3,396(a5)
	add	a5,a5,a6
	sw	a1,8(a5)
	li	a0,0
	ret
lab209: 	li	a0,-1
	ret
_exit:
	li	a7,93
	ecall
	bltz	a0,lab213
lab214: lab213: 	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	sw	ra,12(sp)
	neg	s0,s0
	jal	ra,__errno
	sw	s0,0(a0)
lab215: __errno:
	lw	a0,-912(gp) # 13b58 <_impure_ptr>
	ret


	.section .rodata

_ctype__40:
	.2byte	0x3f28
	.2byte	0x2969
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x6128
	.2byte	0x2962
	.4byte	0x2b
	.2byte	0x6228
	.2byte	0x2b2e
	.2byte	0x2b29
	.4byte	0x0000
	.2byte	0x5b61
	.2byte	0x6261
	.2byte	0x2a5d
	.4byte	0x0000
	.2byte	0x5b28
	.2byte	0x6261
	.2byte	0x635e
	.2byte	0x5b5d
	.2byte	0x6261
	.2byte	0x635e
	.2byte	0x295d
	.4byte	0x245e002b
	.2byte	0x2928
	.2byte	0x5b2e
	.2byte	0x2a5d
	.4byte	0x5c7c3f2b
	.4byte	0x647353
_ctype_:
	.2byte	0x2000
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x2828
	.2byte	0x2828
	.2byte	0x2028
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x8820
	.2byte	0x1010
	.2byte	0x1010
	.2byte	0x1010
	.2byte	0x1010
	.2byte	0x1010
	.2byte	0x1010
	.2byte	0x1010
	.2byte	0x410
	.2byte	0x404
	.2byte	0x404
	.2byte	0x404
	.2byte	0x404
	.2byte	0x1004
	.2byte	0x1010
	.2byte	0x1010
	.2byte	0x1010
	.2byte	0x4141
	.2byte	0x4141
	.2byte	0x4141
	.2byte	0x101
	.2byte	0x101
	.2byte	0x101
	.2byte	0x101
	.2byte	0x101
	.2byte	0x101
	.2byte	0x101
	.2byte	0x101
	.2byte	0x101
	.2byte	0x101
	.2byte	0x1010
	.2byte	0x1010
	.2byte	0x1010
	.2byte	0x4242
	.2byte	0x4242
	.2byte	0x4242
	.2byte	0x202
	.2byte	0x202
	.2byte	0x202
	.2byte	0x202
	.2byte	0x202
	.2byte	0x202
	.2byte	0x202
	.2byte	0x202
	.2byte	0x202
	.2byte	0x202
	.2byte	0x1010
	.2byte	0x1010
	.2byte	0x20
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x00


	.data

text:
	.2byte	0x6261
	.2byte	0x6262
	.2byte	0x6261
	.2byte	0x6261
	.2byte	0x6161
	.2byte	0x6362
	.4byte	0x61626163
	.2byte	0x6362
	.2byte	0x6361
	.2byte	0x6362
	.2byte	0x6362
	.2byte	0x6162
	.2byte	0x6262
	.2byte	0x6261
	.4byte	0x62616263
	.4byte	0x63626163
	.2byte	0x6262
	.4byte	0x61626263
	.4byte	0x00000063
regexes:
	.2byte	0x259c
	.2byte	0x1
	.2byte	0x25a4
	.2byte	0x1
	.2byte	0x25ac
	.2byte	0x1
	.2byte	0x25b4
	.2byte	0x1
impure_data:
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x3a14
	.2byte	0x1
	.2byte	0x3a7c
	.2byte	0x1
	.2byte	0x3ae4
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
