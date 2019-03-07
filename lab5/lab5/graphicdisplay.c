#include "defines.h"

void graphic_ctrl_bit_set(unsigned char x){
	GPIO_E.odrLow |= x & ~B_SELECT;
}


//Välj grafisk display och nollställ de bitar som är 1 i x
void graphic_ctrl_bit_clear(unsigned char x){
	GPIO_E.odrLow &= (~x & ~B_SELECT);
}


//Konfigurera CS-signalerna
void select_controller(unsigned char controller){
    switch(controller){
        case 0:
            graphic_ctrl_bit_clear(B_CS1 | B_CS2);
            break;
        case B_CS1:
            graphic_ctrl_bit_set(B_CS1);
            graphic_ctrl_bit_clear(B_CS2);
            break;
        case B_CS2:
            graphic_ctrl_bit_set(B_CS2);
            graphic_ctrl_bit_clear(B_CS1);
            break;
        case (B_CS1 | B_CS2):
            graphic_ctrl_bit_set(B_CS1 | B_CS2);
			break;
        default:
            graphic_ctrl_bit_clear(B_CS1 | B_CS2);
    }
}





//Undersök ''busy'' flaggan, och returnera från funktion när den blir 0
void graphic_wait_ready(void){
	graphic_ctrl_bit_clear(B_E);
	
	GPIO_E.moder = 0x00005555;  //15-8 utgång, 7-0 ingång
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_set(B_RW); //Gör så vi kollar status
	delay_500ns();
	
	while(GPIO_E.idrHigh & 1<<7){ //gör detta medan busy-flaggan inte är 0
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
	}
	
	graphic_ctrl_bit_set(B_E);
	GPIO_E.moder = 0x55555555; //15-0 utgång
}



unsigned char graphic_read(unsigned char controller){
	graphic_ctrl_bit_clear(B_E);
	
	GPIO_E.moder = 0x00005555;  //15-8 utgång, 7-0 ingång
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_set(B_RW); //Gör så vi kan läsa data
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	unsigned char RV = GPIO_E.idrHigh;
	graphic_ctrl_bit_clear(B_E);
	GPIO_E.moder = 0x55555555; //15-0 utgång
	
	if (controller == B_CS1){
		select_controller(B_CS1);
		graphic_wait_ready();
	} else if (controller == B_CS2){
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	return RV;
}


void graphic_write(unsigned char value, unsigned char controller){
	GPIO_E.odrHigh = value;
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	graphic_ctrl_bit_clear(B_E);
	
	if (controller & B_CS1){
		select_controller(B_CS1);
		graphic_wait_ready();
	} else if (controller & B_CS2){
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	
	GPIO_E.odrHigh = 0;
	graphic_ctrl_bit_set(B_E);
	select_controller(0);
}


void graphic_write_command(unsigned char command, unsigned char controller){
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(command, controller);
}

void graphic_write_data(unsigned char data, unsigned char controller){
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(data, controller);
}

unsigned char graphic_read_data(unsigned char controller){
	graphic_read(controller); //Nonsens
	return graphic_read(controller); //korrekt data
}

void graphic_initialize(void){
	graphic_ctrl_bit_set(B_E);
	delay_mikro(10);
	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
	delay_milli(30);
	graphic_ctrl_bit_set(B_RST);
	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
	graphic_write_command(LCD_ON, B_CS1|B_CS2);         //toggla display
	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2); //start=0
	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);    //add=0
	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);   //page=0
	select_controller(0);                               //deaktivera båda CS-signalerna
}

void graphic_clear_screen(void){
	for (int i = 0; i<=7; i++){
		graphic_write_command(LCD_SET_PAGE | i, B_CS1|B_CS2);
		graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
		for(int w = 0; w<=63; w++){
			graphic_write_data(0, B_CS1|B_CS2);
		}
	}
}

void pixel(unsigned char x, unsigned char y, unsigned char set){
	if(x < 1 || x > 128 || y < 1 || y > 64 || set < 0 || set > 1){  //kolla så värdena är tillåtna
		return;
	}
	
	unsigned char index = (y-1)/8;
	unsigned char bitmask;
	unsigned char controller;
	unsigned char x_fysisk;
	
	switch((y-1) % 8){
		case 0:
			bitmask = 1;
			break;
		case 1:
			bitmask = 2;
			break;
		case 2:
			bitmask = 4;
			break;
		case 3:
			bitmask = 8;
			break;
		case 4:
			bitmask = 0x10;
			break;
		case 5:
			bitmask = 0x20;
			break;
		case 6:
			bitmask = 0x40;
			break;
		case 7:
			bitmask = 0x80;
			break;
	}
	
	if(set == 0){
		bitmask = ~bitmask;
	}
	
	if(x > 64){
		controller = B_CS2;
		x_fysisk = x - 65;
	} else{
		controller = B_CS1;
		x_fysisk = x - 1;
	}
	
	graphic_write_command(LCD_SET_ADD | x_fysisk, controller);
	graphic_write_command(LCD_SET_PAGE | index, controller);
	unsigned char temp = graphic_read_data(controller);
	graphic_write_command(LCD_SET_ADD | x_fysisk, controller);
	
	
	if(set == 1){
		bitmask = (bitmask | temp);
	} else{
		bitmask = (bitmask & temp);
	}
	
	graphic_write_data(bitmask, controller);
}
