	.text
	.global _reset
	.align 2
_reset:

/* Clear cp15 regs with unknown reset values */
	mov	r0, #0x0
	mcr	p15, 0, r0, c5, c0, 0	/* DFSR */
	mcr	p15, 0, r0, c5, c0, 1	/* IFSR */
	mcr	p15, 0, r0, c6, c0, 0	/* DFAR */
	mcr	p15, 0, r0, c6, c0, 2	/* IFAR */
	mcr	p15, 0, r0, c9, c13, 2	/* PMXEVCNTR */
	mcr	p15, 0, r0, c13, c0, 2	/* TPIDRURW */
	mcr	p15, 0, r0, c13, c0, 3	/* TPIDRURO */

/* Reset and start Cycle Counter */
	mov	r2, #0x80000000		/* clear overflow */
	mcr	p15, 0, r2, c9, c12, 3
	mov	r2, #0xd		/* D, C, E */
	mcr	p15, 0, r2, c9, c12, 0
	mov	r2, #0x80000000		/* enable cycle counter */
	mcr	p15, 0, r2, c9, c12, 1

	bx	lr

hello:
	push {r7, lr}

	mov r0, #1
	ldr r1, =string
	mov r2, #20
	mov r7, #4
	svc #0

	pop {r7, pc}

.data
string: .asciz "Hello World\n"

.end
