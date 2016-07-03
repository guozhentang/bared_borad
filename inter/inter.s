.equ INTMSK,	0X4A000008
.global _start 
_start:
@****************************************************************************** 	  
@ �쳣�������������У���Reset��HandleIRQ�⣬�����쳣��û��ʹ��
@****************************************************************************** 	  
b	Reset
	
@ 0x04: δ����ָ����ֹģʽ��������ַ
HandleUndef:
	b	HandleUndef 
	 
@ 0x08: ����ģʽ��������ַ��ͨ��SWIָ������ģʽ
HandleSWI:
	b	HandleSWI
	
@ 0x0c: ָ��Ԥȡ��ֹ���µ��쳣��������ַ
HandlePrefetchAbort:
	b	HandlePrefetchAbort
	
@ 0x10: ���ݷ�����ֹ���µ��쳣��������ַ
HandleDataAbort:
	b	HandleDataAbort
	
@ 0x14: ����
HandleNotUsed:
	b	HandleNotUsed
	
@ 0x18: �ж�ģʽ��������ַ
	b	_inter_handle
	
@ 0x1c: ���ж�ģʽ��������ַ
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
	@ ��CPSR�е��жϿ���
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
