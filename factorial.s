.global factorial
factorial:	stmfd sp!, {r4, lr}
		cmp r0, #0
		moveq r0, #1
		beq ret
		cmp r0, #1
		moveq r0, #1
		beq ret
		mov r4, r0
		sub r0, r0, #1
		bl factorial
		mul r0, r0, r4
ret:		ldmfd sp!, {r4, lr}
		mov pc, lr
