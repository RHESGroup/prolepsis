exit:
	addi	sp,sp,-16
	li	a1,0
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	jal	ra,__call_exitprocs
	lw	a0,-1204(gp) # 19530 <_global_impure_ptr>
	lw	a5,60(a0)
	beqz	a5,lab0
	jalr	a5
lab0: 	mv	a0,s0
	jal	ra,_exit
register_fini:
	li	a5,0
	beqz	a5,lab1
	lui	a0,0x17
	addi	a0,a0,436 # 171b4 <__libc_fini_array>
	j	atexit
lab1: 	ret
_start:
	auipc	gp,0xa
	addi	gp,gp,-1784 # 199e4 <__global_pointer$>
	addi	a0,gp,-1196 # 19538 <completed.1>
	auipc	a2,0xa
	addi	a2,a2,252 # 1a1e4 <__BSS_END__>
	sub	a2,a2,a0
	li	a1,0
	jal	ra,memset
	auipc	a0,0x7
	addi	a0,a0,276 # 17210 <atexit>
	beqz	a0,lab2
	auipc	a0,0x7
	addi	a0,a0,172 # 171b4 <__libc_fini_array>
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
	lbu	a5,-1196(gp) # 19538 <completed.1>
	sw	ra,12(sp)
	bnez	a5,lab3
	li	a5,0
	beqz	a5,lab4
	lui	a0,0x19
	addi	a0,a0,244 # 190f4 <__FRAME_END__>
	auipc	ra,0x0
	jalr	zero # 0 <exit-0x10094>
lab4: 	li	a5,1
	sb	a5,-1196(gp) # 19538 <completed.1>
lab3: 	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	ret
frame_dummy:
	li	a5,0
	beqz	a5,lab5
	lui	a0,0x19
	addi	a1,gp,-1192 # 1953c <object.0>
	addi	a0,a0,244 # 190f4 <__FRAME_END__>
	auipc	t1,0x0
	jr	zero # 0 <exit-0x10094>
lab5: 	ret
Min:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	bge	a4,a5,lab6
	lw	a5,-20(s0)
	j	lab7
lab6: 	lw	a5,-24(s0)
lab7: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
TestCompare:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-24(s0)
	sw	a1,-20(s0)
	sw	a2,-32(s0)
	sw	a3,-28(s0)
	lw	a4,-24(s0)
	lw	a5,-32(s0)
	slt	a5,a4,a5
	zext.b	a5,a5
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
Range_length:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-24(s0)
	sw	a1,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	sub	a5,a4,a5
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
MakeRange:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	lw	a5,-36(s0)
	sw	a5,-32(s0)
	lw	a5,-40(s0)
	sw	a5,-28(s0)
	lw	a5,-32(s0)
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	mv	a2,a4
	mv	a3,a5
	mv	a4,a2
	mv	a5,a3
	mv	a0,a4
	mv	a1,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	ret
FloorPowerOfTwo:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srai	a5,a5,0x1
	lw	a4,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srai	a5,a5,0x2
	lw	a4,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srai	a5,a5,0x4
	lw	a4,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srai	a5,a5,0x8
	lw	a4,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srai	a5,a5,0x10
	lw	a4,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srai	a5,a5,0x1
	lw	a4,-20(s0)
	sub	a5,a4,a5
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	ret
BinaryFirst:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-48(s0)
	sw	a3,-44(s0)
	sw	a4,-52(s0)
	lw	a5,-48(s0)
	sw	a5,-20(s0)
	lw	a5,-44(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
	j	lab8
lab10: 	lw	a5,-20(s0)
	sub	a5,a4,a5
	srli	a4,a5,0x1f
	add	a5,a4,a5
	srai	a5,a5,0x1
	mv	a4,a5
	lw	a5,-20(s0)
	add	a5,a5,a4
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	slli	a5,a5,0x3
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,-40(s0)
	slli	a4,a4,0x3
	lw	a3,-36(s0)
	add	a4,a3,a4
	lw	a6,-52(s0)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab9
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	lab8
lab9: 	lw	a5,-28(s0)
	sw	a5,-24(s0)
lab8: 	lw	a4,-20(s0)
	lw	a5,-24(s0)
	blt	a4,a5,lab10
	lw	a5,-44(s0)
	addi	a5,a5,-1
	lw	a4,-20(s0)
	bne	a4,a5,lab11
	lw	a5,-20(s0)
	slli	a5,a5,0x3
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,-40(s0)
	slli	a4,a4,0x3
	lw	a3,-36(s0)
	add	a4,a3,a4
	lw	a6,-52(s0)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab11
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab11: 	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	ret
BinaryLast:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-48(s0)
	sw	a3,-44(s0)
	sw	a4,-52(s0)
	lw	a5,-48(s0)
	sw	a5,-20(s0)
	lw	a5,-44(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
	j	lab12
lab14: 	lw	a5,-20(s0)
	sub	a5,a4,a5
	srli	a4,a5,0x1f
	add	a5,a4,a5
	srai	a5,a5,0x1
	mv	a4,a5
	lw	a5,-20(s0)
	add	a5,a5,a4
	sw	a5,-28(s0)
	lw	a5,-40(s0)
	slli	a5,a5,0x3
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,-28(s0)
	slli	a4,a4,0x3
	lw	a3,-36(s0)
	add	a4,a3,a4
	lw	a6,-52(s0)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab13
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	lab12
lab13: 	lw	a5,-28(s0)
	sw	a5,-24(s0)
lab12: 	lw	a4,-20(s0)
	lw	a5,-24(s0)
	blt	a4,a5,lab14
	lw	a5,-44(s0)
	addi	a5,a5,-1
	lw	a4,-20(s0)
	bne	a4,a5,lab15
	lw	a5,-40(s0)
	slli	a5,a5,0x3
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,-20(s0)
	slli	a4,a4,0x3
	lw	a3,-36(s0)
	add	a4,a3,a4
	lw	a6,-52(s0)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab15
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab15: 	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	ret
InsertionSort:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-44(s0)
	sw	a2,-40(s0)
	sw	a3,-48(s0)
	lw	a5,-44(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	lab16
lab20: 	slli	a5,a5,0x3
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	sw	a4,-32(s0)
	lw	a5,4(a5)
	sw	a5,-28(s0)
	lw	a5,-20(s0)
	sw	a5,-24(s0)
	j	lab17
lab19: 	lui	a5,0x20000
	addi	a5,a5,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a5,a4,a5
	slli	a5,a5,0x3
	lw	a4,-36(s0)
	add	a4,a4,a5
	lw	a5,-24(s0)
	slli	a5,a5,0x3
	lw	a3,-36(s0)
	add	a5,a3,a5
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
lab17: 	lw	a5,-44(s0)
	lw	a4,-24(s0)
	bge	a5,a4,lab18
	lw	a4,-24(s0)
	lui	a5,0x20000
	addi	a5,a5,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a5,a4,a5
	slli	a5,a5,0x3
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,-48(s0)
	lw	a2,0(a5)
	lw	a3,4(a5)
	lw	a0,-32(s0)
	lw	a1,-28(s0)
	jalr	a4
	mv	a5,a0
	bnez	a5,lab19
lab18: 	lw	a5,-24(s0)
	slli	a5,a5,0x3
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,-32(s0)
	sw	a4,0(a5)
	lw	a4,-28(s0)
	sw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab16: 	lw	a5,-40(s0)
	lw	a4,-20(s0)
	blt	a4,a5,lab20
	nop
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	ret
Reverse:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-60(s0)
	sw	a2,-56(s0)
	lw	a0,-60(s0)
	lw	a1,-56(s0)
	jal	ra,Range_length
	mv	a5,a0
	srli	a4,a5,0x1f
	add	a5,a4,a5
	srai	a5,a5,0x1
	addi	a5,a5,-1
	sw	a5,-20(s0)
	j	lab21
lab22: 	lw	a5,-20(s0)
	add	a5,a4,a5
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	lw	a4,-56(s0)
	lw	a5,-20(s0)
	sub	a5,a4,a5
	mv	a4,a5
	lui	a5,0x20000
	addi	a5,a5,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a5,a4,a5
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	a5,a4,a5
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	lw	a4,0(a5)
	sw	a4,-36(s0)
	lw	a5,4(a5)
	sw	a5,-32(s0)
	lw	a5,-24(s0)
	lw	a4,-28(s0)
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	lw	a5,-28(s0)
	lw	a4,-36(s0)
	sw	a4,0(a5)
	lw	a4,-32(s0)
	sw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
lab21: 	lw	a5,-20(s0)
	bgez	a5,lab22
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	ret
BlockSwap:
	addi	sp,sp,-64
	sw	s0,60(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	sw	a3,-64(s0)
	sw	zero,-20(s0)
	j	lab23
lab24: 	lw	a5,-20(s0)
	add	a5,a4,a5
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	lw	a4,-60(s0)
	lw	a5,-20(s0)
	add	a5,a4,a5
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	a5,a4,a5
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	lw	a4,0(a5)
	sw	a4,-36(s0)
	lw	a5,4(a5)
	sw	a5,-32(s0)
	lw	a5,-24(s0)
	lw	a4,-28(s0)
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	lw	a5,-28(s0)
	lw	a4,-36(s0)
	sw	a4,0(a5)
	lw	a4,-32(s0)
	sw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab23: 	lw	a4,-20(s0)
	lw	a5,-64(s0)
	blt	a4,a5,lab24
	nop
	nop
	lw	s0,60(sp)
	addi	sp,sp,64
	ret
Rotate:
	addi	sp,sp,-80
	sw	ra,76(sp)
	sw	s0,72(sp)
	sw	s1,68(sp)
	sw	s2,64(sp)
	addi	s0,sp,80
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-64(s0)
	sw	a3,-60(s0)
	sw	a4,-68(s0)
	sw	a5,-72(s0)
	lw	a0,-64(s0)
	lw	a1,-60(s0)
	jal	ra,Range_length
	mv	a5,a0
	beqz	a5,lab25
	lw	a5,-56(s0)
	bltz	a5,lab26
	lw	a5,-64(s0)
	lw	a4,-56(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	j	lab27
lab26: 	lw	a5,-60(s0)
	lw	a4,-56(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
lab27: 	lw	a5,-64(s0)
	lw	a1,-20(s0)
	mv	a0,a5
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-28(s0)
	sw	a5,-24(s0)
	lw	a5,-60(s0)
	mv	a1,a5
	lw	a0,-20(s0)
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-36(s0)
	sw	a5,-32(s0)
	lw	a0,-28(s0)
	lw	a1,-24(s0)
	jal	ra,Range_length
	mv	s1,a0
	lw	a0,-36(s0)
	lw	a1,-32(s0)
	jal	ra,Range_length
	mv	a5,a0
	blt	a5,s1,lab28
	lw	a0,-28(s0)
	lw	a1,-24(s0)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-72(s0)
	blt	a5,a4,lab29
	lw	a5,-28(s0)
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	s1,a4,a5
	lw	a0,-28(s0)
	lw	a1,-24(s0)
	jal	ra,Range_length
	mv	a5,a0
	slli	a5,a5,0x3
	mv	a2,a5
	mv	a1,s1
	lw	a0,-68(s0)
	jal	ra,memcpy
	lw	a5,-28(s0)
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	s1,a4,a5
	lw	a5,-36(s0)
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	s2,a4,a5
	lw	a0,-36(s0)
	lw	a1,-32(s0)
	jal	ra,Range_length
	mv	a5,a0
	slli	a5,a5,0x3
	mv	a2,a5
	mv	a1,s2
	mv	a0,s1
	jal	ra,memmove
	lw	s1,-28(s0)
	lw	a0,-36(s0)
	lw	a1,-32(s0)
	jal	ra,Range_length
	mv	a5,a0
	add	a5,s1,a5
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	s1,a4,a5
	lw	a0,-28(s0)
	lw	a1,-24(s0)
	jal	ra,Range_length
	mv	a5,a0
	slli	a5,a5,0x3
	mv	a2,a5
	lw	a1,-68(s0)
	mv	a0,s1
	jal	ra,memcpy
	j	lab30
lab28: 	lw	a0,-36(s0)
	lw	a1,-32(s0)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-72(s0)
	blt	a5,a4,lab29
	lw	a5,-36(s0)
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	s1,a4,a5
	lw	a0,-36(s0)
	lw	a1,-32(s0)
	jal	ra,Range_length
	mv	a5,a0
	slli	a5,a5,0x3
	mv	a2,a5
	mv	a1,s1
	lw	a0,-68(s0)
	jal	ra,memcpy
	lw	s1,-32(s0)
	lw	a0,-28(s0)
	lw	a1,-24(s0)
	jal	ra,Range_length
	mv	a5,a0
	sub	a5,s1,a5
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	s1,a4,a5
	lw	a5,-28(s0)
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	s2,a4,a5
	lw	a0,-28(s0)
	lw	a1,-24(s0)
	jal	ra,Range_length
	mv	a5,a0
	slli	a5,a5,0x3
	mv	a2,a5
	mv	a1,s2
	mv	a0,s1
	jal	ra,memmove
	lw	a5,-28(s0)
	slli	a5,a5,0x3
	lw	a4,-52(s0)
	add	s1,a4,a5
	lw	a0,-36(s0)
	lw	a1,-32(s0)
	jal	ra,Range_length
	mv	a5,a0
	slli	a5,a5,0x3
	mv	a2,a5
	lw	a1,-68(s0)
	mv	a0,s1
	jal	ra,memcpy
	j	lab30
lab29: 	lw	a1,-28(s0)
	lw	a2,-24(s0)
	lw	a0,-52(s0)
	jal	ra,Reverse
	lw	a1,-36(s0)
	lw	a2,-32(s0)
	lw	a0,-52(s0)
	jal	ra,Reverse
	lw	a1,-64(s0)
	lw	a2,-60(s0)
	lw	a0,-52(s0)
	jal	ra,Reverse
	j	lab30
lab25: 	nop
lab30: 	lw	ra,76(sp)
	lw	s0,72(sp)
	lw	s1,68(sp)
	lw	s2,64(sp)
	addi	sp,sp,80
	ret
WikiMerge:
	addi	sp,sp,-112
	sw	ra,108(sp)
	sw	s0,104(sp)
	sw	s1,100(sp)
	sw	s2,96(sp)
	addi	s0,sp,112
	sw	a0,-84(s0)
	sw	a1,-92(s0)
	sw	a2,-88(s0)
	sw	a3,-100(s0)
	sw	a4,-96(s0)
	sw	a5,-108(s0)
	sw	a6,-104(s0)
	sw	a7,-112(s0)
	lw	a0,-100(s0)
	lw	a1,-96(s0)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,4(s0)
	blt	a5,a4,lab31
	lw	a5,0(s0)
	sw	a5,-20(s0)
	lw	a5,-108(s0)
	slli	a5,a5,0x3
	lw	a4,-84(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-100(s0)
	slli	a5,a5,0x3
	lw	a4,-84(s0)
	add	a5,a4,a5
	sw	a5,-28(s0)
	lw	a0,-100(s0)
	lw	a1,-96(s0)
	jal	ra,Range_length
	mv	a5,a0
	slli	a5,a5,0x3
	lw	a4,0(s0)
	add	a5,a4,a5
	sw	a5,-60(s0)
	lw	a5,-104(s0)
	slli	a5,a5,0x3
	lw	a4,-84(s0)
	add	a5,a4,a5
	sw	a5,-64(s0)
	lw	a0,-108(s0)
	lw	a1,-104(s0)
	jal	ra,Range_length
	mv	a5,a0
	blez	a5,lab32
	lw	a0,-100(s0)
	lw	a1,-96(s0)
	jal	ra,Range_length
	mv	a5,a0
	blez	a5,lab32
lab34: 	lw	a5,-24(s0)
	lw	a6,-112(s0)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab33
	lw	a5,-28(s0)
	lw	a4,-20(s0)
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a5,a5,8
	sw	a5,-20(s0)
	lw	a5,-28(s0)
	addi	a5,a5,8
	sw	a5,-28(s0)
	lw	a4,-20(s0)
	lw	a5,-60(s0)
	bne	a4,a5,lab34
	j	lab32
lab33: 	lw	a5,-28(s0)
	lw	a4,-24(s0)
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a5,a5,8
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	addi	a5,a5,8
	sw	a5,-28(s0)
	lw	a4,-24(s0)
	lw	a5,-64(s0)
	beq	a4,a5,lab35
	j	lab34
lab35: 	nop
lab32: 	lw	a4,-60(s0)
	lw	a5,-20(s0)
	sub	a5,a4,a5
	mv	a2,a5
	lw	a1,-20(s0)
	lw	a0,-28(s0)
	jal	ra,memcpy
	j	lab36
lab31: 	sw	zero,-32(s0)
	sw	zero,-36(s0)
	sw	zero,-40(s0)
	lw	a0,-108(s0)
	lw	a1,-104(s0)
	jal	ra,Range_length
	mv	a5,a0
	blez	a5,lab37
	lw	a0,-100(s0)
	lw	a1,-96(s0)
	jal	ra,Range_length
	mv	a5,a0
	blez	a5,lab37
lab39: 	lw	a5,-36(s0)
	add	a5,a4,a5
	slli	a5,a5,0x3
	lw	a4,-84(s0)
	add	a5,a4,a5
	lw	a3,-92(s0)
	lw	a4,-32(s0)
	add	a4,a3,a4
	slli	a4,a4,0x3
	lw	a3,-84(s0)
	add	a4,a3,a4
	lw	a6,-112(s0)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab38
	lw	a4,-100(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	slli	a5,a5,0x3
	lw	a4,-84(s0)
	add	a5,a4,a5
	sw	a5,-52(s0)
	lw	a4,-92(s0)
	lw	a5,-32(s0)
	add	a5,a4,a5
	slli	a5,a5,0x3
	lw	a4,-84(s0)
	add	a5,a4,a5
	sw	a5,-56(s0)
	lw	a5,-52(s0)
	lw	a4,0(a5)
	sw	a4,-72(s0)
	lw	a5,4(a5)
	sw	a5,-68(s0)
	lw	a5,-52(s0)
	lw	a4,-56(s0)
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	lw	a5,-56(s0)
	lw	a4,-72(s0)
	sw	a4,0(a5)
	lw	a4,-68(s0)
	sw	a4,4(a5)
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
	lw	a5,-40(s0)
	addi	a5,a5,1
	sw	a5,-40(s0)
	lw	a0,-100(s0)
	lw	a1,-96(s0)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-32(s0)
	blt	a5,a4,lab39
	j	lab37
lab38: 	lw	a4,-100(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	slli	a5,a5,0x3
	lw	a4,-84(s0)
	add	a5,a4,a5
	sw	a5,-44(s0)
	lw	a4,-108(s0)
	lw	a5,-36(s0)
	add	a5,a4,a5
	slli	a5,a5,0x3
	lw	a4,-84(s0)
	add	a5,a4,a5
	sw	a5,-48(s0)
	lw	a5,-44(s0)
	lw	a4,0(a5)
	sw	a4,-80(s0)
	lw	a5,4(a5)
	sw	a5,-76(s0)
	lw	a5,-44(s0)
	lw	a4,-48(s0)
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	lw	a5,-48(s0)
	lw	a4,-80(s0)
	sw	a4,0(a5)
	lw	a4,-76(s0)
	sw	a4,4(a5)
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
	lw	a5,-40(s0)
	addi	a5,a5,1
	sw	a5,-40(s0)
	lw	a0,-108(s0)
	lw	a1,-104(s0)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-36(s0)
	bge	a5,a4,lab40
	j	lab39
lab40: 	nop
lab37: 	lw	a4,-92(s0)
	lw	a5,-32(s0)
	add	s1,a4,a5
	lw	a4,-100(s0)
	lw	a5,-40(s0)
	add	s2,a4,a5
	lw	a0,-100(s0)
	lw	a1,-96(s0)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-32(s0)
	sub	a5,a4,a5
	mv	a3,a5
	mv	a2,s2
	mv	a1,s1
	lw	a0,-84(s0)
	jal	ra,BlockSwap
lab36: 	nop
	lw	ra,108(sp)
	lw	s0,104(sp)
	lw	s1,100(sp)
	lw	s2,96(sp)
	addi	sp,sp,112
	ret
WikiSort:
	addi	sp,sp,-432
	sw	ra,428(sp)
	sw	s0,424(sp)
	sw	s1,420(sp)
	sw	s2,416(sp)
	sw	s3,412(sp)
	addi	s0,sp,432
	lui	t0,0xfffff
	add	sp,sp,t0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a0,-372(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a1,-376(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a2,-380(a5)
	li	a5,512
	sw	a5,-76(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-376(a5)
	li	a5,32
	blt	a5,a4,lab41
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a1,-376(a5)
	li	a0,0
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-248(s0)
	sw	a5,-244(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-380(a4)
	lw	a1,-248(s0)
	lw	a2,-244(s0)
	lw	a0,-372(a5)
	jal	ra,InsertionSort
	j	lab42
lab41: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-376(a5)
	jal	ra,FloorPowerOfTwo
	sw	a0,-80(s0)
	lw	a5,-80(s0)
	srai	a4,a5,0x1f
	andi	a4,a4,15
	add	a5,a4,a5
	srai	a5,a5,0x4
	sw	a5,-84(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-376(a5)
	lw	a5,-84(s0)
	rem	a5,a4,a5
	sw	a5,-52(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-376(a5)
	lw	a5,-84(s0)
	div	a5,a4,a5
	sw	a5,-56(s0)
	sw	zero,-48(s0)
	sw	zero,-44(s0)
	j	lab43
lab45: 	sw	a5,-108(s0)
	lw	a4,-48(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	sw	a5,-48(s0)
	lw	a4,-44(s0)
	lw	a5,-52(s0)
	add	a5,a4,a5
	sw	a5,-44(s0)
	lw	a4,-44(s0)
	lw	a5,-84(s0)
	blt	a4,a5,lab44
	lw	a4,-44(s0)
	lw	a5,-84(s0)
	sub	a5,a4,a5
	sw	a5,-44(s0)
	lw	a5,-48(s0)
	addi	a5,a5,1
	sw	a5,-48(s0)
lab44: 	lw	a5,-48(s0)
	sw	a5,-116(s0)
	lw	a1,-116(s0)
	lw	a0,-108(s0)
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-240(s0)
	sw	a5,-236(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-380(a4)
	lw	a1,-240(s0)
	lw	a2,-236(s0)
	lw	a0,-372(a5)
	jal	ra,InsertionSort
lab43: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-48(s0)
	lw	a5,-376(a5)
	blt	a4,a5,lab45
	li	a5,16
	sw	a5,-40(s0)
	j	lab46
lab139: 	jal	ra,__floatsidf
	mv	a4,a0
	mv	a5,a1
	mv	a0,a4
	mv	a1,a5
	jal	ra,sqrt
	mv	a4,a0
	mv	a5,a1
	mv	a0,a4
	mv	a1,a5
	jal	ra,__fixdfsi
	mv	a5,a0
	sw	a5,-88(s0)
	lw	a4,-56(s0)
	lw	a5,-88(s0)
	div	a5,a4,a5
	addi	a5,a5,1
	sw	a5,-92(s0)
	li	a1,0
	li	a0,0
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-224(a3)
	sw	a5,-220(a3)
	li	a1,0
	li	a0,0
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-232(a3)
	sw	a5,-228(a3)
	li	a1,0
	li	a0,0
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-240(a3)
	sw	a5,-236(a3)
	li	a1,0
	li	a0,0
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-248(a3)
	sw	a5,-244(a3)
	sw	zero,-44(s0)
	lw	a5,-44(s0)
	sw	a5,-48(s0)
	j	lab47
lab128: 	sw	a5,-108(s0)
	lw	a4,-48(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	sw	a5,-48(s0)
	lw	a4,-44(s0)
	lw	a5,-52(s0)
	add	a5,a4,a5
	sw	a5,-44(s0)
	lw	a4,-44(s0)
	lw	a5,-84(s0)
	blt	a4,a5,lab48
	lw	a4,-44(s0)
	lw	a5,-84(s0)
	sub	a5,a4,a5
	sw	a5,-44(s0)
	lw	a5,-48(s0)
	addi	a5,a5,1
	sw	a5,-48(s0)
lab48: 	lw	a5,-48(s0)
	sw	a5,-112(s0)
	lw	a4,-48(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	sw	a5,-48(s0)
	lw	a4,-44(s0)
	lw	a5,-52(s0)
	add	a5,a4,a5
	sw	a5,-44(s0)
	lw	a4,-44(s0)
	lw	a5,-84(s0)
	blt	a4,a5,lab49
	lw	a4,-44(s0)
	lw	a5,-84(s0)
	sub	a5,a4,a5
	sw	a5,-44(s0)
	lw	a5,-48(s0)
	addi	a5,a5,1
	sw	a5,-48(s0)
lab49: 	lw	a5,-48(s0)
	sw	a5,-116(s0)
	lw	a4,-116(s0)
	lui	a5,0x20000
	addi	a5,a5,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a5,a4,a5
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lw	a4,-108(s0)
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab50
	lw	a4,-112(s0)
	lw	a5,-108(s0)
	sub	s1,a4,a5
	lw	a1,-116(s0)
	lw	a0,-108(s0)
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-232(s0)
	sw	a5,-228(s0)
	lui	a5,0xfffff
	addi	a5,a5,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a5,a5,-32
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a5,s0
	lw	a5,-76(s0)
	lw	a2,-232(s0)
	lw	a3,-228(s0)
	mv	a1,s1
	lw	a0,-372(a0)
	jal	ra,Rotate
	j	lab47
lab50: 	lw	a5,-112(s0)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lw	a3,-112(s0)
	lui	a4,0x20000
	addi	a4,a4,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a4,a3,a4
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab51
	j	lab47
lab51: 	lw	a1,-112(s0)
	lw	a0,-108(s0)
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-336(a3)
	sw	a5,-332(a3)
	lw	a1,-116(s0)
	lw	a0,-112(s0)
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-344(a3)
	sw	a5,-340(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-336(a5)
	lw	a1,-332(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-76(s0)
	blt	a5,a4,lab52
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-336(a5)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	s1,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-336(a5)
	lw	a1,-332(a5)
	jal	ra,Range_length
	mv	a5,a0
	slli	a4,a5,0x3
	lui	a5,0xfffff
	addi	a5,a5,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a5,a5,-32
	add	a5,a5,s0
	mv	a2,a4
	mv	a1,s1
	mv	a0,a5
	jal	ra,memcpy
	li	a1,0
	li	a0,0
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-224(s0)
	sw	a5,-220(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a4,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lui	a2,0xfffff
	addi	a2,a2,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a2,s0
	lw	a2,-76(s0)
	sw	a2,4(sp)
	lui	a2,0xfffff
	addi	a2,a2,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a2,a2,-32
	add	a2,a2,s0
	sw	a2,0(sp)
	lw	a7,-380(a5)
	lw	a5,-344(a3)
	lw	a6,-340(a3)
	lw	a3,-336(a4)
	lw	a4,-332(a4)
	lw	a1,-224(s0)
	lw	a2,-220(s0)
	lw	a0,-372(a0)
	jal	ra,WikiMerge
	j	lab47
lab52: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-224(a5)
	lw	a1,-220(a5)
	jal	ra,Range_length
	mv	a5,a0
	blez	a5,lab53
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-336(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-336(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-256(a3)
	sw	a5,-252(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-340(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-340(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-264(a3)
	sw	a5,-260(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a3,-224(a4)
	sw	a3,-272(a5)
	lw	a4,-220(a4)
	sw	a4,-268(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a3,-232(a4)
	sw	a3,-280(a5)
	lw	a4,-228(a4)
	sw	a4,-276(a5)
	j	lab54
lab53: 	li	a5,1
	sw	a5,-72(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-336(a5)
	addi	a4,a5,1
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-272(a5)
	j	lab55
lab59: 	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	mv	a4,a5
	lui	a5,0x20000
	addi	a5,a5,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a5,a4,a5
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-272(a4)
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab56
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-272(a4)
	mv	a3,a4
	lui	a4,0x20000
	addi	a4,a4,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a4,a3,a4
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab57
lab56: 	lw	a5,-72(s0)
	addi	a5,a5,1
	sw	a5,-72(s0)
	lw	a4,-72(s0)
	lw	a5,-92(s0)
	beq	a4,a5,lab58
lab57: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	addi	a4,a5,1
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-272(a5)
lab55: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-332(a5)
	blt	a4,a5,lab59
	j	lab60
lab58: 	nop
lab60: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lw	a5,-72(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-268(a5)
	lw	a4,-92(s0)
	lw	a5,-76(s0)
	blt	a5,a4,lab61
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-336(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-336(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-280(a3)
	sw	a5,-276(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-272(a5)
	lw	a1,-268(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-92(s0)
	bne	a5,a4,lab62
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-272(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lw	a5,-92(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-256(a3)
	sw	a5,-252(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-340(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-340(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-264(a3)
	sw	a5,-260(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-336(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-336(a5)
	lw	a5,-92(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-272(a3)
	sw	a5,-268(a3)
	j	lab63
lab62: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-256(a3)
	sw	a5,-252(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-336(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-336(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-272(a3)
	sw	a5,-268(a3)
	li	a5,1
	sw	a5,-72(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-340(a5)
	addi	a4,a5,-2
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-272(a5)
	j	lab64
lab68: 	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-272(a4)
	addi	a4,a4,1
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab65
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	addi	a5,a5,1
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-272(a4)
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab66
lab65: 	lw	a5,-72(s0)
	addi	a5,a5,1
	sw	a5,-72(s0)
	lw	a4,-72(s0)
	lw	a5,-92(s0)
	beq	a4,a5,lab67
lab66: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	addi	a4,a5,-1
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-272(a5)
lab64: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-344(a5)
	bge	a4,a5,lab68
	j	lab69
lab67: 	nop
lab69: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lw	a5,-72(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-268(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-272(a5)
	lw	a1,-268(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-92(s0)
	bne	a5,a4,lab63
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-272(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lw	a5,-92(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-264(a3)
	sw	a5,-260(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-340(a5)
	lw	a5,-92(s0)
	sub	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-340(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-272(a3)
	sw	a5,-268(a3)
	j	lab63
lab61: 	sw	zero,-72(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	addi	a4,a5,1
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-280(a5)
	j	lab70
lab74: 	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-280(a5)
	mv	a4,a5
	lui	a5,0x20000
	addi	a5,a5,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a5,a4,a5
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-280(a4)
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab71
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-280(a5)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-280(a4)
	mv	a3,a4
	lui	a4,0x20000
	addi	a4,a4,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a4,a3,a4
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab72
lab71: 	lw	a5,-72(s0)
	addi	a5,a5,1
	sw	a5,-72(s0)
	lw	a4,-72(s0)
	lw	a5,-92(s0)
	beq	a4,a5,lab73
lab72: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-280(a5)
	addi	a4,a5,1
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-280(a5)
lab70: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-280(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-332(a5)
	blt	a4,a5,lab74
	j	lab75
lab73: 	nop
lab75: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-280(a5)
	lw	a5,-72(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-276(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-280(a5)
	lw	a1,-276(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-92(s0)
	bne	a5,a4,lab76
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-280(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-280(a5)
	lw	a5,-92(s0)
	slli	a5,a5,0x1
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-256(a3)
	sw	a5,-252(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-340(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-340(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-264(a3)
	sw	a5,-260(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-336(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-336(a5)
	lw	a5,-92(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-272(a3)
	sw	a5,-268(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-336(a5)
	lw	a5,-92(s0)
	add	a3,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-336(a5)
	lw	a5,-92(s0)
	slli	a5,a5,0x1
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-280(a3)
	sw	a5,-276(a3)
	j	lab63
lab76: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-272(a5)
	lw	a1,-268(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-92(s0)
	bne	a5,a4,lab77
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-272(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lw	a5,-92(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-256(a3)
	sw	a5,-252(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-336(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-336(a5)
	lw	a5,-92(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-272(a3)
	sw	a5,-268(a3)
	li	a5,1
	sw	a5,-72(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-340(a5)
	addi	a4,a5,-2
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-280(a5)
	j	lab78
lab82: 	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-280(a5)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-280(a4)
	addi	a4,a4,1
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab79
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-280(a5)
	addi	a5,a5,1
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-280(a4)
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab80
lab79: 	lw	a5,-72(s0)
	addi	a5,a5,1
	sw	a5,-72(s0)
	lw	a4,-72(s0)
	lw	a5,-92(s0)
	beq	a4,a5,lab81
lab80: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-280(a5)
	addi	a4,a5,-1
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-280(a5)
lab78: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-280(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-344(a5)
	bge	a4,a5,lab82
	j	lab83
lab81: 	nop
lab83: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-280(a5)
	lw	a5,-72(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-276(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-280(a5)
	lw	a1,-276(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-92(s0)
	bne	a5,a4,lab84
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-280(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-280(a5)
	lw	a5,-92(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-264(a3)
	sw	a5,-260(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-340(a5)
	lw	a5,-92(s0)
	sub	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-340(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-280(a3)
	sw	a5,-276(a3)
	j	lab63
lab84: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-268(a5)
	j	lab63
lab77: 	li	a5,1
	sw	a5,-72(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-340(a5)
	addi	a4,a5,-2
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-272(a5)
	j	lab85
lab89: 	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-272(a4)
	addi	a4,a4,1
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab86
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	addi	a5,a5,1
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-272(a4)
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab87
lab86: 	lw	a5,-72(s0)
	addi	a5,a5,1
	sw	a5,-72(s0)
	lw	a4,-72(s0)
	lw	a5,-92(s0)
	beq	a4,a5,lab88
lab87: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	addi	a4,a5,-1
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-272(a5)
lab85: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-344(a5)
	bge	a4,a5,lab89
	j	lab90
lab88: 	nop
lab90: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lw	a5,-72(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-268(a5)
	sw	zero,-72(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	addi	a4,a5,-1
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-280(a5)
	j	lab91
lab95: 	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-280(a5)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-280(a4)
	addi	a4,a4,1
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab92
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-280(a5)
	addi	a5,a5,1
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-280(a4)
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab93
lab92: 	lw	a5,-72(s0)
	addi	a5,a5,1
	sw	a5,-72(s0)
	lw	a4,-72(s0)
	lw	a5,-92(s0)
	beq	a4,a5,lab94
lab93: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-280(a5)
	addi	a4,a5,-1
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-280(a5)
lab91: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-280(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-344(a5)
	bge	a4,a5,lab95
	j	lab96
lab94: 	nop
lab96: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-280(a5)
	lw	a5,-72(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-276(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-280(a5)
	lw	a1,-276(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-92(s0)
	bne	a5,a4,lab97
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-336(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-336(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-256(a3)
	sw	a5,-252(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-280(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-280(a5)
	lw	a5,-92(s0)
	slli	a5,a5,0x1
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-264(a3)
	sw	a5,-260(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-340(a5)
	lw	a5,-92(s0)
	sub	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-340(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-272(a3)
	sw	a5,-268(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lw	a5,-92(s0)
	sub	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-272(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-280(a3)
	sw	a5,-276(a3)
	j	lab63
lab97: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-268(a5)
lab63: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-272(a5)
	lw	a1,-268(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-92(s0)
	bge	a4,a5,lab98
	j	lab99
lab102: 	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a1,-336(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a3,s0
	lw	a4,-380(a4)
	lw	a2,-344(a5)
	lw	a3,-340(a5)
	lw	a0,-372(a0)
	jal	ra,BinaryFirst
	sw	a0,-124(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-332(a5)
	lw	a4,-124(s0)
	sub	a5,a4,a5
	sw	a5,-128(s0)
	lw	a5,-128(s0)
	neg	s1,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-336(a5)
	lw	a1,-124(s0)
	mv	a0,a5
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-216(s0)
	sw	a5,-212(s0)
	lui	a5,0xfffff
	addi	a5,a5,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a5,a5,-32
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a5,s0
	lw	a5,-76(s0)
	lw	a2,-216(s0)
	lw	a3,-212(s0)
	mv	a1,s1
	lw	a0,-372(a0)
	jal	ra,Rotate
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-124(s0)
	sw	a4,-344(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-336(a5)
	lw	a5,-128(s0)
	add	a1,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a3,s0
	lw	a4,-380(a4)
	lw	a2,-336(a5)
	lw	a3,-332(a5)
	lw	a0,-372(a0)
	jal	ra,BinaryLast
	mv	a4,a0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-344(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-336(a3)
	sw	a5,-332(a3)
lab99: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-336(a5)
	lw	a1,-332(a5)
	jal	ra,Range_length
	mv	a5,a0
	bgtz	a5,lab100
	j	lab101
lab100: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-344(a5)
	lw	a1,-340(a5)
	jal	ra,Range_length
	mv	a5,a0
	bgtz	a5,lab102
	j	lab101
lab98: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-256(a5)
	lw	a1,-252(a5)
	jal	ra,Range_length
	sw	a0,-120(s0)
	sw	zero,-72(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-256(a5)
	sw	a5,-36(s0)
	j	lab103
lab106: 	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-336(a5)
	lw	a4,-36(s0)
	beq	a4,a5,lab104
	lw	a4,-36(s0)
	lui	a5,0x20000
	addi	a5,a5,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a5,a4,a5
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lw	a4,-36(s0)
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab104
	lw	a5,-36(s0)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lw	a3,-36(s0)
	lui	a4,0x20000
	addi	a4,a4,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a4,a3,a4
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab105
lab104: 	lw	a5,-72(s0)
	neg	s1,a5
	lw	a5,-36(s0)
	addi	a4,a5,1
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-256(a5)
	addi	a5,a5,1
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-208(s0)
	sw	a5,-204(s0)
	lui	a5,0xfffff
	addi	a5,a5,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a5,a5,-32
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a5,s0
	lw	a5,-76(s0)
	lw	a2,-208(s0)
	lw	a3,-204(s0)
	mv	a1,s1
	lw	a0,-372(a0)
	jal	ra,Rotate
	lw	a4,-36(s0)
	lw	a5,-72(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-256(a5)
	lw	a5,-72(s0)
	addi	a5,a5,1
	sw	a5,-72(s0)
lab105: 	lw	a5,-36(s0)
	addi	a5,a5,-1
	sw	a5,-36(s0)
lab103: 	lw	a4,-72(s0)
	lw	a5,-120(s0)
	blt	a4,a5,lab106
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-336(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-336(a5)
	lw	a5,-120(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-256(a3)
	sw	a5,-252(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-264(a5)
	lw	a1,-260(a5)
	jal	ra,Range_length
	sw	a0,-120(s0)
	sw	zero,-72(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-264(a5)
	sw	a5,-36(s0)
	j	lab107
lab110: 	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-340(a5)
	addi	a5,a5,-1
	lw	a4,-36(s0)
	beq	a4,a5,lab108
	lw	a5,-36(s0)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lw	a4,-36(s0)
	addi	a4,a4,1
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab108
	lw	a5,-36(s0)
	addi	a5,a5,1
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lw	a4,-36(s0)
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab109
lab108: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-264(a5)
	lw	a1,-36(s0)
	mv	a0,a5
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-200(s0)
	sw	a5,-196(s0)
	lui	a5,0xfffff
	addi	a5,a5,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a5,a5,-32
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a5,s0
	lw	a5,-76(s0)
	lw	a2,-200(s0)
	lw	a3,-196(s0)
	lw	a1,-72(s0)
	lw	a0,-372(a0)
	jal	ra,Rotate
	lw	a4,-36(s0)
	lw	a5,-72(s0)
	sub	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-264(a5)
	lw	a5,-72(s0)
	addi	a5,a5,1
	sw	a5,-72(s0)
lab109: 	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
lab107: 	lw	a4,-72(s0)
	lw	a5,-120(s0)
	blt	a4,a5,lab110
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-340(a5)
	lw	a5,-120(s0)
	sub	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-340(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-264(a3)
	sw	a5,-260(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a3,-272(a4)
	sw	a3,-224(a5)
	lw	a4,-268(a4)
	sw	a4,-220(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a3,-280(a4)
	sw	a3,-232(a5)
	lw	a4,-276(a4)
	sw	a4,-228(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a3,-256(a4)
	sw	a3,-240(a5)
	lw	a4,-252(a4)
	sw	a4,-236(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a3,-264(a4)
	sw	a3,-248(a5)
	lw	a4,-260(a4)
	sw	a4,-244(a5)
lab54: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-252(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-332(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-288(a3)
	sw	a5,-284(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	s2,-252(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	s1,-252(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-288(a5)
	lw	a1,-284(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-88(s0)
	rem	a5,a4,a5
	add	a5,s1,a5
	mv	a1,a5
	mv	a0,s2
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-304(a3)
	sw	a5,-300(a3)
	sw	zero,-36(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-300(a5)
	addi	a5,a5,1
	sw	a5,-60(s0)
	j	lab111
lab112: 	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lw	a5,-36(s0)
	add	a5,a4,a5
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	sw	a5,-148(s0)
	lw	a5,-60(s0)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	sw	a5,-152(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-148(s0)
	lw	a3,0(a4)
	sw	a3,-352(a5)
	lw	a4,4(a4)
	sw	a4,-348(a5)
	lw	a5,-148(s0)
	lw	a4,-152(s0)
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	lw	a5,-152(s0)
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a3,-352(a4)
	sw	a3,0(a5)
	lw	a4,-348(a4)
	sw	a4,4(a5)
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
	lw	a4,-60(s0)
	lw	a5,-88(s0)
	add	a5,a4,a5
	sw	a5,-60(s0)
lab111: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-284(a5)
	lw	a4,-60(s0)
	blt	a4,a5,lab112
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a3,-304(a4)
	sw	a3,-312(a5)
	lw	a4,-300(a4)
	sw	a4,-308(a5)
	li	a1,0
	li	a0,0
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-320(a3)
	sw	a5,-316(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	s2,-344(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	s1,-344(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-344(a5)
	lw	a1,-340(a5)
	jal	ra,Range_length
	mv	s3,a0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-264(a5)
	lw	a1,-260(a5)
	jal	ra,Range_length
	mv	a5,a0
	sub	a5,s3,a5
	mv	a1,a5
	lw	a0,-88(s0)
	jal	ra,Min
	mv	a5,a0
	add	a5,s1,a5
	mv	a1,a5
	mv	a0,s2
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-296(a3)
	sw	a5,-292(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-304(a5)
	lw	a1,-300(a5)
	jal	ra,Range_length
	mv	a4,a0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-288(a5)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-288(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-288(a5)
	sw	a5,-64(s0)
	lw	a5,-64(s0)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,0(a4)
	sw	a3,-328(a5)
	lw	a4,4(a4)
	sw	a4,-324(a5)
	sw	zero,-60(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-312(a5)
	lw	a1,-308(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-76(s0)
	blt	a5,a4,lab113
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-312(a5)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	s1,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-312(a5)
	lw	a1,-308(a5)
	jal	ra,Range_length
	mv	a5,a0
	slli	a4,a5,0x3
	lui	a5,0xfffff
	addi	a5,a5,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a5,a5,-32
	add	a5,a5,s0
	mv	a2,a4
	mv	a1,s1
	mv	a0,a5
	jal	ra,memcpy
	j	lab114
lab113: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	s1,-312(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	s2,-280(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-312(a5)
	lw	a1,-308(a5)
	jal	ra,Range_length
	mv	a4,a0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	mv	a3,a4
	mv	a2,s2
	mv	a1,s1
	lw	a0,-372(a5)
	jal	ra,BlockSwap
lab114: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-320(a5)
	lw	a1,-316(a5)
	jal	ra,Range_length
	mv	a5,a0
	blez	a5,lab115
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-316(a5)
	mv	a4,a5
	lui	a5,0x20000
	addi	a5,a5,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a5,a4,a5
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,-328(a4)
	lw	a3,-324(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab116
lab115: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-296(a5)
	lw	a1,-292(a5)
	jal	ra,Range_length
	mv	a5,a0
	bnez	a5,lab117
lab116: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a3,s0
	lw	a4,-380(a4)
	lw	a2,-320(a5)
	lw	a3,-316(a5)
	lw	a1,-64(s0)
	lw	a0,-372(a0)
	jal	ra,BinaryFirst
	sw	a0,-132(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-316(a5)
	lw	a5,-132(s0)
	sub	a5,a4,a5
	sw	a5,-136(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-288(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-88(s0)
	lw	a2,-64(s0)
	mv	a1,a4
	lw	a0,-372(a5)
	jal	ra,BlockSwap
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-288(a5)
	addi	a5,a5,1
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	sw	a5,-140(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-272(a5)
	lw	a5,-60(s0)
	addi	a3,a5,1
	sw	a3,-60(s0)
	add	a5,a4,a5
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	sw	a5,-144(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-140(s0)
	lw	a3,0(a4)
	sw	a3,-360(a5)
	lw	a4,4(a4)
	sw	a4,-356(a5)
	lw	a5,-140(s0)
	lw	a4,-144(s0)
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a4,4(a4)
	sw	a4,4(a5)
	lw	a5,-144(s0)
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a3,-360(a4)
	sw	a3,0(a5)
	lw	a4,-356(a4)
	sw	a4,4(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-308(a5)
	lw	a1,-132(s0)
	mv	a0,a5
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-192(s0)
	sw	a5,-188(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a2,a3,s0
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a3,s0
	lw	a3,-76(s0)
	sw	a3,4(sp)
	lui	a3,0xfffff
	addi	a3,a3,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a3,a3,-32
	add	a3,a3,s0
	sw	a3,0(sp)
	lw	a7,-380(a5)
	lw	a5,-192(s0)
	lw	a6,-188(s0)
	lw	a3,-312(a4)
	lw	a4,-308(a4)
	lw	a1,-280(a2)
	lw	a2,-276(a2)
	lw	a0,-372(a0)
	jal	ra,WikiMerge
	lw	a4,-88(s0)
	lw	a5,-76(s0)
	blt	a5,a4,lab118
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-288(a5)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a4,a4,a5
	lw	a5,-88(s0)
	slli	a3,a5,0x3
	lui	a5,0xfffff
	addi	a5,a5,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a5,a5,-32
	add	a5,a5,s0
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	jal	ra,memcpy
	j	lab119
lab118: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-288(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a2,-280(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-88(s0)
	mv	a1,a4
	lw	a0,-372(a5)
	jal	ra,BlockSwap
lab119: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-288(a5)
	lw	a5,-88(s0)
	add	a4,a4,a5
	lw	a5,-136(s0)
	sub	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-136(s0)
	mv	a2,a4
	lw	a1,-132(s0)
	lw	a0,-372(a5)
	jal	ra,BlockSwap
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-288(a5)
	lw	a5,-136(s0)
	sub	a3,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-288(a5)
	lw	a5,-136(s0)
	sub	a4,a4,a5
	lw	a5,-88(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-312(a3)
	sw	a5,-308(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-308(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-308(a5)
	lw	a5,-136(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-320(a3)
	sw	a5,-316(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-288(a5)
	lw	a5,-88(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-288(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-288(a5)
	lw	a1,-284(a5)
	jal	ra,Range_length
	mv	a5,a0
	beqz	a5,lab120
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-288(a5)
	addi	a5,a5,1
	sw	a5,-64(s0)
	lw	a4,-64(s0)
	lw	a5,-88(s0)
	add	a5,a4,a5
	sw	a5,-68(s0)
	j	lab121
lab123: 	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lw	a4,-64(s0)
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	beqz	a5,lab122
	lw	a5,-68(s0)
	sw	a5,-64(s0)
lab122: 	lw	a4,-68(s0)
	lw	a5,-88(s0)
	add	a5,a4,a5
	sw	a5,-68(s0)
lab121: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-284(a5)
	lw	a4,-68(s0)
	blt	a4,a5,lab123
	lw	a5,-64(s0)
	addi	a5,a5,-1
	sw	a5,-64(s0)
	lw	a5,-64(s0)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,0(a4)
	sw	a3,-328(a5)
	lw	a4,4(a4)
	sw	a4,-324(a5)
	j	lab124
lab117: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-296(a5)
	lw	a1,-292(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-88(s0)
	bge	a4,a5,lab125
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-296(a5)
	lw	a1,-292(a5)
	jal	ra,Range_length
	mv	a5,a0
	neg	s1,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-288(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-292(a5)
	mv	a1,a5
	mv	a0,a4
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-184(s0)
	sw	a5,-180(s0)
	lui	a5,0xfffff
	addi	a5,a5,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a5,a5,-32
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a5,s0
	li	a5,0
	lw	a2,-184(s0)
	lw	a3,-180(s0)
	mv	a1,s1
	lw	a0,-372(a0)
	jal	ra,Rotate
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	s2,-288(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	s1,-288(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-296(a5)
	lw	a1,-292(a5)
	jal	ra,Range_length
	mv	a5,a0
	add	a5,s1,a5
	mv	a1,a5
	mv	a0,s2
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-320(a3)
	sw	a5,-316(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-296(a5)
	lw	a1,-292(a5)
	jal	ra,Range_length
	mv	a4,a0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-288(a5)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-288(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-296(a5)
	lw	a1,-292(a5)
	jal	ra,Range_length
	mv	a4,a0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-284(a5)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-284(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-296(a5)
	lw	a1,-292(a5)
	jal	ra,Range_length
	mv	a4,a0
	lw	a5,-64(s0)
	add	a5,a5,a4
	sw	a5,-64(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-296(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-292(a5)
	j	lab114
lab125: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-288(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a2,-296(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-88(s0)
	mv	a1,a4
	lw	a0,-372(a5)
	jal	ra,BlockSwap
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a3,-288(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-288(a5)
	lw	a5,-88(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	sw	a4,-320(a3)
	sw	a5,-316(a3)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-288(a5)
	lw	a4,-64(s0)
	bne	a4,a5,lab126
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-284(a5)
	sw	a5,-64(s0)
lab126: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-288(a5)
	lw	a5,-88(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-288(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-284(a5)
	lw	a5,-88(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-284(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-296(a5)
	lw	a5,-88(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-296(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-292(a5)
	lw	a5,-88(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-292(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-292(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-264(a5)
	bge	a5,a4,lab114
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-264(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-292(a5)
lab124: 	j	lab114
lab120: 	nop
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	s2,-308(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	s1,-340(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-264(a5)
	lw	a1,-260(a5)
	jal	ra,Range_length
	mv	a5,a0
	sub	a5,s1,a5
	mv	a1,a5
	mv	a0,s2
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-176(s0)
	sw	a5,-172(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a2,a3,s0
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a3,s0
	lw	a3,-76(s0)
	sw	a3,4(sp)
	lui	a3,0xfffff
	addi	a3,a3,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a3,a3,-32
	add	a3,a3,s0
	sw	a3,0(sp)
	lw	a7,-380(a5)
	lw	a5,-176(s0)
	lw	a6,-172(s0)
	lw	a3,-312(a4)
	lw	a4,-308(a4)
	lw	a1,-280(a2)
	lw	a2,-276(a2)
	lw	a0,-372(a0)
	jal	ra,WikiMerge
	j	lab47
lab101: 	nop
lab47: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-48(s0)
	lw	a5,-376(a5)
	bge	a4,a5,lab127
	j	lab128
lab127: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-224(a5)
	lw	a1,-220(a5)
	jal	ra,Range_length
	mv	a5,a0
	blez	a5,lab129
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a3,-380(a3)
	lw	a1,-232(a5)
	lw	a2,-228(a5)
	lw	a0,-372(a4)
	jal	ra,InsertionSort
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-240(a5)
	sw	a5,-96(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-236(a5)
	sw	a5,-36(s0)
	j	lab130
lab133: 	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-248(a5)
	lw	a4,-36(s0)
	beq	a4,a5,lab131
	lw	a5,-36(s0)
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-240(a4)
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab132
lab131: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-236(a5)
	lw	a4,-36(s0)
	sub	a5,a4,a5
	sw	a5,-104(s0)
	lw	a5,-104(s0)
	neg	s1,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-240(a5)
	lw	a1,-36(s0)
	mv	a0,a5
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-168(s0)
	sw	a5,-164(s0)
	lui	a5,0xfffff
	addi	a5,a5,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a5,a5,-32
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a5,s0
	lw	a5,-76(s0)
	lw	a2,-168(s0)
	lw	a3,-164(s0)
	mv	a1,s1
	lw	a0,-372(a0)
	jal	ra,Rotate
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-240(a5)
	lw	a5,-104(s0)
	addi	a5,a5,1
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-240(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-236(a5)
	lw	a5,-104(s0)
	add	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-236(a5)
	lw	a5,-36(s0)
	addi	a5,a5,-1
	sw	a5,-36(s0)
lab132: 	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
lab130: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-240(a5)
	lw	a1,-236(a5)
	jal	ra,Range_length
	mv	a5,a0
	bgtz	a5,lab133
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-248(a5)
	sw	a5,-36(s0)
	j	lab134
lab137: 	lw	a5,-96(s0)
	beq	a4,a5,lab135
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-244(a5)
	mv	a4,a5
	lui	a5,0x20000
	addi	a5,a5,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a5,a4,a5
	slli	a5,a5,0x3
	lui	a4,0xfffff
	addi	a4,a4,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a4,a4,s0
	lw	a4,-372(a4)
	add	a5,a4,a5
	lw	a3,-36(s0)
	lui	a4,0x20000
	addi	a4,a4,-1 # 1fffffff <__BSS_END__+0x1ffe5e1b>
	add	a4,a3,a4
	slli	a4,a4,0x3
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a3,-372(a3)
	add	a4,a3,a4
	lui	a3,0xfffff
	addi	a3,a3,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a3,a3,s0
	lw	a6,-380(a3)
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	jalr	a6
	mv	a5,a0
	bnez	a5,lab136
lab135: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-248(a5)
	lw	a5,-36(s0)
	sub	a5,a4,a5
	sw	a5,-100(s0)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a5,-244(a5)
	mv	a1,a5
	lw	a0,-36(s0)
	jal	ra,MakeRange
	mv	a4,a0
	mv	a5,a1
	sw	a4,-160(s0)
	sw	a5,-156(s0)
	lui	a5,0xfffff
	addi	a5,a5,-216 # ffffef28 <__BSS_END__+0xfffe4d44>
	addi	a5,a5,-32
	add	a4,a5,s0
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a0,a5,s0
	lw	a5,-76(s0)
	lw	a2,-160(s0)
	lw	a3,-156(s0)
	lw	a1,-100(s0)
	lw	a0,-372(a0)
	jal	ra,Rotate
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-248(a5)
	lw	a5,-100(s0)
	sub	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-248(a5)
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a4,-244(a5)
	lw	a5,-100(s0)
	addi	a5,a5,1
	sub	a4,a4,a5
	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	sw	a4,-244(a5)
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
lab136: 	lw	a5,-36(s0)
	addi	a5,a5,-1
	sw	a5,-36(s0)
lab134: 	lui	a5,0xfffff
	addi	a5,a5,-32 # ffffefe0 <__BSS_END__+0xfffe4dfc>
	add	a5,a5,s0
	lw	a0,-248(a5)
	lw	a1,-244(a5)
	jal	ra,Range_length
	mv	a5,a0
	bgtz	a5,lab137
lab129: 	lw	a5,-56(s0)
	slli	a5,a5,0x1
	sw	a5,-56(s0)
	lw	a5,-52(s0)
	slli	a5,a5,0x1
	sw	a5,-52(s0)
	lw	a4,-52(s0)
	lw	a5,-84(s0)
	blt	a4,a5,lab138
	lw	a4,-52(s0)
	lw	a5,-84(s0)
	sub	a5,a4,a5
	sw	a5,-52(s0)
	lw	a5,-56(s0)
	addi	a5,a5,1
	sw	a5,-56(s0)
lab138: 	lw	a5,-40(s0)
	slli	a5,a5,0x1
	sw	a5,-40(s0)
lab46: 	lw	a4,-40(s0)
	lw	a5,-80(s0)
	bge	a4,a5,lab42
	j	lab139
lab42: 	lui	t0,0x1
	add	sp,sp,t0
	lw	ra,428(sp)
	lw	s0,424(sp)
	lw	s1,420(sp)
	lw	s2,416(sp)
	lw	s3,412(sp)
	addi	sp,sp,432
	ret
TestingPathological:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-20(s0)
	bnez	a5,lab140
	li	a5,10
	j	lab141
lab140: 	lw	a5,-24(s0)
	srli	a4,a5,0x1f
	add	a5,a4,a5
	srai	a5,a5,0x1
	mv	a4,a5
	lw	a5,-20(s0)
	bge	a5,a4,lab142
	li	a5,11
	j	lab141
lab142: 	lw	a5,-24(s0)
	addi	a5,a5,-1
	lw	a4,-20(s0)
	bne	a4,a5,lab143
	li	a5,10
	j	lab141
lab143: 	li	a5,9
lab141: 	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
TestingRandom:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	jal	ra,rand_beebs
	mv	a5,a0
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	ret
TestingMostlyDescending:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s2,20(sp)
	sw	s3,16(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	sub	a5,a4,a5
	mv	a0,a5
	jal	ra,__floatsidf
	mv	s2,a0
	mv	s3,a1
	jal	ra,rand_beebs
	mv	a5,a0
	mv	a0,a5
	jal	ra,__floatsidf
	mv	a4,a0
	mv	a5,a1
	lui	a3,0x18
	lw	a2,-104(a3) # 17f98 <_exit+0xcdc>
	lw	a3,-100(a3)
	mv	a0,a4
	mv	a1,a5
	jal	ra,__divdf3
	mv	a4,a0
	mv	a5,a1
	mv	a0,a4
	mv	a1,a5
	lui	a5,0x18
	lw	a2,-96(a5) # 17fa0 <_exit+0xce4>
	lw	a3,-92(a5)
	jal	ra,__muldf3
	mv	a4,a0
	mv	a5,a1
	mv	a2,a4
	mv	a3,a5
	mv	a0,s2
	mv	a1,s3
	jal	ra,__adddf3
	mv	a4,a0
	mv	a5,a1
	mv	a0,a4
	mv	a1,a5
	lui	a5,0x18
	lw	a2,-88(a5) # 17fa8 <_exit+0xcec>
	lw	a3,-84(a5)
	jal	ra,__subdf3
	mv	a4,a0
	mv	a5,a1
	mv	a0,a4
	mv	a1,a5
	jal	ra,__fixdfsi
	mv	a5,a0
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s2,20(sp)
	lw	s3,16(sp)
	addi	sp,sp,32
	ret
TestingMostlyAscending:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s2,20(sp)
	sw	s3,16(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a0,-20(s0)
	jal	ra,__floatsidf
	mv	s2,a0
	mv	s3,a1
	jal	ra,rand_beebs
	mv	a5,a0
	mv	a0,a5
	jal	ra,__floatsidf
	mv	a4,a0
	mv	a5,a1
	lui	a3,0x18
	lw	a2,-104(a3) # 17f98 <_exit+0xcdc>
	lw	a3,-100(a3)
	mv	a0,a4
	mv	a1,a5
	jal	ra,__divdf3
	mv	a4,a0
	mv	a5,a1
	mv	a0,a4
	mv	a1,a5
	lui	a5,0x18
	lw	a2,-96(a5) # 17fa0 <_exit+0xce4>
	lw	a3,-92(a5)
	jal	ra,__muldf3
	mv	a4,a0
	mv	a5,a1
	mv	a2,a4
	mv	a3,a5
	mv	a0,s2
	mv	a1,s3
	jal	ra,__adddf3
	mv	a4,a0
	mv	a5,a1
	mv	a0,a4
	mv	a1,a5
	lui	a5,0x18
	lw	a2,-88(a5) # 17fa8 <_exit+0xcec>
	lw	a3,-84(a5)
	jal	ra,__subdf3
	mv	a4,a0
	mv	a5,a1
	mv	a0,a4
	mv	a1,a5
	jal	ra,__fixdfsi
	mv	a5,a0
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s2,20(sp)
	lw	s3,16(sp)
	addi	sp,sp,32
	ret
TestingAscending:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
TestingDescending:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	sub	a5,a4,a5
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
TestingEqual:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	li	a5,1000
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
TestingJittered:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	jal	ra,rand_beebs
	mv	a5,a0
	mv	a0,a5
	jal	ra,__floatsidf
	mv	a4,a0
	mv	a5,a1
	lui	a3,0x18
	lw	a2,-104(a3) # 17f98 <_exit+0xcdc>
	lw	a3,-100(a3)
	mv	a0,a4
	mv	a1,a5
	jal	ra,__divdf3
	mv	a4,a0
	mv	a5,a1
	mv	a0,a4
	mv	a1,a5
	lui	a5,0x18
	lw	a2,-80(a5) # 17fb0 <_exit+0xcf4>
	lw	a3,-76(a5)
	jal	ra,__ledf2
	mv	a5,a0
	bgtz	a5,lab144
	lw	a5,-20(s0)
	j	lab145
lab144: 	lw	a5,-20(s0)
	addi	a5,a5,-2
lab145: 	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	ret
TestingMostlyEqual:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	jal	ra,rand_beebs
	mv	a4,a0
	srai	a5,a4,0x1f
	srli	a5,a5,0x1e
	add	a4,a4,a5
	andi	a4,a4,3
	sub	a5,a4,a5
	addi	a5,a5,1000
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	ret
verify_benchmark:
	addi	sp,sp,-2032
	sw	ra,2028(sp)
	sw	s0,2024(sp)
	addi	s0,sp,2032
	addi	sp,sp,-1200
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__BSS_END__+0xfffe4e0c>
	add	a5,a5,s0
	sw	a0,892(a5)
	lui	a5,0xfffff
	addi	a5,a5,-16 # ffffeff0 <__BSS_END__+0xfffe4e0c>
	add	a5,a5,s0
	lui	a4,0x17
	addi	a3,a4,752 # 172f0 <_exit+0x34>
	addi	a4,a5,896
	lui	a5,0x1
	addi	a5,a5,-896 # c80 <exit-0xf414>
	mv	a2,a5
	mv	a1,a3
	mv	a0,a4
	jal	ra,memcpy
	li	a5,400
	slli	a4,a5,0x3
	lui	a5,0xfffff
	addi	a5,a5,896 # fffff380 <__BSS_END__+0xfffe519c>
	addi	a5,a5,-16
	add	a5,a5,s0
	mv	a2,a4
	mv	a1,a5
	lui	a5,0x19
	addi	a0,a5,1364 # 19554 <array1>
	jal	ra,memcmp
	mv	a5,a0
	seqz	a5,a5
	zext.b	a5,a5
	mv	a0,a5
	addi	sp,sp,1200
	lw	ra,2028(sp)
	lw	s0,2024(sp)
	addi	sp,sp,2032
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
	li	a0,1
	jal	ra,benchmark_body
	mv	a5,a0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	ret
benchmark_body:
	addi	sp,sp,-96
	sw	ra,92(sp)
	sw	s0,88(sp)
	addi	s0,sp,96
	sw	a0,-84(s0)
	lui	a5,0x10
	addi	a5,a5,460 # 101cc <TestCompare>
	sw	a5,-32(s0)
	lui	a5,0x18
	addi	a5,a5,-144 # 17f70 <_exit+0xcb4>
	lw	t1,0(a5)
	lw	a7,4(a5)
	lw	a6,8(a5)
	lw	a0,12(a5)
	lw	a1,16(a5)
	lw	a2,20(a5)
	lw	a3,24(a5)
	lw	a4,28(a5)
	lw	a5,32(a5)
	sw	t1,-72(s0)
	sw	a7,-68(s0)
	sw	a6,-64(s0)
	sw	a0,-60(s0)
	sw	a1,-56(s0)
	sw	a2,-52(s0)
	sw	a3,-48(s0)
	sw	a4,-44(s0)
	sw	a5,-40(s0)
	sw	zero,-28(s0)
	j	lab146
lab151: 	jal	ra,srand_beebs
	li	a5,400
	sw	a5,-36(s0)
	sw	zero,-24(s0)
	j	lab147
lab150: 	j	lab148
lab149: 	slli	a5,a5,0x2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-56(a5)
	lw	a1,-36(s0)
	lw	a0,-20(s0)
	jalr	a5
	mv	a5,a0
	sw	a5,-80(s0)
	lw	a5,-20(s0)
	sw	a5,-76(s0)
	lui	a5,0x19
	addi	a4,a5,1364 # 19554 <array1>
	lw	a5,-20(s0)
	slli	a5,a5,0x3
	add	a5,a4,a5
	lw	a4,-80(s0)
	sw	a4,0(a5)
	lw	a4,-76(s0)
	sw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
lab148: 	lw	a4,-20(s0)
	lw	a5,-36(s0)
	blt	a4,a5,lab149
	lw	a2,-32(s0)
	lw	a1,-36(s0)
	lui	a5,0x19
	addi	a0,a5,1364 # 19554 <array1>
	jal	ra,WikiSort
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
lab147: 	lw	a4,-24(s0)
	li	a5,8
	bge	a5,a4,lab150
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
lab146: 	lw	a4,-28(s0)
	lw	a5,-84(s0)
	blt	a4,a5,lab151
	li	a5,0
	mv	a0,a5
	lw	ra,92(sp)
	lw	s0,88(sp)
	addi	sp,sp,96
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
	lw	a4,2032(gp) # 1a1d4 <seed>
	lui	a5,0x41c65
	addi	a5,a5,-403 # 41c64e6d <__BSS_END__+0x41c4ac89>
	mul	a4,a4,a5
	lui	a5,0x3
	addi	a5,a5,57 # 3039 <exit-0xd05b>
	add	a4,a4,a5
	lui	a5,0x80000
	not	a5,a5
	and	a4,a4,a5
	sw	a4,2032(gp) # 1a1d4 <seed>
	lw	a5,2032(gp) # 1a1d4 <seed>
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
	sw	a4,2032(gp) # 1a1d4 <seed>
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	ret
sqrt:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	mv	s1,a0
	mv	s0,a1
	sw	ra,28(sp)
	jal	ra,__ieee754_sqrt
	mv	s3,a0
	mv	s2,a1
	mv	a2,s1
	mv	a0,s1
	mv	a3,s0
	mv	a1,s0
	jal	ra,__unorddf2
	bnez	a0,lab152
	mv	a0,s1
	mv	a1,s0
	li	a2,0
	li	a3,0
	jal	ra,__ledf2
	bltz	a0,lab153
lab152: 	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	mv	a0,s3
	mv	a1,s2
	lw	s3,12(sp)
	lw	s2,16(sp)
	addi	sp,sp,32
	ret
lab153: 	jal	ra,__errno
	li	a5,33
	li	a2,0
	li	a3,0
	sw	a5,0(a0)
	mv	a1,a3
	mv	a0,a2
	jal	ra,__divdf3
	mv	s3,a0
	mv	s2,a1
	j	lab152
__ieee754_sqrt:
	addi	sp,sp,-16
	lui	a3,0x7ff00
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	and	a6,a3,a1
	mv	s1,a1
	mv	s0,a0
	beq	a6,a3,lab154
	mv	a4,a0
	blez	a1,lab155
	srai	a3,a1,0x14
	mv	a5,a1
	beqz	a3,lab156
lab173: 	addi	a1,a2,-1 # fffff <__BSS_END__+0xe5e1b>
	addi	a3,a3,-1023 # 7feffc01 <__BSS_END__+0x7fee5a1d>
	and	a5,a5,a1
	andi	a1,a3,1
	or	a5,a5,a2
	beqz	a1,lab157
	srli	a2,a4,0x1f
	slli	a5,a5,0x1
	add	a5,a5,a2
	slli	a4,a4,0x1
lab157: 	srli	a2,a4,0x1f
	slli	a5,a5,0x1
	srai	s1,a3,0x1
	add	a5,a5,a2
	slli	a4,a4,0x1
	li	a1,22
	li	t3,0
	li	a3,0
	lui	a2,0x200
lab159: 	srli	a6,a4,0x1f
	addi	a1,a1,-1
	blt	a5,a0,lab158
	sub	a5,a5,a0
	add	a3,a0,a2
	add	t3,t3,a2
lab158: 	slli	a5,a5,0x1
	add	a5,a5,a6
	slli	a4,a4,0x1
	srli	a2,a2,0x1
	bnez	a1,lab159
	li	t1,0
	li	a0,32
	lui	a2,0x80000
	j	lab160
lab163: lab175: 	slli	a5,a5,0x1
	addi	a0,a0,-1
	add	a5,a6,a5
	slli	a4,a4,0x1
	srli	a2,a2,0x1
	beqz	a0,lab162
lab160: 	add	a6,a2,a1
	bge	a3,a5,lab163
	add	a1,a6,a2
	mv	a7,a3
	bltz	a6,lab164
lab174: 	sltu	a3,a4,a6
	sub	a5,a5,a3
lab176: 	srli	a6,a4,0x1f
	slli	a5,a5,0x1
	addi	a0,a0,-1
	add	t1,t1,a2
	mv	a3,a7
	add	a5,a6,a5
	slli	a4,a4,0x1
	srli	a2,a2,0x1
	bnez	a0,lab160
lab162: 	or	a5,a5,a4
	beqz	a5,lab165
	li	a5,-1
	beq	t1,a5,lab166
	addi	t1,t1,1 # 10185 <frame_dummy+0x15>
lab165: 	srli	a0,t1,0x1
lab177: 	lui	a4,0x3fe00
	andi	t3,t3,1
	add	a5,a5,a4
	beqz	t3,lab167
	lui	a4,0x80000
	or	a0,a0,a4
lab167: 	slli	s1,s1,0x14
	mv	s0,a0
	add	s1,s1,a5
lab168: 	mv	a0,s0
	lw	s0,8(sp)
	mv	a1,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	ret
lab155: 	slli	a5,a1,0x1
	srli	a5,a5,0x1
	or	a5,a5,a0
	beqz	a5,lab168
	li	a3,0
	bnez	a1,lab169
lab170: 	addi	a3,a3,-21
	slli	a4,a4,0x15
	beqz	a5,lab170
	srli	a2,a5,0x14
	bnez	a2,lab171
lab156: 	li	a2,0
	lui	a6,0x100
lab172: 	and	a0,a5,a6
	mv	a1,a2
	addi	a2,a2,1 # 80000001 <__BSS_END__+0x7ffe5e1d>
	beqz	a0,lab172
	li	a6,32
	mv	a0,a4
	sub	a6,a6,a2
	sll	a4,a4,a2
lab178: 	sub	a3,a3,a1
	or	a5,a5,a2
	j	lab173
lab164: 	not	a7,a1
	srli	a7,a7,0x1f
	add	a7,a3,a7
	j	lab174
lab161: 	bltu	a4,a6,lab175
	add	a1,a6,a2
	bltz	a6,lab164
	mv	a7,a5
	li	a5,0
	j	lab176
lab154: 	mv	a2,a0
	mv	a3,a1
	jal	ra,__muldf3
	mv	a2,s0
	mv	a3,s1
	jal	ra,__adddf3
	mv	s0,a0
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	mv	s1,a1
	mv	a1,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	ret
lab169: 	mv	a2,a0
	mv	a3,a1
	jal	ra,__subdf3
	mv	a2,a0
	mv	a3,a1
	jal	ra,__divdf3
	mv	s0,a0
	mv	s1,a1
	j	lab168
lab166: 	addi	t3,t3,1
	j	lab177
lab171: 	mv	a0,a4
	li	a6,32
	li	a1,-1
	j	lab178
__adddf3:
	lui	a6,0x100
	addi	a6,a6,-1 # fffff <__BSS_END__+0xe5e1b>
	addi	sp,sp,-32
	and	a7,a6,a1
	srli	a4,a1,0x14
	srli	a5,a0,0x1d
	and	a6,a6,a3
	sw	s0,24(sp)
	andi	s0,a4,2047
	slli	a4,a7,0x3
	srli	a7,a3,0x14
	slli	a6,a6,0x3
	sw	s1,20(sp)
	or	a5,a5,a4
	andi	a7,a7,2047
	srli	a4,a2,0x1d
	sw	ra,28(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	srli	s1,a1,0x1f
	srli	a3,a3,0x1f
	or	a4,a4,a6
	slli	a0,a0,0x3
	slli	a2,a2,0x3
	sub	a6,s0,a7
	bne	s1,a3,lab179
	blez	a6,lab180
	bnez	a7,lab181
	or	a3,a4,a2
	beqz	a3,lab182
	addi	a1,a6,-1
	bnez	a1,lab183
	add	a2,a0,a2
	add	a4,a5,a4
	sltu	a5,a2,a0
	add	a5,a4,a5
	mv	a0,a2
lab197: 	j	lab184
lab183: 	li	a3,2047
	bne	a6,a3,lab185
lab199: 	j	lab186
lab181: 	li	a3,2047
	beq	s0,a3,lab186
	lui	a3,0x800
	or	a4,a4,a3
	mv	a1,a6
lab185: 	li	a3,56
	blt	a3,a1,lab187
	li	a3,31
	blt	a3,a1,lab188
	li	a6,32
	sub	a6,a6,a1
	sll	a3,a4,a6
	srl	a7,a2,a1
	sll	a6,a2,a6
	or	a3,a3,a7
	snez	a6,a6
	or	a3,a3,a6
	srl	a1,a4,a1
lab191: 	add	a1,a1,a5
	sltu	a5,a3,a0
	add	a5,a1,a5
	mv	a0,a3
lab184: 	lui	a4,0x800
	and	a4,a5,a4
	beqz	a4,lab186
	addi	s0,s0,1
	li	a4,2047
	beq	s0,a4,lab189
	lui	a4,0xff800
	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7e5e1b>
	and	a5,a5,a4
	srli	a4,a0,0x1
	andi	a0,a0,1
	or	a4,a4,a0
	slli	a0,a5,0x1f
	or	a0,a0,a4
	srli	a5,a5,0x1
	j	lab186
lab188: 	addi	a3,a1,-32
	li	a7,32
	srl	a3,a4,a3
	li	a6,0
	beq	a1,a7,lab190
	li	a6,64
	sub	a6,a6,a1
	sll	a6,a4,a6
lab190: 	or	a6,a6,a2
	snez	a6,a6
	or	a3,a3,a6
lab192: 	j	lab191
lab187: 	or	a3,a4,a2
	snez	a3,a3
	j	lab192
lab180: 	beqz	a6,lab193
	sub	a1,a7,s0
	bnez	s0,lab194
	or	a3,a5,a0
	beqz	a3,lab195
	addi	a3,a1,-1
	bnez	a3,lab196
	add	a0,a0,a2
	add	a4,a5,a4
	sltu	a2,a0,a2
	add	a5,a4,a2
	j	lab197
lab196: 	li	a6,2047
	bne	a1,a6,lab198
lab200: 	mv	a0,a2
	j	lab199
lab194: 	li	a3,2047
	beq	a7,a3,lab200
	lui	a3,0x800
	or	a5,a5,a3
	mv	a3,a1
lab198: 	li	a1,56
	blt	a1,a3,lab201
	li	a1,31
	blt	a1,a3,lab202
	li	a6,32
	sub	a6,a6,a3
	sll	a1,a5,a6
	srl	t1,a0,a3
	sll	a6,a0,a6
	or	a1,a1,t1
	snez	a6,a6
	or	a1,a1,a6
	srl	a3,a5,a3
lab204: 	add	a3,a3,a4
	sltu	a2,a0,a2
	add	a5,a3,a2
	mv	s0,a7
	j	lab184
lab202: 	addi	a1,a3,-32 # 7fffe0 <__BSS_END__+0x7e5dfc>
	li	t1,32
	srl	a1,a5,a1
	li	a6,0
	beq	a3,t1,lab203
	li	a6,64
	sub	a6,a6,a3
	sll	a6,a5,a6
lab203: 	or	a6,a6,a0
	snez	a6,a6
	or	a1,a1,a6
lab205: 	j	lab204
lab201: 	or	a1,a5,a0
	snez	a1,a1
	j	lab205
lab193: 	addi	a3,s0,1
	andi	a1,a3,2046
	bnez	a1,lab206
	or	a3,a5,a0
	bnez	s0,lab207
	beqz	a3,lab208
	or	a3,a4,a2
	beqz	a3,lab186
	add	a2,a0,a2
	add	a4,a5,a4
	sltu	a5,a2,a0
	add	a5,a4,a5
	lui	a4,0x800
	and	a4,a5,a4
	mv	a0,a2
	beqz	a4,lab186
	lui	a4,0xff800
	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7e5e1b>
	and	a5,a5,a4
	li	s0,1
lab186: 	andi	a4,a0,7
	beqz	a4,lab209
	andi	a4,a0,15
	li	a3,4
	beq	a4,a3,lab209
	addi	a4,a0,4
	sltu	a0,a4,a0
	add	a5,a5,a0
	mv	a0,a4
	j	lab209
lab207: 	beqz	a3,lab200
	or	a4,a4,a2
	beqz	a4,lab199
lab243: 	lui	a5,0x400
	li	a0,0
lab257: 	j	lab209
lab206: 	li	a1,2047
	beq	a3,a1,lab210
	add	a2,a0,a2
	sltu	a0,a2,a0
	add	a4,a5,a4
	add	a4,a4,a0
	slli	a0,a4,0x1f
	srli	a2,a2,0x1
	or	a0,a0,a2
	srli	a5,a4,0x1
	mv	s0,a3
	j	lab186
lab179: 	blez	a6,lab211
	bnez	a7,lab212
	or	a3,a4,a2
	beqz	a3,lab182
	addi	a1,a6,-1
	bnez	a1,lab213
	sub	a2,a0,a2
	sub	a4,a5,a4
	sltu	a5,a0,a2
	sub	a5,a4,a5
	mv	a0,a2
lab226: 	j	lab214
lab213: 	li	a3,2047
	beq	a6,a3,lab199
lab218: 	blt	a3,a1,lab215
	li	a3,31
	blt	a3,a1,lab216
	li	a6,32
	sub	a6,a6,a1
	sll	a3,a4,a6
	srl	a7,a2,a1
	sll	a6,a2,a6
	or	a3,a3,a7
	snez	a6,a6
	or	a3,a3,a6
	srl	a1,a4,a1
lab220: 	sub	a1,a5,a1
	sltu	a5,a0,a3
	sub	a5,a1,a5
	mv	a0,a3
lab214: 	lui	s2,0x800
	and	a4,a5,s2
	beqz	a4,lab186
	addi	s2,s2,-1 # 7fffff <__BSS_END__+0x7e5e1b>
	and	s2,a5,s2
	mv	s3,a0
	j	lab217
lab212: 	li	a3,2047
	beq	s0,a3,lab186
	lui	a3,0x800
	or	a4,a4,a3
	mv	a1,a6
	j	lab218
lab216: 	addi	a3,a1,-32
	li	a7,32
	srl	a3,a4,a3
	li	a6,0
	beq	a1,a7,lab219
	li	a6,64
	sub	a6,a6,a1
	sll	a6,a4,a6
lab219: 	or	a6,a6,a2
	snez	a6,a6
	or	a3,a3,a6
lab221: 	j	lab220
lab215: 	or	a3,a4,a2
	snez	a3,a3
	j	lab221
lab211: 	beqz	a6,lab222
	sub	a6,a7,s0
	bnez	s0,lab223
	or	a1,a5,a0
	beqz	a1,lab224
	addi	a1,a6,-1
	bnez	a1,lab225
	sub	a0,a2,a0
	sub	a4,a4,a5
	sltu	a2,a2,a0
	sub	a5,a4,a2
	mv	s1,a3
	j	lab226
lab225: 	li	t1,2047
	bne	a6,t1,lab227
lab229: 	mv	a0,a2
	li	s0,2047
	j	lab228
lab223: 	li	a1,2047
	beq	a7,a1,lab229
	lui	a1,0x800
	or	a5,a5,a1
	mv	a1,a6
lab227: 	li	a6,56
	blt	a6,a1,lab230
	li	a6,31
	blt	a6,a1,lab231
	li	t1,32
	sub	t1,t1,a1
	srl	t3,a0,a1
	sll	a6,a5,t1
	sll	t1,a0,t1
	or	a6,a6,t3
	snez	t1,t1
	or	a0,a6,t1
	srl	a1,a5,a1
lab233: 	sub	a1,a4,a1
	sltu	a2,a2,a0
	sub	a5,a1,a2
	mv	s0,a7
	mv	s1,a3
	j	lab214
lab231: 	addi	a6,a1,-32 # 7fffe0 <__BSS_END__+0x7e5dfc>
	li	t3,32
	srl	a6,a5,a6
	li	t1,0
	beq	a1,t3,lab232
	li	t1,64
	sub	t1,t1,a1
	sll	t1,a5,t1
lab232: 	or	t1,t1,a0
	snez	t1,t1
	or	a0,a6,t1
lab234: 	j	lab233
lab230: 	or	a0,a5,a0
	snez	a0,a0
	j	lab234
lab222: 	addi	a1,s0,1
	andi	a1,a1,2046
	bnez	a1,lab235
	or	a6,a5,a0
	or	a1,a4,a2
	bnez	s0,lab236
	bnez	a6,lab237
	beqz	a1,lab238
	mv	a5,a4
	mv	a0,a2
lab228: 	mv	s1,a3
	j	lab186
lab237: 	beqz	a1,lab186
	sub	a6,a0,a2
	sltu	a7,a0,a6
	sub	a1,a5,a4
	sub	a1,a1,a7
	lui	a7,0x800
	and	a7,a1,a7
	beqz	a7,lab239
	sub	a0,a2,a0
	sub	a4,a4,a5
	sltu	a2,a2,a0
	sub	a5,a4,a2
	j	lab228
lab239: 	or	a0,a6,a1
	beqz	a0,lab240
	mv	a5,a1
	mv	a0,a6
	j	lab186
lab236: 	bnez	a6,lab241
	beqz	a1,lab242
	mv	a5,a4
	mv	a0,a2
	mv	s1,a3
	j	lab199
lab241: 	beqz	a1,lab199
	j	lab243
lab235: 	sub	s3,a0,a2
	sltu	a1,a0,s3
	sub	s2,a5,a4
	sub	s2,s2,a1
	lui	a1,0x800
	and	a1,s2,a1
	beqz	a1,lab244
	sub	s3,a2,a0
	sub	s2,a4,a5
	sltu	a2,a2,s3
	sub	s2,s2,a2
	mv	s1,a3
lab217: 	beqz	s2,lab245
	mv	a0,s2
	jal	ra,__clzsi2
lab250: 	li	a5,31
	blt	a5,a4,lab246
	li	a5,32
	sub	a5,a5,a4
	sll	s2,s2,a4
	srl	a5,s3,a5
	or	a5,a5,s2
	sll	a0,s3,a4
lab251: 	sub	a4,a4,s0
	addi	a2,a4,1
	li	a3,31
	blt	a3,a2,lab248
	li	a4,32
	sub	a4,a4,a2
	sll	a3,a5,a4
	srl	a1,a0,a2
	sll	a4,a0,a4
	or	a3,a3,a1
	snez	a4,a4
	or	a0,a3,a4
	srl	a5,a5,a2
lab253: 	j	lab186
lab244: 	or	a0,s3,s2
	bnez	a0,lab217
	li	a5,0
	li	s0,0
	j	lab249
lab245: 	mv	a0,s3
	jal	ra,__clzsi2
	addi	a0,a0,32
	j	lab250
lab246: 	addi	a5,a0,-40
	sll	a5,s3,a5
	li	a0,0
	j	lab251
lab248: 	addi	a4,a4,-31
	li	a1,32
	srl	a4,a5,a4
	li	a3,0
	beq	a2,a1,lab252
	li	a3,64
	sub	a3,a3,a2
	sll	a3,a5,a3
lab252: 	or	a3,a0,a3
	snez	a3,a3
	or	a0,a4,a3
	li	a5,0
	j	lab253
lab247: 	sub	s0,s0,a4
	lui	a4,0xff800
	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7e5e1b>
	and	a5,a5,a4
	j	lab186
lab195: 	mv	a5,a4
	mv	a0,a2
	mv	s0,a1
	j	lab186
lab208: 	mv	a5,a4
	mv	a0,a2
	j	lab186
lab210: 	li	s0,2047
lab189: 	li	a5,0
	li	a0,0
lab209: 	lui	a4,0x800
	and	a4,a5,a4
	beqz	a4,lab254
	addi	s0,s0,1
	li	a4,2047
	beq	s0,a4,lab255
	lui	a4,0xff800
	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7e5e1b>
	and	a5,a5,a4
lab254: 	slli	a3,a5,0x1d
	srli	a0,a0,0x3
	li	a4,2047
	or	a3,a3,a0
	srli	a5,a5,0x3
	bne	s0,a4,lab256
	or	a3,a3,a5
	li	a5,0
	beqz	a3,lab256
	lui	a5,0x80
	li	a3,0
	li	s1,0
lab256: 	slli	a4,s0,0x14
	lui	a2,0x7ff00
	slli	a5,a5,0xc
	lw	ra,28(sp)
	lw	s0,24(sp)
	and	a4,a4,a2
	srli	a5,a5,0xc
	slli	s1,s1,0x1f
	or	a5,a4,a5
	or	a4,a5,s1
	lw	s2,16(sp)
	lw	s1,20(sp)
	lw	s3,12(sp)
	mv	a0,a3
	mv	a1,a4
	addi	sp,sp,32
	ret
lab182: 	mv	s0,a6
	j	lab186
lab224: 	mv	a5,a4
	mv	a0,a2
	mv	s0,a6
	j	lab228
lab238: 	li	a5,0
	li	a0,0
lab249: 	li	s1,0
	j	lab209
lab240: 	li	a5,0
	j	lab249
lab242: 	li	a0,0
	li	s1,0
	lui	a5,0x400
	j	lab257
lab255: 	li	a5,0
	li	a0,0
	j	lab254
__divdf3:
	addi	sp,sp,-48
	srli	a6,a1,0x14
	sw	s1,36(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s6,16(sp)
	sw	s8,8(sp)
	slli	s1,a1,0xc
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s2,32(sp)
	sw	s5,20(sp)
	sw	s7,12(sp)
	andi	a6,a6,2047
	mv	s4,a0
	mv	s6,a2
	mv	s8,a3
	srli	s1,s1,0xc
	srli	s3,a1,0x1f
	beqz	a6,lab258
	li	a5,2047
	beq	a6,a5,lab259
	srli	s5,a0,0x1d
	slli	s1,s1,0x3
	or	s5,s5,s1
	lui	a5,0x800
	or	s5,s5,a5
	slli	s0,a0,0x3
	addi	s2,a6,-1023
lab266: lab270: 	slli	s1,s8,0xc
	andi	a5,a5,2047
	srli	s1,s1,0xc
	srli	s8,s8,0x1f
	beqz	a5,lab260
	li	a4,2047
	beq	a5,a4,lab261
	slli	s1,s1,0x3
	srli	a4,s6,0x1d
	or	a4,a4,s1
	lui	s1,0x800
	or	s1,a4,s1
	slli	t4,s6,0x3
	addi	a5,a5,-1023 # 7ffc01 <__BSS_END__+0x7e5a1d>
lab274: lab278: 	slli	a5,s7,0x2
	or	a5,a5,a4
	addi	a5,a5,-1
	li	a3,14
	xor	a2,s3,s8
	bltu	a3,a5,lab262
	lui	a3,0x18
	slli	a5,a5,0x2
	addi	a3,a3,-72 # 17fb8 <_exit+0xcfc>
	add	a5,a5,a3
	lw	a5,0(a5)
	jr	a5
lab258: 	or	s5,s1,a0
	beqz	s5,lab263
	beqz	s1,lab264
	mv	a0,s1
	jal	ra,__clzsi2
lab267: 	li	a4,28
	blt	a4,a5,lab265
	li	s5,29
	addi	s0,a0,-8
	sub	s5,s5,a5
	sll	s1,s1,s0
	srl	s5,s4,s5
	or	s5,s5,s1
	sll	s0,s4,s0
lab268: 	sub	s2,a6,a0
	j	lab266
lab264: 	jal	ra,__clzsi2
	addi	a0,a0,32
	j	lab267
lab265: 	addi	s5,a0,-40
	sll	s5,s4,s5
	li	s0,0
	j	lab268
lab259: 	or	s5,s1,a0
	beqz	s5,lab269
	mv	s0,a0
	mv	s5,s1
	li	s2,2047
	li	s7,3
	j	lab270
lab263: 	li	s0,0
	li	s2,0
	li	s7,1
	j	lab270
lab269: 	li	s0,0
	li	s2,2047
	li	s7,2
	j	lab270
lab260: 	or	t4,s1,s6
	beqz	t4,lab271
	beqz	s1,lab272
	mv	a0,s1
	jal	ra,__clzsi2
lab275: 	li	a5,28
	blt	a5,a4,lab273
	li	a5,29
	addi	t4,a0,-8
	sub	a5,a5,a4
	sll	s1,s1,t4
	srl	a5,s6,a5
	or	s1,a5,s1
	sll	t4,s6,t4
lab276: 	sub	a5,a5,a0
	j	lab274
lab272: 	mv	a0,s6
	jal	ra,__clzsi2
	addi	a0,a0,32
	j	lab275
lab273: 	addi	s1,a0,-40
	sll	s1,s6,s1
	li	t4,0
	j	lab276
lab261: 	or	t4,s1,s6
	beqz	t4,lab277
	mv	t4,s6
	li	a5,2047
	li	a4,3
	j	lab278
lab271: 	li	s1,0
	li	a5,0
	li	a4,1
	j	lab278
lab277: 	li	s1,0
	li	a5,2047
	li	a4,2
	j	lab278
lab262: 	bltu	s1,s5,lab279
	bne	s5,s1,lab280
	bltu	s0,t4,lab280
lab279: 	slli	a4,s5,0x1f
	srli	a5,s0,0x1
	slli	t5,s0,0x1f
	srli	s5,s5,0x1
	or	s0,a4,a5
lab303: 	srli	a3,t4,0x18
	or	a3,a3,a0
	srli	a0,a0,0x10
	divu	t3,s5,a0
	slli	t1,a3,0x10
	srli	t1,t1,0x10
	srli	a5,s0,0x10
	slli	a1,t4,0x8
	remu	s5,s5,a0
	mv	a4,t3
	mul	a7,t1,t3
	slli	s5,s5,0x10
	or	a5,a5,s5
	bgeu	a5,a7,lab281
	add	a5,a5,a3
	addi	a4,t3,-1
	bltu	a5,a3,lab281
	bgeu	a5,a7,lab281
	addi	a4,t3,-2
	add	a5,a5,a3
lab281: 	sub	a5,a5,a7
	divu	t3,a5,a0
	slli	s0,s0,0x10
	srli	s0,s0,0x10
	remu	a5,a5,a0
	mul	a7,t1,t3
	slli	a5,a5,0x10
	or	s0,s0,a5
	mv	a5,t3
	bgeu	s0,a7,lab282
	add	s0,s0,a3
	addi	a5,t3,-1
	bltu	s0,a3,lab282
	bgeu	s0,a7,lab282
	addi	a5,t3,-2
	add	s0,s0,a3
lab282: 	slli	a4,a4,0x10
	lui	t2,0x10
	or	t6,a4,a5
	sub	s0,s0,a7
	addi	a7,t2,-1 # ffff <exit-0x95>
	and	a5,t6,a7
	srli	t4,t6,0x10
	srli	t3,a1,0x10
	and	a7,a1,a7
	mul	t0,a7,a5
	mul	s1,t4,a7
	srli	a4,t0,0x10
	mul	a5,t3,a5
	add	a5,a5,s1
	add	a4,a4,a5
	mul	t4,t4,t3
	bgeu	a4,s1,lab283
	add	t4,t4,t2
lab283: 	srli	a5,a4,0x10
	add	a5,a5,t4
	lui	t4,0x10
	addi	t4,t4,-1 # ffff <exit-0x95>
	and	a4,a4,t4
	slli	a4,a4,0x10
	and	t0,t0,t4
	add	a4,a4,t0
	bltu	s0,a5,lab284
	mv	s1,t6
	bne	s0,a5,lab285
	bgeu	t5,a4,lab285
lab284: 	add	t5,t5,a1
	sltu	t4,t5,a1
	add	t4,t4,a3
	add	s0,s0,t4
	addi	s1,t6,-1
	bltu	a3,s0,lab286
	bne	a3,s0,lab285
	bltu	t5,a1,lab285
lab286: 	bltu	s0,a5,lab287
	bne	a5,s0,lab285
	bgeu	t5,a4,lab285
lab287: 	add	t5,t5,a1
	sltu	t4,t5,a1
	add	t4,t4,a3
	addi	s1,t6,-2
	add	s0,s0,t4
lab285: 	sub	a4,t5,a4
	sub	s0,s0,a5
	sltu	a5,t5,a4
	sub	s0,s0,a5
	li	t4,-1
	beq	a3,s0,lab288
	divu	t6,s0,a0
	srli	a5,a4,0x10
	remu	s0,s0,a0
	mv	t4,t6
	mul	t5,t1,t6
	slli	s0,s0,0x10
	or	a5,a5,s0
	bgeu	a5,t5,lab289
	add	a5,a5,a3
	addi	t4,t6,-1
	bltu	a5,a3,lab289
	bgeu	a5,t5,lab289
	addi	t4,t6,-2
	add	a5,a5,a3
lab289: 	sub	a5,a5,t5
	divu	t5,a5,a0
	slli	a4,a4,0x10
	srli	a4,a4,0x10
	remu	a5,a5,a0
	mv	a0,t5
	mul	t1,t1,t5
	slli	a5,a5,0x10
	or	a4,a4,a5
	bgeu	a4,t1,lab290
	add	a4,a4,a3
	addi	a0,t5,-1
	bltu	a4,a3,lab290
	bgeu	a4,t1,lab290
	addi	a0,t5,-2
	add	a4,a4,a3
lab290: 	slli	a5,t4,0x10
	or	a5,a5,a0
	slli	a0,a5,0x10
	srli	a0,a0,0x10
	sub	a4,a4,t1
	srli	t1,a5,0x10
	mul	t4,a0,a7
	mul	a7,t1,a7
	mul	t1,t3,t1
	mul	t3,t3,a0
	srli	a0,t4,0x10
	add	t3,t3,a7
	add	a0,a0,t3
	bgeu	a0,a7,lab291
	lui	a7,0x10
	add	t1,t1,a7
lab291: 	srli	a7,a0,0x10
	add	a7,a7,t1
	lui	t1,0x10
	addi	t1,t1,-1 # ffff <exit-0x95>
	and	a0,a0,t1
	slli	a0,a0,0x10
	and	t4,t4,t1
	add	a0,a0,t4
	bltu	a4,a7,lab292
	bne	a4,a7,lab293
	mv	t4,a5
	beqz	a0,lab288
lab292: 	add	a4,a3,a4
	addi	t4,a5,-1
	bltu	a4,a3,lab294
	bltu	a4,a7,lab295
	bne	a4,a7,lab296
	bgeu	a1,a0,lab297
lab295: 	addi	t4,a5,-2
	slli	a5,a1,0x1
	sltu	a1,a5,a1
	add	a1,a1,a3
	add	a4,a4,a1
	mv	a1,a5
lab294: 	bne	a4,a7,lab298
lab297: 	beq	a0,a1,lab288
lab298: 	ori	t4,t4,1
lab288: 	addi	a5,a6,1023
	blez	a5,lab299
	andi	a4,t4,7
	beqz	a4,lab300
	andi	a4,t4,15
	li	a3,4
	beq	a4,a3,lab300
	addi	a4,t4,4
	sltu	t4,a4,t4
	add	s1,s1,t4
	mv	t4,a4
lab300: 	lui	a4,0x1000
	and	a4,s1,a4
	beqz	a4,lab301
	lui	a5,0xff000
	addi	a5,a5,-1 # feffffff <__BSS_END__+0xfefe5e1b>
	and	s1,s1,a5
	addi	a5,a6,1024
lab301: 	li	a4,2046
	blt	a4,a5,lab302
	srli	t4,t4,0x3
	slli	a4,s1,0x1d
	or	a4,a4,t4
	srli	a0,s1,0x3
lab306: 	slli	a5,a5,0x14
	slli	a0,a0,0xc
	lw	ra,44(sp)
	lw	s0,40(sp)
	and	a5,a5,a3
	srli	a0,a0,0xc
	or	a5,a5,a0
	slli	a2,a2,0x1f
	or	a3,a5,a2
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	lw	s8,8(sp)
	mv	a0,a4
	mv	a1,a3
	addi	sp,sp,48
	ret
lab280: 	addi	a6,a6,-1
	li	t5,0
	j	lab303
	mv	a2,s3
	mv	s1,s5
	mv	t4,s0
	mv	a4,s7
lab307: 	beq	a4,a5,lab304
	li	a5,1
	beq	a4,a5,lab305
	li	a5,2
	bne	a4,a5,lab288
lab302: 	li	a0,0
	li	a4,0
	li	a5,2047
	j	lab306
	mv	a2,s8
	j	lab307
	lui	s1,0x80
	li	t4,0
	li	a2,0
	li	a4,3
	j	lab307
lab299: 	li	a0,1
	sub	a0,a0,a5
	li	a4,56
	blt	a4,a0,lab305
	li	a4,31
	blt	a4,a0,lab308
	addi	a6,a6,1054
	sll	a5,s1,a6
	srl	a4,t4,a0
	sll	a6,t4,a6
	or	a5,a5,a4
	snez	a6,a6
	or	a5,a5,a6
	srl	a0,s1,a0
lab312: 	beqz	a4,lab309
	andi	a4,a5,15
	li	a3,4
	beq	a4,a3,lab309
	addi	a4,a5,4
	sltu	a5,a4,a5
	add	a0,a0,a5
	mv	a5,a4
lab309: 	lui	a4,0x800
	and	a4,a0,a4
	bnez	a4,lab310
	slli	a4,a0,0x1d
	srli	a5,a5,0x3
	or	a4,a4,a5
	srli	a0,a0,0x3
lab313: 	j	lab306
lab308: 	li	a4,-31
	sub	a5,a4,a5
	li	a3,32
	srl	a5,s1,a5
	li	a4,0
	beq	a0,a3,lab311
	addi	a4,a6,1086
	sll	a4,s1,a4
lab311: 	or	a4,a4,t4
	snez	a4,a4
	or	a5,a5,a4
	li	a0,0
	j	lab312
lab305: 	li	a0,0
	li	a4,0
	j	lab313
lab304: 	lui	a0,0x80
	li	a4,0
	li	a5,2047
	li	a2,0
	j	lab306
lab310: 	li	a0,0
	li	a4,0
	li	a5,1
	j	lab306
lab296: 	mv	a5,t4
lab293: 	mv	t4,a5
	j	lab298
__ledf2:
	lui	a4,0x100
	addi	a4,a4,-1 # fffff <__BSS_END__+0xe5e1b>
	srli	a6,a1,0x14
	and	a7,a4,a1
	mv	a5,a0
	mv	t1,a0
	andi	a6,a6,2047
	srli	a0,a1,0x1f
	li	t4,2047
	srli	a1,a3,0x14
	and	a4,a4,a3
	mv	t3,a2
	andi	a1,a1,2047
	srli	a3,a3,0x1f
	bne	a6,t4,lab314
	or	t4,a7,a5
	beqz	t4,lab315
lab317: 	ret
lab314: 	bne	a1,t4,lab316
lab331: 	bnez	t4,lab317
lab316: 	bnez	a6,lab318
	or	a5,a7,a5
	seqz	a5,a5
	bnez	a1,lab319
lab333: 	beqz	a2,lab320
lab319: 	bnez	a5,lab321
lab332: 	bge	a1,a6,lab323
lab322: 	beqz	a0,lab324
lab327: 	ret
lab321: 	li	a0,-1
	beqz	a3,lab325
	mv	a0,a3
	ret
lab323: 	bge	a6,a1,lab326
lab329: lab325: 	ret
lab326: 	bltu	a4,a7,lab322
	bne	a7,a4,lab328
	bltu	t3,t1,lab322
	bltu	t1,t3,lab329
lab330: 	ret
lab324: 	li	a0,1
	ret
lab320: 	bnez	a5,lab330
	j	lab322
lab328: 	bltu	a7,a4,lab329
	j	lab330
lab315: 	beq	a1,a6,lab331
lab318: 	bnez	a1,lab332
	li	a5,0
	j	lab333
__muldf3:
	addi	sp,sp,-48
	sw	s3,28(sp)
	srli	s3,a1,0x14
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s7,12(sp)
	slli	s1,a1,0xc
	sw	ra,44(sp)
	sw	s2,32(sp)
	sw	s6,16(sp)
	andi	s3,s3,2047
	mv	s0,a0
	mv	s7,a2
	mv	s5,a3
	srli	s1,s1,0xc
	srli	s4,a1,0x1f
	beqz	s3,lab334
	li	a5,2047
	beq	s3,a5,lab335
	slli	s1,s1,0x3
	srli	a5,a0,0x1d
	or	a5,a5,s1
	lui	s1,0x800
	or	s1,a5,s1
	slli	s2,a0,0x3
	addi	s3,s3,-1023
lab353: lab357: 	slli	s0,s5,0xc
	andi	a4,a4,2047
	srli	s0,s0,0xc
	srli	s5,s5,0x1f
	beqz	a4,lab336
	li	a5,2047
	beq	a4,a5,lab337
	slli	s0,s0,0x3
	srli	a5,s7,0x1d
	or	a5,a5,s0
	lui	s0,0x800
	or	s0,a5,s0
	addi	a4,a4,-1023
	slli	a5,s7,0x3
lab361: lab365: 	slli	a4,s6,0x2
	or	a4,a4,a0
	li	a3,10
	xor	a2,s4,s5
	addi	a1,s3,1
	blt	a3,a4,lab338
	li	a3,2
	blt	a3,a4,lab339
	addi	a4,a4,-1
	li	a3,1
	bgeu	a3,a4,lab340
lab368: 	addi	t1,t3,-1 # ffff <exit-0x95>
	srli	a6,s2,0x10
	srli	a0,a5,0x10
	and	s2,s2,t1
	and	t4,a5,t1
	mul	a5,s2,t4
	mul	t5,a6,t4
	srli	a4,a5,0x10
	mul	a3,a0,s2
	add	a3,a3,t5
	add	a4,a4,a3
	mul	a7,a6,a0
	bgeu	a4,t5,lab341
	add	a7,a7,t3
lab341: 	and	a3,a4,t1
	and	a5,a5,t1
	slli	a3,a3,0x10
	and	t3,s0,t1
	add	a3,a3,a5
	srli	a5,s0,0x10
	srli	t0,a4,0x10
	mul	t5,s2,t3
	mul	t1,a6,t3
	srli	a4,t5,0x10
	mul	s2,a5,s2
	add	s2,s2,t1
	add	a4,a4,s2
	mul	a6,a6,a5
	bgeu	a4,t1,lab342
	lui	t1,0x10
	add	a6,a6,t1
lab342: 	lui	s2,0x10
	addi	t6,s2,-1 # ffff <exit-0x95>
	srli	t1,a4,0x10
	and	t5,t5,t6
	and	a4,a4,t6
	srli	s0,s1,0x10
	and	t6,s1,t6
	mul	t2,t4,t6
	add	t1,t1,a6
	slli	a4,a4,0x10
	add	t5,a4,t5
	add	t0,t0,t5
	mul	a6,s0,t4
	srli	a4,t2,0x10
	mul	s1,a0,s0
	mul	a0,a0,t6
	add	a0,a0,a6
	add	a4,a4,a0
	bgeu	a4,a6,lab343
	add	s1,s1,s2
lab343: 	srli	t4,a4,0x10
	add	t4,t4,s1
	lui	s1,0x10
	addi	a0,s1,-1 # ffff <exit-0x95>
	and	a4,a4,a0
	and	t2,t2,a0
	slli	a4,a4,0x10
	mul	a0,s0,t3
	add	a4,a4,t2
	mul	a6,a5,s0
	mul	t2,t3,t6
	mul	a5,a5,t6
	srli	t6,t2,0x10
	add	a5,a5,a0
	add	t6,t6,a5
	bgeu	t6,a0,lab344
	add	a6,a6,s1
lab344: 	lui	a0,0x10
	addi	a0,a0,-1 # ffff <exit-0x95>
	and	a5,t6,a0
	and	t2,t2,a0
	slli	a5,a5,0x10
	add	a7,a7,t0
	add	a5,a5,t2
	sltu	t5,a7,t5
	add	a5,a5,t1
	add	t0,a5,t5
	add	a7,a7,a4
	sltu	a4,a7,a4
	add	a0,t0,t4
	add	t3,a0,a4
	sltu	s0,a5,t1
	sltu	t0,t0,t5
	srli	a5,t6,0x10
	sltu	a4,t3,a4
	or	s0,s0,t0
	sltu	a0,a0,t4
	add	s0,s0,a5
	or	a0,a0,a4
	add	s0,s0,a0
	add	s0,s0,a6
	srli	a5,t3,0x17
	slli	s0,s0,0x9
	or	s0,s0,a5
	slli	a5,a7,0x9
	or	a5,a5,a3
	snez	a5,a5
	srli	a7,a7,0x17
	slli	a4,t3,0x9
	or	a5,a5,a7
	or	a5,a5,a4
	lui	a4,0x1000
	and	a4,s0,a4
	beqz	a4,lab345
	srli	a4,a5,0x1
	andi	a5,a5,1
	or	a4,a4,a5
	slli	a5,s0,0x1f
	or	a5,a4,a5
	srli	s0,s0,0x1
lab370: 	blez	a3,lab346
	andi	a4,a5,7
	beqz	a4,lab347
	andi	a4,a5,15
	li	a0,4
	beq	a4,a0,lab347
	addi	a4,a5,4
	sltu	a5,a4,a5
	add	s0,s0,a5
	mv	a5,a4
lab347: 	lui	a4,0x1000
	and	a4,s0,a4
	beqz	a4,lab348
	lui	a4,0xff000
	addi	a4,a4,-1 # feffffff <__BSS_END__+0xfefe5e1b>
	and	s0,s0,a4
	addi	a3,a1,1024
lab348: 	li	a4,2046
	blt	a4,a3,lab349
	slli	a4,s0,0x1d
	srli	a5,a5,0x3
	or	a4,a4,a5
	srli	s0,s0,0x3
lab379: 	slli	a3,a3,0x14
	slli	s0,s0,0xc
	and	a3,a3,a5
	srli	s0,s0,0xc
	lw	ra,44(sp)
	or	a3,a3,s0
	lw	s0,40(sp)
	slli	a2,a2,0x1f
	or	a5,a3,a2
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	mv	a0,a4
	mv	a1,a5
	addi	sp,sp,48
	ret
lab334: 	or	s2,s1,a0
	beqz	s2,lab350
	beqz	s1,lab351
	mv	a0,s1
	jal	ra,__clzsi2
lab354: 	li	a5,28
	blt	a5,a4,lab352
	li	a5,29
	addi	s2,a0,-8
	sub	a5,a5,a4
	sll	s1,s1,s2
	srl	a5,s0,a5
	or	s1,a5,s1
	sll	s2,s0,s2
lab355: 	sub	s3,s3,a0
	j	lab353
lab351: 	jal	ra,__clzsi2
	addi	a0,a0,32
	j	lab354
lab352: 	addi	s1,a0,-40
	sll	s1,s0,s1
	li	s2,0
	j	lab355
lab335: 	or	s2,s1,a0
	beqz	s2,lab356
	mv	s2,a0
	li	s3,2047
	li	s6,3
	j	lab357
lab350: 	li	s1,0
	li	s3,0
	li	s6,1
	j	lab357
lab356: 	li	s1,0
	li	s3,2047
	li	s6,2
	j	lab357
lab336: 	or	a5,s0,s7
	beqz	a5,lab358
	beqz	s0,lab359
	mv	a0,s0
	jal	ra,__clzsi2
lab362: 	li	a5,28
	blt	a5,a3,lab360
	li	a4,29
	addi	a5,a0,-8
	sub	a4,a4,a3
	sll	s0,s0,a5
	srl	a4,s7,a4
	or	s0,a4,s0
	sll	a5,s7,a5
lab363: 	sub	a4,a4,a0
	j	lab361
lab359: 	mv	a0,s7
	jal	ra,__clzsi2
	addi	a0,a0,32
	j	lab362
lab360: 	addi	s0,a0,-40
	sll	s0,s7,s0
	li	a5,0
	j	lab363
lab337: 	or	a5,s0,s7
	beqz	a5,lab364
	mv	a5,s7
	li	a4,2047
	li	a0,3
	j	lab365
lab358: 	li	s0,0
	li	a4,0
	li	a0,1
	j	lab365
lab364: 	li	s0,0
	li	a4,2047
	li	a0,2
	j	lab365
lab339: 	li	a3,1
	sll	a3,a3,a4
	andi	a4,a3,1328
	bnez	a4,lab366
	andi	a6,a3,576
	bnez	a6,lab367
	andi	a3,a3,136
	beqz	a3,lab368
lab373: lab340: 	li	a4,2
	beq	a0,a4,lab349
lab374: 	beq	a0,a4,lab369
	li	a4,1
	bne	a0,a4,lab370
lab375: 	li	a4,0
	j	lab371
lab338: 	li	a3,15
	beq	a4,a3,lab372
	li	a3,11
	beq	a4,a3,lab373
	mv	a2,s4
lab366: 	mv	s0,s1
	mv	a5,s2
	mv	a0,s6
	j	lab340
lab372: 	lui	s0,0x80
	li	a5,0
	li	a2,0
	li	a0,3
	j	lab374
lab345: 	mv	a1,s3
	j	lab370
lab346: 	li	a0,1
	sub	a0,a0,a3
	li	a4,56
	blt	a4,a0,lab375
	li	a4,31
	blt	a4,a0,lab376
	addi	a1,a1,1054
	sll	a4,s0,a1
	srl	a3,a5,a0
	sll	a1,a5,a1
	or	a4,a4,a3
	snez	a1,a1
	or	a5,a4,a1
	srl	s0,s0,a0
lab381: 	beqz	a4,lab377
	andi	a4,a5,15
	li	a3,4
	beq	a4,a3,lab377
	addi	a4,a5,4 # 7ff00004 <__BSS_END__+0x7fee5e20>
	sltu	a5,a4,a5
	add	s0,s0,a5
	mv	a5,a4
lab377: 	lui	a4,0x800
	and	a4,s0,a4
	bnez	a4,lab378
	slli	a4,s0,0x1d
	srli	a5,a5,0x3
	or	a4,a4,a5
	srli	s0,s0,0x3
lab371: 	li	a3,0
	j	lab379
lab376: 	li	a4,-31
	sub	a4,a4,a3
	li	a6,32
	srl	a4,s0,a4
	li	a3,0
	beq	a0,a6,lab380
	addi	a1,a1,1086
	sll	a3,s0,a1
lab380: 	or	a3,a3,a5
	snez	a3,a3
	or	a5,a4,a3
	li	s0,0
	j	lab381
lab367: 	lui	s0,0x80
lab382: 	li	a2,0
	j	lab379
lab369: 	lui	s0,0x80
	li	a4,0
	j	lab382
lab349: 	li	s0,0
	li	a4,0
	li	a3,2047
	j	lab379
lab378: 	li	s0,0
	li	a4,0
	li	a3,1
	j	lab379
__subdf3:
	lui	a6,0x100
	addi	a6,a6,-1 # fffff <__BSS_END__+0xe5e1b>
	addi	sp,sp,-32
	and	a7,a6,a1
	srli	a4,a1,0x14
	srli	a5,a0,0x1d
	and	a6,a6,a3
	sw	s0,24(sp)
	andi	s0,a4,2047
	slli	a4,a7,0x3
	srli	a7,a3,0x14
	sw	s1,20(sp)
	or	a5,a5,a4
	srli	s1,a1,0x1f
	srli	a4,a2,0x1d
	slli	a6,a6,0x3
	sw	ra,28(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	andi	a7,a7,2047
	li	a1,2047
	slli	a0,a0,0x3
	srli	a3,a3,0x1f
	or	a4,a4,a6
	slli	a2,a2,0x3
	bne	a7,a1,lab383
	or	a1,a4,a2
	bnez	a1,lab384
lab383: 	xori	a3,a3,1
lab384: 	sub	a6,s0,a7
	bne	a3,s1,lab385
	blez	a6,lab386
	bnez	a7,lab387
	or	a3,a4,a2
	beqz	a3,lab388
	addi	a1,a6,-1
	bnez	a1,lab389
	add	a2,a0,a2
	add	a4,a5,a4
	sltu	a5,a2,a0
	add	a5,a4,a5
	mv	a0,a2
lab403: 	j	lab390
lab389: 	li	a3,2047
	bne	a6,a3,lab391
lab405: 	j	lab392
lab387: 	li	a3,2047
	beq	s0,a3,lab392
	lui	a3,0x800
	or	a4,a4,a3
	mv	a1,a6
lab391: 	li	a3,56
	blt	a3,a1,lab393
	li	a3,31
	blt	a3,a1,lab394
	li	a6,32
	sub	a6,a6,a1
	sll	a3,a4,a6
	srl	a7,a2,a1
	sll	a6,a2,a6
	or	a3,a3,a7
	snez	a6,a6
	or	a3,a3,a6
	srl	a1,a4,a1
lab397: 	add	a1,a1,a5
	sltu	a5,a3,a0
	add	a5,a1,a5
	mv	a0,a3
lab390: 	lui	a4,0x800
	and	a4,a5,a4
	beqz	a4,lab392
	addi	s0,s0,1 # 80001 <__BSS_END__+0x65e1d>
	li	a4,2047
	beq	s0,a4,lab395
	lui	a4,0xff800
	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7e5e1b>
	and	a5,a5,a4
	srli	a4,a0,0x1
	andi	a0,a0,1
	or	a4,a4,a0
	slli	a0,a5,0x1f
	or	a0,a0,a4
	srli	a5,a5,0x1
	j	lab392
lab394: 	addi	a3,a1,-32
	li	a7,32
	srl	a3,a4,a3
	li	a6,0
	beq	a1,a7,lab396
	li	a6,64
	sub	a6,a6,a1
	sll	a6,a4,a6
lab396: 	or	a6,a6,a2
	snez	a6,a6
	or	a3,a3,a6
lab398: 	j	lab397
lab393: 	or	a3,a4,a2
	snez	a3,a3
	j	lab398
lab386: 	beqz	a6,lab399
	sub	a1,a7,s0
	bnez	s0,lab400
	or	a3,a5,a0
	beqz	a3,lab401
	addi	a3,a1,-1
	bnez	a3,lab402
	add	a0,a0,a2
	add	a4,a5,a4
	sltu	a2,a0,a2
	add	a5,a4,a2
	j	lab403
lab402: 	li	a6,2047
	bne	a1,a6,lab404
lab406: 	mv	a0,a2
	j	lab405
lab400: 	li	a3,2047
	beq	a7,a3,lab406
	lui	a3,0x800
	or	a5,a5,a3
	mv	a3,a1
lab404: 	li	a1,56
	blt	a1,a3,lab407
	li	a1,31
	blt	a1,a3,lab408
	li	a6,32
	sub	a6,a6,a3
	sll	a1,a5,a6
	srl	t1,a0,a3
	sll	a6,a0,a6
	or	a1,a1,t1
	snez	a6,a6
	or	a1,a1,a6
	srl	a3,a5,a3
lab410: 	add	a3,a3,a4
	sltu	a2,a0,a2
	add	a5,a3,a2
	mv	s0,a7
	j	lab390
lab408: 	addi	a1,a3,-32 # 7fffe0 <__BSS_END__+0x7e5dfc>
	li	t1,32
	srl	a1,a5,a1
	li	a6,0
	beq	a3,t1,lab409
	li	a6,64
	sub	a6,a6,a3
	sll	a6,a5,a6
lab409: 	or	a6,a6,a0
	snez	a6,a6
	or	a1,a1,a6
lab411: 	j	lab410
lab407: 	or	a1,a5,a0
	snez	a1,a1
	j	lab411
lab399: 	addi	a3,s0,1
	andi	a1,a3,2046
	bnez	a1,lab412
	or	a3,a5,a0
	bnez	s0,lab413
	beqz	a3,lab414
	or	a3,a4,a2
	beqz	a3,lab392
	add	a2,a0,a2
	add	a4,a5,a4
	sltu	a5,a2,a0
	add	a5,a4,a5
	lui	a4,0x800
	and	a4,a5,a4
	mv	a0,a2
	beqz	a4,lab392
	lui	a4,0xff800
	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7e5e1b>
	and	a5,a5,a4
	li	s0,1
lab392: 	andi	a4,a0,7
	beqz	a4,lab415
	andi	a4,a0,15
	li	a3,4
	beq	a4,a3,lab415
	addi	a4,a0,4
	sltu	a0,a4,a0
	add	a5,a5,a0
	mv	a0,a4
	j	lab415
lab413: 	beqz	a3,lab406
	or	a4,a4,a2
	beqz	a4,lab405
lab449: 	lui	a5,0x400
	li	a0,0
lab463: 	j	lab415
lab412: 	li	a1,2047
	beq	a3,a1,lab416
	add	a2,a0,a2
	sltu	a0,a2,a0
	add	a4,a5,a4
	add	a4,a4,a0
	slli	a0,a4,0x1f
	srli	a2,a2,0x1
	or	a0,a0,a2
	srli	a5,a4,0x1
	mv	s0,a3
	j	lab392
lab385: 	blez	a6,lab417
	bnez	a7,lab418
	or	a3,a4,a2
	beqz	a3,lab388
	addi	a1,a6,-1
	bnez	a1,lab419
	sub	a2,a0,a2
	sub	a4,a5,a4
	sltu	a5,a0,a2
	sub	a5,a4,a5
	mv	a0,a2
lab432: 	j	lab420
lab419: 	li	a3,2047
	beq	a6,a3,lab405
lab424: 	blt	a3,a1,lab421
	li	a3,31
	blt	a3,a1,lab422
	li	a6,32
	sub	a6,a6,a1
	sll	a3,a4,a6
	srl	a7,a2,a1
	sll	a6,a2,a6
	or	a3,a3,a7
	snez	a6,a6
	or	a3,a3,a6
	srl	a1,a4,a1
lab426: 	sub	a1,a5,a1
	sltu	a5,a0,a3
	sub	a5,a1,a5
	mv	a0,a3
lab420: 	lui	s2,0x800
	and	a4,a5,s2
	beqz	a4,lab392
	addi	s2,s2,-1 # 7fffff <__BSS_END__+0x7e5e1b>
	and	s2,a5,s2
	mv	s3,a0
	j	lab423
lab418: 	li	a3,2047
	beq	s0,a3,lab392
	lui	a3,0x800
	or	a4,a4,a3
	mv	a1,a6
	j	lab424
lab422: 	addi	a3,a1,-32
	li	a7,32
	srl	a3,a4,a3
	li	a6,0
	beq	a1,a7,lab425
	li	a6,64
	sub	a6,a6,a1
	sll	a6,a4,a6
lab425: 	or	a6,a6,a2
	snez	a6,a6
	or	a3,a3,a6
lab427: 	j	lab426
lab421: 	or	a3,a4,a2
	snez	a3,a3
	j	lab427
lab417: 	beqz	a6,lab428
	sub	a6,a7,s0
	bnez	s0,lab429
	or	a1,a5,a0
	beqz	a1,lab430
	addi	a1,a6,-1
	bnez	a1,lab431
	sub	a0,a2,a0
	sub	a4,a4,a5
	sltu	a2,a2,a0
	sub	a5,a4,a2
	mv	s1,a3
	j	lab432
lab431: 	li	t1,2047
	bne	a6,t1,lab433
lab435: 	mv	a0,a2
	li	s0,2047
	j	lab434
lab429: 	li	a1,2047
	beq	a7,a1,lab435
	lui	a1,0x800
	or	a5,a5,a1
	mv	a1,a6
lab433: 	li	a6,56
	blt	a6,a1,lab436
	li	a6,31
	blt	a6,a1,lab437
	li	t1,32
	sub	t1,t1,a1
	srl	t3,a0,a1
	sll	a6,a5,t1
	sll	t1,a0,t1
	or	a6,a6,t3
	snez	t1,t1
	or	a0,a6,t1
	srl	a1,a5,a1
lab439: 	sub	a1,a4,a1
	sltu	a2,a2,a0
	sub	a5,a1,a2
	mv	s0,a7
	mv	s1,a3
	j	lab420
lab437: 	addi	a6,a1,-32 # 7fffe0 <__BSS_END__+0x7e5dfc>
	li	t3,32
	srl	a6,a5,a6
	li	t1,0
	beq	a1,t3,lab438
	li	t1,64
	sub	t1,t1,a1
	sll	t1,a5,t1
lab438: 	or	t1,t1,a0
	snez	t1,t1
	or	a0,a6,t1
lab440: 	j	lab439
lab436: 	or	a0,a5,a0
	snez	a0,a0
	j	lab440
lab428: 	addi	a1,s0,1
	andi	a1,a1,2046
	bnez	a1,lab441
	or	a1,a4,a2
	or	a6,a5,a0
	bnez	s0,lab442
	bnez	a6,lab443
	beqz	a1,lab444
	mv	a5,a4
	mv	a0,a2
lab434: 	mv	s1,a3
	j	lab392
lab443: 	beqz	a1,lab392
	sub	a6,a0,a2
	sltu	a7,a0,a6
	sub	a1,a5,a4
	sub	a1,a1,a7
	lui	a7,0x800
	and	a7,a1,a7
	beqz	a7,lab445
	sub	a0,a2,a0
	sub	a4,a4,a5
	sltu	a2,a2,a0
	sub	a5,a4,a2
	j	lab434
lab445: 	or	a0,a6,a1
	beqz	a0,lab446
	mv	a5,a1
	mv	a0,a6
	j	lab392
lab442: 	bnez	a6,lab447
	beqz	a1,lab448
	mv	a5,a4
	mv	a0,a2
	mv	s1,a3
	j	lab405
lab447: 	beqz	a1,lab405
	j	lab449
lab441: 	sub	s3,a0,a2
	sltu	a1,a0,s3
	sub	s2,a5,a4
	sub	s2,s2,a1
	lui	a1,0x800
	and	a1,s2,a1
	beqz	a1,lab450
	sub	s3,a2,a0
	sub	s2,a4,a5
	sltu	a2,a2,s3
	sub	s2,s2,a2
	mv	s1,a3
lab423: 	beqz	s2,lab451
	mv	a0,s2
	jal	ra,__clzsi2
lab456: 	li	a5,31
	blt	a5,a4,lab452
	li	a5,32
	sub	a5,a5,a4
	sll	s2,s2,a4
	srl	a5,s3,a5
	or	a5,a5,s2
	sll	a0,s3,a4
lab457: 	sub	a4,a4,s0
	addi	a2,a4,1
	li	a3,31
	blt	a3,a2,lab454
	li	a4,32
	sub	a4,a4,a2
	sll	a3,a5,a4
	srl	a1,a0,a2
	sll	a4,a0,a4
	or	a3,a3,a1
	snez	a4,a4
	or	a0,a3,a4
	srl	a5,a5,a2
lab459: 	j	lab392
lab450: 	or	a0,s3,s2
	bnez	a0,lab423
	li	a5,0
	li	s0,0
	j	lab455
lab451: 	mv	a0,s3
	jal	ra,__clzsi2
	addi	a0,a0,32
	j	lab456
lab452: 	addi	a5,a0,-40
	sll	a5,s3,a5
	li	a0,0
	j	lab457
lab454: 	addi	a4,a4,-31
	li	a1,32
	srl	a4,a5,a4
	li	a3,0
	beq	a2,a1,lab458
	li	a3,64
	sub	a3,a3,a2
	sll	a3,a5,a3
lab458: 	or	a3,a0,a3
	snez	a3,a3
	or	a0,a4,a3
	li	a5,0
	j	lab459
lab453: 	sub	s0,s0,a4
	lui	a4,0xff800
	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7e5e1b>
	and	a5,a5,a4
	j	lab392
lab401: 	mv	a5,a4
	mv	a0,a2
	mv	s0,a1
	j	lab392
lab414: 	mv	a5,a4
	mv	a0,a2
	j	lab392
lab416: 	li	s0,2047
lab395: 	li	a5,0
	li	a0,0
lab415: 	lui	a4,0x800
	and	a4,a5,a4
	beqz	a4,lab460
	addi	s0,s0,1
	li	a4,2047
	beq	s0,a4,lab461
	lui	a4,0xff800
	addi	a4,a4,-1 # ff7fffff <__BSS_END__+0xff7e5e1b>
	and	a5,a5,a4
lab460: 	slli	a3,a5,0x1d
	srli	a0,a0,0x3
	li	a4,2047
	or	a3,a3,a0
	srli	a5,a5,0x3
	bne	s0,a4,lab462
	or	a3,a3,a5
	li	a5,0
	beqz	a3,lab462
	lui	a5,0x80
	li	a3,0
	li	s1,0
lab462: 	slli	a4,s0,0x14
	lui	a2,0x7ff00
	slli	a5,a5,0xc
	lw	ra,28(sp)
	lw	s0,24(sp)
	and	a4,a4,a2
	srli	a5,a5,0xc
	slli	s1,s1,0x1f
	or	a5,a4,a5
	or	a4,a5,s1
	lw	s2,16(sp)
	lw	s1,20(sp)
	lw	s3,12(sp)
	mv	a0,a3
	mv	a1,a4
	addi	sp,sp,32
	ret
lab388: 	mv	s0,a6
	j	lab392
lab430: 	mv	a5,a4
	mv	a0,a2
	mv	s0,a6
	j	lab434
lab444: 	li	a5,0
	li	a0,0
lab455: 	li	s1,0
	j	lab415
lab446: 	li	a5,0
	j	lab455
lab448: 	li	a0,0
	li	s1,0
	lui	a5,0x400
	j	lab463
lab461: 	li	a5,0
	li	a0,0
	j	lab460
__unorddf2:
	lui	a5,0x100
	addi	a5,a5,-1 # fffff <__BSS_END__+0xe5e1b>
	and	a4,a5,a1
	srli	a1,a1,0x14
	and	a5,a5,a3
	andi	a1,a1,2047
	srli	a3,a3,0x14
	li	a6,2047
	andi	a3,a3,2047
	bne	a1,a6,lab464
	or	a4,a4,a0
	li	a0,1
	bnez	a4,lab465
lab464: 	li	a4,2047
	li	a0,0
	bne	a3,a4,lab465
	or	a5,a5,a2
	snez	a0,a5
lab465: 	ret
__fixdfsi:
	srli	a4,a1,0x14
	lui	a3,0x100
	addi	a5,a3,-1 # fffff <__BSS_END__+0xe5e1b>
	andi	a4,a4,2047
	li	a2,1022
	and	a5,a5,a1
	srli	a1,a1,0x1f
	bge	a2,a4,lab466
	li	a2,1053
	bge	a2,a4,lab467
	lui	a0,0x80000
	not	a0,a0
	add	a0,a1,a0
	ret
lab467: 	or	a5,a5,a3
	li	a3,1075
	sub	a3,a3,a4
	li	a2,31
	blt	a2,a3,lab468
	addi	a4,a4,-1043
	sll	a5,a5,a4
	srl	a0,a0,a3
	or	a0,a5,a0
lab470: 	neg	a0,a0
	ret
lab468: 	li	a3,1043
	sub	a4,a3,a4
	srl	a0,a5,a4
	j	lab470
lab466: 	li	a0,0
lab469: 	ret
__floatsidf:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	beqz	a0,lab471
	srai	a5,a0,0x1f
	xor	s0,a5,a0
	sub	s0,s0,a5
	srli	s1,a0,0x1f
	mv	a0,s0
	jal	ra,__clzsi2
	li	a4,1054
	li	a5,10
	sub	a4,a4,a0
	blt	a5,a0,lab472
	li	a5,11
	sub	a5,a5,a0
	addi	a0,a0,21 # 80000015 <__BSS_END__+0x7ffe5e31>
	srl	a5,s0,a5
	sll	s0,s0,a0
	mv	a0,s1
lab473: 	srli	a5,a5,0xc
	slli	a4,a4,0x14
	slli	a0,a0,0x1f
	or	a4,a4,a5
	lw	ra,12(sp)
	or	a5,a4,a0
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a1,a5
	addi	sp,sp,16
	ret
lab472: 	addi	a0,a0,-11
	sll	a5,s0,a0
	mv	a0,s1
lab474: 	j	lab473
lab471: 	li	a4,0
	li	a5,0
	j	lab474
__clzsi2:
	lui	a5,0x10
	bgeu	a0,a5,lab475
	sltiu	a5,a0,256
	xori	a5,a5,1
	slli	a5,a5,0x3
lab476: 	li	a3,32
	sub	a3,a3,a5
	srl	a0,a0,a5
	addi	a5,a4,-12 # 17ff4 <__clz_tab>
	add	a5,a5,a0
	lbu	a0,0(a5) # 10000 <exit-0x94>
	sub	a0,a3,a0
	ret
lab475: 	lui	a4,0x1000
	li	a5,16
	bltu	a0,a4,lab476
	li	a5,24
	j	lab476
__errno:
	lw	a0,-1200(gp) # 19534 <_impure_ptr>
	ret
__libc_init_array:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s2,0(sp)
	lui	s0,0x19
	lui	s2,0x19
	addi	a5,s0,248 # 190f8 <__init_array_start>
	addi	s2,s2,248 # 190f8 <__init_array_start>
	sub	s2,s2,a5
	sw	ra,12(sp)
	sw	s1,4(sp)
	srai	s2,s2,0x2
	beqz	s2,lab477
	addi	s0,s0,248
	li	s1,0
lab478: 	addi	s1,s1,1
	addi	s0,s0,4
	jalr	a5
	bne	s2,s1,lab478
lab477: 	lui	s0,0x19
	lui	s2,0x19
	addi	a5,s0,248 # 190f8 <__init_array_start>
	addi	s2,s2,256 # 19100 <__do_global_dtors_aux_fini_array_entry>
	sub	s2,s2,a5
	srai	s2,s2,0x2
	beqz	s2,lab479
	addi	s0,s0,248
	li	s1,0
lab480: 	addi	s1,s1,1
	addi	s0,s0,4
	jalr	a5
	bne	s2,s1,lab480
lab479: 	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lw	s2,0(sp)
	addi	sp,sp,16
	ret
memcmp:
	li	a5,3
	bgeu	a5,a2,lab481
	or	a5,a0,a1
	andi	a5,a5,3
	li	a3,3
	bnez	a5,lab482
lab483: 	lw	a5,0(a1) # 800000 <__BSS_END__+0x7e5e1c>
	bne	a4,a5,lab482
	addi	a2,a2,-4 # 7feffffc <__BSS_END__+0x7fee5e18>
	addi	a0,a0,4
	addi	a1,a1,4
	bltu	a3,a2,lab483
lab481: 	addi	a3,a2,-1
	beqz	a2,lab484
lab487: 	add	a3,a0,a3
	j	lab485
lab486: lab485: 	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,lab486
	sub	a0,a5,a4
	ret
lab484: 	li	a0,0
	ret
lab482: 	addi	a3,a2,-1
	j	lab487
memcpy:
	xor	a5,a0,a1
	andi	a5,a5,3
	add	a7,a0,a2
	bnez	a5,lab488
	li	a5,3
	bgeu	a5,a2,lab488
	andi	a5,a0,3
	mv	a4,a0
	bnez	a5,lab489
lab496: 	sub	a3,a2,a4
	li	a5,32
	li	t0,32
	blt	a5,a3,lab490
lab495: 	mv	a5,a4
	bgeu	a4,a2,lab491
lab492: 	addi	a5,a5,4
	addi	a3,a3,4
	sw	a6,-4(a5)
	bltu	a5,a2,lab492
	addi	a5,a2,-1
	sub	a5,a5,a4
	andi	a5,a5,-4
	addi	a5,a5,4
	add	a4,a4,a5
	add	a1,a1,a5
lab491: 	bltu	a4,a7,lab493
lab494: lab488: 	mv	a4,a0
	bgeu	a0,a7,lab494
lab493: 	lbu	a5,0(a1)
	addi	a4,a4,1 # 1000001 <__BSS_END__+0xfe5e1d>
	addi	a1,a1,1
	sb	a5,-1(a4)
	bltu	a4,a7,lab493
	ret
lab490: 	lw	a3,4(a1)
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
	blt	t0,a5,lab490
	j	lab495
lab489: 	lbu	a3,0(a1)
	addi	a4,a4,1
	andi	a5,a4,3
	sb	a3,-1(a4)
	addi	a1,a1,1
	beqz	a5,lab496
	lbu	a3,0(a1)
	addi	a4,a4,1
	andi	a5,a4,3
	sb	a3,-1(a4)
	addi	a1,a1,1
	bnez	a5,lab489
	j	lab496
memmove:
	bgeu	a1,a0,lab497
	add	a5,a1,a2
	bgeu	a0,a5,lab497
	add	a4,a0,a2
	beqz	a2,lab498
lab499: 	addi	a5,a5,-1
	addi	a4,a4,-1
	sb	a3,0(a4)
	bne	a1,a5,lab499
	ret
lab497: 	li	a5,15
	bltu	a5,a2,lab500
	mv	a5,a0
lab507: 	beqz	a2,lab501
lab508: 	add	a3,a5,a3
lab502: 	addi	a5,a5,1
	addi	a1,a1,1
	sb	a4,-1(a5)
	bne	a5,a3,lab502
	ret
lab500: 	or	a5,a0,a1
	andi	a5,a5,3
	bnez	a5,lab503
	addi	a7,a2,-16
	andi	a7,a7,-16
	addi	a7,a7,16 # 800010 <__BSS_END__+0x7e5e2c>
	add	a6,a0,a7
	mv	a4,a1
	mv	a5,a0
lab504: 	addi	a4,a4,16
	addi	a5,a5,16
	sw	a3,-16(a5)
	lw	a3,-12(a4)
	sw	a3,-12(a5)
	lw	a3,-8(a4)
	sw	a3,-8(a5)
	lw	a3,-4(a4)
	sw	a3,-4(a5)
	bne	a6,a5,lab504
	andi	a4,a2,12
	add	a1,a1,a7
	andi	a6,a2,15
	beqz	a4,lab505
	mv	a4,a1
	mv	a7,a5
	li	t3,3
lab506: 	addi	a4,a4,4
	sub	a3,a6,a4
	sw	t1,0(a7)
	add	a3,a1,a3
	addi	a7,a7,4
	bltu	t3,a3,lab506
	addi	a4,a6,-4
	andi	a4,a4,-4
	addi	a4,a4,4
	andi	a2,a2,3
	add	a5,a5,a4
	add	a1,a1,a4
	j	lab507
lab498: 	ret
lab503: 	addi	a3,a2,-1
	mv	a5,a0
	j	lab508
lab501: 	ret
lab505: 	mv	a2,a6
	j	lab507
memset:
	li	t1,15
	mv	a4,a0
	bgeu	t1,a2,lab509
	andi	a5,a4,15
	bnez	a5,lab510
lab514: lab513: 	andi	a2,a2,15
	add	a3,a3,a4
lab512: 	sw	a1,4(a4)
	sw	a1,8(a4)
	sw	a1,12(a4)
	addi	a4,a4,16
	bltu	a4,a3,lab512
	bnez	a2,lab509
	ret
lab509: 	sub	a3,t1,a2
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
lab511: 	zext.b	a1,a1
	slli	a3,a1,0x8
	or	a1,a1,a3
	slli	a3,a1,0x10
	or	a1,a1,a3
	j	lab513
lab510: 	slli	a3,a5,0x2
	auipc	t0,0x0
	add	a3,a3,t0
	mv	t0,ra
	jalr	-96(a3)
	mv	ra,t0
	addi	a5,a5,-16
	sub	a4,a4,a5
	add	a2,a2,a5
	bgeu	t1,a2,lab509
	j	lab514
__call_exitprocs:
	addi	sp,sp,-48
	sw	s4,24(sp)
	lw	s4,-1204(gp) # 19530 <_global_impure_ptr>
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
	beqz	s2,lab515
	mv	s6,a0
	mv	s7,a1
	li	s5,1
	li	s3,-1
lab522: 	addi	s0,s1,-1
	bltz	s0,lab515
	slli	s1,s1,0x2
	add	s1,s2,s1
lab517: 	lw	a5,260(s1)
	beq	a5,s7,lab516
lab519: 	addi	s1,s1,-4
	bne	s0,s3,lab517
lab515: 	lw	ra,44(sp)
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
lab516: 	lw	a5,4(s2)
	lw	a3,4(s1)
	addi	a5,a5,-1
	beq	a5,s0,lab518
	sw	zero,4(s1)
lab525: 	lw	a5,392(s2)
	sll	a4,s5,s0
	lw	s8,4(s2)
	and	a5,a4,a5
	bnez	a5,lab520
	jalr	a3
lab524: 	lw	a5,328(s4)
	bne	a4,s8,lab521
	beq	a5,s2,lab519
lab521: 	beqz	a5,lab515
	mv	s2,a5
	j	lab522
lab520: 	lw	a5,396(s2)
	lw	a1,132(s1)
	and	a4,a4,a5
	bnez	a4,lab523
	mv	a0,s6
	jalr	a3
	j	lab524
lab518: 	sw	s0,4(s2)
	j	lab525
lab523: 	mv	a0,a1
	jalr	a3
	j	lab524
__libc_fini_array:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lui	a5,0x19
	lui	s0,0x19
	addi	a5,a5,256 # 19100 <__do_global_dtors_aux_fini_array_entry>
	addi	s0,s0,260 # 19104 <__fini_array_end>
	sub	s0,s0,a5
	sw	s1,4(sp)
	sw	ra,12(sp)
	srai	s1,s0,0x2
	beqz	s1,lab526
	addi	s0,s0,-4
	add	s0,s0,a5
lab527: 	addi	s1,s1,-1
	addi	s0,s0,-4
	jalr	a5
	bnez	s1,lab527
lab526: 	lw	ra,12(sp)
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
	lw	a4,-1204(gp) # 19530 <_global_impure_ptr>
	lw	a5,328(a4)
	beqz	a5,lab528
lab532: 	li	a6,31
	blt	a6,a4,lab529
	slli	a6,a4,0x2
	beqz	a0,lab530
	add	t1,a5,a6
	sw	a2,136(t1) # 10088 <exit-0xc>
	lw	a7,392(a5)
	li	a2,1
	sll	a2,a2,a4
	or	a7,a7,a2
	sw	a7,392(a5)
	sw	a3,264(t1)
	li	a3,2
	beq	a0,a3,lab531
lab530: 	addi	a4,a4,1
	sw	a4,4(a5)
	add	a5,a5,a6
	sw	a1,8(a5)
	li	a0,0
	ret
lab528: 	addi	a5,a4,332
	sw	a5,328(a4)
	j	lab532
lab531: 	lw	a3,396(a5)
	addi	a4,a4,1
	sw	a4,4(a5)
	or	a3,a3,a2
	sw	a3,396(a5)
	add	a5,a5,a6
	sw	a1,8(a5)
	li	a0,0
	ret
lab529: 	li	a0,-1
	ret
_exit:
	li	a7,93
	ecall
	bltz	a0,lab533
lab534: lab533: 	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	sw	ra,12(sp)
	neg	s0,s0
	jal	ra,__errno
	sw	s0,0(a0)
lab535: 