#define GPFCON (*((volatile unsigned int*)(0x56000050)))
#define GPFDAT (*((volatile unsigned int*)(0x56000054)))


int sleep(int u_s)
{
	volatile int i;
	volatile int j = 0;
	volatile unsigned int s=10000*u_s;
	for (j=0;j<s;j++)
	{
		for (i=0;i<s;i++)
		{
			j++;
		}
	}
	return j;
}
int init_gpio()
{
	
	GPFCON=0x1500;
	GPFDAT|=0xffffffff;
	return 0;
}
int main()
{
	init_gpio();
	while(1)
	{
		GPFDAT|=0xffffffff;
		GPFDAT=GPFDAT&(~0x40);
		sleep(3);
		GPFDAT|=0xffffffff;
		GPFDAT=GPFDAT&(~0x20);
		sleep(3);
		GPFDAT|=0xffffffff;
		GPFDAT=GPFDAT&(~0x10);
		sleep(3);
	}
	return 0;
}	
