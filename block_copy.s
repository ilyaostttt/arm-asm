.text
		.global block_copy
		/* r0 - dst, r1 - src, r2 - size */
block_copy:	stmfd sp!, {r4-r8}
		mov r3, r2
copy_block:	cmp r2, #16
		blt copy_byte
		ldmia r1!, {r5-r8}
		stmia r0!, {r5-r8}
		sub r2, r2, #16
		b copy_block
copy_byte:	cmp r2, #0
		beq done
		ldrb r5, [r1], #+1
		strb r5, [r0], #+1
		sub r2, #1
		b copy_byte
 done:		ldmfd sp!, {r4-r8}
		mov r3, r0
		mov pc, lr
