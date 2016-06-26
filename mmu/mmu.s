.equ       	MEM_CTL_BASE,       0x48000000
.equ        SDRAM_BASE,         0x30000000
.equ		SDRAM_CODE,         0x31000000
.equ		SDRAM_STACK, 		0x34000000
.equ	 	MMU_FULL_ACCESS,     (3 << 10)
.equ MMU_DOMAIN,          (0 << 5)
.equ MMU_SPECIAL,        (1 << 4)
.equ MMU_CACHEABLE,       (1 << 3)
.equ MMU_BUFFERABLE,      (1 << 2)
.equ MMU_SECTION,         (2)
.equ MMU_SECDESC,         (MMU_FULL_ACCESS | MMU_DOMAIN | MMU_SPECIAL | MMU_SECTION)
.equ MMU_SECDESC_WB,      (MMU_FULL_ACCESS | MMU_DOMAIN | MMU_SPECIAL | MMU_CACHEABLE | MMU_BUFFERABLE | MMU_SECTION)
.equ MMU_SECTION_SIZE,    0x00100000


.global _start
_start:
	@shutdown watch dog
	bl 	_close_watchdog
	bl 	_init_adram
	bl 	_copy_to_sdram
	bl 	_make_mmu_table
	bl 	_enable_mmu
	ldr sp,=0xB4000000
	ldr pc,=0xB1000000




_make_mmu_table:
	mov r0,	#SDRAM_BASE
	ldr r1,	=(0&0xfff00000)|MMU_SECDESC_WB
	str r1, [r0]
	ldr r1,	=(0x56000000&0xfff00000)|MMU_SECDESC
	ldr r2, =(0xA0000000>>18)
	add r0,r0,r2
	str r1, [r0]
	mov r0,	#0x30000000
	mov r1, #0xB0000000
3:
	mov r2, r0
	ldr r5, =0xfff00000
	and r2, r2, r5
	ldr r5, =MMU_SECDESC_WB
	orr r2, r2, r5   @R2存的就是将要填写的值
	mov r3, r1,LSR#18
	add r3,r3,#0x30000000@R3存的就是将要填写的地址
	str r2, [r3]
	cmp r0, #0x34000000
	add r0,r0,#0x100000
	add r1,r1,#0x100000
	bne 3b
	mov pc, lr

_enable_mmu:
	mov	r0, #0
	mcr	p15, 0, r0, c7, c7, 0	
	mcr	p15, 0, r0, c7, c10, 4
	mcr	p15, 0, r0, c8, c7, 0	
	mov	r4, #SDRAM_BASE
	mcr	p15, 0, r4, c2, c0, 0	
	mvn	r0, #0
	mcr	p15, 0, r0, c3, c0, 0
	mrc	p15, 0, r0, c1, c0, 0
	bic	r0, r0, #0x3000
	bic	r0, r0, #0x0300
	bic	r0, r0, #0x0087
	orr	r0, r0, #0x0002
	orr	r0, r0, #0x0004
	orr	r0, r0, #0x1000
	orr	r0, r0, #0x0001
	mcr	p15, 0, r0, c1, c0, 0
	mov pc, lr

_close_watchdog:
	ldr r0, =0x53000000
	mov r1, #0x0
	str r1, [r0]
	mov pc, lr

_copy_to_sdram:
	mov r1,#2048
	ldr r2,=SDRAM_CODE
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

