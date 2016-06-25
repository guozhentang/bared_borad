.global _start
_start:
	ldr r0,=0x56000050
	ldr r1,=0b1010100000000
	str r1, [r0]

	ldr r0,=0x56000054
	ldr r1,=0b1110000
	str r1, [r0]