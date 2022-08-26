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
	cfed 0x195d6
	lw	a0,-984(gp) # 17438 <_global_impure_ptr>
	lw	a5,60(a0)
	beqz	a5,lab0
	jalr	a5
lab0: 	mv	a0,s0
	jal	ra,_exit
register_fini:
	li	a5,0
	beqz	a5,lab1
	lui	a0,0x16
	addi	a0,a0,-152 # 15f68 <__libc_fini_array>
	j	atexit
lab1: 	ret
_start:
	auipc	gp,0x7
	addi	gp,gp,1844 # 17810 <__global_pointer$>
	addi	a0,gp,-976 # 17440 <spectral_start>
	addi	a2,gp,1472 # 17dd0 <__BSS_END__>
	sub	a2,a2,a0
	li	a1,0
	jal	ra,memset
	auipc	a0,0x6
	addi	a0,a0,-308 # 15fc4 <atexit>
	beqz	a0,lab2
	auipc	a0,0x6
	addi	a0,a0,-412 # 15f68 <__libc_fini_array>
	jal	ra,atexit
lab2: 	jal	ra,__libc_init_array
	cfed 0x08ff8
	lw	a0,0(sp)
	addi	a1,sp,4
	li	a2,0
	jal	ra,main
	cfed 0x3e731
	j	exit
__do_global_dtors_aux:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lbu	a5,-968(gp) # 17448 <completed.1>
	sw	ra,12(sp)
	bnez	a5,lab3
	li	a5,0
	beqz	a5,lab4
	lui	a0,0x17
	mv	a0,a0
	auipc	ra,0x0
	jalr	zero # 0 <exit-0x10094>
lab4: 	li	a5,1
	sb	a5,-968(gp) # 17448 <completed.1>
lab3: 	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0xfc56c
	ret
frame_dummy:
	li	a5,0
	beqz	a5,lab5
	lui	a0,0x17
	addi	a1,gp,-964 # 1744c <object.0>
	mv	a0,a0
	auipc	t1,0x0
	jr	zero # 0 <exit-0x10094>
lab5: 	ret
fillInBuf:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a4,4
	sb	a4,1344(gp) # 17d50 <gInBufOfs>
	sb	zero,1345(gp) # 17d51 <gInBufLeft>
	lw	a6,1416(gp) # 17d98 <g_pNeedBytesCallback>
	lbu	a5,1344(gp) # 17d50 <gInBufOfs>
	mv	a4,a5
	addi	a5,gp,1088 # 17c50 <gInBuf>
	add	a4,a4,a5
	lbu	a5,1344(gp) # 17d50 <gInBufOfs>
	neg	a5,a5
	zext.b	a1,a5
	lw	a5,1420(gp) # 17d9c <g_pCallback_data>
	mv	a3,a5
	addi	a2,gp,1345 # 17d51 <gInBufLeft>
	mv	a0,a4
	jalr	a6
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	beqz	a5,lab6
	lbu	a4,-17(s0)
	sb	a4,1424(gp) # 17da0 <gCallbackStatus>
lab6: 	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x4cf98
	ret
getChar:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lbu	a5,1345(gp) # 17d51 <gInBufLeft>
	bnez	a5,lab7
	jal	ra,fillInBuf
	cfed 0x1c34e
	lbu	a5,1345(gp) # 17d51 <gInBufLeft>
	bnez	a5,lab7
	lbu	a5,1086(gp) # 17c4e <gTemFlag>
	not	a5,a5
	zext.b	a4,a5
	sb	a4,1086(gp) # 17c4e <gTemFlag>
	lbu	a5,1086(gp) # 17c4e <gTemFlag>
	beqz	a5,lab8
	li	a5,255
	j	lab9
lab8: 	li	a5,217
	j	lab9
lab7: 	lbu	a5,1345(gp) # 17d51 <gInBufLeft>
	addi	a5,a5,-1
	zext.b	a4,a5
	sb	a4,1345(gp) # 17d51 <gInBufLeft>
	lbu	a5,1344(gp) # 17d50 <gInBufOfs>
	addi	a4,a5,1
	zext.b	a3,a4
	sb	a3,1344(gp) # 17d50 <gInBufOfs>
	mv	a4,a5
	addi	a5,gp,1088 # 17c50 <gInBuf>
	add	a5,a5,a4
	lbu	a5,0(a5)
lab9: 	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0x2e6c8
	ret
stuffChar:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,1344(gp) # 17d50 <gInBufOfs>
	addi	a5,a5,-1
	zext.b	a4,a5
	sb	a4,1344(gp) # 17d50 <gInBufOfs>
	lbu	a5,1344(gp) # 17d50 <gInBufOfs>
	mv	a4,a5
	addi	a5,gp,1088 # 17c50 <gInBuf>
	add	a5,a5,a4
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	lbu	a5,1345(gp) # 17d51 <gInBufLeft>
	addi	a5,a5,1
	zext.b	a4,a5
	sb	a4,1345(gp) # 17d51 <gInBufLeft>
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
getOctet:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	sb	a5,-33(s0)
	jal	ra,getChar
	cfed 0xbac1e
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-33(s0)
	beqz	a5,lab10
	lbu	a4,-17(s0)
	li	a5,255
	bne	a4,a5,lab10
	jal	ra,getChar
	cfed 0x10425
	mv	a5,a0
	sb	a5,-18(s0)
	lbu	a5,-18(s0)
	beqz	a5,lab10
	lbu	a5,-18(s0)
	mv	a0,a5
	jal	ra,stuffChar
	li	a0,255
	jal	ra,stuffChar
lab10: 	lbu	a5,-17(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x2f2e6
	ret
getBits:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	mv	a4,a1
	sb	a5,-33(s0)
	mv	a5,a4
	sb	a5,-34(s0)
	lbu	a5,-33(s0)
	sb	a5,-19(s0)
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	sh	a5,-18(s0)
	lbu	a4,-33(s0)
	li	a5,8
	bgeu	a5,a4,lab11
	lbu	a5,-33(s0)
	addi	a5,a5,-8
	sb	a5,-33(s0)
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	mv	a4,a5
	lbu	a5,1348(gp) # 17d54 <gBitsLeft>
	sll	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1346(gp) # 17d52 <gBitBuf>
	lbu	a5,-34(s0)
	mv	a0,a5
	jal	ra,getOctet
	cfed 0xcf807
	mv	a5,a0
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	or	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1346(gp) # 17d52 <gBitBuf>
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	mv	a4,a5
	lbu	a5,1348(gp) # 17d54 <gBitsLeft>
	mv	a3,a5
	li	a5,8
	sub	a5,a5,a3
	sll	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1346(gp) # 17d52 <gBitBuf>
	lh	a5,-18(s0)
	andi	a5,a5,-256
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	or	a5,a4,a5
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	sh	a5,-18(s0)
lab11: 	lbu	a5,1348(gp) # 17d54 <gBitsLeft>
	lbu	a4,-33(s0)
	bgeu	a5,a4,lab12
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	mv	a4,a5
	lbu	a5,1348(gp) # 17d54 <gBitsLeft>
	sll	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1346(gp) # 17d52 <gBitBuf>
	lbu	a5,-34(s0)
	mv	a0,a5
	jal	ra,getOctet
	cfed 0xf0606
	mv	a5,a0
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	or	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1346(gp) # 17d52 <gBitBuf>
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	mv	a3,a5
	lbu	a5,-33(s0)
	lbu	a4,1348(gp) # 17d54 <gBitsLeft>
	sub	a5,a5,a4
	sll	a5,a3,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1346(gp) # 17d52 <gBitBuf>
	lbu	a5,1348(gp) # 17d54 <gBitsLeft>
	lbu	a4,-33(s0)
	sub	a5,a5,a4
	zext.b	a5,a5
	addi	a5,a5,8
	zext.b	a4,a5
	sb	a4,1348(gp) # 17d54 <gBitsLeft>
	j	lab13
lab12: 	lbu	a5,1348(gp) # 17d54 <gBitsLeft>
	lbu	a4,-33(s0)
	sub	a5,a5,a4
	zext.b	a4,a5
	sb	a4,1348(gp) # 17d54 <gBitsLeft>
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	mv	a4,a5
	lbu	a5,-33(s0)
	sll	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1346(gp) # 17d52 <gBitBuf>
lab13: 	lhu	a4,-18(s0)
	lbu	a5,-19(s0)
	li	a3,16
	sub	a5,a3,a5
	sra	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x57f0e
	ret
getBits1:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	li	a1,0
	mv	a0,a5
	jal	ra,getBits
	cfed 0x079de
	mv	a5,a0
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x272ea
	ret
getBits2:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	li	a1,1
	mv	a0,a5
	jal	ra,getBits
	cfed 0x279de
	mv	a5,a0
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x00fae
	ret
getBit:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sb	zero,-17(s0)
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	bgez	a5,lab14
	li	a5,1
	sb	a5,-17(s0)
lab14: 	lbu	a5,1348(gp) # 17d54 <gBitsLeft>
	bnez	a5,lab15
	li	a0,1
	jal	ra,getOctet
	cfed 0x10606
	mv	a5,a0
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	or	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1346(gp) # 17d52 <gBitBuf>
	lbu	a5,1348(gp) # 17d54 <gBitsLeft>
	addi	a5,a5,8
	zext.b	a4,a5
	sb	a4,1348(gp) # 17d54 <gBitsLeft>
lab15: 	lbu	a5,1348(gp) # 17d54 <gBitsLeft>
	addi	a5,a5,-1
	zext.b	a4,a5
	sb	a4,1348(gp) # 17d54 <gBitsLeft>
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	slli	a5,a5,0x1
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1346(gp) # 17d52 <gBitBuf>
	lbu	a5,-17(s0)
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x30eed
	ret
getExtendTest:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	li	a4,15
	bltu	a4,a5,lab16
	slli	a4,a5,0x2
	lui	a5,0x16
	addi	a5,a5,232 # 160e8 <ZAG+0x40>
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	li	a5,0
	j	lab17
	li	a5,1
	j	lab17
	li	a5,2
	j	lab17
	li	a5,4
	j	lab17
	li	a5,8
	j	lab17
	li	a5,16
	j	lab17
	li	a5,32
	j	lab17
	li	a5,64
	j	lab17
	li	a5,128
	j	lab17
	li	a5,256
	j	lab17
	li	a5,512
	j	lab17
	li	a5,1024
	j	lab17
	lui	a5,0x1
	addi	a5,a5,-2048 # 800 <exit-0xf894>
	j	lab17
	lui	a5,0x1
	j	lab17
	lui	a5,0x2
	j	lab17
	lui	a5,0x4
	j	lab17
lab16: 	li	a5,0
lab17: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
getExtendOffset:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	li	a4,15
	bltu	a4,a5,lab18
	slli	a4,a5,0x2
	lui	a5,0x16
	addi	a5,a5,296 # 16128 <ZAG+0x80>
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	li	a5,0
	j	lab19
	li	a5,-1
	j	lab19
	li	a5,-3
	j	lab19
	li	a5,-7
	j	lab19
	li	a5,-15
	j	lab19
	li	a5,-31
	j	lab19
	li	a5,-63
	j	lab19
	li	a5,-127
	j	lab19
	li	a5,-255
	j	lab19
	li	a5,-511
	j	lab19
	li	a5,-1023
	j	lab19
	li	a5,-2047
	j	lab19
	lui	a5,0xfffff
	addi	a5,a5,1 # fffff001 <__BSS_END__+0xfffe7231>
	j	lab19
	lui	a5,0xffffe
	addi	a5,a5,1 # ffffe001 <__BSS_END__+0xfffe6231>
	j	lab19
	lui	a5,0xffffc
	addi	a5,a5,1 # ffffc001 <__BSS_END__+0xfffe4231>
	j	lab19
	lui	a5,0xffff8
	addi	a5,a5,1 # ffff8001 <__BSS_END__+0xfffe0231>
	j	lab19
lab18: 	li	a5,0
lab19: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
huffExtend:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	mv	a5,a0
	mv	a4,a1
	sh	a5,-18(s0)
	mv	a5,a4
	sb	a5,-19(s0)
	lbu	a5,-19(s0)
	mv	a0,a5
	jal	ra,getExtendTest
	mv	a5,a0
	mv	a4,a5
	lhu	a5,-18(s0)
	bgeu	a5,a4,lab20
	lbu	a5,-19(s0)
	mv	a0,a5
	jal	ra,getExtendOffset
	mv	a5,a0
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	lhu	a4,-18(s0)
	add	a5,a5,a4
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	j	lab21
lab20: 	lh	a5,-18(s0)
lab21: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x404d9
	ret
huffDecode:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sb	zero,-17(s0)
	jal	ra,getBit
	cfed 0x1659c
	mv	a5,a0
	sh	a5,-20(s0)
lab26: 	li	a5,16
	bne	a4,a5,lab22
	li	a5,0
	j	lab23
lab22: 	lbu	a5,-17(s0)
	lw	a4,-36(s0)
	addi	a5,a5,16
	slli	a5,a5,0x1
	add	a5,a4,a5
	lhu	a5,0(a5)
	sh	a5,-22(s0)
	lhu	a4,-20(s0)
	lhu	a5,-22(s0)
	bltu	a5,a4,lab24
	lhu	a4,-22(s0)
	lui	a5,0x10
	addi	a5,a5,-1 # ffff <exit-0x95>
	bne	a4,a5,lab25
lab24: 	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
	lhu	a5,-20(s0)
	slli	a5,a5,0x1
	sh	a5,-20(s0)
	jal	ra,getBit
	cfed 0x1e59c
	mv	a5,a0
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	lhu	a4,-20(s0)
	or	a5,a5,a4
	sh	a5,-20(s0)
	j	lab26
lab25: 	nop
	lbu	a5,-17(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,64(a5)
	sb	a5,-23(s0)
	lhu	a5,-20(s0)
	zext.b	a4,a5
	lbu	a5,-17(s0)
	lw	a3,-36(s0)
	slli	a5,a5,0x1
	add	a5,a3,a5
	lhu	a5,0(a5)
	zext.b	a5,a5
	sub	a5,a4,a5
	zext.b	a5,a5
	lbu	a4,-23(s0)
	add	a5,a5,a4
	sb	a5,-23(s0)
	lbu	a5,-23(s0)
	lw	a4,-40(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
lab23: 	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x45e92
	ret
huffCreate:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sb	zero,-17(s0)
	sb	zero,-18(s0)
	sh	zero,-20(s0)
lab30: 	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-21(s0)
	lbu	a5,-21(s0)
	bnez	a5,lab27
	lbu	a5,-17(s0)
	lw	a4,-40(s0)
	slli	a5,a5,0x1
	add	a5,a4,a5
	sh	zero,0(a5)
	lbu	a5,-17(s0)
	lw	a4,-40(s0)
	addi	a5,a5,16
	slli	a5,a5,0x1
	add	a5,a4,a5
	li	a4,-1
	sh	a4,0(a5)
	lbu	a5,-17(s0)
	lw	a4,-40(s0)
	add	a5,a4,a5
	sb	zero,64(a5)
	j	lab28
lab27: 	lbu	a5,-17(s0)
	lw	a4,-40(s0)
	slli	a5,a5,0x1
	add	a5,a4,a5
	lhu	a4,-20(s0)
	sh	a4,0(a5)
	lbu	a5,-21(s0)
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	lhu	a4,-20(s0)
	add	a5,a5,a4
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a5,-17(s0)
	addi	a4,a4,-1
	slli	a4,a4,0x10
	srli	a4,a4,0x10
	lw	a3,-40(s0)
	addi	a5,a5,16
	slli	a5,a5,0x1
	add	a5,a3,a5
	sh	a4,0(a5)
	lbu	a5,-17(s0)
	lw	a4,-40(s0)
	add	a5,a4,a5
	lbu	a4,-18(s0)
	sb	a4,64(a5)
	lbu	a5,-18(s0)
	mv	a4,a5
	lbu	a5,-21(s0)
	add	a5,a4,a5
	sb	a5,-18(s0)
	lbu	a5,-21(s0)
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	lhu	a4,-20(s0)
	add	a5,a5,a4
	sh	a5,-20(s0)
lab28: 	lhu	a5,-20(s0)
	slli	a5,a5,0x1
	sh	a5,-20(s0)
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
	lbu	a4,-17(s0)
	li	a5,15
	bltu	a5,a4,lab29
	j	lab30
lab29: 	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	ret
getHuffTable:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	li	a4,3
	beq	a5,a4,lab31
	li	a4,3
	blt	a4,a5,lab32
	li	a4,2
	beq	a5,a4,lab33
	li	a4,2
	blt	a4,a5,lab32
	beqz	a5,lab34
	li	a4,1
	beq	a5,a4,lab35
	j	lab32
lab34: 	addi	a5,gp,220 # 178ec <gHuffTab0>
	j	lab36
lab35: 	addi	a5,gp,316 # 1794c <gHuffTab1>
	j	lab36
lab33: 	addi	a5,gp,412 # 179ac <gHuffTab2>
	j	lab36
lab31: 	addi	a5,gp,748 # 17afc <gHuffTab3>
	j	lab36
lab32: 	li	a5,0
lab36: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
getHuffVal:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	li	a4,3
	beq	a5,a4,lab37
	li	a4,3
	blt	a4,a5,lab38
	li	a4,2
	beq	a5,a4,lab39
	li	a4,2
	blt	a4,a5,lab38
	beqz	a5,lab40
	li	a4,1
	beq	a5,a4,lab41
	j	lab38
lab40: 	addi	a5,gp,300 # 1793c <gHuffVal0>
	j	lab42
lab41: 	addi	a5,gp,396 # 1799c <gHuffVal1>
	j	lab42
lab39: 	addi	a5,gp,492 # 179fc <gHuffVal2>
	j	lab42
lab37: 	addi	a5,gp,828 # 17b4c <gHuffVal3>
	j	lab42
lab38: 	li	a5,0
lab42: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
getMaxHuffCodes:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a4,-17(s0)
	li	a5,1
	bltu	a5,a4,lab43
	li	a5,12
	j	lab44
lab43: 	li	a5,255
lab44: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
readDHTMarker:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	li	a0,16
	jal	ra,getBits1
	cfed 0x78602
	mv	a5,a0
	sh	a5,-18(s0)
	lhu	a4,-18(s0)
	li	a5,1
	bltu	a5,a4,lab45
	li	a5,4
	j	lab46
lab45: 	lhu	a5,-18(s0)
	addi	a5,a5,-2
	sh	a5,-18(s0)
	j	lab47
lab56: 	jal	ra,getBits1
	cfed 0x98602
	mv	a5,a0
	sb	a5,-23(s0)
	lbu	a5,-23(s0)
	andi	a5,a5,14
	bnez	a5,lab48
	lbu	a5,-23(s0)
	andi	a4,a5,240
	li	a5,16
	bge	a5,a4,lab49
lab48: 	li	a5,3
	j	lab46
lab49: 	lbu	a5,-23(s0)
	srli	a5,a5,0x3
	zext.b	a5,a5
	slli	a5,a5,0x18
	srai	a5,a5,0x18
	andi	a5,a5,2
	slli	a4,a5,0x18
	srai	a4,a4,0x18
	lb	a5,-23(s0)
	andi	a5,a5,1
	slli	a5,a5,0x18
	srai	a5,a5,0x18
	or	a5,a4,a5
	slli	a5,a5,0x18
	srai	a5,a5,0x18
	sb	a5,-24(s0)
	lbu	a5,-24(s0)
	mv	a0,a5
	jal	ra,getHuffTable
	sw	a0,-28(s0)
	lbu	a5,-24(s0)
	mv	a0,a5
	jal	ra,getHuffVal
	sw	a0,-32(s0)
	lbu	a5,-24(s0)
	li	a4,1
	sll	a5,a4,a5
	slli	a4,a5,0x18
	srai	a4,a4,0x18
	lbu	a5,1084(gp) # 17c4c <gValidHuffTables>
	slli	a5,a5,0x18
	srai	a5,a5,0x18
	or	a5,a4,a5
	slli	a5,a5,0x18
	srai	a5,a5,0x18
	zext.b	a4,a5
	sb	a4,1084(gp) # 17c4c <gValidHuffTables>
	sh	zero,-22(s0)
	sb	zero,-19(s0)
	j	lab50
lab51: 	jal	ra,getBits1
	cfed 0xb8602
	mv	a5,a0
	sb	a5,-35(s0)
	lbu	a5,-19(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a4,-35(s0)
	sb	a4,-36(a5)
	lbu	a5,-35(s0)
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	lhu	a4,-22(s0)
	add	a5,a5,a4
	sh	a5,-22(s0)
	lbu	a5,-19(s0)
	addi	a5,a5,1
	sb	a5,-19(s0)
lab50: 	lbu	a4,-19(s0)
	li	a5,15
	bgeu	a5,a4,lab51
	lbu	a5,-24(s0)
	mv	a0,a5
	jal	ra,getMaxHuffCodes
	mv	a5,a0
	mv	a4,a5
	lhu	a5,-22(s0)
	bgeu	a4,a5,lab52
	li	a5,2
	j	lab46
lab52: 	sb	zero,-19(s0)
	j	lab53
lab54: 	jal	ra,getBits1
	cfed 0xd8602
	mv	a5,a0
	mv	a3,a5
	lbu	a5,-19(s0)
	lw	a4,-32(s0)
	add	a5,a4,a5
	zext.b	a4,a3
	sb	a4,0(a5)
	lbu	a5,-19(s0)
	addi	a5,a5,1
	sb	a5,-19(s0)
lab53: 	lbu	a5,-19(s0)
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	lhu	a4,-22(s0)
	bltu	a5,a4,lab54
	lhu	a5,-22(s0)
	addi	a5,a5,17
	sh	a5,-34(s0)
	lhu	a4,-18(s0)
	lhu	a5,-34(s0)
	bgeu	a4,a5,lab55
	li	a5,4
	j	lab46
lab55: 	lhu	a5,-18(s0)
	mv	a4,a5
	lhu	a5,-34(s0)
	sub	a5,a4,a5
	sh	a5,-18(s0)
	addi	a5,s0,-52
	lw	a1,-28(s0)
	mv	a0,a5
	jal	ra,huffCreate
lab47: 	lhu	a5,-18(s0)
	bnez	a5,lab56
	li	a5,0
lab46: 	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	cfes 0x069ca
	ret
readDQTMarker:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	addi	s0,sp,32
	li	a0,16
	jal	ra,getBits1
	cfed 0xe5ae1
	mv	a5,a0
	sh	a5,-18(s0)
	lhu	a4,-18(s0)
	li	a5,1
	bltu	a5,a4,lab57
	li	a5,5
	j	lab58
lab57: 	lhu	a5,-18(s0)
	addi	a5,a5,-2
	sh	a5,-18(s0)
	j	lab59
lab72: 	jal	ra,getBits1
	cfed 0xf5ae1
	mv	a5,a0
	sb	a5,-25(s0)
	lbu	a5,-25(s0)
	srli	a5,a5,0x4
	sb	a5,-26(s0)
	lbu	a5,-25(s0)
	andi	a5,a5,15
	sb	a5,-25(s0)
	lbu	a4,-25(s0)
	li	a5,1
	bgeu	a5,a4,lab60
	li	a5,6
	j	lab58
lab60: 	lbu	a5,-25(s0)
	beqz	a5,lab61
	li	a5,2
	j	lab62
lab61: 	li	a5,1
lab62: 	lbu	a4,1085(gp) # 17c4d <gValidQuantTables>
	slli	a4,a4,0x18
	srai	a4,a4,0x18
	or	a5,a5,a4
	slli	a5,a5,0x18
	srai	a5,a5,0x18
	zext.b	a4,a5
	sb	a4,1085(gp) # 17c4d <gValidQuantTables>
	sb	zero,-19(s0)
	j	lab63
lab67: 	jal	ra,getBits1
	cfed 0x05ae1
	mv	a5,a0
	sh	a5,-24(s0)
	lbu	a5,-26(s0)
	beqz	a5,lab64
	lhu	a5,-24(s0)
	slli	a5,a5,0x8
	slli	s1,a5,0x10
	srli	s1,s1,0x10
	li	a0,8
	jal	ra,getBits1
	cfed 0x15ae1
	mv	a5,a0
	add	a5,s1,a5
	sh	a5,-24(s0)
lab64: 	lbu	a5,-25(s0)
	beqz	a5,lab65
	lbu	a5,-19(s0)
	lh	a4,-24(s0)
	addi	a3,gp,84 # 17864 <gQuant1>
	slli	a5,a5,0x1
	add	a5,a3,a5
	sh	a4,0(a5)
	j	lab66
lab65: 	lbu	a5,-19(s0)
	lh	a4,-24(s0)
	addi	a3,gp,-44 # 177e4 <gQuant0>
	slli	a5,a5,0x1
	add	a5,a3,a5
	sh	a4,0(a5)
lab66: 	lbu	a5,-19(s0)
	addi	a5,a5,1
	sb	a5,-19(s0)
lab63: 	lbu	a4,-19(s0)
	li	a5,63
	bgeu	a5,a4,lab67
	lbu	a5,-25(s0)
	beqz	a5,lab68
	addi	a5,gp,84 # 17864 <gQuant1>
	j	lab69
lab68: 	addi	a5,gp,-44 # 177e4 <gQuant0>
lab69: 	mv	a0,a5
	jal	ra,createWinogradQuant
	li	a5,65
	sh	a5,-22(s0)
	lbu	a5,-26(s0)
	beqz	a5,lab70
	lhu	a5,-22(s0)
	addi	a5,a5,64
	sh	a5,-22(s0)
lab70: 	lhu	a4,-18(s0)
	lhu	a5,-22(s0)
	bgeu	a4,a5,lab71
	li	a5,21
	j	lab58
lab71: 	lhu	a5,-18(s0)
	mv	a4,a5
	lhu	a5,-22(s0)
	sub	a5,a4,a5
	sh	a5,-18(s0)
lab59: 	lhu	a5,-18(s0)
	bnez	a5,lab72
	li	a5,0
lab58: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	cfes 0x7fcc7
	ret
readSOFMarker:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a0,16
	jal	ra,getBits1
	cfed 0x25ae1
	mv	a5,a0
	sh	a5,-20(s0)
	li	a0,8
	jal	ra,getBits1
	cfed 0x35ae1
	mv	a5,a0
	mv	a4,a5
	li	a5,8
	beq	a4,a5,lab73
	li	a5,7
	j	lab74
lab73: 	li	a0,16
	jal	ra,getBits1
	cfed 0x45ae1
	mv	a5,a0
	mv	a4,a5
	sh	a4,1352(gp) # 17d58 <gImageYSize>
	lhu	a5,1352(gp) # 17d58 <gImageYSize>
	beqz	a5,lab75
	lhu	a4,1352(gp) # 17d58 <gImageYSize>
	lui	a5,0x4
	bgeu	a5,a4,lab76
lab75: 	li	a5,8
	j	lab74
lab76: 	li	a0,16
	jal	ra,getBits1
	cfed 0x55ae1
	mv	a5,a0
	mv	a4,a5
	sh	a4,1350(gp) # 17d56 <gImageXSize>
	lhu	a5,1350(gp) # 17d56 <gImageXSize>
	beqz	a5,lab77
	lhu	a4,1350(gp) # 17d56 <gImageXSize>
	lui	a5,0x4
	bgeu	a5,a4,lab78
lab77: 	li	a5,9
	j	lab74
lab78: 	li	a0,8
	jal	ra,getBits1
	cfed 0x65ae1
	mv	a5,a0
	zext.b	a4,a5
	sb	a4,1354(gp) # 17d5a <gCompsInFrame>
	lbu	a4,1354(gp) # 17d5a <gCompsInFrame>
	li	a5,3
	bgeu	a5,a4,lab79
	li	a5,10
	j	lab74
lab79: 	lhu	a4,-20(s0)
	lbu	a5,1354(gp) # 17d5a <gCompsInFrame>
	mv	a3,a5
	mv	a5,a3
	slli	a5,a5,0x1
	add	a5,a5,a3
	addi	a5,a5,8 # 4008 <exit-0xc08c>
	beq	a4,a5,lab80
	li	a5,11
	j	lab74
lab80: 	sb	zero,-17(s0)
	j	lab81
lab83: 	jal	ra,getBits1
	cfed 0x75ae1
	mv	a5,a0
	lbu	a3,-17(s0)
	zext.b	a4,a5
	addi	a5,gp,1356 # 17d5c <gCompIdent>
	add	a5,a3,a5
	sb	a4,0(a5)
	li	a0,4
	jal	ra,getBits1
	cfed 0x85ae1
	mv	a5,a0
	lbu	a3,-17(s0)
	zext.b	a4,a5
	addi	a5,gp,1360 # 17d60 <gCompHSamp>
	add	a5,a3,a5
	sb	a4,0(a5)
	li	a0,4
	jal	ra,getBits1
	cfed 0x95ae1
	mv	a5,a0
	lbu	a3,-17(s0)
	zext.b	a4,a5
	addi	a5,gp,1364 # 17d64 <gCompVSamp>
	add	a5,a3,a5
	sb	a4,0(a5)
	li	a0,8
	jal	ra,getBits1
	cfed 0xa5ae1
	mv	a5,a0
	lbu	a3,-17(s0)
	zext.b	a4,a5
	addi	a5,gp,1368 # 17d68 <gCompQuant>
	add	a5,a3,a5
	sb	a4,0(a5)
	lbu	a4,-17(s0)
	addi	a5,gp,1368 # 17d68 <gCompQuant>
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,1
	bgeu	a5,a4,lab82
	li	a5,36
	j	lab74
lab82: 	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab81: 	lbu	a5,1354(gp) # 17d5a <gCompsInFrame>
	lbu	a4,-17(s0)
	bltu	a4,a5,lab83
	li	a5,0
lab74: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x2d6d0
	ret
skipVariableMarker:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a0,16
	jal	ra,getBits1
	cfed 0xb5ae1
	mv	a5,a0
	sh	a5,-18(s0)
	lhu	a4,-18(s0)
	li	a5,1
	bltu	a5,a4,lab84
	li	a5,12
	j	lab85
lab84: 	lhu	a5,-18(s0)
	addi	a5,a5,-2
	sh	a5,-18(s0)
	j	lab86
lab87: 	jal	ra,getBits1
	cfed 0xc5ae1
	lhu	a5,-18(s0)
	addi	a5,a5,-1
	sh	a5,-18(s0)
lab86: 	lhu	a5,-18(s0)
	bnez	a5,lab87
	li	a5,0
lab85: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x3f778
	ret
readDRIMarker:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a0,16
	jal	ra,getBits1
	cfed 0xd5ae1
	mv	a5,a0
	mv	a4,a5
	li	a5,4
	beq	a4,a5,lab88
	li	a5,13
	j	lab89
lab88: 	li	a0,16
	jal	ra,getBits1
	cfed 0xe4e88
	mv	a5,a0
	mv	a4,a5
	sh	a4,1372(gp) # 17d6c <gRestartInterval>
	li	a5,0
lab89: 	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0x45ba4
	ret
readSOSMarker:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a0,16
	jal	ra,getBits1
	cfed 0xf4e88
	mv	a5,a0
	sh	a5,-20(s0)
	li	a0,8
	jal	ra,getBits1
	cfed 0x04e88
	mv	a5,a0
	zext.b	a4,a5
	sb	a4,1378(gp) # 17d72 <gCompsInScan>
	lhu	a5,-20(s0)
	addi	a5,a5,-3
	sh	a5,-20(s0)
	lhu	a4,-20(s0)
	lbu	a5,1378(gp) # 17d72 <gCompsInScan>
	slli	a5,a5,0x1
	addi	a5,a5,3
	bne	a4,a5,lab90
	lbu	a5,1378(gp) # 17d72 <gCompsInScan>
	beqz	a5,lab90
	lbu	a4,1378(gp) # 17d72 <gCompsInScan>
	li	a5,3
	bgeu	a5,a4,lab91
lab90: 	li	a5,14
	j	lab92
lab91: 	sb	zero,-17(s0)
	j	lab93
lab99: 	jal	ra,getBits1
	cfed 0x14e88
	mv	a5,a0
	sb	a5,-22(s0)
	li	a0,8
	jal	ra,getBits1
	cfed 0x24e88
	mv	a5,a0
	sb	a5,-23(s0)
	lhu	a5,-20(s0)
	addi	a5,a5,-2
	sh	a5,-20(s0)
	sb	zero,-21(s0)
	j	lab94
lab96: 	addi	a5,gp,1356 # 17d5c <gCompIdent>
	add	a5,a4,a5
	lbu	a5,0(a5)
	lbu	a4,-22(s0)
	beq	a4,a5,lab95
	lbu	a5,-21(s0)
	addi	a5,a5,1
	sb	a5,-21(s0)
lab94: 	lbu	a5,1354(gp) # 17d5a <gCompsInFrame>
	lbu	a4,-21(s0)
	bltu	a4,a5,lab96
	j	lab97
lab95: 	nop
lab97: 	lbu	a5,1354(gp) # 17d5a <gCompsInFrame>
	lbu	a4,-21(s0)
	bltu	a4,a5,lab98
	li	a5,15
	j	lab92
lab98: 	lbu	a4,-17(s0)
	addi	a5,gp,1380 # 17d74 <gCompList>
	add	a5,a4,a5
	lbu	a4,-21(s0)
	sb	a4,0(a5)
	lbu	a3,-21(s0)
	lbu	a5,-23(s0)
	srli	a5,a5,0x4
	zext.b	a4,a5
	addi	a5,gp,1384 # 17d78 <gCompDCTab>
	add	a5,a3,a5
	sb	a4,0(a5)
	lbu	a3,-21(s0)
	lbu	a5,-23(s0)
	andi	a5,a5,15
	zext.b	a4,a5
	addi	a5,gp,1388 # 17d7c <gCompACTab>
	add	a5,a3,a5
	sb	a4,0(a5)
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab93: 	lbu	a5,1378(gp) # 17d72 <gCompsInScan>
	lbu	a4,-17(s0)
	bltu	a4,a5,lab99
	li	a0,8
	jal	ra,getBits1
	cfed 0x34e88
	mv	a5,a0
	zext.b	a4,a5
	sb	a4,-976(gp) # 17440 <spectral_start>
	li	a0,8
	jal	ra,getBits1
	cfed 0x44e88
	mv	a5,a0
	zext.b	a4,a5
	sb	a4,-975(gp) # 17441 <spectral_end>
	li	a0,4
	jal	ra,getBits1
	cfed 0x54e88
	mv	a5,a0
	zext.b	a4,a5
	sb	a4,-974(gp) # 17442 <successive_high>
	li	a0,4
	jal	ra,getBits1
	cfed 0x64e88
	mv	a5,a0
	zext.b	a4,a5
	sb	a4,-973(gp) # 17443 <successive_low>
	lhu	a5,-20(s0)
	addi	a5,a5,-3
	sh	a5,-20(s0)
	j	lab100
lab101: 	jal	ra,getBits1
	cfed 0x74e88
	lhu	a5,-20(s0)
	addi	a5,a5,-1
	sh	a5,-20(s0)
lab100: 	lhu	a5,-20(s0)
	bnez	a5,lab101
	li	a5,0
lab92: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x289df
	ret
nextMarker:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sb	zero,-17(s0)
lab102: 	addi	a5,a5,1
	sb	a5,-17(s0)
	li	a0,8
	jal	ra,getBits1
	cfed 0x84e88
	mv	a5,a0
	sb	a5,-18(s0)
	lbu	a4,-18(s0)
	li	a5,255
	bne	a4,a5,lab102
lab103: 	jal	ra,getBits1
	cfed 0x94e88
	mv	a5,a0
	sb	a5,-18(s0)
	lbu	a4,-18(s0)
	li	a5,255
	beq	a4,a5,lab103
	lbu	a5,-18(s0)
	beqz	a5,lab102
	lbu	a5,-18(s0)
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x6d214
	ret
processMarkers:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
lab114: 	cfed 0x42275
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	li	a4,221
	beq	a5,a4,lab104
	li	a4,221
	blt	a4,a5,lab105
	li	a4,219
	beq	a5,a4,lab106
	li	a4,219
	blt	a4,a5,lab105
	li	a4,218
	blt	a4,a5,lab105
	li	a4,216
	bge	a5,a4,lab107
	li	a4,215
	blt	a4,a5,lab105
	li	a4,197
	bge	a5,a4,lab108
	li	a4,196
	beq	a5,a4,lab109
	li	a4,196
	blt	a4,a5,lab105
	li	a4,1
	beq	a5,a4,lab110
	blez	a5,lab105
	addi	a4,a5,-192
	li	a5,3
	bltu	a5,a4,lab105
	j	lab107
lab108: 	addi	a5,a5,-197
	li	a4,1
	sll	a5,a4,a5
	lui	a4,0x80
	addi	a4,a4,-2040 # 7f808 <__BSS_END__+0x67a38>
	and	a4,a5,a4
	snez	a4,a4
	zext.b	a4,a4
	bnez	a4,lab110
	andi	a4,a5,1911
	snez	a4,a4
	zext.b	a4,a4
	bnez	a4,lab107
	andi	a5,a5,128
	snez	a5,a5
	zext.b	a5,a5
	bnez	a5,lab111
	j	lab105
lab107: 	lw	a5,-36(s0)
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	li	a5,0
	j	lab112
lab109: 	jal	ra,readDHTMarker
	cfed 0x78abf
	j	lab113
lab111: 	li	a5,17
	j	lab112
lab106: 	jal	ra,readDQTMarker
	cfed 0x077c2
	j	lab113
lab104: 	jal	ra,readDRIMarker
	cfed 0x598e5
	j	lab113
lab110: 	li	a5,18
	j	lab112
lab105: 	jal	ra,skipVariableMarker
	cfed 0x57d11
	nop
lab113: 	j	lab114
lab112: 	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x8aa36
	ret
locateSOIMarker:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a0,8
	jal	ra,getBits1
	cfed 0xa4e88
	mv	a5,a0
	sb	a5,-20(s0)
	li	a0,8
	jal	ra,getBits1
	cfed 0xb4e88
	mv	a5,a0
	sb	a5,-19(s0)
	lbu	a4,-20(s0)
	li	a5,255
	bne	a4,a5,lab115
	lbu	a4,-19(s0)
	li	a5,216
	bne	a4,a5,lab115
	li	a5,0
	j	lab116
lab115: 	lui	a5,0x1
	sh	a5,-18(s0)
lab118: 	addi	a5,a5,-1 # fff <exit-0xf095>
	sh	a5,-18(s0)
	lhu	a5,-18(s0)
	bnez	a5,lab117
	li	a5,19
	j	lab116
lab117: 	lbu	a5,-19(s0)
	sb	a5,-20(s0)
	li	a0,8
	jal	ra,getBits1
	cfed 0xc4e88
	mv	a5,a0
	sb	a5,-19(s0)
	lbu	a4,-20(s0)
	li	a5,255
	bne	a4,a5,lab118
	lbu	a4,-19(s0)
	li	a5,216
	beq	a4,a5,lab119
	lbu	a4,-19(s0)
	li	a5,217
	bne	a4,a5,lab118
	li	a5,19
	j	lab116
lab119: 	nop
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sb	a5,-19(s0)
	lbu	a4,-19(s0)
	li	a5,255
	beq	a4,a5,lab120
	li	a5,19
	j	lab116
lab120: 	li	a5,0
lab116: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x9f53f
	ret
locateSOFMarker:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	jal	ra,locateSOIMarker
	cfed 0x27f4a
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	beqz	a5,lab121
	lbu	a5,-17(s0)
	j	lab122
lab121: 	addi	a5,s0,-18
	mv	a0,a5
	jal	ra,processMarkers
	cfed 0x2ca53
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	beqz	a5,lab123
	lbu	a5,-17(s0)
	j	lab122
lab123: 	lbu	a5,-18(s0)
	li	a4,201
	beq	a5,a4,lab124
	li	a4,201
	blt	a4,a5,lab125
	li	a4,192
	beq	a5,a4,lab126
	li	a4,194
	bne	a5,a4,lab125
	li	a5,37
	j	lab122
lab126: 	jal	ra,readSOFMarker
	cfed 0x61db9
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	beqz	a5,lab127
	lbu	a5,-17(s0)
	j	lab122
lab124: 	li	a5,17
	j	lab122
lab125: 	li	a5,20
	j	lab122
lab127: 	nop
	li	a5,0
lab122: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x3ee4b
	ret
locateSOSMarker:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	sb	zero,0(a5)
	addi	a5,s0,-18
	mv	a0,a5
	jal	ra,processMarkers
	cfed 0x34a53
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	beqz	a5,lab128
	lbu	a5,-17(s0)
	j	lab129
lab128: 	lbu	a4,-18(s0)
	li	a5,217
	bne	a4,a5,lab130
	lw	a5,-36(s0)
	li	a4,1
	sb	a4,0(a5)
	li	a5,0
	j	lab129
lab130: 	lbu	a4,-18(s0)
	li	a5,218
	beq	a4,a5,lab131
	li	a5,18
	j	lab129
lab131: 	jal	ra,readSOSMarker
	cfed 0x7eaaa
	mv	a5,a0
lab129: 	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x3e196
	ret
init:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	sh	zero,1350(gp) # 17d56 <gImageXSize>
	sh	zero,1352(gp) # 17d58 <gImageYSize>
	sb	zero,1354(gp) # 17d5a <gCompsInFrame>
	sh	zero,1372(gp) # 17d6c <gRestartInterval>
	sb	zero,1378(gp) # 17d72 <gCompsInScan>
	sb	zero,1084(gp) # 17c4c <gValidHuffTables>
	sb	zero,1085(gp) # 17c4d <gValidQuantTables>
	sb	zero,1086(gp) # 17c4e <gTemFlag>
	sb	zero,1344(gp) # 17d50 <gInBufOfs>
	sb	zero,1345(gp) # 17d51 <gInBufLeft>
	sh	zero,1346(gp) # 17d52 <gBitBuf>
	li	a4,8
	sb	a4,1348(gp) # 17d54 <gBitsLeft>
	li	a0,8
	jal	ra,getBits1
	cfed 0xd4e88
	li	a0,8
	jal	ra,getBits1
	cfed 0xe019f
	li	a5,0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0x30cc4
	ret
fixInBuffer:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lbu	a5,1348(gp) # 17d54 <gBitsLeft>
	beqz	a5,lab132
	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	zext.b	a5,a5
	mv	a0,a5
	jal	ra,stuffChar
lab132: 	lhu	a5,1346(gp) # 17d52 <gBitBuf>
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	zext.b	a5,a5
	mv	a0,a5
	jal	ra,stuffChar
	li	a4,8
	sb	a4,1348(gp) # 17d54 <gBitsLeft>
	li	a0,8
	jal	ra,getBits2
	cfed 0x0e4db
	li	a0,8
	jal	ra,getBits2
	cfed 0x164db
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0x99da8
	ret
processRestart:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sb	zero,-19(s0)
	li	a5,1536
	sh	a5,-18(s0)
	j	lab133
lab135: 	cfed 0x50425
	mv	a5,a0
	mv	a4,a5
	li	a5,255
	beq	a4,a5,lab134
	lhu	a5,-18(s0)
	addi	a5,a5,-1
	sh	a5,-18(s0)
lab133: 	lhu	a5,-18(s0)
	bnez	a5,lab135
	j	lab136
lab134: 	nop
lab136: 	lhu	a5,-18(s0)
	bnez	a5,lab137
	li	a5,29
	j	lab138
lab140: 	cfed 0x90425
	mv	a5,a0
	sb	a5,-19(s0)
	lbu	a4,-19(s0)
	li	a5,255
	bne	a4,a5,lab139
	lhu	a5,-18(s0)
	addi	a5,a5,-1
	sh	a5,-18(s0)
lab137: 	lhu	a5,-18(s0)
	bnez	a5,lab140
	j	lab141
lab139: 	nop
lab141: 	lhu	a5,-18(s0)
	bnez	a5,lab142
	li	a5,29
	j	lab138
lab142: 	lbu	a4,-19(s0)
	lhu	a5,1374(gp) # 17d6e <gNextRestartNum>
	addi	a5,a5,208
	beq	a4,a5,lab143
	li	a5,29
	j	lab138
lab143: 	addi	a5,gp,212 # 178e4 <gLastDC>
	sh	zero,0(a5)
	addi	a5,gp,212 # 178e4 <gLastDC>
	sh	zero,2(a5)
	addi	a5,gp,212 # 178e4 <gLastDC>
	sh	zero,4(a5)
	lhu	a4,1372(gp) # 17d6c <gRestartInterval>
	sh	a4,1376(gp) # 17d70 <gRestartsLeft>
	lhu	a5,1374(gp) # 17d6e <gNextRestartNum>
	addi	a5,a5,1
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	andi	a5,a5,7
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1374(gp) # 17d6e <gNextRestartNum>
	li	a4,8
	sb	a4,1348(gp) # 17d54 <gBitsLeft>
	li	a0,8
	jal	ra,getBits2
	cfed 0x1e4db
	li	a0,8
	jal	ra,getBits2
	cfed 0x264db
	li	a5,0
lab138: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0xbd2f2
	ret
checkHuffTables:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sb	zero,-17(s0)
	j	lab144
lab148: 	addi	a5,gp,1380 # 17d74 <gCompList>
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a4,a5
	addi	a5,gp,1384 # 17d78 <gCompDCTab>
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-18(s0)
	lbu	a4,-17(s0)
	addi	a5,gp,1380 # 17d74 <gCompList>
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a4,a5
	addi	a5,gp,1388 # 17d7c <gCompACTab>
	add	a5,a4,a5
	lbu	a5,0(a5)
	addi	a5,a5,2
	sb	a5,-19(s0)
	lbu	a5,1084(gp) # 17c4c <gValidHuffTables>
	mv	a4,a5
	lbu	a5,-18(s0)
	sra	a5,a4,a5
	andi	a5,a5,1
	beqz	a5,lab145
	lbu	a5,1084(gp) # 17c4c <gValidHuffTables>
	mv	a4,a5
	lbu	a5,-19(s0)
	sra	a5,a4,a5
	andi	a5,a5,1
	bnez	a5,lab146
lab145: 	li	a5,24
	j	lab147
lab146: 	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab144: 	lbu	a5,1378(gp) # 17d72 <gCompsInScan>
	lbu	a4,-17(s0)
	bltu	a4,a5,lab148
	li	a5,0
lab147: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
checkQuantTables:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sb	zero,-17(s0)
	j	lab149
lab154: 	addi	a5,gp,1380 # 17d74 <gCompList>
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a4,a5
	addi	a5,gp,1368 # 17d68 <gCompQuant>
	add	a5,a4,a5
	lbu	a5,0(a5)
	beqz	a5,lab150
	li	a5,2
	j	lab151
lab150: 	li	a5,1
lab151: 	sb	a5,-18(s0)
	lbu	a5,1085(gp) # 17c4d <gValidQuantTables>
	lbu	a4,-18(s0)
	and	a5,a5,a4
	zext.b	a5,a5
	bnez	a5,lab152
	li	a5,23
	j	lab153
lab152: 	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab149: 	lbu	a5,1378(gp) # 17d72 <gCompsInScan>
	lbu	a4,-17(s0)
	bltu	a4,a5,lab154
	li	a5,0
lab153: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
initScan:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	addi	a5,s0,-18
	mv	a0,a5
	jal	ra,locateSOSMarker
	cfed 0x992f3
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	beqz	a5,lab155
	lbu	a5,-17(s0)
	j	lab156
lab155: 	lbu	a5,-18(s0)
	beqz	a5,lab157
	li	a5,18
	j	lab156
lab157: 	jal	ra,checkHuffTables
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	beqz	a5,lab158
	lbu	a5,-17(s0)
	j	lab156
lab158: 	jal	ra,checkQuantTables
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	beqz	a5,lab159
	lbu	a5,-17(s0)
	j	lab156
lab159: 	addi	a5,gp,212 # 178e4 <gLastDC>
	sh	zero,0(a5)
	addi	a5,gp,212 # 178e4 <gLastDC>
	sh	zero,2(a5)
	addi	a5,gp,212 # 178e4 <gLastDC>
	sh	zero,4(a5)
	lhu	a5,1372(gp) # 17d6c <gRestartInterval>
	beqz	a5,lab160
	lhu	a4,1372(gp) # 17d6c <gRestartInterval>
	sh	a4,1376(gp) # 17d70 <gRestartsLeft>
	sh	zero,1374(gp) # 17d6e <gNextRestartNum>
lab160: 	jal	ra,fixInBuffer
	cfed 0x4d6e1
	li	a5,0
lab156: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0xb5a0c
	ret
initFrame:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	lbu	a4,1354(gp) # 17d5a <gCompsInFrame>
	li	a5,1
	bne	a4,a5,lab161
	lbu	a4,1360(gp) # 17d60 <gCompHSamp>
	li	a5,1
	bne	a4,a5,lab162
	lbu	a4,1364(gp) # 17d64 <gCompVSamp>
	li	a5,1
	beq	a4,a5,lab163
lab162: 	li	a5,27
	j	lab164
lab163: 	sw	zero,1392(gp) # 17d80 <gScanType>
	li	a4,1
	sb	a4,1396(gp) # 17d84 <gMaxBlocksPerMCU>
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	sb	zero,0(a5)
	li	a4,8
	sb	a4,1397(gp) # 17d85 <gMaxMCUXSize>
	li	a4,8
	sb	a4,1398(gp) # 17d86 <gMaxMCUYSize>
	j	lab165
lab161: 	lbu	a4,1354(gp) # 17d5a <gCompsInFrame>
	li	a5,3
	bne	a4,a5,lab166
	addi	a5,gp,1360 # 17d60 <gCompHSamp>
	lbu	a4,1(a5)
	li	a5,1
	bne	a4,a5,lab167
	addi	a5,gp,1364 # 17d64 <gCompVSamp>
	lbu	a4,1(a5)
	li	a5,1
	bne	a4,a5,lab167
	addi	a5,gp,1360 # 17d60 <gCompHSamp>
	lbu	a4,2(a5)
	li	a5,1
	bne	a4,a5,lab167
	addi	a5,gp,1364 # 17d64 <gCompVSamp>
	lbu	a4,2(a5)
	li	a5,1
	beq	a4,a5,lab168
lab167: 	li	a5,27
	j	lab164
lab168: 	lbu	a4,1360(gp) # 17d60 <gCompHSamp>
	li	a5,1
	bne	a4,a5,lab169
	lbu	a4,1364(gp) # 17d64 <gCompVSamp>
	li	a5,1
	bne	a4,a5,lab169
	li	a4,1
	sw	a4,1392(gp) # 17d80 <gScanType>
	li	a4,3
	sb	a4,1396(gp) # 17d84 <gMaxBlocksPerMCU>
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	sb	zero,0(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	li	a4,1
	sb	a4,1(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	li	a4,2
	sb	a4,2(a5)
	li	a4,8
	sb	a4,1397(gp) # 17d85 <gMaxMCUXSize>
	li	a4,8
	sb	a4,1398(gp) # 17d86 <gMaxMCUYSize>
	j	lab165
lab169: 	lbu	a4,1360(gp) # 17d60 <gCompHSamp>
	li	a5,1
	bne	a4,a5,lab170
	lbu	a4,1364(gp) # 17d64 <gCompVSamp>
	li	a5,2
	bne	a4,a5,lab170
	li	a4,3
	sw	a4,1392(gp) # 17d80 <gScanType>
	li	a4,4
	sb	a4,1396(gp) # 17d84 <gMaxBlocksPerMCU>
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	sb	zero,0(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	sb	zero,1(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	li	a4,1
	sb	a4,2(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	li	a4,2
	sb	a4,3(a5)
	li	a4,8
	sb	a4,1397(gp) # 17d85 <gMaxMCUXSize>
	li	a4,16
	sb	a4,1398(gp) # 17d86 <gMaxMCUYSize>
	j	lab165
lab170: 	lbu	a4,1360(gp) # 17d60 <gCompHSamp>
	li	a5,2
	bne	a4,a5,lab171
	lbu	a4,1364(gp) # 17d64 <gCompVSamp>
	li	a5,1
	bne	a4,a5,lab171
	li	a4,2
	sw	a4,1392(gp) # 17d80 <gScanType>
	li	a4,4
	sb	a4,1396(gp) # 17d84 <gMaxBlocksPerMCU>
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	sb	zero,0(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	sb	zero,1(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	li	a4,1
	sb	a4,2(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	li	a4,2
	sb	a4,3(a5)
	li	a4,16
	sb	a4,1397(gp) # 17d85 <gMaxMCUXSize>
	li	a4,8
	sb	a4,1398(gp) # 17d86 <gMaxMCUYSize>
	j	lab165
lab171: 	lbu	a4,1360(gp) # 17d60 <gCompHSamp>
	li	a5,2
	bne	a4,a5,lab172
	lbu	a4,1364(gp) # 17d64 <gCompVSamp>
	li	a5,2
	bne	a4,a5,lab172
	li	a4,4
	sw	a4,1392(gp) # 17d80 <gScanType>
	li	a4,6
	sb	a4,1396(gp) # 17d84 <gMaxBlocksPerMCU>
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	sb	zero,0(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	sb	zero,1(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	sb	zero,2(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	sb	zero,3(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	li	a4,1
	sb	a4,4(a5)
	addi	a5,gp,1408 # 17d90 <gMCUOrg>
	li	a4,2
	sb	a4,5(a5)
	li	a4,16
	sb	a4,1397(gp) # 17d85 <gMaxMCUXSize>
	li	a4,16
	sb	a4,1398(gp) # 17d86 <gMaxMCUYSize>
	j	lab165
lab172: 	li	a5,27
	j	lab164
lab166: 	li	a5,26
	j	lab164
lab165: 	lhu	a5,1350(gp) # 17d56 <gImageXSize>
	mv	a4,a5
	lbu	a5,1397(gp) # 17d85 <gMaxMCUXSize>
	addi	a5,a5,-1
	add	a4,a4,a5
	lbu	a3,1397(gp) # 17d85 <gMaxMCUXSize>
	li	a5,8
	bne	a3,a5,lab173
	li	a5,3
	j	lab174
lab173: 	li	a5,4
lab174: 	sra	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1400(gp) # 17d88 <gMaxMCUSPerRow>
	lhu	a5,1352(gp) # 17d58 <gImageYSize>
	mv	a4,a5
	lbu	a5,1398(gp) # 17d86 <gMaxMCUYSize>
	addi	a5,a5,-1
	add	a4,a4,a5
	lbu	a3,1398(gp) # 17d86 <gMaxMCUYSize>
	li	a5,8
	bne	a3,a5,lab175
	li	a5,3
	j	lab176
lab175: 	li	a5,4
lab176: 	sra	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1402(gp) # 17d8a <gMaxMCUSPerCol>
	lhu	a4,1400(gp) # 17d88 <gMaxMCUSPerRow>
	lhu	a5,1402(gp) # 17d8a <gMaxMCUSPerCol>
	mul	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1404(gp) # 17d8c <gNumMCUSRemaining>
	li	a5,0
lab164: 	mv	a0,a5
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
createWinogradQuant:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sb	zero,-17(s0)
	j	lab177
lab178: 	slli	a5,a5,0x1
	lw	a4,-36(s0)
	add	a5,a4,a5
	lh	a5,0(a5)
	sw	a5,-24(s0)
	lbu	a5,-17(s0)
	lui	a4,0x16
	addi	a4,a4,360 # 16168 <gWinogradQuant>
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a4,a5
	lw	a5,-24(s0)
	mul	a5,a5,a4
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	addi	a5,a5,4
	srai	a3,a5,0x3
	lbu	a5,-17(s0)
	slli	a5,a5,0x1
	lw	a4,-36(s0)
	add	a5,a4,a5
	slli	a4,a3,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab177: 	lbu	a4,-17(s0)
	li	a5,63
	bgeu	a5,a4,lab178
	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	ret
imul_b1_b3:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	mv	a5,a0
	sh	a5,-34(s0)
	lh	a4,-34(s0)
	li	a5,362
	mul	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addi	a5,a5,128
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srai	a5,a5,0x8
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	ret
imul_b2:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	mv	a5,a0
	sh	a5,-34(s0)
	lh	a4,-34(s0)
	li	a5,669
	mul	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addi	a5,a5,128
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srai	a5,a5,0x8
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	ret
imul_b4:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	mv	a5,a0
	sh	a5,-34(s0)
	lh	a4,-34(s0)
	li	a5,277
	mul	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addi	a5,a5,128
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srai	a5,a5,0x8
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	ret
imul_b5:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	mv	a5,a0
	sh	a5,-34(s0)
	lh	a4,-34(s0)
	li	a5,196
	mul	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addi	a5,a5,128
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srai	a5,a5,0x8
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	ret
clamp:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	sh	a5,-18(s0)
	lhu	a4,-18(s0)
	li	a5,255
	bgeu	a5,a4,lab179
	lh	a5,-18(s0)
	bgez	a5,lab180
	li	a5,0
	j	lab181
lab180: 	lh	a4,-18(s0)
	li	a5,255
	bge	a5,a4,lab179
	li	a5,255
	j	lab181
lab179: 	lhu	a5,-18(s0)
	zext.b	a5,a5
lab181: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
idctRows:
	addi	sp,sp,-96
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	addi	s0,sp,96
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	sw	a5,-24(s0)
	sb	zero,-17(s0)
	j	lab182
lab185: 	addi	a5,a5,2
	lh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,4
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,6
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,8
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,10
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,12
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,14
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	bnez	a5,lab183
	lw	a5,-24(s0)
	lhu	a5,0(a5)
	sh	a5,-84(s0)
	lw	a5,-24(s0)
	addi	a5,a5,2
	lhu	a4,-84(s0)
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,4
	lhu	a4,-84(s0)
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,6
	lhu	a4,-84(s0)
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,8
	lhu	a4,-84(s0)
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,10
	lhu	a4,-84(s0)
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,12
	lhu	a4,-84(s0)
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,14
	lhu	a4,-84(s0)
	sh	a4,0(a5)
	j	lab184
lab183: 	lw	a5,-24(s0)
	lhu	a5,10(a5)
	sh	a5,-26(s0)
	lw	a5,-24(s0)
	lhu	a5,6(a5)
	sh	a5,-28(s0)
	lhu	a4,-26(s0)
	lhu	a5,-28(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-30(s0)
	lhu	a4,-26(s0)
	lhu	a5,-28(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-32(s0)
	lw	a5,-24(s0)
	lhu	a5,2(a5)
	sh	a5,-34(s0)
	lw	a5,-24(s0)
	lhu	a5,14(a5)
	sh	a5,-36(s0)
	lhu	a4,-34(s0)
	lhu	a5,-36(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-38(s0)
	lhu	a4,-34(s0)
	lhu	a5,-36(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-40(s0)
	lhu	a4,-30(s0)
	lhu	a5,-40(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,imul_b5
	mv	a5,a0
	sh	a5,-42(s0)
	lh	a5,-40(s0)
	mv	a0,a5
	jal	ra,imul_b4
	mv	a5,a0
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,-42(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-44(s0)
	lhu	s1,-42(s0)
	lh	a5,-30(s0)
	mv	a0,a5
	jal	ra,imul_b2
	mv	a5,a0
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sub	a5,s1,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-46(s0)
	lhu	a4,-38(s0)
	lhu	a5,-32(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-48(s0)
	lhu	a4,-38(s0)
	lhu	a5,-32(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-50(s0)
	lhu	a4,-44(s0)
	lhu	a5,-50(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-52(s0)
	lh	a5,-48(s0)
	mv	a0,a5
	jal	ra,imul_b1_b3
	mv	a5,a0
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,-52(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-54(s0)
	lhu	a4,-54(s0)
	lhu	a5,-46(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-56(s0)
	lw	a5,-24(s0)
	lhu	a5,0(a5)
	sh	a5,-58(s0)
	lw	a5,-24(s0)
	lhu	a5,8(a5)
	sh	a5,-60(s0)
	lhu	a4,-58(s0)
	lhu	a5,-60(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-62(s0)
	lhu	a4,-58(s0)
	lhu	a5,-60(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-64(s0)
	lw	a5,-24(s0)
	lhu	a5,4(a5)
	sh	a5,-66(s0)
	lw	a5,-24(s0)
	lhu	a5,12(a5)
	sh	a5,-68(s0)
	lhu	a4,-66(s0)
	lhu	a5,-68(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-70(s0)
	lhu	a4,-66(s0)
	lhu	a5,-68(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-72(s0)
	lh	a5,-70(s0)
	mv	a0,a5
	jal	ra,imul_b1_b3
	mv	a5,a0
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,-72(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-74(s0)
	lhu	a4,-62(s0)
	lhu	a5,-72(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-76(s0)
	lhu	a4,-62(s0)
	lhu	a5,-72(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-78(s0)
	lhu	a4,-64(s0)
	lhu	a5,-74(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-80(s0)
	lhu	a4,-64(s0)
	lhu	a5,-74(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-82(s0)
	lhu	a4,-76(s0)
	lhu	a5,-50(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	sh	a4,0(a5)
	lhu	a4,-80(s0)
	lhu	a5,-52(s0)
	add	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,2
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lhu	a4,-82(s0)
	lhu	a5,-54(s0)
	add	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,4
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lhu	a4,-78(s0)
	lhu	a5,-56(s0)
	sub	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,6
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lhu	a4,-78(s0)
	lhu	a5,-56(s0)
	add	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,8
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lhu	a4,-82(s0)
	lhu	a5,-54(s0)
	sub	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,10
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lhu	a4,-80(s0)
	lhu	a5,-52(s0)
	sub	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,12
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lhu	a4,-76(s0)
	lhu	a5,-50(s0)
	sub	a5,a4,a5
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,14
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
lab184: 	lw	a5,-24(s0)
	addi	a5,a5,16
	sw	a5,-24(s0)
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab182: 	lbu	a4,-17(s0)
	li	a5,7
	bgeu	a5,a4,lab185
	nop
	nop
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	addi	sp,sp,96
	cfes 0x02568
	ret
idctCols:
	addi	sp,sp,-96
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	addi	s0,sp,96
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	sw	a5,-24(s0)
	sb	zero,-17(s0)
	j	lab186
lab189: 	addi	a5,a5,16
	lh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,32
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,48
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,64
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,80
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,96
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	addi	a5,a5,112
	lh	a5,0(a5)
	or	a5,a4,a5
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	bnez	a5,lab187
	lw	a5,-24(s0)
	lh	a5,0(a5)
	addi	a5,a5,64
	srli	a5,a5,0x7
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,128
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,clamp
	mv	a5,a0
	sb	a5,-83(s0)
	lbu	a5,-83(s0)
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,16
	lbu	a4,-83(s0)
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,32
	lbu	a4,-83(s0)
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,48
	lbu	a4,-83(s0)
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,64
	lbu	a4,-83(s0)
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,80
	lbu	a4,-83(s0)
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,96
	lbu	a4,-83(s0)
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,112
	lbu	a4,-83(s0)
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	j	lab188
lab187: 	lw	a5,-24(s0)
	lhu	a5,80(a5)
	sh	a5,-26(s0)
	lw	a5,-24(s0)
	lhu	a5,48(a5)
	sh	a5,-28(s0)
	lhu	a4,-26(s0)
	lhu	a5,-28(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-30(s0)
	lhu	a4,-26(s0)
	lhu	a5,-28(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-32(s0)
	lw	a5,-24(s0)
	lhu	a5,16(a5)
	sh	a5,-34(s0)
	lw	a5,-24(s0)
	lhu	a5,112(a5)
	sh	a5,-36(s0)
	lhu	a4,-34(s0)
	lhu	a5,-36(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-38(s0)
	lhu	a4,-34(s0)
	lhu	a5,-36(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-40(s0)
	lhu	a4,-30(s0)
	lhu	a5,-40(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,imul_b5
	mv	a5,a0
	sh	a5,-42(s0)
	lh	a5,-40(s0)
	mv	a0,a5
	jal	ra,imul_b4
	mv	a5,a0
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,-42(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-44(s0)
	lhu	s1,-42(s0)
	lh	a5,-30(s0)
	mv	a0,a5
	jal	ra,imul_b2
	mv	a5,a0
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sub	a5,s1,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-46(s0)
	lhu	a4,-38(s0)
	lhu	a5,-32(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-48(s0)
	lhu	a4,-38(s0)
	lhu	a5,-32(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-50(s0)
	lhu	a4,-44(s0)
	lhu	a5,-50(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-52(s0)
	lh	a5,-48(s0)
	mv	a0,a5
	jal	ra,imul_b1_b3
	mv	a5,a0
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,-52(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-54(s0)
	lhu	a4,-54(s0)
	lhu	a5,-46(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-56(s0)
	lw	a5,-24(s0)
	lhu	a5,0(a5)
	sh	a5,-58(s0)
	lw	a5,-24(s0)
	lhu	a5,64(a5)
	sh	a5,-60(s0)
	lhu	a4,-58(s0)
	lhu	a5,-60(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-62(s0)
	lhu	a4,-58(s0)
	lhu	a5,-60(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-64(s0)
	lw	a5,-24(s0)
	lhu	a5,32(a5)
	sh	a5,-66(s0)
	lw	a5,-24(s0)
	lhu	a5,96(a5)
	sh	a5,-68(s0)
	lhu	a4,-66(s0)
	lhu	a5,-68(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-70(s0)
	lhu	a4,-66(s0)
	lhu	a5,-68(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-72(s0)
	lh	a5,-70(s0)
	mv	a0,a5
	jal	ra,imul_b1_b3
	mv	a5,a0
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,-72(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-74(s0)
	lhu	a4,-62(s0)
	lhu	a5,-72(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-76(s0)
	lhu	a4,-62(s0)
	lhu	a5,-72(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-78(s0)
	lhu	a4,-64(s0)
	lhu	a5,-74(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-80(s0)
	lhu	a4,-64(s0)
	lhu	a5,-74(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-82(s0)
	lh	a4,-76(s0)
	lh	a5,-50(s0)
	add	a5,a4,a5
	addi	a5,a5,64
	srli	a5,a5,0x7
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,128
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,clamp
	mv	a5,a0
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	lw	a5,-24(s0)
	sh	a4,0(a5)
	lh	a4,-80(s0)
	lh	a5,-52(s0)
	add	a5,a4,a5
	addi	a5,a5,64
	srli	a5,a5,0x7
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,128
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,clamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-24(s0)
	addi	a5,a5,16
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lh	a4,-82(s0)
	lh	a5,-54(s0)
	add	a5,a4,a5
	addi	a5,a5,64
	srli	a5,a5,0x7
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,128
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,clamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-24(s0)
	addi	a5,a5,32
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lh	a4,-78(s0)
	lh	a5,-56(s0)
	sub	a5,a4,a5
	addi	a5,a5,64
	srli	a5,a5,0x7
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,128
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,clamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-24(s0)
	addi	a5,a5,48
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lh	a4,-78(s0)
	lh	a5,-56(s0)
	add	a5,a4,a5
	addi	a5,a5,64
	srli	a5,a5,0x7
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,128
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,clamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-24(s0)
	addi	a5,a5,64
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lh	a4,-82(s0)
	lh	a5,-54(s0)
	sub	a5,a4,a5
	addi	a5,a5,64
	srli	a5,a5,0x7
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,128
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,clamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-24(s0)
	addi	a5,a5,80
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lh	a4,-80(s0)
	lh	a5,-52(s0)
	sub	a5,a4,a5
	addi	a5,a5,64
	srli	a5,a5,0x7
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,128
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,clamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-24(s0)
	addi	a5,a5,96
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
	lh	a4,-76(s0)
	lh	a5,-50(s0)
	sub	a5,a4,a5
	addi	a5,a5,64
	srli	a5,a5,0x7
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,128
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,clamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-24(s0)
	addi	a5,a5,112
	slli	a4,a4,0x10
	srai	a4,a4,0x10
	sh	a4,0(a5)
lab188: 	lw	a5,-24(s0)
	addi	a5,a5,2
	sw	a5,-24(s0)
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab186: 	lbu	a4,-17(s0)
	li	a5,7
	bgeu	a5,a4,lab189
	nop
	nop
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	addi	sp,sp,96
	cfes 0x079db
	ret
addAndClamp:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	mv	a4,a1
	sb	a5,-17(s0)
	mv	a5,a4
	sh	a5,-20(s0)
	lbu	a5,-17(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,-20(s0)
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-20(s0)
	lhu	a4,-20(s0)
	li	a5,255
	bgeu	a5,a4,lab190
	lh	a5,-20(s0)
	bgez	a5,lab191
	li	a5,0
	j	lab192
lab191: 	lh	a4,-20(s0)
	li	a5,255
	bge	a5,a4,lab190
	li	a5,255
	j	lab192
lab190: 	lhu	a5,-20(s0)
	zext.b	a5,a5
lab192: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
subAndClamp:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	mv	a4,a1
	sb	a5,-17(s0)
	mv	a5,a4
	sh	a5,-20(s0)
	lbu	a5,-17(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,-20(s0)
	sub	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-20(s0)
	lhu	a4,-20(s0)
	li	a5,255
	bgeu	a5,a4,lab193
	lh	a5,-20(s0)
	bgez	a5,lab194
	li	a5,0
	j	lab195
lab194: 	lh	a4,-20(s0)
	li	a5,255
	bge	a5,a4,lab193
	li	a5,255
	j	lab195
lab193: 	lhu	a5,-20(s0)
	zext.b	a5,a5
lab195: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
upsampleCb:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	addi	s0,sp,64
	mv	a5,a0
	mv	a4,a1
	sb	a5,-49(s0)
	mv	a5,a4
	sb	a5,-50(s0)
	lbu	a5,-49(s0)
	slli	a4,a5,0x1
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	add	a5,a4,a5
	sw	a5,-24(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	add	a5,a4,a5
	sw	a5,-28(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	add	a5,a4,a5
	sw	a5,-32(s0)
	sb	zero,-18(s0)
	j	lab196
lab199: 	j	lab197
lab198: 	addi	a4,a5,2
	sw	a4,-24(s0)
	lh	a5,0(a5)
	sb	a5,-33(s0)
	lbu	a4,-33(s0)
	li	a5,88
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-44
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-36(s0)
	lw	a5,-28(s0)
	lbu	a5,0(a5)
	lh	a4,-36(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-28(s0)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	lw	a5,-28(s0)
	addi	s1,a5,1
	lh	a5,-36(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,subAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-28(s0)
	addi	a5,a5,8
	lbu	a4,0(a5)
	lw	a5,-28(s0)
	addi	s1,a5,8
	lh	a5,-36(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,subAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-28(s0)
	addi	a5,a5,9
	lbu	a4,0(a5)
	lw	a5,-28(s0)
	addi	s1,a5,9
	lh	a5,-36(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,subAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lbu	a5,-33(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-33(s0)
	li	a5,198
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-227
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-38(s0)
	lw	a5,-32(s0)
	lbu	a5,0(a5)
	lh	a4,-38(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-32(s0)
	sb	a4,0(a5)
	lw	a5,-32(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	lw	a5,-32(s0)
	addi	s1,a5,1
	lh	a5,-38(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,addAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-32(s0)
	addi	a5,a5,8
	lbu	a4,0(a5)
	lw	a5,-32(s0)
	addi	s1,a5,8
	lh	a5,-38(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,addAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-32(s0)
	addi	a5,a5,9
	lbu	a4,0(a5)
	lw	a5,-32(s0)
	addi	s1,a5,9
	lh	a5,-38(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,addAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-28(s0)
	addi	a5,a5,2
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	addi	a5,a5,2
	sw	a5,-32(s0)
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab197: 	lbu	a4,-17(s0)
	li	a5,3
	bgeu	a5,a4,lab198
	lw	a5,-24(s0)
	addi	a5,a5,8
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	addi	a5,a5,8
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	addi	a5,a5,8
	sw	a5,-32(s0)
	lbu	a5,-18(s0)
	addi	a5,a5,1
	sb	a5,-18(s0)
lab196: 	lbu	a4,-18(s0)
	li	a5,3
	bgeu	a5,a4,lab199
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	cfes 0x0653b
	ret
upsampleCbH:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	addi	s0,sp,64
	mv	a5,a0
	mv	a4,a1
	sb	a5,-49(s0)
	mv	a5,a4
	sb	a5,-50(s0)
	lbu	a5,-49(s0)
	slli	a4,a5,0x1
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	add	a5,a4,a5
	sw	a5,-24(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	add	a5,a4,a5
	sw	a5,-28(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	add	a5,a4,a5
	sw	a5,-32(s0)
	sb	zero,-18(s0)
	j	lab200
lab203: 	j	lab201
lab202: 	addi	a4,a5,2
	sw	a4,-24(s0)
	lh	a5,0(a5)
	sb	a5,-33(s0)
	lbu	a4,-33(s0)
	li	a5,88
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-44
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-36(s0)
	lw	a5,-28(s0)
	lbu	a5,0(a5)
	lh	a4,-36(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-28(s0)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	lw	a5,-28(s0)
	addi	s1,a5,1
	lh	a5,-36(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,subAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lbu	a5,-33(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-33(s0)
	li	a5,198
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-227
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-38(s0)
	lw	a5,-32(s0)
	lbu	a5,0(a5)
	lh	a4,-38(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-32(s0)
	sb	a4,0(a5)
	lw	a5,-32(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	lw	a5,-32(s0)
	addi	s1,a5,1
	lh	a5,-38(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,addAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-28(s0)
	addi	a5,a5,2
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	addi	a5,a5,2
	sw	a5,-32(s0)
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab201: 	lbu	a4,-17(s0)
	li	a5,3
	bgeu	a5,a4,lab202
	lw	a5,-24(s0)
	addi	a5,a5,8
	sw	a5,-24(s0)
	lbu	a5,-18(s0)
	addi	a5,a5,1
	sb	a5,-18(s0)
lab200: 	lbu	a4,-18(s0)
	li	a5,7
	bgeu	a5,a4,lab203
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	cfes 0x053a4
	ret
upsampleCbV:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	addi	s0,sp,64
	mv	a5,a0
	mv	a4,a1
	sb	a5,-49(s0)
	mv	a5,a4
	sb	a5,-50(s0)
	lbu	a5,-49(s0)
	slli	a4,a5,0x1
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	add	a5,a4,a5
	sw	a5,-24(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	add	a5,a4,a5
	sw	a5,-28(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	add	a5,a4,a5
	sw	a5,-32(s0)
	sb	zero,-18(s0)
	j	lab204
lab207: 	j	lab205
lab206: 	addi	a4,a5,2
	sw	a4,-24(s0)
	lh	a5,0(a5)
	sb	a5,-33(s0)
	lbu	a4,-33(s0)
	li	a5,88
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-44
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-36(s0)
	lw	a5,-28(s0)
	lbu	a5,0(a5)
	lh	a4,-36(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-28(s0)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	addi	a5,a5,8
	lbu	a4,0(a5)
	lw	a5,-28(s0)
	addi	s1,a5,8
	lh	a5,-36(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,subAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lbu	a5,-33(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-33(s0)
	li	a5,198
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-227
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-38(s0)
	lw	a5,-32(s0)
	lbu	a5,0(a5)
	lh	a4,-38(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-32(s0)
	sb	a4,0(a5)
	lw	a5,-32(s0)
	addi	a5,a5,8
	lbu	a4,0(a5)
	lw	a5,-32(s0)
	addi	s1,a5,8
	lh	a5,-38(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,addAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab205: 	lbu	a4,-17(s0)
	li	a5,7
	bgeu	a5,a4,lab206
	lw	a5,-28(s0)
	addi	a5,a5,8
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	addi	a5,a5,8
	sw	a5,-32(s0)
	lbu	a5,-18(s0)
	addi	a5,a5,1
	sb	a5,-18(s0)
lab204: 	lbu	a4,-18(s0)
	li	a5,3
	bgeu	a5,a4,lab207
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	cfes 0x39774
	ret
upsampleCr:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	addi	s0,sp,64
	mv	a5,a0
	mv	a4,a1
	sb	a5,-49(s0)
	mv	a5,a4
	sb	a5,-50(s0)
	lbu	a5,-49(s0)
	slli	a4,a5,0x1
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	add	a5,a4,a5
	sw	a5,-24(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	add	a5,a4,a5
	sw	a5,-28(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	add	a5,a4,a5
	sw	a5,-32(s0)
	sb	zero,-18(s0)
	j	lab208
lab211: 	j	lab209
lab210: 	addi	a4,a5,2
	sw	a4,-24(s0)
	lh	a5,0(a5)
	sb	a5,-33(s0)
	lbu	a5,-33(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-33(s0)
	li	a5,103
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-179
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-36(s0)
	lw	a5,-28(s0)
	lbu	a5,0(a5)
	lh	a4,-36(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-28(s0)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	lw	a5,-28(s0)
	addi	s1,a5,1
	lh	a5,-36(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,addAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-28(s0)
	addi	a5,a5,8
	lbu	a4,0(a5)
	lw	a5,-28(s0)
	addi	s1,a5,8
	lh	a5,-36(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,addAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-28(s0)
	addi	a5,a5,9
	lbu	a4,0(a5)
	lw	a5,-28(s0)
	addi	s1,a5,9
	lh	a5,-36(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,addAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lbu	a4,-33(s0)
	li	a5,183
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-91
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-38(s0)
	lw	a5,-32(s0)
	lbu	a5,0(a5)
	lh	a4,-38(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-32(s0)
	sb	a4,0(a5)
	lw	a5,-32(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	lw	a5,-32(s0)
	addi	s1,a5,1
	lh	a5,-38(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,subAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-32(s0)
	addi	a5,a5,8
	lbu	a4,0(a5)
	lw	a5,-32(s0)
	addi	s1,a5,8
	lh	a5,-38(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,subAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-32(s0)
	addi	a5,a5,9
	lbu	a4,0(a5)
	lw	a5,-32(s0)
	addi	s1,a5,9
	lh	a5,-38(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,subAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-28(s0)
	addi	a5,a5,2
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	addi	a5,a5,2
	sw	a5,-32(s0)
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab209: 	lbu	a4,-17(s0)
	li	a5,3
	bgeu	a5,a4,lab210
	lw	a5,-24(s0)
	addi	a5,a5,8
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	addi	a5,a5,8
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	addi	a5,a5,8
	sw	a5,-32(s0)
	lbu	a5,-18(s0)
	addi	a5,a5,1
	sb	a5,-18(s0)
lab208: 	lbu	a4,-18(s0)
	li	a5,3
	bgeu	a5,a4,lab211
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	cfes 0x1a144
	ret
upsampleCrH:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	addi	s0,sp,64
	mv	a5,a0
	mv	a4,a1
	sb	a5,-49(s0)
	mv	a5,a4
	sb	a5,-50(s0)
	lbu	a5,-49(s0)
	slli	a4,a5,0x1
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	add	a5,a4,a5
	sw	a5,-24(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	add	a5,a4,a5
	sw	a5,-28(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	add	a5,a4,a5
	sw	a5,-32(s0)
	sb	zero,-18(s0)
	j	lab212
lab215: 	j	lab213
lab214: 	addi	a4,a5,2
	sw	a4,-24(s0)
	lh	a5,0(a5)
	sb	a5,-33(s0)
	lbu	a5,-33(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-33(s0)
	li	a5,103
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-179
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-36(s0)
	lw	a5,-28(s0)
	lbu	a5,0(a5)
	lh	a4,-36(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-28(s0)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	lw	a5,-28(s0)
	addi	s1,a5,1
	lh	a5,-36(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,addAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lbu	a4,-33(s0)
	li	a5,183
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-91
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-38(s0)
	lw	a5,-32(s0)
	lbu	a5,0(a5)
	lh	a4,-38(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-32(s0)
	sb	a4,0(a5)
	lw	a5,-32(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	lw	a5,-32(s0)
	addi	s1,a5,1
	lh	a5,-38(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,subAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-28(s0)
	addi	a5,a5,2
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	addi	a5,a5,2
	sw	a5,-32(s0)
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab213: 	lbu	a4,-17(s0)
	li	a5,3
	bgeu	a5,a4,lab214
	lw	a5,-24(s0)
	addi	a5,a5,8
	sw	a5,-24(s0)
	lbu	a5,-18(s0)
	addi	a5,a5,1
	sb	a5,-18(s0)
lab212: 	lbu	a4,-18(s0)
	li	a5,7
	bgeu	a5,a4,lab215
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	cfes 0x2159a
	ret
upsampleCrV:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	addi	s0,sp,64
	mv	a5,a0
	mv	a4,a1
	sb	a5,-49(s0)
	mv	a5,a4
	sb	a5,-50(s0)
	lbu	a5,-49(s0)
	slli	a4,a5,0x1
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	add	a5,a4,a5
	sw	a5,-24(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	add	a5,a4,a5
	sw	a5,-28(s0)
	lbu	a4,-50(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	add	a5,a4,a5
	sw	a5,-32(s0)
	sb	zero,-18(s0)
	j	lab216
lab219: 	j	lab217
lab218: 	addi	a4,a5,2
	sw	a4,-24(s0)
	lh	a5,0(a5)
	sb	a5,-33(s0)
	lbu	a5,-33(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-33(s0)
	li	a5,103
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-179
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-36(s0)
	lw	a5,-28(s0)
	lbu	a5,0(a5)
	lh	a4,-36(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-28(s0)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	addi	a5,a5,8
	lbu	a4,0(a5)
	lw	a5,-28(s0)
	addi	s1,a5,8
	lh	a5,-36(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,addAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lbu	a4,-33(s0)
	li	a5,183
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-91
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-38(s0)
	lw	a5,-32(s0)
	lbu	a5,0(a5)
	lh	a4,-38(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-32(s0)
	sb	a4,0(a5)
	lw	a5,-32(s0)
	addi	a5,a5,8
	lbu	a4,0(a5)
	lw	a5,-32(s0)
	addi	s1,a5,8
	lh	a5,-38(s0)
	mv	a1,a5
	mv	a0,a4
	jal	ra,subAndClamp
	mv	a5,a0
	sb	a5,0(s1)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab217: 	lbu	a4,-17(s0)
	li	a5,7
	bgeu	a5,a4,lab218
	lw	a5,-28(s0)
	addi	a5,a5,8
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	addi	a5,a5,8
	sw	a5,-32(s0)
	lbu	a5,-18(s0)
	addi	a5,a5,1
	sb	a5,-18(s0)
lab216: 	lbu	a4,-18(s0)
	li	a5,3
	bgeu	a5,a4,lab219
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	cfes 0x67fdb
	ret
copyY:
	addi	sp,sp,-64
	sw	s0,60(sp)
	addi	s0,sp,64
	mv	a5,a0
	sb	a5,-49(s0)
	lbu	a4,-49(s0)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	add	a5,a4,a5
	sw	a5,-24(s0)
	lbu	a4,-49(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	add	a5,a4,a5
	sw	a5,-28(s0)
	lbu	a4,-49(s0)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	add	a5,a4,a5
	sw	a5,-32(s0)
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	sw	a5,-36(s0)
	li	a5,64
	sb	a5,-17(s0)
	j	lab220
lab221: 	addi	a4,a5,2
	sw	a4,-36(s0)
	lh	a5,0(a5)
	sb	a5,-37(s0)
	lw	a5,-24(s0)
	addi	a4,a5,1
	sw	a4,-24(s0)
	lbu	a4,-37(s0)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	addi	a4,a5,1
	sw	a4,-28(s0)
	lbu	a4,-37(s0)
	sb	a4,0(a5)
	lw	a5,-32(s0)
	addi	a4,a5,1
	sw	a4,-32(s0)
	lbu	a4,-37(s0)
	sb	a4,0(a5)
	lbu	a5,-17(s0)
	addi	a5,a5,-1
	sb	a5,-17(s0)
lab220: 	lbu	a5,-17(s0)
	bnez	a5,lab221
	nop
	nop
	lw	s0,60(sp)
	addi	sp,sp,64
	ret
convertCb:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	mv	a5,a0
	sb	a5,-49(s0)
	lbu	a4,-49(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	add	a5,a4,a5
	sw	a5,-24(s0)
	lbu	a4,-49(s0)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	add	a5,a4,a5
	sw	a5,-28(s0)
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	sw	a5,-32(s0)
	li	a5,64
	sb	a5,-17(s0)
	j	lab222
lab223: 	addi	a4,a5,2
	sw	a4,-32(s0)
	lh	a5,0(a5)
	sb	a5,-33(s0)
	lbu	a4,-33(s0)
	li	a5,88
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-44
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-36(s0)
	lw	a5,-24(s0)
	lbu	a5,0(a5)
	lh	a4,-36(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-24(s0)
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lbu	a5,-33(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-33(s0)
	li	a5,198
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-227
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-38(s0)
	lw	a5,-28(s0)
	lbu	a5,0(a5)
	lh	a4,-38(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-28(s0)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
	lbu	a5,-17(s0)
	addi	a5,a5,-1
	sb	a5,-17(s0)
lab222: 	lbu	a5,-17(s0)
	bnez	a5,lab223
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	cfes 0x2e406
	ret
convertCr:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	mv	a5,a0
	sb	a5,-49(s0)
	lbu	a4,-49(s0)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	add	a5,a4,a5
	sw	a5,-24(s0)
	lbu	a4,-49(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	add	a5,a4,a5
	sw	a5,-28(s0)
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	sw	a5,-32(s0)
	li	a5,64
	sb	a5,-17(s0)
	j	lab224
lab225: 	addi	a4,a5,2
	sw	a4,-32(s0)
	lh	a5,0(a5)
	sb	a5,-33(s0)
	lbu	a5,-33(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-33(s0)
	li	a5,103
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-179
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-36(s0)
	lw	a5,-24(s0)
	lbu	a5,0(a5)
	lh	a4,-36(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-24(s0)
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lbu	a4,-33(s0)
	li	a5,183
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-91
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-38(s0)
	lw	a5,-28(s0)
	lbu	a5,0(a5)
	lh	a4,-38(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	lw	a5,-28(s0)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
	lbu	a5,-17(s0)
	addi	a5,a5,-1
	sb	a5,-17(s0)
lab224: 	lbu	a5,-17(s0)
	bnez	a5,lab225
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	cfes 0x48c70
	ret
transformBlock:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	jal	ra,idctRows
	cfed 0xfcf21
	jal	ra,idctCols
	cfed 0x0053d
	lw	a5,1392(gp) # 17d80 <gScanType>
	li	a4,4
	bltu	a4,a5,lab226
	slli	a4,a5,0x2
	lui	a5,0x16
	addi	a5,a5,424 # 161a8 <gWinogradQuant+0x40>
	add	a5,a4,a5
	lw	a5,0(a5)
	cfes 0x7ec58
	jr	a5
	li	a0,0
	jal	ra,copyY
	j	lab226
	lbu	a5,-17(s0)
	li	a4,2
	beq	a5,a4,lab227
	li	a4,2
	blt	a4,a5,lab228
	beqz	a5,lab229
	li	a4,1
	beq	a5,a4,lab230
	j	lab228
lab229: 	li	a0,0
	jal	ra,copyY
	j	lab231
lab230: 	li	a0,0
	jal	ra,convertCb
	cfed 0x61b12
	j	lab231
lab227: 	li	a0,0
	jal	ra,convertCr
	cfed 0x4f2a8
	nop
lab231: 	j	lab228
	lbu	a5,-17(s0)
	li	a4,3
	beq	a5,a4,lab232
	li	a4,3
	blt	a4,a5,lab233
	li	a4,2
	beq	a5,a4,lab234
	li	a4,2
	blt	a4,a5,lab233
	beqz	a5,lab235
	li	a4,1
	beq	a5,a4,lab236
	j	lab233
lab235: 	li	a0,0
	jal	ra,copyY
	j	lab237
lab236: 	li	a0,128
	jal	ra,copyY
	j	lab237
lab234: 	li	a1,0
	li	a0,0
	jal	ra,upsampleCbV
	cfed 0x067a4
	li	a1,128
	li	a0,32
	jal	ra,upsampleCbV
	cfed 0x0e7a4
	j	lab237
lab232: 	li	a1,0
	li	a0,0
	jal	ra,upsampleCrV
	cfed 0x17f3d
	li	a1,128
	li	a0,32
	jal	ra,upsampleCrV
	cfed 0x1ff3d
	nop
lab237: 	j	lab233
	lbu	a5,-17(s0)
	li	a4,3
	beq	a5,a4,lab238
	li	a4,3
	blt	a4,a5,lab239
	li	a4,2
	beq	a5,a4,lab240
	li	a4,2
	blt	a4,a5,lab239
	beqz	a5,lab241
	li	a4,1
	beq	a5,a4,lab242
	j	lab239
lab241: 	li	a0,0
	jal	ra,copyY
	j	lab243
lab242: 	li	a0,64
	jal	ra,copyY
	j	lab243
lab240: 	li	a1,0
	li	a0,0
	jal	ra,upsampleCbH
	cfed 0x2ab74
	li	a1,64
	li	a0,4
	jal	ra,upsampleCbH
	cfed 0x32b74
	j	lab243
lab238: 	li	a1,0
	li	a0,0
	jal	ra,upsampleCrH
	cfed 0x4e97e
	li	a1,64
	li	a0,4
	jal	ra,upsampleCrH
	cfed 0x5697e
	nop
lab243: 	j	lab239
	lbu	a5,-17(s0)
	li	a4,5
	bltu	a4,a5,lab244
	slli	a4,a5,0x2
	lui	a5,0x16
	addi	a5,a5,444 # 161bc <gWinogradQuant+0x54>
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	li	a0,0
	jal	ra,copyY
	j	lab245
	li	a0,64
	jal	ra,copyY
	j	lab245
	li	a0,128
	jal	ra,copyY
	j	lab245
	li	a0,192
	jal	ra,copyY
	j	lab245
	li	a1,0
	li	a0,0
	jal	ra,upsampleCb
	cfed 0x099dd
	li	a1,64
	li	a0,4
	jal	ra,upsampleCb
	cfed 0x119dd
	li	a1,128
	li	a0,32
	jal	ra,upsampleCb
	cfed 0x199dd
	li	a1,192
	li	a0,36
	jal	ra,upsampleCb
	cfed 0x219dd
	j	lab245
	li	a1,0
	li	a0,0
	jal	ra,upsampleCr
	cfed 0x35dd4
	li	a1,64
	li	a0,4
	jal	ra,upsampleCr
	cfed 0x3ddd4
	li	a1,128
	li	a0,32
	jal	ra,upsampleCr
	cfed 0x45dd4
	li	a1,192
	li	a0,36
	jal	ra,upsampleCr
	cfed 0x4ddd4
	nop
lab245: 	j	lab244
lab228: 	nop
	j	lab226
lab233: 	nop
	j	lab226
lab239: 	nop
	j	lab226
lab244: 	nop
lab226: 	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	ret
transformBlockReduce:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	sb	a5,-33(s0)
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	lh	a5,0(a5)
	addi	a5,a5,64
	srli	a5,a5,0x7
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,128
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a5,a5,0x10
	srai	a5,a5,0x10
	mv	a0,a5
	jal	ra,clamp
	mv	a5,a0
	sb	a5,-17(s0)
	lw	a5,1392(gp) # 17d80 <gScanType>
	li	a4,4
	bltu	a4,a5,lab246
	slli	a4,a5,0x2
	lui	a5,0x16
	addi	a5,a5,468 # 161d4 <gWinogradQuant+0x6c>
	add	a5,a4,a5
	lw	a5,0(a5)
	cfes 0x6733c
	jr	a5
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	j	lab246
	lbu	a5,-33(s0)
	li	a4,2
	beq	a5,a4,lab247
	li	a4,2
	blt	a4,a5,lab248
	beqz	a5,lab249
	li	a4,1
	beq	a5,a4,lab250
	j	lab248
lab249: 	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	j	lab251
lab250: 	lbu	a4,-17(s0)
	li	a5,88
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-44
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-24(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,0(a5)
	lh	a4,-24(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,0(a5)
	lbu	a5,-17(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-17(s0)
	li	a5,198
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-227
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-26(s0)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a5,0(a5)
	lh	a4,-26(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	sb	a4,0(a5)
	j	lab251
lab247: 	lbu	a5,-17(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-17(s0)
	li	a5,103
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-179
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-20(s0)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a5,0(a5)
	lh	a4,-20(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	sb	a4,0(a5)
	lbu	a4,-17(s0)
	li	a5,183
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-91
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-22(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,0(a5)
	lh	a4,-22(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,0(a5)
	nop
lab251: 	j	lab248
	lbu	a5,-33(s0)
	li	a4,3
	beq	a5,a4,lab252
	li	a4,3
	blt	a4,a5,lab253
	li	a4,2
	beq	a5,a4,lab254
	li	a4,2
	blt	a4,a5,lab253
	beqz	a5,lab255
	li	a4,1
	beq	a5,a4,lab256
	j	lab253
lab255: 	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	j	lab257
lab256: 	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a4,-17(s0)
	sb	a4,128(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a4,-17(s0)
	sb	a4,128(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a4,-17(s0)
	sb	a4,128(a5)
	j	lab257
lab254: 	lbu	a4,-17(s0)
	li	a5,88
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-44
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-24(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,0(a5)
	lh	a4,-24(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,0(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,128(a5)
	lh	a4,-24(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,128(a5)
	lbu	a5,-17(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-17(s0)
	li	a5,198
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-227
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-26(s0)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a5,0(a5)
	lh	a4,-26(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	sb	a4,0(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a5,128(a5)
	lh	a4,-26(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	sb	a4,128(a5)
	j	lab257
lab252: 	lbu	a5,-17(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-17(s0)
	li	a5,103
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-179
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-20(s0)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a5,0(a5)
	lh	a4,-20(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	sb	a4,0(a5)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a5,128(a5)
	lh	a4,-20(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	sb	a4,128(a5)
	lbu	a4,-17(s0)
	li	a5,183
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-91
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-22(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,0(a5)
	lh	a4,-22(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,0(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,128(a5)
	lh	a4,-22(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,128(a5)
	nop
lab257: 	j	lab253
	lbu	a5,-33(s0)
	li	a4,3
	beq	a5,a4,lab258
	li	a4,3
	blt	a4,a5,lab259
	li	a4,2
	beq	a5,a4,lab260
	li	a4,2
	blt	a4,a5,lab259
	beqz	a5,lab261
	li	a4,1
	beq	a5,a4,lab262
	j	lab259
lab261: 	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	j	lab263
lab262: 	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a4,-17(s0)
	sb	a4,64(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a4,-17(s0)
	sb	a4,64(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a4,-17(s0)
	sb	a4,64(a5)
	j	lab263
lab260: 	lbu	a4,-17(s0)
	li	a5,88
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-44
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-24(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,0(a5)
	lh	a4,-24(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,0(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,64(a5)
	lh	a4,-24(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,64(a5)
	lbu	a5,-17(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-17(s0)
	li	a5,198
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-227
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-26(s0)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a5,0(a5)
	lh	a4,-26(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	sb	a4,0(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a5,64(a5)
	lh	a4,-26(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	sb	a4,64(a5)
	j	lab263
lab258: 	lbu	a5,-17(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-17(s0)
	li	a5,103
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-179
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-20(s0)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a5,0(a5)
	lh	a4,-20(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	sb	a4,0(a5)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a5,64(a5)
	lh	a4,-20(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	sb	a4,64(a5)
	lbu	a4,-17(s0)
	li	a5,183
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-91
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-22(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,0(a5)
	lh	a4,-22(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,0(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,64(a5)
	lh	a4,-22(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,64(a5)
	nop
lab263: 	j	lab259
	lbu	a5,-33(s0)
	li	a4,5
	bltu	a4,a5,lab264
	slli	a4,a5,0x2
	lui	a5,0x16
	addi	a5,a5,488 # 161e8 <gWinogradQuant+0x80>
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	j	lab265
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a4,-17(s0)
	sb	a4,64(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a4,-17(s0)
	sb	a4,64(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a4,-17(s0)
	sb	a4,64(a5)
	j	lab265
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a4,-17(s0)
	sb	a4,128(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a4,-17(s0)
	sb	a4,128(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a4,-17(s0)
	sb	a4,128(a5)
	j	lab265
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a4,-17(s0)
	sb	a4,192(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a4,-17(s0)
	sb	a4,192(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a4,-17(s0)
	sb	a4,192(a5)
	j	lab265
	lbu	a4,-17(s0)
	li	a5,88
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-44
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-24(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,0(a5)
	lh	a4,-24(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,0(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,64(a5)
	lh	a4,-24(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,64(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,128(a5)
	lh	a4,-24(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,128(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,192(a5)
	lh	a4,-24(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,192(a5)
	lbu	a5,-17(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-17(s0)
	li	a5,198
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-227
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-26(s0)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a5,0(a5)
	lh	a4,-26(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	sb	a4,0(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a5,64(a5)
	lh	a4,-26(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	sb	a4,64(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a5,128(a5)
	lh	a4,-26(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	sb	a4,128(a5)
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	lbu	a5,192(a5)
	lh	a4,-26(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-300 # 176e4 <gMCUBufB>
	sb	a4,192(a5)
	j	lab265
	lbu	a5,-17(s0)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lbu	a3,-17(s0)
	li	a5,103
	mul	a5,a3,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	add	a5,a4,a5
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-179
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-20(s0)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a5,0(a5)
	lh	a4,-20(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	sb	a4,0(a5)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a5,64(a5)
	lh	a4,-20(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	sb	a4,64(a5)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a5,128(a5)
	lh	a4,-20(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	sb	a4,128(a5)
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	lbu	a5,192(a5)
	lh	a4,-20(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,addAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-812 # 174e4 <gMCUBufR>
	sb	a4,192(a5)
	lbu	a4,-17(s0)
	li	a5,183
	mul	a5,a4,a5
	srli	a5,a5,0x8
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	addi	a5,a5,-91
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	sh	a5,-22(s0)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,0(a5)
	lh	a4,-22(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,0(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,64(a5)
	lh	a4,-22(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,64(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,128(a5)
	lh	a4,-22(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,128(a5)
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	lbu	a5,192(a5)
	lh	a4,-22(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,subAndClamp
	mv	a5,a0
	mv	a4,a5
	addi	a5,gp,-556 # 175e4 <gMCUBufG>
	sb	a4,192(a5)
	nop
lab265: 	j	lab264
lab248: 	nop
	j	lab246
lab253: 	nop
	j	lab246
lab259: 	nop
	j	lab246
lab264: 	nop
lab246: 	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	ret
decodeNextMCU:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	lhu	a5,1372(gp) # 17d6c <gRestartInterval>
	beqz	a5,lab266
	lhu	a5,1376(gp) # 17d70 <gRestartsLeft>
	bnez	a5,lab267
	jal	ra,processRestart
	cfed 0x32197
	mv	a5,a0
	sb	a5,-23(s0)
	lbu	a5,-23(s0)
	beqz	a5,lab267
	lbu	a5,-23(s0)
	j	lab268
lab267: 	lhu	a5,1376(gp) # 17d70 <gRestartsLeft>
	addi	a5,a5,-1
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1376(gp) # 17d70 <gRestartsLeft>
lab266: 	sb	zero,-17(s0)
	j	lab269
lab310: 	addi	a4,gp,1408 # 17d90 <gMCUOrg>
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-24(s0)
	lbu	a4,-24(s0)
	addi	a5,gp,1368 # 17d68 <gCompQuant>
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-25(s0)
	lbu	a4,-24(s0)
	addi	a5,gp,1384 # 17d78 <gCompDCTab>
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-26(s0)
	lbu	a5,-25(s0)
	beqz	a5,lab270
	addi	a5,gp,84 # 17864 <gQuant1>
	j	lab271
lab270: 	addi	a5,gp,-44 # 177e4 <gQuant0>
lab271: 	sw	a5,-32(s0)
	lbu	a5,-26(s0)
	beqz	a5,lab272
	addi	a5,gp,316 # 1794c <gHuffTab1>
	j	lab273
lab272: 	addi	a5,gp,220 # 178ec <gHuffTab0>
lab273: 	lbu	a4,-26(s0)
	beqz	a4,lab274
	addi	a4,gp,396 # 1799c <gHuffVal1>
	j	lab275
lab274: 	addi	a4,gp,300 # 1793c <gHuffVal0>
lab275: 	mv	a1,a4
	mv	a0,a5
	jal	ra,huffDecode
	cfed 0x215f7
	mv	a5,a0
	sb	a5,-33(s0)
	sh	zero,-20(s0)
	lbu	a5,-33(s0)
	andi	a5,a5,15
	sb	a5,-34(s0)
	lbu	a5,-34(s0)
	beqz	a5,lab276
	lbu	a5,-34(s0)
	mv	a0,a5
	jal	ra,getBits2
	cfed 0x2e4db
	mv	a5,a0
	sh	a5,-20(s0)
lab276: 	lbu	a4,-33(s0)
	lhu	a5,-20(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,huffExtend
	cfed 0x16fb0
	mv	a5,a0
	sh	a5,-36(s0)
	lbu	a5,-24(s0)
	addi	a4,gp,212 # 178e4 <gLastDC>
	slli	a5,a5,0x1
	add	a5,a4,a5
	lh	a5,0(a5)
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	lhu	a4,-36(s0)
	add	a5,a5,a4
	sh	a5,-36(s0)
	lbu	a5,-24(s0)
	lh	a4,-36(s0)
	addi	a3,gp,212 # 178e4 <gLastDC>
	slli	a5,a5,0x1
	add	a5,a3,a5
	sh	a4,0(a5)
	lw	a5,-32(s0)
	lh	a5,0(a5)
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	lhu	a4,-36(s0)
	mul	a5,a5,a4
	slli	a5,a5,0x10
	srli	a5,a5,0x10
	slli	a4,a5,0x10
	srai	a4,a4,0x10
	addi	a5,gp,-940 # 17464 <gCoeffBuf>
	sh	a4,0(a5)
	lbu	a4,-24(s0)
	addi	a5,gp,1388 # 17d7c <gCompACTab>
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,-37(s0)
	lbu	a5,1425(gp) # 17da1 <gReduce>
	beqz	a5,lab277
	li	a5,1
	sb	a5,-18(s0)
	j	lab278
lab289: 	beqz	a5,lab279
	addi	a5,gp,748 # 17afc <gHuffTab3>
	j	lab280
lab279: 	addi	a5,gp,412 # 179ac <gHuffTab2>
lab280: 	lbu	a4,-37(s0)
	beqz	a4,lab281
	addi	a4,gp,828 # 17b4c <gHuffVal3>
	j	lab282
lab281: 	addi	a4,gp,492 # 179fc <gHuffVal2>
lab282: 	mv	a1,a4
	mv	a0,a5
	jal	ra,huffDecode
	cfed 0x295f7
	mv	a5,a0
	sb	a5,-33(s0)
	lbu	a5,-33(s0)
	andi	a5,a5,15
	sb	a5,-34(s0)
	lbu	a5,-34(s0)
	beqz	a5,lab283
	lbu	a5,-34(s0)
	mv	a0,a5
	jal	ra,getBits2
lab283:	cfed 0x364db
 	lbu	a5,-33(s0)
	srli	a5,a5,0x4
	zext.b	a5,a5
	sh	a5,-20(s0)
	lbu	a5,-33(s0)
	andi	a5,a5,15
	sb	a5,-33(s0)
	lbu	a5,-33(s0)
	beqz	a5,lab284
	lhu	a5,-20(s0)
	beqz	a5,lab285
	lbu	a4,-18(s0)
	lhu	a5,-20(s0)
	add	a4,a4,a5
	li	a5,63
	bge	a5,a4,lab286
	li	a5,28
	j	lab268
lab286: 	lhu	a5,-20(s0)
	zext.b	a5,a5
	lbu	a4,-18(s0)
	add	a5,a5,a4
	sb	a5,-18(s0)
	j	lab285
lab284: 	lhu	a4,-20(s0)
	li	a5,15
	bne	a4,a5,lab287
	lbu	a4,-18(s0)
	li	a5,48
	bgeu	a5,a4,lab288
	li	a5,28
	j	lab268
lab288: 	lbu	a5,-18(s0)
	addi	a5,a5,15
	sb	a5,-18(s0)
lab285: 	lbu	a5,-18(s0)
	addi	a5,a5,1
	sb	a5,-18(s0)
lab278: 	lbu	a4,-18(s0)
	li	a5,63
	bgeu	a5,a4,lab289
	j	lab290
lab287: 	nop
lab290: 	lbu	a5,-17(s0)
	mv	a0,a5
	jal	ra,transformBlockReduce
	cfed 0x40bdc
	j	lab291
lab277: 	li	a5,1
	sb	a5,-18(s0)
	j	lab292
lab307: 	beqz	a5,lab293
	addi	a5,gp,748 # 17afc <gHuffTab3>
	j	lab294
lab293: 	addi	a5,gp,412 # 179ac <gHuffTab2>
lab294: 	lbu	a4,-37(s0)
	beqz	a4,lab295
	addi	a4,gp,828 # 17b4c <gHuffVal3>
	j	lab296
lab295: 	addi	a4,gp,492 # 179fc <gHuffVal2>
lab296: 	mv	a1,a4
	mv	a0,a5
	jal	ra,huffDecode
	cfed 0x315f7
	mv	a5,a0
	sb	a5,-33(s0)
	sh	zero,-22(s0)
	lbu	a5,-33(s0)
	andi	a5,a5,15
	sb	a5,-34(s0)
	lbu	a5,-34(s0)
	beqz	a5,lab297
	lbu	a5,-34(s0)
	mv	a0,a5
	jal	ra,getBits2
	cfed 0x3e4db
	mv	a5,a0
	sh	a5,-22(s0)
lab297: 	lbu	a5,-33(s0)
	srli	a5,a5,0x4
	zext.b	a5,a5
	sh	a5,-20(s0)
	lbu	a5,-33(s0)
	andi	a5,a5,15
	sb	a5,-33(s0)
	lbu	a5,-33(s0)
	beqz	a5,lab298
	lhu	a5,-20(s0)
	beqz	a5,lab299
	lbu	a4,-18(s0)
	lhu	a5,-20(s0)
	add	a4,a4,a5
	li	a5,63
	bge	a5,a4,lab300
	li	a5,28
	j	lab268
lab301: 	addi	a4,a5,1
	sb	a4,-18(s0)
	mv	a4,a5
	lui	a5,0x16
	addi	a5,a5,168 # 160a8 <ZAG>
	add	a5,a5,a4
	lb	a5,0(a5)
	mv	a3,a5
	addi	a4,gp,-940 # 17464 <gCoeffBuf>
	slli	a5,a3,0x1
	add	a5,a4,a5
	sh	zero,0(a5)
	lhu	a5,-20(s0)
	addi	a5,a5,-1
	sh	a5,-20(s0)
lab300: 	lhu	a5,-20(s0)
	bnez	a5,lab301
lab299: 	lbu	a4,-33(s0)
	lhu	a5,-22(s0)
	mv	a1,a4
	mv	a0,a5
	jal	ra,huffExtend
	cfed 0x1efb0
	mv	a5,a0
	sh	a5,-40(s0)
	lbu	a5,-18(s0)
	slli	a5,a5,0x1
	lw	a4,-32(s0)
	add	a5,a4,a5
	lh	a5,0(a5)
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	lhu	a5,-40(s0)
	mul	a5,a4,a5
	slli	a3,a5,0x10
	srli	a3,a3,0x10
	lbu	a5,-18(s0)
	lui	a4,0x16
	addi	a4,a4,168 # 160a8 <ZAG>
	add	a5,a4,a5
	lb	a5,0(a5)
	mv	a2,a5
	slli	a4,a3,0x10
	srai	a4,a4,0x10
	addi	a3,gp,-940 # 17464 <gCoeffBuf>
	slli	a5,a2,0x1
	add	a5,a3,a5
	sh	a4,0(a5)
	j	lab302
lab298: 	lhu	a4,-20(s0)
	li	a5,15
	bne	a4,a5,lab303
	lbu	a4,-18(s0)
	li	a5,48
	bgeu	a5,a4,lab304
	li	a5,28
	j	lab268
lab304: 	li	a5,16
	sh	a5,-20(s0)
	j	lab305
lab306: 	addi	a4,a5,1
	sb	a4,-18(s0)
	mv	a4,a5
	lui	a5,0x16
	addi	a5,a5,168 # 160a8 <ZAG>
	add	a5,a5,a4
	lb	a5,0(a5)
	mv	a3,a5
	addi	a4,gp,-940 # 17464 <gCoeffBuf>
	slli	a5,a3,0x1
	add	a5,a4,a5
	sh	zero,0(a5)
	lhu	a5,-20(s0)
	addi	a5,a5,-1
	sh	a5,-20(s0)
lab305: 	lhu	a5,-20(s0)
	bnez	a5,lab306
	lbu	a5,-18(s0)
	addi	a5,a5,-1
	sb	a5,-18(s0)
lab302: 	lbu	a5,-18(s0)
	addi	a5,a5,1
	sb	a5,-18(s0)
lab292: 	lbu	a4,-18(s0)
	li	a5,63
	bgeu	a5,a4,lab307
	j	lab308
lab303: 	nop
	j	lab308
lab309: 	addi	a4,a5,1
	sb	a4,-18(s0)
	mv	a4,a5
	lui	a5,0x16
	addi	a5,a5,168 # 160a8 <ZAG>
	add	a5,a5,a4
	lb	a5,0(a5)
	mv	a3,a5
	addi	a4,gp,-940 # 17464 <gCoeffBuf>
	slli	a5,a3,0x1
	add	a5,a4,a5
	sh	zero,0(a5)
lab308: 	lbu	a4,-18(s0)
	li	a5,63
	bgeu	a5,a4,lab309
	lbu	a5,-17(s0)
	mv	a0,a5
	jal	ra,transformBlock
lab291:	cfed 0x212c0
 	lbu	a5,-17(s0)
	addi	a5,a5,1
	sb	a5,-17(s0)
lab269: 	lbu	a5,1396(gp) # 17d84 <gMaxBlocksPerMCU>
	lbu	a4,-17(s0)
	bltu	a4,a5,lab310
	li	a5,0
lab268: 	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x7905d
	ret
pjpeg_decode_mcu:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	beqz	a5,lab311
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	j	lab312
lab311: 	lhu	a5,1404(gp) # 17d8c <gNumMCUSRemaining>
	bnez	a5,lab313
	li	a5,1
	j	lab312
lab313: 	jal	ra,decodeNextMCU
	cfed 0x36ebb
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	bnez	a5,lab314
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	beqz	a5,lab315
lab314: 	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	beqz	a5,lab316
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	j	lab312
lab316: 	lbu	a5,-17(s0)
	j	lab312
lab315: 	lhu	a5,1404(gp) # 17d8c <gNumMCUSRemaining>
	addi	a5,a5,-1
	slli	a4,a5,0x10
	srli	a4,a4,0x10
	sh	a4,1404(gp) # 17d8c <gNumMCUSRemaining>
	li	a5,0
lab312: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x0dc68
	ret
pjpeg_decode_init:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	mv	a5,a3
	sb	a5,-45(s0)
	lw	a5,-36(s0)
	sw	zero,0(a5)
	lw	a5,-36(s0)
	sw	zero,4(a5)
	lw	a5,-36(s0)
	sw	zero,8(a5)
	lw	a5,-36(s0)
	sw	zero,12(a5)
	lw	a5,-36(s0)
	sw	zero,16(a5)
	lw	a5,-36(s0)
	sw	zero,20(a5)
	lw	a5,-36(s0)
	sw	zero,24(a5)
	lw	a5,-36(s0)
	sw	zero,28(a5)
	lw	a5,-36(s0)
	sw	zero,32(a5)
	lw	a5,-36(s0)
	sw	zero,36(a5)
	lw	a5,-36(s0)
	sw	zero,40(a5)
	lw	a4,-40(s0)
	sw	a4,1416(gp) # 17d98 <g_pNeedBytesCallback>
	lw	a4,-44(s0)
	sw	a4,1420(gp) # 17d9c <g_pCallback_data>
	sb	zero,1424(gp) # 17da0 <gCallbackStatus>
	lbu	a4,-45(s0)
	sb	a4,1425(gp) # 17da1 <gReduce>
	jal	ra,init
	cfed 0xae7c5
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	bnez	a5,lab317
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	beqz	a5,lab318
lab317: 	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	beqz	a5,lab319
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	j	lab320
lab319: 	lbu	a5,-17(s0)
	j	lab320
lab318: 	jal	ra,locateSOFMarker
	cfed 0x9063e
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	bnez	a5,lab321
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	beqz	a5,lab322
lab321: 	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	beqz	a5,lab323
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	j	lab320
lab323: 	lbu	a5,-17(s0)
	j	lab320
lab322: 	jal	ra,initFrame
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	bnez	a5,lab324
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	beqz	a5,lab325
lab324: 	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	beqz	a5,lab326
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	j	lab320
lab326: 	lbu	a5,-17(s0)
	j	lab320
lab325: 	jal	ra,initScan
	cfed 0x41a7d
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	bnez	a5,lab327
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	beqz	a5,lab328
lab327: 	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	beqz	a5,lab329
	lbu	a5,1424(gp) # 17da0 <gCallbackStatus>
	j	lab320
lab329: 	lbu	a5,-17(s0)
	j	lab320
lab328: 	lhu	a5,1350(gp) # 17d56 <gImageXSize>
	mv	a4,a5
	lw	a5,-36(s0)
	sw	a4,0(a5)
	lhu	a5,1352(gp) # 17d58 <gImageYSize>
	mv	a4,a5
	lw	a5,-36(s0)
	sw	a4,4(a5)
	lbu	a5,1354(gp) # 17d5a <gCompsInFrame>
	mv	a4,a5
	lw	a5,-36(s0)
	sw	a4,8(a5)
	lw	a4,1392(gp) # 17d80 <gScanType>
	lw	a5,-36(s0)
	sw	a4,20(a5)
	lhu	a5,1400(gp) # 17d88 <gMaxMCUSPerRow>
	mv	a4,a5
	lw	a5,-36(s0)
	sw	a4,12(a5)
	lhu	a5,1402(gp) # 17d8a <gMaxMCUSPerCol>
	mv	a4,a5
	lw	a5,-36(s0)
	sw	a4,16(a5)
	lbu	a5,1397(gp) # 17d85 <gMaxMCUXSize>
	mv	a4,a5
	lw	a5,-36(s0)
	sw	a4,24(a5)
	lbu	a5,1398(gp) # 17d86 <gMaxMCUYSize>
	mv	a4,a5
	lw	a5,-36(s0)
	sw	a4,28(a5)
	lw	a5,-36(s0)
	addi	a4,gp,-812 # 174e4 <gMCUBufR>
	sw	a4,32(a5)
	lw	a5,-36(s0)
	addi	a4,gp,-556 # 175e4 <gMCUBufG>
	sw	a4,36(a5)
	lw	a5,-36(s0)
	addi	a4,gp,-300 # 176e4 <gMCUBufB>
	sw	a4,40(a5)
	li	a5,0
lab320: 	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x65fd2
	ret
pjpeg_need_bytes_callback:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	mv	a5,a1
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	sb	a5,-37(s0)
	lbu	a3,-37(s0)
	lw	a5,-972(gp) # 17444 <jpeg_off>
	li	a4,570
	sub	a4,a4,a5
	mv	a5,a3
	bgeu	a4,a5,lab330
	mv	a5,a4
lab330: 	sw	a5,-20(s0)
	lw	a4,-972(gp) # 17444 <jpeg_off>
	lui	a5,0x16
	addi	a5,a5,512 # 16200 <jpeg_data>
	add	a5,a4,a5
	lw	a2,-20(s0)
	mv	a1,a5
	lw	a0,-36(s0)
	jal	ra,memcpy
	lw	a5,-20(s0)
	zext.b	a4,a5
	lw	a5,-44(s0)
	sb	a4,0(a5)
	lw	a4,-972(gp) # 17444 <jpeg_off>
	lw	a5,-20(s0)
	add	a4,a4,a5
	sw	a4,-972(gp) # 17444 <jpeg_off>
	li	a5,0
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	ret
verify_benchmark:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	addi	a5,gp,1428 # 17da4 <pInfo>
	lw	a4,32(a5)
	li	a2,64
	lui	a5,0x16
	addi	a1,a5,1084 # 1643c <r_ref.2>
	mv	a0,a4
	jal	ra,memcmp
	mv	a5,a0
	bnez	a5,lab331
	addi	a5,gp,1428 # 17da4 <pInfo>
	lw	a4,36(a5)
	li	a2,64
	lui	a5,0x16
	addi	a1,a5,1148 # 1647c <g_ref.1>
	mv	a0,a4
	jal	ra,memcmp
	mv	a5,a0
	bnez	a5,lab331
	addi	a5,gp,1428 # 17da4 <pInfo>
	lw	a4,40(a5)
	li	a2,64
	lui	a5,0x16
	addi	a1,a5,1212 # 164bc <b_ref.0>
	mv	a0,a4
	jal	ra,memcmp
	mv	a5,a0
	bnez	a5,lab331
	li	a5,1
	j	lab332
lab331: 	li	a5,0
lab332: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	cfes 0x07dbb
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
	cfed 0x28890
	sw	a0,-20(s0)
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0xcd0ad
	ret
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a0,6
	jal	ra,benchmark_body
	cfed 0x30890
	mv	a5,a0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0xe8cf8
	ret
benchmark_body:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	j	lab333
lab336: 	li	a3,0
	li	a2,0
	lui	a5,0x16
	addi	a1,a5,-2024 # 15818 <pjpeg_need_bytes_callback>
	addi	a0,gp,1428 # 17da4 <pInfo>
	jal	ra,pjpeg_decode_init
	cfed 0x61f46
	mv	a5,a0
	sb	a5,-21(s0)
lab335: 	cfed 0xc22b0
	mv	a5,a0
	sb	a5,-21(s0)
	lbu	a4,-21(s0)
	li	a5,1
	beq	a4,a5,lab334
	j	lab335
lab334: 	nop
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab333: 	lw	a4,-20(s0)
	lw	a5,-36(s0)
	blt	a4,a5,lab336
	li	a5,0
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x8f688
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
	cfed 0x32e6b
	jal	ra,start_trigger
	jal	ra,benchmark
	cfed 0x07220
	mv	a5,a0
	sw	a5,-24(s0)
	jal	ra,stop_trigger
	lw	a5,-24(s0)
	mv	a0,a5
	jal	ra,verify_benchmark
	cfed 0xe015d
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	seqz	a5,a5
	zext.b	a5,a5
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0xb97e7
	ret
__libc_init_array:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s2,0(sp)
	lui	s0,0x17
	lui	s2,0x17
	addi	a5,s0,4 # 17004 <__init_array_start>
	addi	s2,s2,4 # 17004 <__init_array_start>
	sub	s2,s2,a5
	sw	ra,12(sp)
	sw	s1,4(sp)
	srai	s2,s2,0x2
	beqz	s2,lab337
	addi	s0,s0,4
	li	s1,0
lab338: 	addi	s1,s1,1
	addi	s0,s0,4
	jalr	a5
	bne	s2,s1,lab338
lab337: 	lui	s0,0x17
	lui	s2,0x17
	addi	a5,s0,4 # 17004 <__init_array_start>
	addi	s2,s2,12 # 1700c <__do_global_dtors_aux_fini_array_entry>
	sub	s2,s2,a5
	srai	s2,s2,0x2
	beqz	s2,lab339
	addi	s0,s0,4
	li	s1,0
lab340: 	addi	s1,s1,1
	addi	s0,s0,4
	jalr	a5
	bne	s2,s1,lab340
lab339: 	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lw	s2,0(sp)
	addi	sp,sp,16
	cfes 0xcef20
	ret
memcmp:
	li	a5,3
	bgeu	a5,a2,lab341
	or	a5,a0,a1
	andi	a5,a5,3
	li	a3,3
	bnez	a5,lab342
lab343: 	lw	a5,0(a1)
	bne	a4,a5,lab342
	addi	a2,a2,-4
	addi	a0,a0,4
	addi	a1,a1,4
	bltu	a3,a2,lab343
lab341: 	addi	a3,a2,-1
	beqz	a2,lab344
lab347: 	add	a3,a0,a3
	j	lab345
lab346: lab345: 	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,lab346
	sub	a0,a5,a4
	ret
lab344: 	li	a0,0
	ret
lab342: 	addi	a3,a2,-1
	j	lab347
memcpy:
	xor	a5,a0,a1
	andi	a5,a5,3
	add	a7,a0,a2
	bnez	a5,lab348
	li	a5,3
	bgeu	a5,a2,lab348
	andi	a5,a0,3
	mv	a4,a0
	bnez	a5,lab349
lab356: 	sub	a3,a2,a4
	li	a5,32
	li	t0,32
	blt	a5,a3,lab350
lab355: 	mv	a5,a4
	bgeu	a4,a2,lab351
lab352: 	addi	a5,a5,4
	addi	a3,a3,4
	sw	a6,-4(a5)
	bltu	a5,a2,lab352
	addi	a5,a2,-1
	sub	a5,a5,a4
	andi	a5,a5,-4
	addi	a5,a5,4
	add	a4,a4,a5
	add	a1,a1,a5
lab351: 	bltu	a4,a7,lab353
lab354: lab348: 	mv	a4,a0
	bgeu	a0,a7,lab354
lab353: 	lbu	a5,0(a1)
	addi	a4,a4,1
	addi	a1,a1,1
	sb	a5,-1(a4)
	bltu	a4,a7,lab353
	ret
lab350: 	lw	a3,4(a1)
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
	blt	t0,a5,lab350
	j	lab355
lab349: 	lbu	a3,0(a1)
	addi	a4,a4,1
	andi	a5,a4,3
	sb	a3,-1(a4)
	addi	a1,a1,1
	beqz	a5,lab356
	lbu	a3,0(a1)
	addi	a4,a4,1
	andi	a5,a4,3
	sb	a3,-1(a4)
	addi	a1,a1,1
	bnez	a5,lab349
	j	lab356
memset:
	li	t1,15
	mv	a4,a0
	bgeu	t1,a2,lab357
	andi	a5,a4,15
	bnez	a5,lab358
lab362: lab361: 	andi	a2,a2,15
	add	a3,a3,a4
lab360: 	sw	a1,4(a4)
	sw	a1,8(a4)
	sw	a1,12(a4)
	addi	a4,a4,16
	bltu	a4,a3,lab360
	bnez	a2,lab357
	ret
lab357: 	sub	a3,t1,a2
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
lab359: 	zext.b	a1,a1
	slli	a3,a1,0x8
	or	a1,a1,a3
	slli	a3,a1,0x10
	or	a1,a1,a3
	j	lab361
lab358: 	slli	a3,a5,0x2
	auipc	t0,0x0
	add	a3,a3,t0
	mv	t0,ra
	jalr	-96(a3)
	mv	ra,t0
	addi	a5,a5,-16
	sub	a4,a4,a5
	add	a2,a2,a5
	bgeu	t1,a2,lab357
	j	lab362
__call_exitprocs:
	addi	sp,sp,-48
	sw	s4,24(sp)
	lw	s4,-984(gp) # 17438 <_global_impure_ptr>
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
	beqz	s2,lab363
	mv	s6,a0
	mv	s7,a1
	li	s5,1
	li	s3,-1
lab370: 	addi	s0,s1,-1
	bltz	s0,lab363
	slli	s1,s1,0x2
	add	s1,s2,s1
lab365: 	lw	a5,260(s1)
	beq	a5,s7,lab364
lab367: 	addi	s1,s1,-4
	bne	s0,s3,lab365
lab363: 	lw	ra,44(sp)
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
	cfes 0xc6942
	ret
lab364: 	lw	a5,4(s2)
	lw	a3,4(s1)
	addi	a5,a5,-1
	beq	a5,s0,lab366
	sw	zero,4(s1)
lab373: 	lw	a5,392(s2)
	sll	a4,s5,s0
	lw	s8,4(s2)
	and	a5,a4,a5
	bnez	a5,lab368
	jalr	a3
lab372: 	lw	a5,328(s4)
	bne	a4,s8,lab369
	beq	a5,s2,lab367
lab369: 	beqz	a5,lab363
	mv	s2,a5
	j	lab370
lab368: 	lw	a5,396(s2)
	lw	a1,132(s1)
	and	a4,a4,a5
	bnez	a4,lab371
	mv	a0,s6
	jalr	a3
	j	lab372
lab366: 	sw	s0,4(s2)
	j	lab373
lab371: 	mv	a0,a1
	jalr	a3
	j	lab372
__libc_fini_array:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lui	a5,0x17
	lui	s0,0x17
	addi	a5,a5,12 # 1700c <__do_global_dtors_aux_fini_array_entry>
	addi	s0,s0,16 # 17010 <impure_data>
	sub	s0,s0,a5
	sw	s1,4(sp)
	sw	ra,12(sp)
	srai	s1,s0,0x2
	beqz	s1,lab374
	addi	s0,s0,-4
	add	s0,s0,a5
lab375: 	addi	s1,s1,-1
	addi	s0,s0,-4
	jalr	a5
	cfed 0x015d3
	bnez	s1,lab375
lab374: 	lw	ra,12(sp)
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
	lw	a4,-984(gp) # 17438 <_global_impure_ptr>
	lw	a5,328(a4)
	beqz	a5,lab376
lab380: 	li	a6,31
	blt	a6,a4,lab377
	slli	a6,a4,0x2
	beqz	a0,lab378
	add	t1,a5,a6
	sw	a2,136(t1) # 10208 <getChar>
	lw	a7,392(a5)
	li	a2,1
	sll	a2,a2,a4
	or	a7,a7,a2
	sw	a7,392(a5)
	sw	a3,264(t1)
	li	a3,2
	beq	a0,a3,lab379
lab378: 	addi	a4,a4,1
	sw	a4,4(a5)
	add	a5,a5,a6
	sw	a1,8(a5)
	li	a0,0
	ret
lab376: 	addi	a5,a4,332
	sw	a5,328(a4)
	j	lab380
lab379: 	lw	a3,396(a5)
	addi	a4,a4,1
	sw	a4,4(a5)
	or	a3,a3,a2
	sw	a3,396(a5)
	add	a5,a5,a6
	sw	a1,8(a5)
	li	a0,0
	ret
lab377: 	li	a0,-1
	ret
_exit:
	li	a7,93
	ecall
	bltz	a0,lab381
lab382: lab381: 	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	sw	ra,12(sp)
	neg	s0,s0
	jal	ra,__errno
	sw	s0,0(a0)
lab383: __errno:
	lw	a0,-980(gp) # 1743c <_impure_ptr>
	ret


	.section .rodata

ZAG:
	.2byte	0x100
	.2byte	0x1008
	.2byte	0x209
	.4byte	0x18110a03
	.2byte	0x1920
	.2byte	0xb12
	.2byte	0x504
	.2byte	0x130c
	.2byte	0x211a
	.2byte	0x3028
	.2byte	0x2229
	.4byte	0x60d141b
	.4byte	0x1c150e07
	.4byte	0x38312a23
	.2byte	0x3239
	.4byte	0x161d242b
	.4byte	0x251e170f
	.2byte	0x332c
	.2byte	0x3b3a
	.2byte	0x2d34
	.2byte	0x1f26
	.4byte	0x3c352e27
	.2byte	0x363d
	.4byte	0x3f3e372f
	.2byte	0x6b8
	.2byte	0x1
	.2byte	0x6c0
	.2byte	0x1
	.2byte	0x6c8
	.2byte	0x1
	.2byte	0x6d0
	.2byte	0x1
	.2byte	0x6d8
	.2byte	0x1
	.2byte	0x6e0
	.2byte	0x1
	.2byte	0x6e8
	.2byte	0x1
	.2byte	0x6f0
	.2byte	0x1
	.2byte	0x6f8
	.2byte	0x1
	.2byte	0x700
	.2byte	0x1
	.2byte	0x708
	.2byte	0x1
	.2byte	0x710
	.2byte	0x1
	.2byte	0x718
	.2byte	0x1
	.2byte	0x724
	.2byte	0x1
	.2byte	0x72c
	.2byte	0x1
	.2byte	0x734
	.2byte	0x1
	.2byte	0x788
	.2byte	0x1
	.2byte	0x790
	.2byte	0x1
	.2byte	0x798
	.2byte	0x1
	.2byte	0x7a0
	.2byte	0x1
	.2byte	0x7a8
	.2byte	0x1
	.2byte	0x7b0
	.2byte	0x1
	.2byte	0x7b8
	.2byte	0x1
	.2byte	0x7c0
	.2byte	0x1
	.2byte	0x7c8
	.2byte	0x1
	.2byte	0x7d0
	.2byte	0x1
	.2byte	0x7d8
	.2byte	0x1
	.2byte	0x7e0
	.2byte	0x1
	.2byte	0x7e8
	.2byte	0x1
	.2byte	0x7f4
	.2byte	0x1
	.2byte	0x800
	.2byte	0x1
	.2byte	0x80c
	.2byte	0x1
gWinogradQuant:
	.2byte	0xb280
	.2byte	0xa7b2
	.2byte	0xa7f6
	.4byte	0x97e8e897
	.2byte	0xd180
	.4byte	0x6580d1db
	.2byte	0xc5b2
	.2byte	0xb2c5
	.2byte	0x4565
	.4byte	0xa7b1a78b
	.4byte	0x6023458b
	.4byte	0x83979783
	.2byte	0x2360
	.2byte	0x5b31
	.2byte	0x8076
	.2byte	0x5b76
	.2byte	0x2e31
	.2byte	0x6551
	.2byte	0x5165
	.2byte	0x2a2e
	.2byte	0x4f45
	.2byte	0x2a45
	.4byte	0x23363623
	.2byte	0x251c
	.2byte	0x131c
	.4byte	0x41b00a13
	.2byte	0x1
	.2byte	0x41bc
	.2byte	0x1
	.2byte	0x4290
	.2byte	0x1
	.2byte	0x4208
	.2byte	0x1
	.2byte	0x4318
	.2byte	0x1
	.2byte	0x433c
	.2byte	0x1
	.2byte	0x4348
	.2byte	0x1
	.2byte	0x4354
	.2byte	0x1
	.2byte	0x4360
	.2byte	0x1
	.2byte	0x436c
	.2byte	0x1
	.2byte	0x43a0
	.2byte	0x1
	.2byte	0x4480
	.2byte	0x1
	.2byte	0x4490
	.2byte	0x1
	.2byte	0x48f8
	.2byte	0x1
	.2byte	0x4658
	.2byte	0x1
	.2byte	0x4b98
	.2byte	0x1
	.2byte	0x4bbc
	.2byte	0x1
	.2byte	0x4be4
	.2byte	0x1
	.2byte	0x4c0c
	.2byte	0x1
	.2byte	0x4c34
	.2byte	0x1
	.2byte	0x4c5c
	.2byte	0x1
	.2byte	0x4e08
	.2byte	0x1
jpeg_data:
	.2byte	0xd8ff
	.2byte	0xe0ff
	.2byte	0x1000
	.2byte	0x464a
	.2byte	0x4649
	.2byte	0x100
	.2byte	0x101
	.2byte	0x4800
	.2byte	0x4800
	.4byte	0x0000
	.2byte	0xdbff
	.2byte	0x4300
	.2byte	0x5000
	.4byte	0x3c463c37
	.2byte	0x5032
	.2byte	0x4146
	.2byte	0x5a46
	.2byte	0x5055
	.byte	0x5f, 0x78, 0xc8, 0x82, 0x78, 0x6e
	.2byte	0x786e
	.2byte	0xaff5
	.2byte	0x91b9
	.2byte	0xffc8
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.4byte	0x14300db
	.2byte	0x5a55
	.2byte	0x785a
	.2byte	0x7869
	.4byte	0xeb8282eb
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xffff
	.2byte	0xc0ff
	.2byte	0x1100
	.2byte	0x8
	.2byte	0x40
	.4byte	0x11010333
	.2byte	0x200
	.2byte	0x111
	.4byte	0xff011103
	.2byte	0xc4
	.2byte	0x18
	.2byte	0x300
	.2byte	0x101
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x201
	.4byte	0xff040003
	.2byte	0xc4
	.2byte	0x1026
	.2byte	0x200
	.2byte	0x102
	.4byte	0x03040303
	.2byte	0x1
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x201
	.2byte	0x1100
	.4byte	0x31211203
	.2byte	0x6141
	.2byte	0x471
	.2byte	0x5322
	.2byte	0x1391
	.4byte	0xff625123
	.2byte	0xc4
	.2byte	0x115
	.2byte	0x101
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x100
	.2byte	0xc4ff
	.2byte	0x1400
	.2byte	0x111
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0xdaff
	.2byte	0xc00
	.4byte	0x02000103
	.2byte	0x311
	.2byte	0x11
	.8byte	0x664d280b88c7003f
	.2byte	0x2e1
	.4byte	0x450558cf
	.2byte	0x88
	.2byte	0x10a9
	.2byte	0xe34
	.4byte	0x54686faf
	.4byte	0x61036433
	.2byte	0x6a02
	.2byte	0xdb49
	.2byte	0x8449
	.2byte	0x5059
	.2byte	0x5091
	.2byte	0x3da0
	.2byte	0x80a4
	.2byte	0x887c
	.2byte	0xd518
	.2byte	0x548
	.2byte	0x4309
	.4byte	0x2b00ffeb
	.2byte	0x2f5
	.2byte	0xd478
	.2byte	0xac1c
	.2byte	0x1048
	.2byte	0xb58e
	.2byte	0xa855
	.2byte	0xa50c
	.4byte	0x2a52db2f
	.2byte	0x5319
	.2byte	0x82f6
	.2byte	0xa104
	.2byte	0x450e
	.2byte	0x84f8
	.2byte	0xad0d
	.2byte	0x217e
	.2byte	0xd020
	.2byte	0x430
	.4byte	0x43995c93
	.2byte	0xc6e2
	.4byte	0xd7d42057
	.2byte	0x207d
	.2byte	0xe13a
	.2byte	0xf640
	.2byte	0xf149
	.2byte	0xa320
	.4byte	0x9c5178b
	.4byte	0x5352647
	.2byte	0x1eb5
	.2byte	0x7520
	.2byte	0x9502
	.2byte	0xfac0
	.2byte	0xcf81
	.2byte	0xc52
	.2byte	0xd6c
	.2byte	0x25a0
	.2byte	0xddbd
	.2byte	0xf3d1
	.2byte	0x282a
	.4byte	0xe04b043
	.2byte	0xdc3a
	.2byte	0xb229
	.4byte	0x116af813
	.2byte	0x5325
	.2byte	0xa922
	.2byte	0xe07d
	.2byte	0xa82e
	.2byte	0xc106
	.2byte	0xa0da
	.2byte	0x2129
	.2byte	0x304d
	.2byte	0x2a35
	.2byte	0xb928
	.4byte	0x15068517
	.2byte	0x9750
	.2byte	0xd88c
	.4byte	0x01e520ef
	.2byte	0xd3f9
	.2byte	0xa152
	.2byte	0xeb5
	.2byte	0x14b0
	.2byte	0x3990
	.2byte	0x2832
	.2byte	0x60e2
	.2byte	0x17d9
	.2byte	0xa2cc
	.2byte	0xb1d9
	.2byte	0x3502
	.2byte	0x1e58
	.2byte	0xc60
	.2byte	0x9558
	.2byte	0xa606
	.2byte	0xf820
	.2byte	0x3b90
	.4byte	0xb3b04167
	.2byte	0x4f02
	.2byte	0x559c
	.2byte	0x8e40
	.2byte	0xfeb5
	.2byte	0x5109
	.2byte	0xd712
	.2byte	0xfd01
	.4byte	0x7b99113b
	.2byte	0x5598
	.2byte	0x4b7d
	.4byte	0xec0064bb
	.2byte	0x4bd
	.2byte	0x4505
	.2byte	0x3662
	.2byte	0x3bb2
	.2byte	0x1b42
	.2byte	0x1c2a
	.2byte	0x7440
	.2byte	0x11b8
	.2byte	0x6
	.2byte	0x1fb8
	.2byte	0xd9ff
	.4byte	0x0000
r_ref.2:
	.2byte	0x2121
	.2byte	0x2121
	.2byte	0x2121
	.2byte	0x2121
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x2020
	.2byte	0x1d1d
	.2byte	0x1d1d
	.2byte	0x1d1d
	.2byte	0x1d1d
	.2byte	0x1919
	.2byte	0x1919
	.2byte	0x1919
	.2byte	0x1919
	.2byte	0x1515
	.2byte	0x1515
	.2byte	0x1515
	.2byte	0x1515
	.2byte	0x1111
	.2byte	0x1111
	.2byte	0x1111
	.2byte	0x1111
	.2byte	0xe0e
	.2byte	0xe0e
	.2byte	0xe0e
	.2byte	0xe0e
	.2byte	0xd0d
	.2byte	0xd0d
	.2byte	0xd0d
	.2byte	0xd0d
g_ref.1:
	.2byte	0x3535
	.2byte	0x3535
	.2byte	0x3535
	.2byte	0x3535
	.2byte	0x3434
	.2byte	0x3434
	.2byte	0x3434
	.2byte	0x3434
	.2byte	0x3131
	.2byte	0x3131
	.2byte	0x3131
	.2byte	0x3131
	.2byte	0x2d2d
	.2byte	0x2d2d
	.2byte	0x2d2d
	.2byte	0x2d2d
	.2byte	0x2929
	.2byte	0x2929
	.2byte	0x2929
	.2byte	0x2929
	.2byte	0x2525
	.2byte	0x2525
	.2byte	0x2525
	.2byte	0x2525
	.2byte	0x2222
	.2byte	0x2222
	.2byte	0x2222
	.2byte	0x2222
	.2byte	0x2121
	.2byte	0x2121
	.2byte	0x2121
	.2byte	0x2121
b_ref.0:
	.4byte	0x43434343
	.4byte	0x43434343
	.2byte	0x4242
	.2byte	0x4242
	.2byte	0x4242
	.2byte	0x4242
	.8byte	0x3f3f3f3f3f3f3f3f
	.4byte	0x3b3b3b3b
	.4byte	0x3b3b3b3b
	.4byte	0x37373737
	.4byte	0x37373737
	.4byte	0x33333333
	.4byte	0x33333333
	.2byte	0x3030
	.2byte	0x3030
	.2byte	0x3030
	.2byte	0x3030
	.4byte	0x2f2f2f2f
	.4byte	0x2f2f2f2f


	.data

impure_data:
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x72fc
	.2byte	0x1
	.2byte	0x7364
	.2byte	0x1
	.2byte	0x73cc
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
gCoeffBuf:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gMCUBufR:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gMCUBufG:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gMCUBufB:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gQuant0:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gQuant1:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gLastDC:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gHuffTab0:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gHuffVal0:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gHuffTab1:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gHuffVal1:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gHuffTab2:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gHuffVal2:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gHuffTab3:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gHuffVal3:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gValidHuffTables:
	.4byte	0x
gValidQuantTables:
	.4byte	0x
gTemFlag:
	.4byte	0x0000
gInBuf:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
gInBufOfs:
	.4byte	0x
gInBufLeft:
	.4byte	0x
gBitBuf:
	.4byte	0x0000
gBitsLeft:
	.4byte	0x0000
gImageXSize:
	.4byte	0x0000
gImageYSize:
	.4byte	0x0000
gCompsInFrame:
	.4byte	0x0000
gCompIdent:
	.4byte	0x0000
	.4byte	0x0000
gCompHSamp:
	.4byte	0x0000
	.4byte	0x0000
gCompVSamp:
	.4byte	0x0000
	.4byte	0x0000
gCompQuant:
	.4byte	0x0000
	.4byte	0x0000
gRestartInterval:
	.4byte	0x0000
gNextRestartNum:
	.4byte	0x0000
gRestartsLeft:
	.4byte	0x0000
gCompsInScan:
	.4byte	0x0000
gCompList:
	.4byte	0x0000
	.4byte	0x0000
gCompDCTab:
	.4byte	0x0000
	.4byte	0x0000
gCompACTab:
	.4byte	0x0000
	.4byte	0x0000
gScanType:
	.4byte	0x0000
	.4byte	0x0000
gMaxBlocksPerMCU:
	.4byte	0x
gMaxMCUXSize:
	.4byte	0x
gMaxMCUYSize:
	.4byte	0x0000
gMaxMCUSPerRow:
	.4byte	0x0000
gMaxMCUSPerCol:
	.4byte	0x0000
gNumMCUSRemaining:
	.4byte	0x0000
	.4byte	0x0000
gMCUOrg:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
g_pNeedBytesCallback:
	.4byte	0x0000
	.4byte	0x0000
g_pCallback_data:
	.4byte	0x0000
	.4byte	0x0000
gCallbackStatus:
	.4byte	0x
gReduce:
	.4byte	0x0000
	.4byte	0x
pInfo:
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
	.4byte	0x0000
