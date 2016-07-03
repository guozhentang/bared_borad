#define GPFCON 				(*((volatile unsigned int*)(0x56000050)))
#define GPFDAT 				(*((volatile unsigned int*)(0x56000054)))
#define GPGCON 				(*((volatile unsigned int*)(0x56000060)))
#define GPGDAT 				(*((volatile unsigned int*)(0x56000064)))
#define INTOFFSET           (*(volatile unsigned long *)0x4A000014)
#define SRCPND              (*(volatile unsigned long *)0x4A000000)
#define PRIORITY            (*(volatile unsigned long *)0x4A00000c)
#define INTMSK              (*(volatile unsigned long *)0x4A000008)


#define GPF4_out (1<<(4*2))//[9:8]:01
#define GPF5_out (1<<(5*2))//[11:10]:01
#define GPF6_out (1<<(6*2))//[13:12]:01

#define GPF0_inter (1<<(1))//[1:0]:10
#define GPF2_in (0<<(2*2))//[5:4]:00
#define GPG3_in (0<<(3*2))//[7:6]:00

#define GPF4_mask (3<<(4*2))
#define GPF5_mask (3<<(5*2))
#define GPF6_mask (3<<(6*2))

#define GPF0_mask (3<<(0*2))
#define GPF2_mask (3<<(2*2))
#define GPF3_mask (3<<(3*2))



#define INTPND (*((volatile unsigned int*)(0X4A000010)))
void init_led(void)
{
    // LED1,LED2,LED4对应的3根引脚设为输出
    GPFCON &= ~(GPF4_mask | GPF5_mask | GPF6_mask);
    GPFCON |= GPF4_out | GPF5_out | GPF6_out;
}

/*
 * 初始化GPIO引脚为外部中断
 * GPIO引脚用作外部中断时，默认为低电平触发、IRQ方式(不用设置INTMOD)
 */ 
void init_irq( )
{
    // S2,S3对应的2根引脚设为中断引脚 EINT0,ENT2
    GPFCON &= ~GPF0_mask;
    GPFCON |= GPF0_inter;

        
    /*
     * 设定优先级：
     * ARB_SEL0 = 00b, ARB_MODE0 = 0: REQ1 > REQ3，即EINT0 > EINT2
     * 仲裁器1、6无需设置
     * 最终：
     * EINT0 > EINT2 > EINT11即K2 > K3 > K4
     */
    PRIORITY = (PRIORITY & ((~0x01) | (0x3<<7))) | (0x0 << 7) ;

    // EINT0、EINT2、EINT8_23使能
    INTMSK   &= ~(1<<0);
}

/*
void init_gpio()
{
	
	GPFCON &= ~GPF4_mask;
	GPFCON |= GPF4_out;
	GPFCON &= ~GPF0_mask;
	GPFCON |= GPF0_inter;
	GPFDAT|=(1<<4); 
	PRIORITY = (PRIORITY & ((~0x01) | (0x3<<7))) | (0x0 << 7);
	INTMSK   &= (~(1<<0));
}
*/
void EINT_Handle()
{
	int oft=INTOFFSET;
		//judge if it is the gpf interrupt
	if(oft==0)
	{
		GPFDAT |= (0x7<<4);   // 所有LED熄灭
		GPFDAT&=(~(1<<4));;    //botton down
	
	}
		/*
		if(GPFDAT&(1<<2))
		{
			GPFDAT=GPFDAT|(1<<5);    //botton up
		}
		else
		{
			GPFDAT=GPFDAT&(~(1<<5));      //boton down
		}
		if(GPGDAT&(1<<3))
		{
			GPFDAT=GPFDAT|(1<<6);    //botton up
		}
		else
		{
			GPFDAT=GPFDAT&(~(1<<6));      //boton down
		}
		*/
	//clear interrupt
	SRCPND = 1<<oft;
    INTPND = 1<<oft;;
}	

