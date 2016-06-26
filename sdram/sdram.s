.equ        MEM_CTL_BASE,       0x48000000
.equ        SDRAM_BASE,         0x30000000

.global _start
_start:
	@shutdown watch dog
	ldr r0, =0x53000000
	mov r1, #0x0
	str r1, [r0]
	
	bl _init_adram
	bl _copy_to_sdram
	ldr pc, =_setup_main
	
_setup_main:
	ldr sp,=0x34000000
	bl main
halt_loop:
	b halt_loop


_copy_to_sdram:
	mov r1,#0
	ldr r2,=SDRAM_BASE
	ldr r3,=1024*4
2:
	ldr r4, [r1],#4
	str r4, [r2],#4
	cmp r1, r3
	bne 2b
	mov pc, lr


_init_adram:
	mov r1,#MEM_CTL_BASE
	adrl r2, mem_cfg_val
	
	@add r3,r1,#52
	ldr r3,=MEM_CTL_BASE+52
1:
	ldr r4, [r2],#4
	str r4, [r1],#4
	cmp r1, r3
	bne 1b
	mov pc, lr


	
.align 4
mem_cfg_val:
		@ 存储控制器13个寄存器的设置值
	.long	0x22011110		@ BWSCON
	.long	0x00000700		@ BANKCON0
	.long	0x00000700		@ BANKCON1
	.long	0x00000700		@ BANKCON2
	.long	0x00000700		@ BANKCON3	
	.long	0x00000700		@ BANKCON4
	.long	0x00000700		@ BANKCON5
	.long	0x00018005		@ BANKCON6
	.long	0x00018005		@ BANKCON7
	.long	0x008C07A3		@ REFRESH
	.long	0x000000B1		@ BANKSIZE
	.long	0x00000030		@ MRSRB6
	.long	0x00000030		@ MRSRB7

