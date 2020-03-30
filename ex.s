.global ex4_2
ex4_2:	mov r0, #1
	mov r1, #0x20
	orr r1, r1, r0
	lsl r1, #0x2
	orr r1, r1, r0
	eor r0, r0, r1
	lsr r1, r1, #3
	mov pc, lr
