#define GPFCON (*((volatile unsigned int*)(0xA0000050)))
#define GPFDAT (*((volatile unsigned int*)(0xA0000054)))
#define GPGCON (*((volatile unsigned int*)(0xA0000060)))
#define GPGDAT (*((volatile unsigned int*)(0xA0000064)))
#define GPF4_out (1<<(4*2))//[9:8]:01
#define GPF5_out (1<<(5*2))//[11:10]:01
#define GPF6_out (1<<(6*2))//[13:12]:01

#define GPF0_in (0<<(0*2))//[1:0]:00
#define GPF2_in (0<<(2*2))//[5:4]:00
#define GPG3_in (0<<(3*2))//[7:6]:00

#define GPF4_mask (3<<(4*2))
#define GPF5_mask (3<<(5*2))
#define GPF6_mask (3<<(6*2))

#define GPF0_mask (3<<(0*2))
#define GPF2_mask (3<<(2*2))
#define GPF3_mask (3<<(3*2))

int init_gpio();


int main()
{
	init_gpio();
	while(1)
	{
		if(GPFDAT&(1<<0))
		{
			GPFDAT=GPFDAT|(1<<4);    //botton up
		}
		else
		{
			GPFDAT=GPFDAT&(~(1<<4));      //boton down
		}
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
	}
	return 0;
}	
int init_gpio()
{
	
	GPFCON=GPFCON&(~GPF4_mask)&(~GPF5_mask)&(~GPF6_mask)&(~GPF0_mask)&(~GPF2_mask);
	GPGCON=GPFCON&(~GPF3_mask);
	GPFCON=GPFCON|GPF4_out|GPF5_out|GPF6_out|GPF0_in|GPF2_in;
	GPGCON=GPGCON|GPG3_in;
	return 0;
}

