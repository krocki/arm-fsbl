
.global _reset
_reset:
	ldr	sp, [pc, #4]
	b	_print

_print:
	
