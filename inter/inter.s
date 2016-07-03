.equ INTMSK,	0X4A000008
.global _start 
_start:
@****************************************************************************** 	  
@ 异常向量，本程序中，除Reset和HandleIRQ外，其它异常都没有使用
@****************************************************************************** 	  
b	Reset
	
@ 0x04: 未定义指令中止模式的向量地址
HandleUndef:
	b	HandleUndef 
	 
@ 0x08: 管理模式的向量地址，通过SWI指令进入此模式
HandleSWI:
	b	HandleSWI
	
@ 0x0c: 指令预取终止导致的异常的向量地址
HandlePrefetchAbort:
	b	HandlePrefetchAbort
	
@ 0x10: 数据访问终止导致的异常的向量地址
HandleDataAbort:
	b	HandleDataAbort
	
@ 0x14: 保留
HandleNotUsed:
	b	HandleNotUsed
	
@ 0x18: 中断模式的向量地址
	b	_inter_handle
	
@ 0x1c: 快中断模式的向量地址
HandleFIQ:
	b	HandleFIQ
Reset:
	@[0:4]10010 interrupt mod
	msr cpsr_c, #0xd2       
    ldr sp, =1024*3
    @[0:4]10011 interrupt mod
    msr cpsr_c, #0xd3
	bl _close_watch_dog
	ldr sp,=1024*4
	@open interrupt set I bit =0
	bl init_led
	bl init_irq
	@ 打开CPSR中的中断开关
	msr cpsr_c, #0x53
	bl main


_close_watch_dog:
	ldr r0, =0x53000000
	mov r1, #0x0
	str r1, [r0]
	mov pc, lr
_inter_handle:
	@store the scence
	sub lr,lr, #4
	stmdb sp!, {r0-r12,lr} 
	@jump to inter handle
	ldr lr, =int_return
	ldr pc, =EINT_Handle
	@recovery the scence
int_return:
	ldmia sp!, {r0-r12,pc}^
