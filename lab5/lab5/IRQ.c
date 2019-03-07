#include "defines.h"
#include "globals.h"

void systick_irq_handler (void)
{
	
	//Öka second_count, 
	*STK_CTRL = 0;
	delay_count -- ;
	if( delay_count > 0 )
	delay_1s();
	else
	systick_flag = 1;
	
}