#define STK_CTRL ((volatile unsigned int *)(0xE000E010))
#define STK_LOAD ((volatile unsigned int *)(0xE000E014))
#define STK_VAL ((volatile unsigned int *)(0xE000E018)) 


void delay_250ns(void)
{
	*STK_CTRL = 0;
	*STK_LOAD = ( (168/4) -1 );
	*STK_VAL = 0;
	*STK_CTRL = 5;
	while( (*STK_CTRL & 0x10000 )== 0 ) {}
	*STK_CTRL = 0;
}

void delay_mikro(unsigned int us)
{
	while(us--) 
	{
		delay_250ns();
		delay_250ns();
		delay_250ns();
		delay_250ns();
	}
}

void delay_milli(unsigned int ms)
{
	#ifdef SIMULATOR
		ms=ms/1000;
		ms++;
	#endif
	while( ms-- )
		delay_mikro(1000);
}