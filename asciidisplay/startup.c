/*
 * 	startup.c
 *
 */

#define GPIO_E 0x40021000 /* MD407 port E */

#define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15)) 
#define B_E 0x40 /* Enable-signal */
#define B_SELECT 4 /* Select ASCII-display */
#define B_RW 2 /* 0=Write, 1=Read */
#define B_RS 1 /* 0=Control, 1=Data */

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

void ascii_ctrl_bit_set( unsigned char x )
{
	unsigned char c;
	c = *GPIO_ODR_LOW;
	c |= ( B_SELECT | x );
	*GPIO_ODR_LOW = c;
}

void ascii_ctrl_bit_clear( unsigned char x )
{
	unsigned char c;
	c = *GPIO_ODR_LOW;
	c &= ( B_SELECT | ~x );
	*GPIO_ODR_LOW = c;
}

void ascii_write_controller( unsigned char c )
{
	ascii_ctrl_bit_set( B_E );
	*GPIO_ODR_HIGH = c;
	ascii_ctrl_bit_clear( B_E );
	delay_250ns();
}

unsigned char ascii_read_controller( void )
{
	unsigned char c;
	ascii_ctrl_bit_set( B_E );
	delay_250ns();
	delay_250ns();
	c = *GPIO_IDR_HIGH;
	ascii_ctrl_bit_clear( B_E );
	return c;
}

unsigned char ascii_read_status(void)
{
	unsigned char c;
	*GPIO_MODER = 0x00005555;
	ascii_ctrl_bit_set( B_RW );
	ascii_ctrl_bit_clear( B_RS );
	c = ascii_read_controller( );
	*GPIO_MODER = 0x55555555;
	return c;
}

unsigned char ascii_read_data(void)
{
	*GPIO_MODER = 0x00005555;
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_set(B_RW);
	unsigned char rv = ascii_read_controller();
	*GPIO_MODER = 0x55555555;
	return rv;
}

void ascii_write_cmd (unsigned char command)
{
	ascii_ctrl_bit_clear( B_RS );
	ascii_ctrl_bit_clear( B_RW );
	ascii_write_controller(command);
}

void ascii_write_data (unsigned char data)
{
	ascii_ctrl_bit_set( B_RS );
	ascii_ctrl_bit_clear( B_RW );
	ascii_write_controller(data);
}

void ascii_command(unsigned char command){
	while((ascii_read_status() & 0x80) == 0x80); //vänta tills displayen kan ta kommando
	delay_mikro(8);
	ascii_write_cmd(command);
}

void ascii_write_char (unsigned char chr)
{
	while(1)
		if(ascii_read_status)
		{
			delay_mikro(8);
			ascii_write_data(chr);
			delay_mikro(43);
			break;
		}
}
void function_set(void){
	ascii_command(0x38); //2 rader, 5x8 punkter
	delay_mikro(39);
}

void display_control(void){
	ascii_command(0xE); //tänd display, tänd markör, konstant visning
	delay_mikro(39);
}

void clear_display(void){
	ascii_command(0x1); 
	delay_milli(2);
}

void entry_mode_set(void){
	ascii_command(0x4); //adressering med ''increment'', inget skift av adressbufferten
}

void ascii_init(void)
{
	function_set();
	display_control();
	clear_display();
	entry_mode_set();
}

void init_app(void)
{
	*GPIO_MODER=0x00005555;
}

void ascii_gotoxy(int x, int y)
{
	int address = x-1;
	if(y==2)
	{
		address = address + 0x40;
	}
	ascii_write_cmd(0x80|address);
	delay_mikro(39);
}

int main(int argc, char **argv)
{
	char *s;
	char test1[]="Alfanumerisk";
	char test2[]="Display - test";
	
	init_app();
	ascii_init();
	ascii_gotoxy(1,1);
	s=test1;
	while(*s)
	{
		ascii_write_char(*s++);
	}
	
	ascii_gotoxy(1,2);
	s = test2;
	while(*s){
		ascii_write_char(*s++);
	}
	return 0;
}

