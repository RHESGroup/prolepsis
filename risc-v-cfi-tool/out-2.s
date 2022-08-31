exit:
	addi	sp,sp,-16
	li	a1,0
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	jal	ra,__call_exitprocs
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
	lw	a0,0(sp)
	addi	a1,sp,4
	li	a2,0
	jal	ra,main
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
	sw	a0,-20(s0)
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	ret
benchmark:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a0,170
	jal	ra,benchmark_body
	mv	a5,a0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
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
	jal	ra,start_trigger
	jal	ra,benchmark
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
