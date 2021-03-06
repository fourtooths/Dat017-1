#include <stdio.h>
#include "defines.h"

void kbdActive(unsigned char row)
{
	switch(row){
		case 1: GPIO_D.odrHigh = 0x10; break;
		case 2: GPIO_D.odrHigh = 0x20; break;
		case 3: GPIO_D.odrHigh = 0x40; break;
		case 4: GPIO_D.odrHigh = 0x80; break;
		default: GPIO_D.odrHigh = 0;

	}
}


unsigned char kbdGetCol(void)
{
	unsigned char c = GPIO_D.idrHigh;
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