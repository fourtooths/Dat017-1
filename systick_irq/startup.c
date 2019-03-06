#define GPIO_D 0x40020c00 /* MD407 port D */

#define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))

#define STK_CTRL ((volatile unsigned int *)(0xE000E010))
#define STK_LOAD ((volatile unsigned int *)(0xE000E014))
#define STK_VAL ((volatile unsigned int *)(0xE000E018)) 

static volatile int systick_flag;
static volatile int delay_count;
 
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

#ifdef SIMULATOR
#define DELAY_COUNT 100
#else
#define DELAY_COUNT 1000000
#endif

void delay_1mikro(void)
{
	systick_flag=0;
	*STK_CTRL = 0;
	*STK_LOAD = ( 168 -1 );
	*STK_VAL = 0;
	*STK_CTRL = 7;

}

void delay(unsigned int count)
{
	if( count == 0)
	return;
	delay_count = count;
	systick_flag = 0;	
	delay_1mikro();
}

void systick_irq_handler (void)
{
	*STK_CTRL = 0;
	delay_count -- ;
	if( delay_count > 0 )
	delay_1mikro();
	else
	systick_flag = 1;
}

void init_app(void)
{
	*GPIO_MODER = 0x00005555;
	*GPIO_OTYPER = 0x0000;
	*((void(**)(void))0x2001C03C) = systick_irq_handler;

}

void main(void)
{
	init_app();
	*GPIO_ODR_LOW = 0;
	delay(DELAY_COUNT);
	*GPIO_ODR_LOW = 0xff;
	while(1)
	{
		if(systick_flag)
		{
			break;
		}
		//kod som utförs under väntetiden
	}
	//kod som "väntar på time-out"
	*GPIO_ODR_LOW = 0;
}

