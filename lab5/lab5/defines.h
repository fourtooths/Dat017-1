#ifndef DEFINES_H
#define DEFINES_H

//för undantagsvektor
#define SCB_VTOR (volatile unsigned int*) 0xE000ED08
#define NVIC_ISER0 (volatile unsigned int*) 0xE000E100 //interrupt set enable register i NVIC

//för systick
#define STK_CTRL ((volatile unsigned int *)(0xE000E010))
#define STK_LOAD ((volatile unsigned int *)(0xE000E014))
#define STK_VAL ((volatile unsigned int *)(0xE000E018)) 

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

#define MAX_POINTS 20 //why?

//För portar
typedef struct {
unsigned int moder;
unsigned short otyper; // +0x4
unsigned short otReserved; //
unsigned int ospeedr; // +0x8
unsigned int pupdr; // +0xc (12)
unsigned char idrLow; // +0x10
unsigned char idrHigh; // +0x11
unsigned short idrReserved;
unsigned char odrLow; // +0x14
unsigned char odrHigh; // +0x15
unsigned short odrReserved;
} GPIO;

#define GPIO_D (*((volatile GPIO*) 0x40020C00))
#define GPIO_E (*((volatile GPIO*) 0x40021000))

#endif