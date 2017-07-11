.text
_vector_table:
	b	_boot
	b	Undefined
	b	SVCHandler
	b	PrefetchAbortHandler
	b	DataAbortHandler
	nop	{0}
	b	IRQHandler
	b	FIQHandler
IRQHandler:
FIQHandler:
FIQLoop:
Undefined:
SVCHandler:
DataAbortHandler:
PrefetchAbortHandler:
_boot:
	mrc	p15,0,r1,c0,c0,5
	and	r1, r1, #0xf
	cmp	r1, #0
	beq	OKToRun
OKToRun:
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

