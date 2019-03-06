
//för initieringar
#define portE 0x40021000
#define portModerE ((volatile unsigned int*) (portE))
#define portOtyperE ((volatile unsigned short*) (portE + 4))
#define portOspeedrE ((volatile unsigned int*) (portE + 8))
#define portPupdrE ((volatile unsigned int*) (portE + 0xC))

//för data
#define portIdrLowE ((volatile unsigned char*) (portE + 0x10))
#define portIdrHighE ((volatile unsigned char*) (portE + 0x11))
#define portOdrLowE ((volatile unsigned char*) (portE + 0x14))
#define portOdrHighE ((volatile unsigned char*) (portE + 0x15))

//för styrregister
#define B_E 0x40
#define B_SELECT 0x4
#define B_RW 0x2
#define B_RS 0x1
#define B_RST 0x20
#define B_CS2 0x10
#define B_CS1 0x8


//för LCD
#define LCD_OFF 0x3E
#define LCD_ON 0x3F
#define LCD_DISP_START 0xC0
#define LCD_SET_ADD 0x40
#define LCD_SET_PAGE 0xB8
#define LCD_BUSY 0x80



//för delay
#define stk_ctrl (volatile unsigned int*) 0xE000E010
#define stk_load (volatile unsigned int*) 0xE000E014
#define stk_val (volatile unsigned int*) 0xE000E018


#define MAX_POINTS 20


typedef unsigned char uint8_t;

typedef struct tPoint{
	unsigned char x;
	unsigned char y;
}POINT;


typedef struct tGeometry{
	int numPoints;
	int sizeX;
	int sizeY;
	POINT px[MAX_POINTS];
} GEOMETRY, *PGEOMETRY;


typedef struct tObject{
	PGEOMETRY geo;
	int dirX, dirY;
	int posX, posY;
	void(*draw)(struct tObject*);    //rita i position x och y
	void(*clear)(struct tObject*);   //radera objektet
	void(*move)(struct tObject*); 
	void(*set_speed)(struct tObject*, int, int);
} OBJECT, *POBJECT;

GEOMETRY ball_geometry = 
{
	12,         //numPoints
	4, 4,       //sizeX, sizeY
	{
		//px[0, 1, 2, ....]
		{0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2}, 
		{1, 3}, {2, 0}, {2, 1}, {2, 2}, {2, 3}, 
		{3, 2}
	}
};



__attribute__((naked))
__attribute__((section(".start_section")))
void startup(void){
	__asm volatile(
	" LDR R0,=0x2001C000\n"
	" MOV SP, R0\n"
	" BL main\n"
	" B . \n"
	);
}


//Delay funktioner
void delay_250ns(void){
	/*
	*stk_ctrl = 0x00000000;
	*stk_load = 0x00021001;
	*stk_val = 0x00000000;
	*stk_ctrl = 0x00000101;
	while(((*stk_ctrl) & 0x00010000) == 0);
	*stk_ctrl = 0x00000000;
	*/
}

void delay_500ns(void){
	delay_250ns();
	delay_250ns();
}



void delay_mikro(unsigned int us){
	/*
	for(int i = 0; i < us; i++){
		for(int w = 0; w < 4; w++){
			delay_250ns();
		}
	}
	 */
}

void delay_milli(unsigned int ms){
	/*
	unsigned int us = ms * 1000;
	delay_mikro(us);
	 */
	
}




//Välj grafisk display och ettställ de bitar som är 1 i x
void graphic_ctrl_bit_set(uint8_t x){
	*portOdrLowE |= x & ~B_SELECT;
}


//Välj grafisk display och nollställ de bitar som är 1 i x
void graphic_ctrl_bit_clear(uint8_t x){
	*portOdrLowE &= (~x & ~B_SELECT);
}


//Konfigurera CS-signalerna
void select_controller(uint8_t controller){
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
	
	*portModerE = 0x00005555;  //15-8 utgång, 7-0 ingång
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_set(B_RW); //Gör så vi kollar status
	delay_500ns();
	
	while(*portIdrHighE & 1<<7){ //gör detta medan busy-flaggan inte är 0
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
	}
	
	graphic_ctrl_bit_set(B_E);
	*portModerE = 0x55555555; //15-0 utgång
}



unsigned char graphic_read(unsigned char controller){
	graphic_ctrl_bit_clear(B_E);
	
	*portModerE = 0x00005555;  //15-8 utgång, 7-0 ingång
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_set(B_RW); //Gör så vi kan läsa data
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	unsigned char RV = *portIdrHighE;
	graphic_ctrl_bit_clear(B_E);
	*portModerE = 0x55555555; //15-0 utgång
	
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
	*portOdrHighE = value;
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
	
	*portOdrHighE = 0;
	graphic_ctrl_bit_set(B_E);
	select_controller(0);
}


void graphic_write_command(uint8_t command, uint8_t controller){
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(command, controller);
}

void graphic_write_data(uint8_t data, uint8_t controller){
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



void init_app(void){
	*portModerE = 0x55555555; //15-0 utport
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


void set_object_speed(POBJECT o, int speedX, int speedY){
	o->dirX = speedX;
	o->dirY = speedY;
}

void draw_object(POBJECT o){
	for(int i = 0; i < o->geo->numPoints; i++){
		pixel(o->posX + o->geo->px[i].x, o->posY + o->geo->px[i].y, 1);
	}
}

void clear_object(POBJECT o){
	for(int i = 0; i < o->geo->numPoints; i++){
		pixel(o->posX + o->geo->px[i].x, o->posY + o->geo->px[i].y, 0);
	}
}


void move_object(POBJECT object){
	if(object->posX >118){
		object->set_speed(object, -2, object->dirY);
	} else if (object->posX <10){
		object->set_speed(object, 2, object->dirY);
	}
	if (object->posY <10){
		object->set_speed(object, object->dirX, 2);
	} else if (object->posY >54){
		object->set_speed(object, object->dirX, -2);
	}
	clear_object(object);
	object->posX += object->dirX;
	object->posY += object->dirY;
	
	if(object->posX < 1 || object->posX + object->geo->sizeX > 128){
		object->dirX = -object->dirX;
	}
	
	if(object->posY < 1 || object->posY + object->geo->sizeY > 64){
		object->dirY = -object->dirY;
	}
	draw_object(object);
}



static OBJECT ball = 
{
	&ball_geometry,
	0, 0,
	1, 1,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};




void main(void)
{
	char c;
	POBJECT p = &ball;
	app_init();
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