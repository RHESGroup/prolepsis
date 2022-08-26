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
	cfed 0xbc8f9
	lw	a0,-984(gp) # 11438 <_global_impure_ptr>
	lw	a5,60(a0)
	beqz	a5,lab0
	jalr	a5
lab0: 	mv	a0,s0
	jal	ra,_exit
register_fini:
	li	a5,0
	beqz	a5,lab1
	lui	a0,0x10
	addi	a0,a0,1804 # 1070c <__libc_fini_array>
	j	atexit
lab1: 	ret
_start:
	auipc	gp,0x1
	addi	gp,gp,1844 # 11810 <__global_pointer$>
	addi	a0,gp,-976 # 11440 <completed.1>
	addi	a2,gp,-932 # 1146c <__BSS_END__>
	sub	a2,a2,a0
	li	a1,0
	jal	ra,memset
	auipc	a0,0x0
	addi	a0,a0,1648 # 10768 <atexit>
	beqz	a0,lab2
	auipc	a0,0x0
	addi	a0,a0,1544 # 1070c <__libc_fini_array>
	jal	ra,atexit
lab2: 	jal	ra,__libc_init_array
	cfed 0xdbca1
	lw	a0,0(sp)
	addi	a1,sp,4
	li	a2,0
	jal	ra,main
	cfed 0x18ced
	j	exit
__do_global_dtors_aux:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lbu	a5,-976(gp) # 11440 <completed.1>
	sw	ra,12(sp)
	bnez	a5,lab3
	li	a5,0
	beqz	a5,lab4
	lui	a0,0x11
	mv	a0,a0
	auipc	ra,0x0
	jalr	zero # 0 <exit-0x10094>
lab4: 	li	a5,1
	sb	a5,-976(gp) # 11440 <completed.1>
lab3: 	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0x2c07b
	ret
frame_dummy:
	li	a5,0
	beqz	a5,lab5
	lui	a0,0x11
	addi	a1,gp,-972 # 11444 <object.0>
	mv	a0,a0
	auipc	t1,0x0
	jr	zero # 0 <exit-0x10094>
lab5: 	ret
crc32pseudo:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	addi	s0,sp,32
	li	s1,-1
	sw	zero,-20(s0)
	j	lab6
lab7: 	mv	a5,a0
	zext.b	a5,a5
	xor	a5,s1,a5
	zext.b	a5,a5
	lui	a4,0x11
	addi	a4,a4,-1972 # 1084c <crc_32_tab>
	slli	a5,a5,0x2
	add	a5,a4,a5
	lw	a4,0(a5)
	srli	a5,s1,0x8
	xor	s1,a4,a5
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab6: 	lw	a4,-20(s0)
	li	a5,1023
	bge	a5,a4,lab7
	not	a5,s1
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	cfes 0xa8006
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
	cfed 0xae262
	sw	a0,-20(s0)
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x626ff
	ret
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a0,170
	jal	ra,benchmark_body
	cfed 0xa87f9
	mv	a5,a0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	cfes 0x6424e
	ret
benchmark_body:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	j	lab8
lab9: 	jal	ra,srand_beebs
	jal	ra,crc32pseudo
	cfed 0x47312
	sw	a0,-24(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab8: 	lw	a4,-20(s0)
	lw	a5,-36(s0)
	blt	a4,a5,lab9
	lw	a4,-24(s0)
	lui	a5,0x8
	addi	a5,a5,-1 # 7fff <exit-0x8095>
	and	a5,a4,a5
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	cfes 0x2cb3c
	ret
verify_benchmark:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a4,-20(s0)
	lui	a5,0xffffd
	addi	a5,a5,855 # ffffd357 <__global_pointer$+0xfffebb47>
	add	a5,a4,a5
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
	cfed 0x0cc19
	jal	ra,start_trigger
	jal	ra,benchmark
	cfed 0x795e4
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
	cfes 0xc18e4
	ret
rand_beebs:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	lw	a4,-948(gp) # 1145c <seed>
	lui	a5,0x41c65
	addi	a5,a5,-403 # 41c64e6d <__global_pointer$+0x41c5365d>
	mul	a4,a4,a5
	lui	a5,0x3
	addi	a5,a5,57 # 3039 <exit-0xd05b>
	add	a4,a4,a5
	lui	a5,0x80000
	not	a5,a5
	and	a4,a4,a5
	sw	a4,-948(gp) # 1145c <seed>
	lw	a5,-948(gp) # 1145c <seed>
	srai	a5,a5,0x10
	mv	a0,a5
	lw	s0,12(sp)
	addi	sp,sp,16
	ret
srand_beebs:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a4,-20(s0)
	sw	a4,-948(gp) # 1145c <seed>
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
__libc_init_array:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s2,0(sp)
	lui	s0,0x11
	lui	s2,0x11
	addi	a5,s0,4 # 11004 <__init_array_start>
	addi	s2,s2,4 # 11004 <__init_array_start>
	sub	s2,s2,a5
	sw	ra,12(sp)
	sw	s1,4(sp)
	srai	s2,s2,0x2
	beqz	s2,lab10
	addi	s0,s0,4
	li	s1,0
lab11: 	addi	s1,s1,1
	addi	s0,s0,4
	jalr	a5 # 80000000 <__global_pointer$+0x7ffee7f0>
	bne	s2,s1,lab11
lab10: 	lui	s0,0x11
	lui	s2,0x11
	addi	a5,s0,4 # 11004 <__init_array_start>
	addi	s2,s2,12 # 1100c <__do_global_dtors_aux_fini_array_entry>
	sub	s2,s2,a5
	srai	s2,s2,0x2
	beqz	s2,lab12
	addi	s0,s0,4
	li	s1,0
lab13: 	addi	s1,s1,1
	addi	s0,s0,4
	jalr	a5
	bne	s2,s1,lab13
lab12: 	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lw	s2,0(sp)
	addi	sp,sp,16
	cfes 0x02d93
	ret
memset:
	li	t1,15
	mv	a4,a0
	bgeu	t1,a2,lab14
	andi	a5,a4,15
	bnez	a5,lab15
lab19: lab18: 	andi	a2,a2,15
	add	a3,a3,a4
lab17: 	sw	a1,4(a4)
	sw	a1,8(a4)
	sw	a1,12(a4)
	addi	a4,a4,16
	bltu	a4,a3,lab17
	bnez	a2,lab14
	ret
lab14: 	sub	a3,t1,a2
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
lab16: 	zext.b	a1,a1
	slli	a3,a1,0x8
	or	a1,a1,a3
	slli	a3,a1,0x10
	or	a1,a1,a3
	j	lab18
lab15: 	slli	a3,a5,0x2
	auipc	t0,0x0
	add	a3,a3,t0
	mv	t0,ra
	jalr	-96(a3)
	mv	ra,t0
	addi	a5,a5,-16
	sub	a4,a4,a5
	add	a2,a2,a5
	bgeu	t1,a2,lab14
	j	lab19
__call_exitprocs:
	addi	sp,sp,-48
	sw	s4,24(sp)
	lw	s4,-984(gp) # 11438 <_global_impure_ptr>
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
	beqz	s2,lab20
	mv	s6,a0
	mv	s7,a1
	li	s5,1
	li	s3,-1
lab27: 	addi	s0,s1,-1
	bltz	s0,lab20
	slli	s1,s1,0x2
	add	s1,s2,s1
lab22: 	lw	a5,260(s1)
	beq	a5,s7,lab21
lab24: 	addi	s1,s1,-4
	bne	s0,s3,lab22
lab20: 	lw	ra,44(sp)
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
	cfes 0x1ca12
	ret
lab21: 	lw	a5,4(s2)
	lw	a3,4(s1)
	addi	a5,a5,-1
	beq	a5,s0,lab23
	sw	zero,4(s1)
lab30: 	lw	a5,392(s2)
	sll	a4,s5,s0
	lw	s8,4(s2)
	and	a5,a4,a5
	bnez	a5,lab25
	jalr	a3
lab29: 	lw	a5,328(s4)
	bne	a4,s8,lab26
	beq	a5,s2,lab24
lab26: 	beqz	a5,lab20
	mv	s2,a5
	j	lab27
lab25: 	lw	a5,396(s2)
	lw	a1,132(s1)
	and	a4,a4,a5
	bnez	a4,lab28
	mv	a0,s6
	jalr	a3
	j	lab29
lab23: 	sw	s0,4(s2)
	j	lab30
lab28: 	mv	a0,a1
	jalr	a3
	j	lab29
__libc_fini_array:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lui	a5,0x11
	lui	s0,0x11
	addi	a5,a5,12 # 1100c <__do_global_dtors_aux_fini_array_entry>
	addi	s0,s0,16 # 11010 <impure_data>
	sub	s0,s0,a5
	sw	s1,4(sp)
	sw	ra,12(sp)
	srai	s1,s0,0x2
	beqz	s1,lab31
	addi	s0,s0,-4
	add	s0,s0,a5
lab32: 	addi	s1,s1,-1
	addi	s0,s0,-4
	jalr	a5
	cfed 0xcb6bc
	bnez	s1,lab32
lab31: 	lw	ra,12(sp)
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
	lw	a4,-984(gp) # 11438 <_global_impure_ptr>
	lw	a5,328(a4)
	beqz	a5,lab33
lab37: 	li	a6,31
	blt	a6,a4,lab34
	slli	a6,a4,0x2
	beqz	a0,lab35
	add	t1,a5,a6
	sw	a2,136(t1) # 10208 <crc32pseudo+0x7c>
	lw	a7,392(a5)
	li	a2,1
	sll	a2,a2,a4
	or	a7,a7,a2
	sw	a7,392(a5)
	sw	a3,264(t1)
	li	a3,2
	beq	a0,a3,lab36
lab35: 	addi	a4,a4,1
	sw	a4,4(a5)
	add	a5,a5,a6
	sw	a1,8(a5)
	li	a0,0
	ret
lab33: 	addi	a5,a4,332
	sw	a5,328(a4)
	j	lab37
lab36: 	lw	a3,396(a5)
	addi	a4,a4,1
	sw	a4,4(a5)
	or	a3,a3,a2
	sw	a3,396(a5)
	add	a5,a5,a6
	sw	a1,8(a5)
	li	a0,0
	ret
lab34: 	li	a0,-1
	ret
_exit:
	li	a7,93
	ecall
	bltz	a0,lab38
lab39: lab38: 	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	sw	ra,12(sp)
	neg	s0,s0
	jal	ra,__errno
	sw	s0,0(a0) # 11000 <__FRAME_END__>
lab40: __errno:
	lw	a0,-980(gp) # 1143c <_impure_ptr>
	ret


	.section .rodata

crc_32_tab:
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x3096
	.4byte	0x612c7707
	.2byte	0xee0e
	.2byte	0x51ba
	.2byte	0x9909
	.2byte	0xc419
	.2byte	0x76d
	.4byte	0x706af48f
	.2byte	0xa535
	.4byte	0x95a3e963
	.2byte	0x9e64
	.2byte	0x8832
	.4byte	0xb8a40edb
	.2byte	0x79dc
	.2byte	0xe91e
	.2byte	0xe0d5
	.2byte	0xd988
	.2byte	0x97d2
	.4byte	0x9b64c2b
	.2byte	0x7cbd
	.2byte	0x7eb1
	.4byte	0xe7b82d07
	.2byte	0x1d91
	.8byte	0x20f21db7106490bf
	.2byte	0x6ab0
	.2byte	0x7148
	.2byte	0xf3b9
	.2byte	0x41de
	.2byte	0x84be
	.2byte	0xd47d
	.2byte	0x1ada
	.4byte	0x6ddde4eb
	.2byte	0xb551
	.2byte	0xf4d4
	.4byte	0x83d385c7
	.2byte	0x9856
	.2byte	0x136c
	.2byte	0xa8c0
	.4byte	0xf97a646b
	.2byte	0xfd62
	.2byte	0xc9ec
	.2byte	0x8a65
	.4byte	0x14015c4f
	.2byte	0x6cd9
	.2byte	0x6306
	.4byte	0xfa0f3d63
	.2byte	0xdf5
	.2byte	0x8d08
	.2byte	0x20c8
	.2byte	0x3b6e
	.2byte	0x105e
	.2byte	0x4c69
	.2byte	0x41e4
	.2byte	0xd560
	.2byte	0x7172
	.4byte	0xe4d1a267
	.4byte	0xd4473c03
	.2byte	0x4b04
	.2byte	0x85fd
	.2byte	0xd20d
	.4byte	0xa50ab56b
	.2byte	0xa8fa
	.2byte	0x35b5
	.2byte	0x986c
	.2byte	0x42b2
	.2byte	0xc9d6
	.4byte	0xf940dbbb
	.2byte	0xacbc
	.4byte	0x32d86ce3
	.2byte	0x5c75
	.byte	0xdf, 0x45, 0xcf, 0x0d, 0xd6, 0xdc
	.2byte	0x3d59
	.2byte	0xabd1
	.2byte	0x30ac
	.2byte	0x26d9
	.2byte	0x3a
	.2byte	0x51de
	.2byte	0x5180
	.4byte	0x6116c8d7
	.2byte	0xbfd0
	.2byte	0xf4b5
	.2byte	0x21b4
	.4byte	0x56b3c423
	.2byte	0x9599
	.2byte	0xcfba
	.4byte	0xb8bda50f
	.2byte	0xb89e
	.2byte	0x2802
	.2byte	0x8808
	.2byte	0x5f05
	.2byte	0xd9b2
	.2byte	0xc60c
	.2byte	0xe924
	.4byte	0x7c87b10b
	.4byte	0x4c112f6f
	.2byte	0x5868
	.4byte	0xc1611dab
	.2byte	0x2d3d
	.2byte	0xb666
	.2byte	0x4190
	.2byte	0x76dc
	.2byte	0x7106
	.4byte	0x20bc01db
	.2byte	0x98d2
	.2byte	0x102a
	.2byte	0xefd5
	.2byte	0x8589
	.2byte	0x71b1
	.byte	0x1f, 0xb5, 0xb6, 0x06, 0xa5, 0xe4
	.8byte	0xc9a2e8b8d4339fbf
	.4byte	0xf9347807
	.2byte	0xf00
	.2byte	0xa88e
	.2byte	0x9609
	.2byte	0x9818
	.2byte	0xe10e
	.4byte	0x7f6a0dbb
	.2byte	0x3d2d
	.2byte	0x86d
	.4byte	0x91646c97
	.2byte	0x5c01
	.4byte	0x51f4e663
	.4byte	0x61626b6b
	.2byte	0x1c6c
	.2byte	0x30d8
	.2byte	0x8565
	.2byte	0x4e
	.2byte	0xf262
	.2byte	0x95ed
	.2byte	0x6c06
	.4byte	0x1b01a57b
	.2byte	0xf4c1
	.2byte	0x8208
	.4byte	0xf50fc457
	.2byte	0xd9c6
	.2byte	0x65b0
	.2byte	0xe950
	.4byte	0xb8ea12b7
	.2byte	0x8bbe
	.2byte	0x887c
	.2byte	0xfcb9
	.byte	0xdf, 0x1d, 0xdd, 0x62, 0x49, 0x2d
	.2byte	0x15da
	.4byte	0x8cd37cf3
	.2byte	0x4c65
	.2byte	0xfbd4
	.2byte	0x6158
	.2byte	0x4db2
	.2byte	0x51ce
	.2byte	0x3ab5
	.2byte	0x74
	.2byte	0xa3bc
	.2byte	0x30e2
	.4byte	0xa541d4bb
	.byte	0xdf, 0x4a, 0xd7, 0x95, 0xd8, 0x3d
	.2byte	0xc46d
	.2byte	0xa4d1
	.4byte	0xd3d6f4fb
	.2byte	0xe96a
	.2byte	0x4369
	.2byte	0xd9fc
	.2byte	0x346e
	.2byte	0x8846
	.4byte	0xb8d0ad67
	.2byte	0xda60
	.4byte	0x44042d73
	.2byte	0x1de5
	.4byte	0x4c5f3303
	.2byte	0xaa0a
	.2byte	0x7cc9
	.2byte	0xdd0d
	.2byte	0x713c
	.2byte	0x5005
	.2byte	0x41aa
	.2byte	0x2702
	.2byte	0x1010
	.4byte	0x2086be0b
	.2byte	0xc90c
	.2byte	0xb525
	.2byte	0x5768
	.4byte	0x206f85b3
	.2byte	0xd409
	.2byte	0xb966
	.byte	0x9f, 0xe4, 0x61, 0xce, 0x0e, 0xf9
	.2byte	0x5ede
	.2byte	0xc998
	.2byte	0x29d9
	.2byte	0x9822
	.2byte	0xb0d0
	.2byte	0xa8b4
	.4byte	0x3d17c7d7
	.4byte	0xd8159b3
	.2byte	0x2eb4
	.4byte	0xb7bd5c3b
	.2byte	0x6cad
	.2byte	0xc0ba
	.2byte	0x8320
	.2byte	0xedb8
	.2byte	0xb3b6
	.8byte	0xd29a03b6e20c9abf
	.2byte	0x74b1
	.2byte	0x4739
	.2byte	0xead5
	.4byte	0x9dd277af
	.2byte	0x2615
	.4byte	0x168304db
	.2byte	0x73dc
	.2byte	0xb12
	.4byte	0x3b84e363
	.2byte	0x9464
	.2byte	0x6a3e
	.2byte	0xd6d
	.2byte	0x5aa8
	.2byte	0x7a6a
	.4byte	0xe40ecf0b
	.2byte	0xff9d
	.2byte	0x9309
	.4byte	0xa00ae27
	.2byte	0x9eb1
	.4byte	0x93447d07
	.4byte	0xa3d2f00f
	.2byte	0x8708
	.2byte	0xf268
	.2byte	0x1e01
	.2byte	0xc2fe
	.2byte	0x6906
	.2byte	0x575d
	.2byte	0xf762
	.4byte	0x806567cb
	.2byte	0x3671
	.2byte	0x196c
	.4byte	0x6e6b06e7
	.2byte	0x1b76
	.2byte	0xfed4
	.2byte	0x2be0
	.4byte	0x7a5a89d3
	.2byte	0x10da
	.2byte	0x4acc
	.2byte	0x67dd
	.4byte	0xf9b9df6f
	.2byte	0xeff9
	.2byte	0x8ebe
	.4byte	0x17b7be43
	.2byte	0x8ed5
	.2byte	0x60b0
	.2byte	0xa3e8
	.2byte	0xd6d6
	.2byte	0x937e
	.2byte	0xa1d1
	.2byte	0xc2c4
	.2byte	0x38d8
	.2byte	0xf252
	.byte	0xdf, 0x4f, 0xf1, 0x67, 0xbb, 0xd1
	.4byte	0xa6bc5767
	.2byte	0x6dd
	.2byte	0x3fb5
	.4byte	0x48b2364b
	.2byte	0x2bda
	.2byte	0xd80d
	.2byte	0x1b4c
	.2byte	0xaf0a
	.2byte	0x4af6
	.4byte	0x7a603603
	.2byte	0x4104
	.4byte	0xdf60efc3
	.2byte	0xdf55
	.4byte	0x8eefa867
	.2byte	0x316e
	.2byte	0xbe79
	.2byte	0x4669
	.2byte	0xb38c
	.2byte	0xcb61
	.2byte	0x831a
	.2byte	0xbc66
	.2byte	0xd2a0
	.4byte	0xe236256f
	.2byte	0x5268
	.2byte	0x7795
	.2byte	0xcc0c
	.4byte	0xbb0b4703
	.2byte	0x16b9
	.2byte	0x2202
	.4byte	0x5505262f
	.2byte	0x3bbe
	.2byte	0xc5ba
	.2byte	0xb28
	.2byte	0xb2bd
	.2byte	0x5a92
	.2byte	0x2bb4
	.2byte	0x6a04
	.4byte	0xffa75cb3
	.4byte	0xcf31c2d7
	.2byte	0xb5d0
	.4byte	0x2cd99e8b
	.2byte	0xae1d
	.2byte	0x5bde
	.2byte	0xc2b0
	.2byte	0x9b64
	.2byte	0xf226
	.4byte	0xa39cec63
	.2byte	0x756a
	.2byte	0x930a
	.2byte	0x26d
	.2byte	0x6a9
	.2byte	0x9c09
	.8byte	0x72076785eb0e363f
	.4byte	0x5005713
	.2byte	0x4a82
	.8byte	0x2baee2b87a1495bf
	.2byte	0x7bb1
	.2byte	0x1b38
	.2byte	0xcb6
	.4byte	0x92d28e9b
	.2byte	0xbe0d
	.2byte	0xe5d5
	.4byte	0x7cdcefb7
	.2byte	0xdf21
	.4byte	0xd2d40bdb
	.4byte	0xe24286d3
	.2byte	0xf1d4
	.2byte	0xb3f8
	.2byte	0x68dd
	.2byte	0x836e
	.2byte	0x1fda
	.2byte	0x16cd
	.2byte	0x81be
	.4byte	0xf6b9265b
	.2byte	0x77e1
	.2byte	0x6fb0
	.4byte	0x18b74777
	.2byte	0x5ae6
	.2byte	0x8808
	.2byte	0x6a70
	.4byte	0x3bcaff0f
	.2byte	0x6606
	.2byte	0xb5c
	.2byte	0x1101
	.2byte	0x9eff
	.2byte	0x8f65
	.2byte	0xae69
	.2byte	0xf862
	.4byte	0x616bffd3
	.2byte	0xcf45
	.2byte	0x166c
	.2byte	0xe278
	.2byte	0xa00a
	.2byte	0xd2ee
	.2byte	0xd70d
	.2byte	0x8354
	.2byte	0x4e04
	.2byte	0xb3c2
	.4byte	0x26613903
	.4byte	0x16f7a767
	.2byte	0xd060
	.2byte	0x474d
	.2byte	0x4969
	.4byte	0x3e6e77db
	.2byte	0x6a4a
	.2byte	0xaed1
	.2byte	0x5adc
	.2byte	0xd9d6
	.2byte	0xb66
	.byte	0xdf, 0x40, 0xf0, 0x3b, 0xd8, 0x37
	.4byte	0xa9bcae53
	.2byte	0x9ec5
	.4byte	0xcf7fdebb
	.2byte	0x47b2
	.2byte	0xffe9
	.2byte	0x30b5
	.2byte	0xf21c
	.2byte	0xbdbd
	.2byte	0xc28a
	.2byte	0xcaba
	.2byte	0x9330
	.4byte	0xa3a653b3
	.2byte	0x24b4
	.2byte	0x3605
	.2byte	0xbad0
	.4byte	0xcdd70693
	.2byte	0x5729
	.2byte	0x54de
	.8byte	0xb3667a2e23d967bf
	.2byte	0x4ab8
	.2byte	0xc461
	.2byte	0x1b02
	.2byte	0x5d68
	.2byte	0x2b94
	.4byte	0xbe372a6f
	.4byte	0x8ea1b40b
	.2byte	0xc30c
	.4byte	0x5a05df1b
	.2byte	0xef8d
	.2byte	0x2d02


	.data

impure_data:
	.4byte	0x0000
	.4byte	0x0000
	.2byte	0x12fc
	.2byte	0x1
	.2byte	0x1364
	.2byte	0x1
	.2byte	0x13cc
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
seed:
	.4byte	0x0000
	.4byte	0x0000
heap_ptr:
	.4byte	0x0000
	.4byte	0x0000
heap_end:
	.4byte	0x0000
	.4byte	0x0000
heap_requested:
	.4byte	0x0000
	.4byte	0x0000
