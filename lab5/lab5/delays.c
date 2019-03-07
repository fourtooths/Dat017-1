#include "defines.h"
#include "globals.h"

void delay_250ns(void){
	
	*STK_CTRL = 0;
	*STK_LOAD = ( (168/4) -1 );
	*STK_VAL = 0;
	*STK_CTRL = 5;
	while( (*STK_CTRL & 0x10000 )== 0 ) {}
	*STK_CTRL = 0;
}

void delay_500ns(void){
	delay_250ns();
	delay_250ns();
}

void delay_mikro(unsigned int us){
	
	while(us--) 
	{
		delay_250ns();
		delay_250ns();
		delay_250ns();
		delay_250ns();
	}
}

void delay_milli(unsigned int ms){
	#ifdef SIMULATOR
		ms=ms/1000;
		ms++;
	#endif
	while( ms-- )
		delay_mikro(1000);
}

void delay_1s(void){
	systick_flag=0;
	*STK_CTRL = 0;
	*STK_LOAD = ( 1680000000 -1 );
	*STK_VAL = 0;
	*STK_CTRL = 7;

}

void delay(unsigned int count){
	if( count == 0)
	return;
	delay_count = count;
	systick_flag = 0;	
	delay_1s();
}