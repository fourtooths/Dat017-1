
#define GPIO_D 0x40020c00 /* MD407 port D */

#define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15)) 
//#define GPIO_ODR_LOW ((volatile unsigned char *)0x40020c14) //Inte säker om detta är rätt 


void app_init(void)
{
	*GPIO_MODER = 0x55005555;
	*GPIO_OTYPER = 0x0000;
	*GPIO_PUPDR = 0x55aa0000;
}

void kbdActive(unsigned char row)
{
	switch(row){
		case 1: *GPIO_ODR_HIGH = 0x10; break;
		case 2: *GPIO_ODR_HIGH = 0x20; break;
		case 3: *GPIO_ODR_HIGH = 0x40; break;
		case 4: *GPIO_ODR_HIGH = 0x80; break;
		default: *GPIO_ODR_HIGH = 0;

	}
}

unsigned char kbdGetCol(void)
{
	unsigned char c = *GPIO_IDR_HIGH;
	
	if(c&0x8) return 4;
	if(c&0x4) return 3;
	if(c&0x2) return 2;
	if(c&0x1) return 1;
	return 0;
}

unsigned char keyb(void)
{
	unsigned char row, col;
	unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE, 0, 0xF, 0xD};
	for(row=1; row<=4; row++){
		kbdActive(row);
		
		if(col=kbdGetCol()){
			kbdActive(0);
			
			return key[(row-1)*4+(col-1)];
		}
	}
	kbdActive(0);
	return 0xff;
}
