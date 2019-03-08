//TODO se till att second_count uppdateras och att rätt metoder använder den och liknande.
/*
 * 
 * vet inte vad din plan med second_count är.
 * 
 * generera avbrott,
 * när avbrott genereras skrivs antalet avbrott som gjorts till asciidisplayen
 * 

*/
//Includes
#include <stdio.h>
#include "defines.h"
#include "globals.h"
#include "IRQ.h"
#include "structs.h"
#include "ball.h"



//Startup
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


//inits
void init_app(void){
	//för avbrott
	*((unsigned long *) 0x40023830) =0x18;
	*((unsigned long *) 0x40023844) |=0x4000; 
	*((unsigned long *) 0xE000ED08) =0x2001C000; //flytta vektortabellen för undantag till adress 0x2001C000 
	*((void(**)(void))0x2001C03C) = systick_irq_handler; //init med adress till hanteringsrutin
	
	//port init
	GPIO_E.moder = 0x55555555; //15-0 utgång. För LCD
	GPIO_D.moder = 0x55005555; //15-12 och 7-0 utgång. För keypad
	GPIO_D.otyper = 0x0000; //onödig tilldelning?
	GPIO_D.pupdr = 0x55aa0000; 
	
	systick_flag = 0;
	second_count = 0;
}



void main(void)
{
	char c;
	POBJECT p = &ball;
	init_app();
	graphic_initialize();
	graphic_clear_screen();
	
	while (1){
		p->move(p);
		delay_milli(40);
		c=keyb();
		switch(c){
			case 6: p->set_speed(p,2,0); break;
			case 4: p->set_speed(p,-2,0); break;
			case 2: p->set_speed(p,0,-2); break;
			case 8: p->set_speed(p,0,2); break;
		}
	}
}