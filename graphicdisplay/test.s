   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.global	ball_geometry
  16              		.data
  17              		.align	2
  20              	ball_geometry:
  21 0000 0C000000 		.word	12
  22 0004 04000000 		.word	4
  23 0008 04000000 		.word	4
  24 000c 00       		.byte	0
  25 000d 01       		.byte	1
  26 000e 00       		.byte	0
  27 000f 02       		.byte	2
  28 0010 01       		.byte	1
  29 0011 00       		.byte	0
  30 0012 01       		.byte	1
  31 0013 01       		.byte	1
  32 0014 01       		.byte	1
  33 0015 02       		.byte	2
  34 0016 01       		.byte	1
  35 0017 03       		.byte	3
  36 0018 02       		.byte	2
  37 0019 00       		.byte	0
  38 001a 02       		.byte	2
  39 001b 01       		.byte	1
  40 001c 02       		.byte	2
  41 001d 02       		.byte	2
  42 001e 02       		.byte	2
  43 001f 03       		.byte	3
  44 0020 03       		.byte	3
  45 0021 02       		.byte	2
  46 0022 00000000 		.space	18
  46      00000000 
  46      00000000 
  46      00000000 
  46      0000
  47              		.section	.start_section,"ax",%progbits
  48              		.align	1
  49              		.global	startup
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	startup:
  56              	.LFB3:
  57              		.file 1 "C:/Users/heinl/Documents/Moplaborationer/graphicdisplay/startup.c"
   1:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #include <stdio.h>
   2:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
   3:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** //för initieringar
   4:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define portE 0x40021000
   5:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define portModerE ((volatile unsigned int*) (portE))
   6:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define portOtyperE ((volatile unsigned short*) (portE + 4))
   7:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define portOspeedrE ((volatile unsigned int*) (portE + 8))
   8:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define portPupdrE ((volatile unsigned int*) (portE + 0xC))
   9:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  10:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** //för data
  11:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define portIdrLowE ((volatile unsigned char*) (portE + 0x10))
  12:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define portIdrHighE ((volatile unsigned char*) (portE + 0x11))
  13:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define portOdrLowE ((volatile unsigned char*) (portE + 0x14))
  14:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define portOdrHighE ((volatile unsigned char*) (portE + 0x15))
  15:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  16:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** //för styrregister
  17:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define B_E 0x40
  18:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define B_SELECT 0x4
  19:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define B_RW 0x2
  20:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define B_RS 0x1
  21:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define B_RST 0x20
  22:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define B_CS2 0x10
  23:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define B_CS1 0x8
  24:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  25:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  26:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** //för LCD
  27:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define LCD_OFF 0x3E
  28:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define LCD_ON 0x3F
  29:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define LCD_DISP_START 0xC0
  30:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define LCD_SET_ADD 0x40
  31:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define LCD_SET_PAGE 0xB8
  32:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define LCD_BUSY 0x80
  33:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  34:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  35:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  36:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** //för delay
  37:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define stk_ctrl (volatile unsigned int*) 0xE000E010
  38:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define stk_load (volatile unsigned int*) 0xE000E014
  39:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define stk_val (volatile unsigned int*) 0xE000E018
  40:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  41:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  42:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #define MAX_POINTS 20
  43:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  44:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  45:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** typedef unsigned char uint8_t;
  46:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  47:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** typedef struct tPoint{
  48:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	unsigned char x;
  49:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	unsigned char y;
  50:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }POINT;
  51:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  52:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  53:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** typedef struct tGeometry{
  54:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	int numPoints;
  55:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	int sizeX;
  56:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	int sizeY;
  57:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	POINT px[MAX_POINTS];
  58:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** } GEOMETRY, *PGEOMETRY;
  59:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  60:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  61:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** typedef struct tObject{
  62:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	PGEOMETRY geo;
  63:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	int dirX, dirY;
  64:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	int posX, posY;
  65:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	void(*draw)(struct tObject*);    //rita i position x och y
  66:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	void(*clear)(struct tObject*);   //radera objektet
  67:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	void(*move)(struct tObject*); 
  68:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	void(*set_speed)(struct tObject*, int, int);
  69:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** } OBJECT, *POBJECT;
  70:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  71:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** GEOMETRY ball_geometry = 
  72:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** {
  73:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	12,         //numPoints
  74:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	4, 4,       //sizeX, sizeY
  75:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	{
  76:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		//px[0, 1, 2, ....]
  77:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		{0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2}, 
  78:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		{1, 3}, {2, 0}, {2, 1}, {2, 2}, {2, 3}, 
  79:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		{3, 2}
  80:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
  81:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** };
  82:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  83:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  84:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  85:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** __attribute__((naked))
  86:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** __attribute__((section(".start_section")))
  87:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void startup(void){
  58              		.loc 1 87 0
  59              		.cfi_startproc
  60              		@ Naked Function: prologue and epilogue provided by programmer.
  61              		@ args = 0, pretend = 0, frame = 0
  62              		@ frame_needed = 1, uses_anonymous_args = 0
  88:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	__asm volatile(
  63              		.loc 1 88 0
  64              		.syntax divided
  65              	@ 88 "C:/Users/heinl/Documents/Moplaborationer/graphicdisplay/startup.c" 1
  66 0000 0248     		 LDR R0,=0x2001C000
  67 0002 8546     	 MOV SP, R0
  68 0004 FFF7FEFF 	 BL main
  69 0008 FEE7     	 B . 
  70              	
  71              	@ 0 "" 2
  89:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	" LDR R0,=0x2001C000\n"
  90:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	" MOV SP, R0\n"
  91:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	" BL main\n"
  92:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	" B . \n"
  93:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	);
  94:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
  72              		.loc 1 94 0
  73              		.thumb
  74              		.syntax unified
  75 000a C046     		nop
  76              		.cfi_endproc
  77              	.LFE3:
  79              		.text
  80              		.align	1
  81              		.global	delay_250ns
  82              		.syntax unified
  83              		.code	16
  84              		.thumb_func
  85              		.fpu softvfp
  87              	delay_250ns:
  88              	.LFB4:
  95:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  96:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
  97:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** //Delay funktioner
  98:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void delay_250ns(void){
  89              		.loc 1 98 0
  90              		.cfi_startproc
  91              		@ args = 0, pretend = 0, frame = 0
  92              		@ frame_needed = 1, uses_anonymous_args = 0
  93 0000 80B5     		push	{r7, lr}
  94              		.cfi_def_cfa_offset 8
  95              		.cfi_offset 7, -8
  96              		.cfi_offset 14, -4
  97 0002 00AF     		add	r7, sp, #0
  98              		.cfi_def_cfa_register 7
  99:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	/*
 100:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*stk_ctrl = 0x00000000;
 101:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*stk_load = 0x00021001;
 102:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*stk_val = 0x00000000;
 103:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*stk_ctrl = 0x00000101;
 104:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	while(((*stk_ctrl) & 0x00010000) == 0);
 105:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*stk_ctrl = 0x00000000;
 106:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*/
 107:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
  99              		.loc 1 107 0
 100 0004 C046     		nop
 101 0006 BD46     		mov	sp, r7
 102              		@ sp needed
 103 0008 80BD     		pop	{r7, pc}
 104              		.cfi_endproc
 105              	.LFE4:
 107              		.align	1
 108              		.global	delay_500ns
 109              		.syntax unified
 110              		.code	16
 111              		.thumb_func
 112              		.fpu softvfp
 114              	delay_500ns:
 115              	.LFB5:
 108:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 109:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void delay_500ns(void){
 116              		.loc 1 109 0
 117              		.cfi_startproc
 118              		@ args = 0, pretend = 0, frame = 0
 119              		@ frame_needed = 1, uses_anonymous_args = 0
 120 000a 80B5     		push	{r7, lr}
 121              		.cfi_def_cfa_offset 8
 122              		.cfi_offset 7, -8
 123              		.cfi_offset 14, -4
 124 000c 00AF     		add	r7, sp, #0
 125              		.cfi_def_cfa_register 7
 110:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	delay_250ns();
 126              		.loc 1 110 0
 127 000e FFF7FEFF 		bl	delay_250ns
 111:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	delay_250ns();
 128              		.loc 1 111 0
 129 0012 FFF7FEFF 		bl	delay_250ns
 112:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 130              		.loc 1 112 0
 131 0016 C046     		nop
 132 0018 BD46     		mov	sp, r7
 133              		@ sp needed
 134 001a 80BD     		pop	{r7, pc}
 135              		.cfi_endproc
 136              	.LFE5:
 138              		.align	1
 139              		.global	delay_mikro
 140              		.syntax unified
 141              		.code	16
 142              		.thumb_func
 143              		.fpu softvfp
 145              	delay_mikro:
 146              	.LFB6:
 113:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 114:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 115:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 116:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void delay_mikro(unsigned int us){
 147              		.loc 1 116 0
 148              		.cfi_startproc
 149              		@ args = 0, pretend = 0, frame = 16
 150              		@ frame_needed = 1, uses_anonymous_args = 0
 151 001c 80B5     		push	{r7, lr}
 152              		.cfi_def_cfa_offset 8
 153              		.cfi_offset 7, -8
 154              		.cfi_offset 14, -4
 155 001e 84B0     		sub	sp, sp, #16
 156              		.cfi_def_cfa_offset 24
 157 0020 00AF     		add	r7, sp, #0
 158              		.cfi_def_cfa_register 7
 159 0022 7860     		str	r0, [r7, #4]
 160              	.LBB2:
 117:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < us; i++){
 161              		.loc 1 117 0
 162 0024 0023     		movs	r3, #0
 163 0026 FB60     		str	r3, [r7, #12]
 164 0028 0DE0     		b	.L5
 165              	.L8:
 166              	.LBB3:
 118:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		for(int w = 0; w < 4; w++){
 167              		.loc 1 118 0
 168 002a 0023     		movs	r3, #0
 169 002c BB60     		str	r3, [r7, #8]
 170 002e 04E0     		b	.L6
 171              	.L7:
 119:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			delay_250ns();
 172              		.loc 1 119 0 discriminator 3
 173 0030 FFF7FEFF 		bl	delay_250ns
 118:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		for(int w = 0; w < 4; w++){
 174              		.loc 1 118 0 discriminator 3
 175 0034 BB68     		ldr	r3, [r7, #8]
 176 0036 0133     		adds	r3, r3, #1
 177 0038 BB60     		str	r3, [r7, #8]
 178              	.L6:
 118:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		for(int w = 0; w < 4; w++){
 179              		.loc 1 118 0 is_stmt 0 discriminator 1
 180 003a BB68     		ldr	r3, [r7, #8]
 181 003c 032B     		cmp	r3, #3
 182 003e F7DD     		ble	.L7
 183              	.LBE3:
 117:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < us; i++){
 184              		.loc 1 117 0 is_stmt 1 discriminator 2
 185 0040 FB68     		ldr	r3, [r7, #12]
 186 0042 0133     		adds	r3, r3, #1
 187 0044 FB60     		str	r3, [r7, #12]
 188              	.L5:
 117:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < us; i++){
 189              		.loc 1 117 0 is_stmt 0 discriminator 1
 190 0046 FB68     		ldr	r3, [r7, #12]
 191 0048 7A68     		ldr	r2, [r7, #4]
 192 004a 9A42     		cmp	r2, r3
 193 004c EDD8     		bhi	.L8
 194              	.LBE2:
 120:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		}
 121:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 122:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 195              		.loc 1 122 0 is_stmt 1
 196 004e C046     		nop
 197 0050 BD46     		mov	sp, r7
 198 0052 04B0     		add	sp, sp, #16
 199              		@ sp needed
 200 0054 80BD     		pop	{r7, pc}
 201              		.cfi_endproc
 202              	.LFE6:
 204              		.align	1
 205              		.global	delay_milli
 206              		.syntax unified
 207              		.code	16
 208              		.thumb_func
 209              		.fpu softvfp
 211              	delay_milli:
 212              	.LFB7:
 123:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 124:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void delay_milli(unsigned int ms){
 213              		.loc 1 124 0
 214              		.cfi_startproc
 215              		@ args = 0, pretend = 0, frame = 16
 216              		@ frame_needed = 1, uses_anonymous_args = 0
 217 0056 80B5     		push	{r7, lr}
 218              		.cfi_def_cfa_offset 8
 219              		.cfi_offset 7, -8
 220              		.cfi_offset 14, -4
 221 0058 84B0     		sub	sp, sp, #16
 222              		.cfi_def_cfa_offset 24
 223 005a 00AF     		add	r7, sp, #0
 224              		.cfi_def_cfa_register 7
 225 005c 7860     		str	r0, [r7, #4]
 125:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	unsigned int us = ms * 1000;
 226              		.loc 1 125 0
 227 005e 7A68     		ldr	r2, [r7, #4]
 228 0060 1300     		movs	r3, r2
 229 0062 5B01     		lsls	r3, r3, #5
 230 0064 9B1A     		subs	r3, r3, r2
 231 0066 9B00     		lsls	r3, r3, #2
 232 0068 9B18     		adds	r3, r3, r2
 233 006a DB00     		lsls	r3, r3, #3
 234 006c FB60     		str	r3, [r7, #12]
 126:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	delay_mikro(us);
 235              		.loc 1 126 0
 236 006e FB68     		ldr	r3, [r7, #12]
 237 0070 1800     		movs	r0, r3
 238 0072 FFF7FEFF 		bl	delay_mikro
 127:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 239              		.loc 1 127 0
 240 0076 C046     		nop
 241 0078 BD46     		mov	sp, r7
 242 007a 04B0     		add	sp, sp, #16
 243              		@ sp needed
 244 007c 80BD     		pop	{r7, pc}
 245              		.cfi_endproc
 246              	.LFE7:
 248              		.align	1
 249              		.global	graphic_ctrl_bit_set
 250              		.syntax unified
 251              		.code	16
 252              		.thumb_func
 253              		.fpu softvfp
 255              	graphic_ctrl_bit_set:
 256              	.LFB8:
 128:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 129:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 130:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 131:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 132:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** //Välj grafisk display och ettställ de bitar som är 1 i x
 133:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void graphic_ctrl_bit_set(uint8_t x){
 257              		.loc 1 133 0
 258              		.cfi_startproc
 259              		@ args = 0, pretend = 0, frame = 8
 260              		@ frame_needed = 1, uses_anonymous_args = 0
 261 007e 80B5     		push	{r7, lr}
 262              		.cfi_def_cfa_offset 8
 263              		.cfi_offset 7, -8
 264              		.cfi_offset 14, -4
 265 0080 82B0     		sub	sp, sp, #8
 266              		.cfi_def_cfa_offset 16
 267 0082 00AF     		add	r7, sp, #0
 268              		.cfi_def_cfa_register 7
 269 0084 0200     		movs	r2, r0
 270 0086 FB1D     		adds	r3, r7, #7
 271 0088 1A70     		strb	r2, [r3]
 134:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*portOdrLowE |= x & ~B_SELECT;
 272              		.loc 1 134 0
 273 008a 094B     		ldr	r3, .L11
 274 008c 1B78     		ldrb	r3, [r3]
 275 008e DBB2     		uxtb	r3, r3
 276 0090 5AB2     		sxtb	r2, r3
 277 0092 FB1D     		adds	r3, r7, #7
 278 0094 1B78     		ldrb	r3, [r3]
 279 0096 5BB2     		sxtb	r3, r3
 280 0098 0421     		movs	r1, #4
 281 009a 8B43     		bics	r3, r1
 282 009c 5BB2     		sxtb	r3, r3
 283 009e 1343     		orrs	r3, r2
 284 00a0 5AB2     		sxtb	r2, r3
 285 00a2 034B     		ldr	r3, .L11
 286 00a4 D2B2     		uxtb	r2, r2
 287 00a6 1A70     		strb	r2, [r3]
 135:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 288              		.loc 1 135 0
 289 00a8 C046     		nop
 290 00aa BD46     		mov	sp, r7
 291 00ac 02B0     		add	sp, sp, #8
 292              		@ sp needed
 293 00ae 80BD     		pop	{r7, pc}
 294              	.L12:
 295              		.align	2
 296              	.L11:
 297 00b0 14100240 		.word	1073877012
 298              		.cfi_endproc
 299              	.LFE8:
 301              		.align	1
 302              		.global	graphic_ctrl_bit_clear
 303              		.syntax unified
 304              		.code	16
 305              		.thumb_func
 306              		.fpu softvfp
 308              	graphic_ctrl_bit_clear:
 309              	.LFB9:
 136:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 137:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 138:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** //Välj grafisk display och nollställ de bitar som är 1 i x
 139:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void graphic_ctrl_bit_clear(uint8_t x){
 310              		.loc 1 139 0
 311              		.cfi_startproc
 312              		@ args = 0, pretend = 0, frame = 8
 313              		@ frame_needed = 1, uses_anonymous_args = 0
 314 00b4 80B5     		push	{r7, lr}
 315              		.cfi_def_cfa_offset 8
 316              		.cfi_offset 7, -8
 317              		.cfi_offset 14, -4
 318 00b6 82B0     		sub	sp, sp, #8
 319              		.cfi_def_cfa_offset 16
 320 00b8 00AF     		add	r7, sp, #0
 321              		.cfi_def_cfa_register 7
 322 00ba 0200     		movs	r2, r0
 323 00bc FB1D     		adds	r3, r7, #7
 324 00be 1A70     		strb	r2, [r3]
 140:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*portOdrLowE &= (~x & ~B_SELECT);
 325              		.loc 1 140 0
 326 00c0 084B     		ldr	r3, .L14
 327 00c2 1B78     		ldrb	r3, [r3]
 328 00c4 DBB2     		uxtb	r3, r3
 329 00c6 FA1D     		adds	r2, r7, #7
 330 00c8 1278     		ldrb	r2, [r2]
 331 00ca D243     		mvns	r2, r2
 332 00cc D2B2     		uxtb	r2, r2
 333 00ce 1340     		ands	r3, r2
 334 00d0 DBB2     		uxtb	r3, r3
 335 00d2 044A     		ldr	r2, .L14
 336 00d4 0421     		movs	r1, #4
 337 00d6 8B43     		bics	r3, r1
 338 00d8 DBB2     		uxtb	r3, r3
 339 00da 1370     		strb	r3, [r2]
 141:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 340              		.loc 1 141 0
 341 00dc C046     		nop
 342 00de BD46     		mov	sp, r7
 343 00e0 02B0     		add	sp, sp, #8
 344              		@ sp needed
 345 00e2 80BD     		pop	{r7, pc}
 346              	.L15:
 347              		.align	2
 348              	.L14:
 349 00e4 14100240 		.word	1073877012
 350              		.cfi_endproc
 351              	.LFE9:
 353              		.align	1
 354              		.global	select_controller
 355              		.syntax unified
 356              		.code	16
 357              		.thumb_func
 358              		.fpu softvfp
 360              	select_controller:
 361              	.LFB10:
 142:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 143:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 144:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** //Konfigurera CS-signalerna
 145:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void select_controller(uint8_t controller){
 362              		.loc 1 145 0
 363              		.cfi_startproc
 364              		@ args = 0, pretend = 0, frame = 8
 365              		@ frame_needed = 1, uses_anonymous_args = 0
 366 00e8 80B5     		push	{r7, lr}
 367              		.cfi_def_cfa_offset 8
 368              		.cfi_offset 7, -8
 369              		.cfi_offset 14, -4
 370 00ea 82B0     		sub	sp, sp, #8
 371              		.cfi_def_cfa_offset 16
 372 00ec 00AF     		add	r7, sp, #0
 373              		.cfi_def_cfa_register 7
 374 00ee 0200     		movs	r2, r0
 375 00f0 FB1D     		adds	r3, r7, #7
 376 00f2 1A70     		strb	r2, [r3]
 146:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	switch(controller){
 377              		.loc 1 146 0
 378 00f4 FB1D     		adds	r3, r7, #7
 379 00f6 1B78     		ldrb	r3, [r3]
 380 00f8 082B     		cmp	r3, #8
 381 00fa 0CD0     		beq	.L18
 382 00fc 02DC     		bgt	.L19
 383 00fe 002B     		cmp	r3, #0
 384 0100 05D0     		beq	.L20
 385 0102 19E0     		b	.L17
 386              	.L19:
 387 0104 102B     		cmp	r3, #16
 388 0106 0DD0     		beq	.L21
 389 0108 182B     		cmp	r3, #24
 390 010a 12D0     		beq	.L22
 391 010c 14E0     		b	.L17
 392              	.L20:
 147:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case 0:
 148:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_clear(B_CS1 | B_CS2);
 393              		.loc 1 148 0
 394 010e 1820     		movs	r0, #24
 395 0110 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 149:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			break;
 396              		.loc 1 149 0
 397 0114 13E0     		b	.L23
 398              	.L18:
 150:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case B_CS1:
 151:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_set(B_CS1);
 399              		.loc 1 151 0
 400 0116 0820     		movs	r0, #8
 401 0118 FFF7FEFF 		bl	graphic_ctrl_bit_set
 152:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_clear(B_CS2);
 402              		.loc 1 152 0
 403 011c 1020     		movs	r0, #16
 404 011e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 153:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			break;
 405              		.loc 1 153 0
 406 0122 0CE0     		b	.L23
 407              	.L21:
 154:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case B_CS2:
 155:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_set(B_CS2);
 408              		.loc 1 155 0
 409 0124 1020     		movs	r0, #16
 410 0126 FFF7FEFF 		bl	graphic_ctrl_bit_set
 156:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_clear(B_CS1);
 411              		.loc 1 156 0
 412 012a 0820     		movs	r0, #8
 413 012c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 157:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			break;
 414              		.loc 1 157 0
 415 0130 05E0     		b	.L23
 416              	.L22:
 158:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case (B_CS1 | B_CS2):
 159:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_set(B_CS1 | B_CS2);
 417              		.loc 1 159 0
 418 0132 1820     		movs	r0, #24
 419 0134 FFF7FEFF 		bl	graphic_ctrl_bit_set
 420              	.L17:
 160:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		default:
 161:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			graphic_ctrl_bit_clear(B_CS1 | B_CS2);
 421              		.loc 1 161 0
 422 0138 1820     		movs	r0, #24
 423 013a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 424              	.L23:
 162:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 163:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 425              		.loc 1 163 0
 426 013e C046     		nop
 427 0140 BD46     		mov	sp, r7
 428 0142 02B0     		add	sp, sp, #8
 429              		@ sp needed
 430 0144 80BD     		pop	{r7, pc}
 431              		.cfi_endproc
 432              	.LFE10:
 434              		.align	1
 435              		.global	graphic_wait_ready
 436              		.syntax unified
 437              		.code	16
 438              		.thumb_func
 439              		.fpu softvfp
 441              	graphic_wait_ready:
 442              	.LFB11:
 164:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 165:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 166:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 167:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 168:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 169:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** //Undersök ''busy'' flaggan, och returnera från funktion när den blir 0
 170:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void graphic_wait_ready(void){
 443              		.loc 1 170 0
 444              		.cfi_startproc
 445              		@ args = 0, pretend = 0, frame = 0
 446              		@ frame_needed = 1, uses_anonymous_args = 0
 447 0146 80B5     		push	{r7, lr}
 448              		.cfi_def_cfa_offset 8
 449              		.cfi_offset 7, -8
 450              		.cfi_offset 14, -4
 451 0148 00AF     		add	r7, sp, #0
 452              		.cfi_def_cfa_register 7
 171:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 453              		.loc 1 171 0
 454 014a 4020     		movs	r0, #64
 455 014c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 172:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 173:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*portModerE = 0x00005555;  //15-8 utgång, 7-0 ingång
 456              		.loc 1 173 0
 457 0150 124B     		ldr	r3, .L27
 458 0152 134A     		ldr	r2, .L27+4
 459 0154 1A60     		str	r2, [r3]
 174:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 460              		.loc 1 174 0
 461 0156 0120     		movs	r0, #1
 462 0158 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 175:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RW); //Gör så vi kollar status
 463              		.loc 1 175 0
 464 015c 0220     		movs	r0, #2
 465 015e FFF7FEFF 		bl	graphic_ctrl_bit_set
 176:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	delay_500ns();
 466              		.loc 1 176 0
 467 0162 FFF7FEFF 		bl	delay_500ns
 177:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 178:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	while(*portIdrHighE & 1<<7){ //gör detta medan busy-flaggan inte är 0
 468              		.loc 1 178 0
 469 0166 09E0     		b	.L25
 470              	.L26:
 179:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_E);
 471              		.loc 1 179 0
 472 0168 4020     		movs	r0, #64
 473 016a FFF7FEFF 		bl	graphic_ctrl_bit_set
 180:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		delay_500ns();
 474              		.loc 1 180 0
 475 016e FFF7FEFF 		bl	delay_500ns
 181:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_E);
 476              		.loc 1 181 0
 477 0172 4020     		movs	r0, #64
 478 0174 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 182:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		delay_500ns();
 479              		.loc 1 182 0
 480 0178 FFF7FEFF 		bl	delay_500ns
 481              	.L25:
 178:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_E);
 482              		.loc 1 178 0
 483 017c 094B     		ldr	r3, .L27+8
 484 017e 1B78     		ldrb	r3, [r3]
 485 0180 DBB2     		uxtb	r3, r3
 486 0182 5BB2     		sxtb	r3, r3
 487 0184 002B     		cmp	r3, #0
 488 0186 EFDB     		blt	.L26
 183:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 184:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 185:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 489              		.loc 1 185 0
 490 0188 4020     		movs	r0, #64
 491 018a FFF7FEFF 		bl	graphic_ctrl_bit_set
 186:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*portModerE = 0x55555555; //15-0 utgång
 492              		.loc 1 186 0
 493 018e 034B     		ldr	r3, .L27
 494 0190 054A     		ldr	r2, .L27+12
 495 0192 1A60     		str	r2, [r3]
 187:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 496              		.loc 1 187 0
 497 0194 C046     		nop
 498 0196 BD46     		mov	sp, r7
 499              		@ sp needed
 500 0198 80BD     		pop	{r7, pc}
 501              	.L28:
 502 019a C046     		.align	2
 503              	.L27:
 504 019c 00100240 		.word	1073876992
 505 01a0 55550000 		.word	21845
 506 01a4 11100240 		.word	1073877009
 507 01a8 55555555 		.word	1431655765
 508              		.cfi_endproc
 509              	.LFE11:
 511              		.align	1
 512              		.global	graphic_read
 513              		.syntax unified
 514              		.code	16
 515              		.thumb_func
 516              		.fpu softvfp
 518              	graphic_read:
 519              	.LFB12:
 188:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 189:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 190:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 191:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** unsigned char graphic_read(unsigned char controller){
 520              		.loc 1 191 0
 521              		.cfi_startproc
 522              		@ args = 0, pretend = 0, frame = 16
 523              		@ frame_needed = 1, uses_anonymous_args = 0
 524 01ac 80B5     		push	{r7, lr}
 525              		.cfi_def_cfa_offset 8
 526              		.cfi_offset 7, -8
 527              		.cfi_offset 14, -4
 528 01ae 84B0     		sub	sp, sp, #16
 529              		.cfi_def_cfa_offset 24
 530 01b0 00AF     		add	r7, sp, #0
 531              		.cfi_def_cfa_register 7
 532 01b2 0200     		movs	r2, r0
 533 01b4 FB1D     		adds	r3, r7, #7
 534 01b6 1A70     		strb	r2, [r3]
 192:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 535              		.loc 1 192 0
 536 01b8 4020     		movs	r0, #64
 537 01ba FFF7FEFF 		bl	graphic_ctrl_bit_clear
 193:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 194:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*portModerE = 0x00005555;  //15-8 utgång, 7-0 ingång
 538              		.loc 1 194 0
 539 01be 1D4B     		ldr	r3, .L33
 540 01c0 1D4A     		ldr	r2, .L33+4
 541 01c2 1A60     		str	r2, [r3]
 195:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 542              		.loc 1 195 0
 543 01c4 0120     		movs	r0, #1
 544 01c6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 196:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RW); //Gör så vi kan läsa data
 545              		.loc 1 196 0
 546 01ca 0220     		movs	r0, #2
 547 01cc FFF7FEFF 		bl	graphic_ctrl_bit_set
 197:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(controller);
 548              		.loc 1 197 0
 549 01d0 FB1D     		adds	r3, r7, #7
 550 01d2 1B78     		ldrb	r3, [r3]
 551 01d4 1800     		movs	r0, r3
 552 01d6 FFF7FEFF 		bl	select_controller
 198:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	delay_500ns();
 553              		.loc 1 198 0
 554 01da FFF7FEFF 		bl	delay_500ns
 199:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 555              		.loc 1 199 0
 556 01de 4020     		movs	r0, #64
 557 01e0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 200:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	delay_500ns();
 558              		.loc 1 200 0
 559 01e4 FFF7FEFF 		bl	delay_500ns
 201:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	unsigned char RV = *portIdrHighE;
 560              		.loc 1 201 0
 561 01e8 144A     		ldr	r2, .L33+8
 562 01ea 0F23     		movs	r3, #15
 563 01ec FB18     		adds	r3, r7, r3
 564 01ee 1278     		ldrb	r2, [r2]
 565 01f0 1A70     		strb	r2, [r3]
 202:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 566              		.loc 1 202 0
 567 01f2 4020     		movs	r0, #64
 568 01f4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 203:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*portModerE = 0x55555555; //15-0 utgång
 569              		.loc 1 203 0
 570 01f8 0E4B     		ldr	r3, .L33
 571 01fa 114A     		ldr	r2, .L33+12
 572 01fc 1A60     		str	r2, [r3]
 204:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 205:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	if (controller == B_CS1){
 573              		.loc 1 205 0
 574 01fe FB1D     		adds	r3, r7, #7
 575 0200 1B78     		ldrb	r3, [r3]
 576 0202 082B     		cmp	r3, #8
 577 0204 05D1     		bne	.L30
 206:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		select_controller(B_CS1);
 578              		.loc 1 206 0
 579 0206 0820     		movs	r0, #8
 580 0208 FFF7FEFF 		bl	select_controller
 207:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		graphic_wait_ready();
 581              		.loc 1 207 0
 582 020c FFF7FEFF 		bl	graphic_wait_ready
 583 0210 08E0     		b	.L31
 584              	.L30:
 208:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	} else if (controller == B_CS2){
 585              		.loc 1 208 0
 586 0212 FB1D     		adds	r3, r7, #7
 587 0214 1B78     		ldrb	r3, [r3]
 588 0216 102B     		cmp	r3, #16
 589 0218 04D1     		bne	.L31
 209:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		select_controller(B_CS2);
 590              		.loc 1 209 0
 591 021a 1020     		movs	r0, #16
 592 021c FFF7FEFF 		bl	select_controller
 210:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		graphic_wait_ready();
 593              		.loc 1 210 0
 594 0220 FFF7FEFF 		bl	graphic_wait_ready
 595              	.L31:
 211:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 212:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	return RV;
 596              		.loc 1 212 0
 597 0224 0F23     		movs	r3, #15
 598 0226 FB18     		adds	r3, r7, r3
 599 0228 1B78     		ldrb	r3, [r3]
 213:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 600              		.loc 1 213 0
 601 022a 1800     		movs	r0, r3
 602 022c BD46     		mov	sp, r7
 603 022e 04B0     		add	sp, sp, #16
 604              		@ sp needed
 605 0230 80BD     		pop	{r7, pc}
 606              	.L34:
 607 0232 C046     		.align	2
 608              	.L33:
 609 0234 00100240 		.word	1073876992
 610 0238 55550000 		.word	21845
 611 023c 11100240 		.word	1073877009
 612 0240 55555555 		.word	1431655765
 613              		.cfi_endproc
 614              	.LFE12:
 616              		.align	1
 617              		.global	graphic_write
 618              		.syntax unified
 619              		.code	16
 620              		.thumb_func
 621              		.fpu softvfp
 623              	graphic_write:
 624              	.LFB13:
 214:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 215:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 216:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void graphic_write(unsigned char value, unsigned char controller){
 625              		.loc 1 216 0
 626              		.cfi_startproc
 627              		@ args = 0, pretend = 0, frame = 8
 628              		@ frame_needed = 1, uses_anonymous_args = 0
 629 0244 80B5     		push	{r7, lr}
 630              		.cfi_def_cfa_offset 8
 631              		.cfi_offset 7, -8
 632              		.cfi_offset 14, -4
 633 0246 82B0     		sub	sp, sp, #8
 634              		.cfi_def_cfa_offset 16
 635 0248 00AF     		add	r7, sp, #0
 636              		.cfi_def_cfa_register 7
 637 024a 0200     		movs	r2, r0
 638 024c FB1D     		adds	r3, r7, #7
 639 024e 1A70     		strb	r2, [r3]
 640 0250 BB1D     		adds	r3, r7, #6
 641 0252 0A1C     		adds	r2, r1, #0
 642 0254 1A70     		strb	r2, [r3]
 217:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*portOdrHighE = value;
 643              		.loc 1 217 0
 644 0256 1A4A     		ldr	r2, .L38
 645 0258 FB1D     		adds	r3, r7, #7
 646 025a 1B78     		ldrb	r3, [r3]
 647 025c 1370     		strb	r3, [r2]
 218:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(controller);
 648              		.loc 1 218 0
 649 025e BB1D     		adds	r3, r7, #6
 650 0260 1B78     		ldrb	r3, [r3]
 651 0262 1800     		movs	r0, r3
 652 0264 FFF7FEFF 		bl	select_controller
 219:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	delay_500ns();
 653              		.loc 1 219 0
 654 0268 FFF7FEFF 		bl	delay_500ns
 220:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 655              		.loc 1 220 0
 656 026c 4020     		movs	r0, #64
 657 026e FFF7FEFF 		bl	graphic_ctrl_bit_set
 221:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	delay_500ns();
 658              		.loc 1 221 0
 659 0272 FFF7FEFF 		bl	delay_500ns
 222:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 660              		.loc 1 222 0
 661 0276 4020     		movs	r0, #64
 662 0278 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 223:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 224:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	if (controller & B_CS1){
 663              		.loc 1 224 0
 664 027c BB1D     		adds	r3, r7, #6
 665 027e 1B78     		ldrb	r3, [r3]
 666 0280 0822     		movs	r2, #8
 667 0282 1340     		ands	r3, r2
 668 0284 05D0     		beq	.L36
 225:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		select_controller(B_CS1);
 669              		.loc 1 225 0
 670 0286 0820     		movs	r0, #8
 671 0288 FFF7FEFF 		bl	select_controller
 226:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		graphic_wait_ready();
 672              		.loc 1 226 0
 673 028c FFF7FEFF 		bl	graphic_wait_ready
 674 0290 09E0     		b	.L37
 675              	.L36:
 227:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	} else if (controller & B_CS2){
 676              		.loc 1 227 0
 677 0292 BB1D     		adds	r3, r7, #6
 678 0294 1B78     		ldrb	r3, [r3]
 679 0296 1022     		movs	r2, #16
 680 0298 1340     		ands	r3, r2
 681 029a 04D0     		beq	.L37
 228:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		select_controller(B_CS2);
 682              		.loc 1 228 0
 683 029c 1020     		movs	r0, #16
 684 029e FFF7FEFF 		bl	select_controller
 229:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		graphic_wait_ready();
 685              		.loc 1 229 0
 686 02a2 FFF7FEFF 		bl	graphic_wait_ready
 687              	.L37:
 230:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 231:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 232:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*portOdrHighE = 0;
 688              		.loc 1 232 0
 689 02a6 064B     		ldr	r3, .L38
 690 02a8 0022     		movs	r2, #0
 691 02aa 1A70     		strb	r2, [r3]
 233:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 692              		.loc 1 233 0
 693 02ac 4020     		movs	r0, #64
 694 02ae FFF7FEFF 		bl	graphic_ctrl_bit_set
 234:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(0);
 695              		.loc 1 234 0
 696 02b2 0020     		movs	r0, #0
 697 02b4 FFF7FEFF 		bl	select_controller
 235:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 698              		.loc 1 235 0
 699 02b8 C046     		nop
 700 02ba BD46     		mov	sp, r7
 701 02bc 02B0     		add	sp, sp, #8
 702              		@ sp needed
 703 02be 80BD     		pop	{r7, pc}
 704              	.L39:
 705              		.align	2
 706              	.L38:
 707 02c0 15100240 		.word	1073877013
 708              		.cfi_endproc
 709              	.LFE13:
 711              		.align	1
 712              		.global	graphic_write_command
 713              		.syntax unified
 714              		.code	16
 715              		.thumb_func
 716              		.fpu softvfp
 718              	graphic_write_command:
 719              	.LFB14:
 236:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 237:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 238:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 720              		.loc 1 238 0
 721              		.cfi_startproc
 722              		@ args = 0, pretend = 0, frame = 8
 723              		@ frame_needed = 1, uses_anonymous_args = 0
 724 02c4 80B5     		push	{r7, lr}
 725              		.cfi_def_cfa_offset 8
 726              		.cfi_offset 7, -8
 727              		.cfi_offset 14, -4
 728 02c6 82B0     		sub	sp, sp, #8
 729              		.cfi_def_cfa_offset 16
 730 02c8 00AF     		add	r7, sp, #0
 731              		.cfi_def_cfa_register 7
 732 02ca 0200     		movs	r2, r0
 733 02cc FB1D     		adds	r3, r7, #7
 734 02ce 1A70     		strb	r2, [r3]
 735 02d0 BB1D     		adds	r3, r7, #6
 736 02d2 0A1C     		adds	r2, r1, #0
 737 02d4 1A70     		strb	r2, [r3]
 239:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 738              		.loc 1 239 0
 739 02d6 4020     		movs	r0, #64
 740 02d8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 240:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(controller);
 741              		.loc 1 240 0
 742 02dc BB1D     		adds	r3, r7, #6
 743 02de 1B78     		ldrb	r3, [r3]
 744 02e0 1800     		movs	r0, r3
 745 02e2 FFF7FEFF 		bl	select_controller
 241:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 746              		.loc 1 241 0
 747 02e6 0120     		movs	r0, #1
 748 02e8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 242:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 749              		.loc 1 242 0
 750 02ec 0220     		movs	r0, #2
 751 02ee FFF7FEFF 		bl	graphic_ctrl_bit_clear
 243:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write(command, controller);
 752              		.loc 1 243 0
 753 02f2 BB1D     		adds	r3, r7, #6
 754 02f4 1A78     		ldrb	r2, [r3]
 755 02f6 FB1D     		adds	r3, r7, #7
 756 02f8 1B78     		ldrb	r3, [r3]
 757 02fa 1100     		movs	r1, r2
 758 02fc 1800     		movs	r0, r3
 759 02fe FFF7FEFF 		bl	graphic_write
 244:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 760              		.loc 1 244 0
 761 0302 C046     		nop
 762 0304 BD46     		mov	sp, r7
 763 0306 02B0     		add	sp, sp, #8
 764              		@ sp needed
 765 0308 80BD     		pop	{r7, pc}
 766              		.cfi_endproc
 767              	.LFE14:
 769              		.align	1
 770              		.global	graphic_write_data
 771              		.syntax unified
 772              		.code	16
 773              		.thumb_func
 774              		.fpu softvfp
 776              	graphic_write_data:
 777              	.LFB15:
 245:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 246:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void graphic_write_data(uint8_t data, uint8_t controller){
 778              		.loc 1 246 0
 779              		.cfi_startproc
 780              		@ args = 0, pretend = 0, frame = 8
 781              		@ frame_needed = 1, uses_anonymous_args = 0
 782 030a 80B5     		push	{r7, lr}
 783              		.cfi_def_cfa_offset 8
 784              		.cfi_offset 7, -8
 785              		.cfi_offset 14, -4
 786 030c 82B0     		sub	sp, sp, #8
 787              		.cfi_def_cfa_offset 16
 788 030e 00AF     		add	r7, sp, #0
 789              		.cfi_def_cfa_register 7
 790 0310 0200     		movs	r2, r0
 791 0312 FB1D     		adds	r3, r7, #7
 792 0314 1A70     		strb	r2, [r3]
 793 0316 BB1D     		adds	r3, r7, #6
 794 0318 0A1C     		adds	r2, r1, #0
 795 031a 1A70     		strb	r2, [r3]
 247:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 796              		.loc 1 247 0
 797 031c 4020     		movs	r0, #64
 798 031e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 248:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(controller);
 799              		.loc 1 248 0
 800 0322 BB1D     		adds	r3, r7, #6
 801 0324 1B78     		ldrb	r3, [r3]
 802 0326 1800     		movs	r0, r3
 803 0328 FFF7FEFF 		bl	select_controller
 249:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 804              		.loc 1 249 0
 805 032c 0120     		movs	r0, #1
 806 032e FFF7FEFF 		bl	graphic_ctrl_bit_set
 250:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 807              		.loc 1 250 0
 808 0332 0220     		movs	r0, #2
 809 0334 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 251:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write(data, controller);
 810              		.loc 1 251 0
 811 0338 BB1D     		adds	r3, r7, #6
 812 033a 1A78     		ldrb	r2, [r3]
 813 033c FB1D     		adds	r3, r7, #7
 814 033e 1B78     		ldrb	r3, [r3]
 815 0340 1100     		movs	r1, r2
 816 0342 1800     		movs	r0, r3
 817 0344 FFF7FEFF 		bl	graphic_write
 252:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 818              		.loc 1 252 0
 819 0348 C046     		nop
 820 034a BD46     		mov	sp, r7
 821 034c 02B0     		add	sp, sp, #8
 822              		@ sp needed
 823 034e 80BD     		pop	{r7, pc}
 824              		.cfi_endproc
 825              	.LFE15:
 827              		.align	1
 828              		.global	graphic_read_data
 829              		.syntax unified
 830              		.code	16
 831              		.thumb_func
 832              		.fpu softvfp
 834              	graphic_read_data:
 835              	.LFB16:
 253:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 254:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** unsigned char graphic_read_data(unsigned char controller){
 836              		.loc 1 254 0
 837              		.cfi_startproc
 838              		@ args = 0, pretend = 0, frame = 8
 839              		@ frame_needed = 1, uses_anonymous_args = 0
 840 0350 80B5     		push	{r7, lr}
 841              		.cfi_def_cfa_offset 8
 842              		.cfi_offset 7, -8
 843              		.cfi_offset 14, -4
 844 0352 82B0     		sub	sp, sp, #8
 845              		.cfi_def_cfa_offset 16
 846 0354 00AF     		add	r7, sp, #0
 847              		.cfi_def_cfa_register 7
 848 0356 0200     		movs	r2, r0
 849 0358 FB1D     		adds	r3, r7, #7
 850 035a 1A70     		strb	r2, [r3]
 255:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_read(controller); //Nonsens
 851              		.loc 1 255 0
 852 035c FB1D     		adds	r3, r7, #7
 853 035e 1B78     		ldrb	r3, [r3]
 854 0360 1800     		movs	r0, r3
 855 0362 FFF7FEFF 		bl	graphic_read
 256:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	return graphic_read(controller); //korrekt data
 856              		.loc 1 256 0
 857 0366 FB1D     		adds	r3, r7, #7
 858 0368 1B78     		ldrb	r3, [r3]
 859 036a 1800     		movs	r0, r3
 860 036c FFF7FEFF 		bl	graphic_read
 861 0370 0300     		movs	r3, r0
 257:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 862              		.loc 1 257 0
 863 0372 1800     		movs	r0, r3
 864 0374 BD46     		mov	sp, r7
 865 0376 02B0     		add	sp, sp, #8
 866              		@ sp needed
 867 0378 80BD     		pop	{r7, pc}
 868              		.cfi_endproc
 869              	.LFE16:
 871              		.align	1
 872              		.global	init_app
 873              		.syntax unified
 874              		.code	16
 875              		.thumb_func
 876              		.fpu softvfp
 878              	init_app:
 879              	.LFB17:
 258:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 259:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 260:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 261:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void init_app(void){
 880              		.loc 1 261 0
 881              		.cfi_startproc
 882              		@ args = 0, pretend = 0, frame = 0
 883              		@ frame_needed = 1, uses_anonymous_args = 0
 884 037a 80B5     		push	{r7, lr}
 885              		.cfi_def_cfa_offset 8
 886              		.cfi_offset 7, -8
 887              		.cfi_offset 14, -4
 888 037c 00AF     		add	r7, sp, #0
 889              		.cfi_def_cfa_register 7
 262:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	*portModerE = 0x55555555; //15-0 utport
 890              		.loc 1 262 0
 891 037e 034B     		ldr	r3, .L45
 892 0380 034A     		ldr	r2, .L45+4
 893 0382 1A60     		str	r2, [r3]
 263:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 894              		.loc 1 263 0
 895 0384 C046     		nop
 896 0386 BD46     		mov	sp, r7
 897              		@ sp needed
 898 0388 80BD     		pop	{r7, pc}
 899              	.L46:
 900 038a C046     		.align	2
 901              	.L45:
 902 038c 00100240 		.word	1073876992
 903 0390 55555555 		.word	1431655765
 904              		.cfi_endproc
 905              	.LFE17:
 907              		.align	1
 908              		.global	graphic_initialize
 909              		.syntax unified
 910              		.code	16
 911              		.thumb_func
 912              		.fpu softvfp
 914              	graphic_initialize:
 915              	.LFB18:
 264:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 265:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void graphic_initialize(void){
 916              		.loc 1 265 0
 917              		.cfi_startproc
 918              		@ args = 0, pretend = 0, frame = 0
 919              		@ frame_needed = 1, uses_anonymous_args = 0
 920 0394 80B5     		push	{r7, lr}
 921              		.cfi_def_cfa_offset 8
 922              		.cfi_offset 7, -8
 923              		.cfi_offset 14, -4
 924 0396 00AF     		add	r7, sp, #0
 925              		.cfi_def_cfa_register 7
 266:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 926              		.loc 1 266 0
 927 0398 4020     		movs	r0, #64
 928 039a FFF7FEFF 		bl	graphic_ctrl_bit_set
 267:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	delay_mikro(10);
 929              		.loc 1 267 0
 930 039e 0A20     		movs	r0, #10
 931 03a0 FFF7FEFF 		bl	delay_mikro
 268:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 932              		.loc 1 268 0
 933 03a4 7820     		movs	r0, #120
 934 03a6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 269:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	//delay_milli(30);
 270:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RST);
 935              		.loc 1 270 0
 936 03aa 2020     		movs	r0, #32
 937 03ac FFF7FEFF 		bl	graphic_ctrl_bit_set
 271:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 938              		.loc 1 271 0
 939 03b0 1821     		movs	r1, #24
 940 03b2 3E20     		movs	r0, #62
 941 03b4 FFF7FEFF 		bl	graphic_write_command
 272:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_ON, B_CS1|B_CS2);         //toggla display
 942              		.loc 1 272 0
 943 03b8 1821     		movs	r1, #24
 944 03ba 3F20     		movs	r0, #63
 945 03bc FFF7FEFF 		bl	graphic_write_command
 273:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2); //start=0
 946              		.loc 1 273 0
 947 03c0 1821     		movs	r1, #24
 948 03c2 C020     		movs	r0, #192
 949 03c4 FFF7FEFF 		bl	graphic_write_command
 274:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);    //add=0
 950              		.loc 1 274 0
 951 03c8 1821     		movs	r1, #24
 952 03ca 4020     		movs	r0, #64
 953 03cc FFF7FEFF 		bl	graphic_write_command
 275:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);   //page=0
 954              		.loc 1 275 0
 955 03d0 1821     		movs	r1, #24
 956 03d2 B820     		movs	r0, #184
 957 03d4 FFF7FEFF 		bl	graphic_write_command
 276:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	select_controller(0);                               //deaktivera båda CS-signalerna
 958              		.loc 1 276 0
 959 03d8 0020     		movs	r0, #0
 960 03da FFF7FEFF 		bl	select_controller
 277:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 961              		.loc 1 277 0
 962 03de C046     		nop
 963 03e0 BD46     		mov	sp, r7
 964              		@ sp needed
 965 03e2 80BD     		pop	{r7, pc}
 966              		.cfi_endproc
 967              	.LFE18:
 969              		.align	1
 970              		.global	graphic_clear_screen
 971              		.syntax unified
 972              		.code	16
 973              		.thumb_func
 974              		.fpu softvfp
 976              	graphic_clear_screen:
 977              	.LFB19:
 278:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 279:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 280:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void graphic_clear_screen(void){
 978              		.loc 1 280 0
 979              		.cfi_startproc
 980              		@ args = 0, pretend = 0, frame = 8
 981              		@ frame_needed = 1, uses_anonymous_args = 0
 982 03e4 80B5     		push	{r7, lr}
 983              		.cfi_def_cfa_offset 8
 984              		.cfi_offset 7, -8
 985              		.cfi_offset 14, -4
 986 03e6 82B0     		sub	sp, sp, #8
 987              		.cfi_def_cfa_offset 16
 988 03e8 00AF     		add	r7, sp, #0
 989              		.cfi_def_cfa_register 7
 990              	.LBB4:
 281:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for (int i = 0; i<=7; i++){
 991              		.loc 1 281 0
 992 03ea 0023     		movs	r3, #0
 993 03ec 7B60     		str	r3, [r7, #4]
 994 03ee 1EE0     		b	.L49
 995              	.L52:
 282:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | i, B_CS1|B_CS2);
 996              		.loc 1 282 0
 997 03f0 7B68     		ldr	r3, [r7, #4]
 998 03f2 5BB2     		sxtb	r3, r3
 999 03f4 4822     		movs	r2, #72
 1000 03f6 5242     		rsbs	r2, r2, #0
 1001 03f8 1343     		orrs	r3, r2
 1002 03fa 5BB2     		sxtb	r3, r3
 1003 03fc DBB2     		uxtb	r3, r3
 1004 03fe 1821     		movs	r1, #24
 1005 0400 1800     		movs	r0, r3
 1006 0402 FFF7FEFF 		bl	graphic_write_command
 283:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 1007              		.loc 1 283 0
 1008 0406 1821     		movs	r1, #24
 1009 0408 4020     		movs	r0, #64
 1010 040a FFF7FEFF 		bl	graphic_write_command
 1011              	.LBB5:
 284:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		for(int w = 0; w<=63; w++){
 1012              		.loc 1 284 0
 1013 040e 0023     		movs	r3, #0
 1014 0410 3B60     		str	r3, [r7]
 1015 0412 06E0     		b	.L50
 1016              	.L51:
 285:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			graphic_write_data(0, B_CS1|B_CS2);
 1017              		.loc 1 285 0 discriminator 3
 1018 0414 1821     		movs	r1, #24
 1019 0416 0020     		movs	r0, #0
 1020 0418 FFF7FEFF 		bl	graphic_write_data
 284:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		for(int w = 0; w<=63; w++){
 1021              		.loc 1 284 0 discriminator 3
 1022 041c 3B68     		ldr	r3, [r7]
 1023 041e 0133     		adds	r3, r3, #1
 1024 0420 3B60     		str	r3, [r7]
 1025              	.L50:
 284:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		for(int w = 0; w<=63; w++){
 1026              		.loc 1 284 0 is_stmt 0 discriminator 1
 1027 0422 3B68     		ldr	r3, [r7]
 1028 0424 3F2B     		cmp	r3, #63
 1029 0426 F5DD     		ble	.L51
 1030              	.LBE5:
 281:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | i, B_CS1|B_CS2);
 1031              		.loc 1 281 0 is_stmt 1 discriminator 2
 1032 0428 7B68     		ldr	r3, [r7, #4]
 1033 042a 0133     		adds	r3, r3, #1
 1034 042c 7B60     		str	r3, [r7, #4]
 1035              	.L49:
 281:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | i, B_CS1|B_CS2);
 1036              		.loc 1 281 0 is_stmt 0 discriminator 1
 1037 042e 7B68     		ldr	r3, [r7, #4]
 1038 0430 072B     		cmp	r3, #7
 1039 0432 DDDD     		ble	.L52
 1040              	.LBE4:
 286:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		}
 287:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 288:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 1041              		.loc 1 288 0 is_stmt 1
 1042 0434 C046     		nop
 1043 0436 BD46     		mov	sp, r7
 1044 0438 02B0     		add	sp, sp, #8
 1045              		@ sp needed
 1046 043a 80BD     		pop	{r7, pc}
 1047              		.cfi_endproc
 1048              	.LFE19:
 1050              		.align	1
 1051              		.global	pixel
 1052              		.syntax unified
 1053              		.code	16
 1054              		.thumb_func
 1055              		.fpu softvfp
 1057              	pixel:
 1058              	.LFB20:
 289:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 290:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 291:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void pixel(unsigned char x, unsigned char y, unsigned char set){
 1059              		.loc 1 291 0
 1060              		.cfi_startproc
 1061              		@ args = 0, pretend = 0, frame = 16
 1062              		@ frame_needed = 1, uses_anonymous_args = 0
 1063 043c F0B5     		push	{r4, r5, r6, r7, lr}
 1064              		.cfi_def_cfa_offset 20
 1065              		.cfi_offset 4, -20
 1066              		.cfi_offset 5, -16
 1067              		.cfi_offset 6, -12
 1068              		.cfi_offset 7, -8
 1069              		.cfi_offset 14, -4
 1070 043e 85B0     		sub	sp, sp, #20
 1071              		.cfi_def_cfa_offset 40
 1072 0440 00AF     		add	r7, sp, #0
 1073              		.cfi_def_cfa_register 7
 1074 0442 0400     		movs	r4, r0
 1075 0444 0800     		movs	r0, r1
 1076 0446 1100     		movs	r1, r2
 1077 0448 FB1D     		adds	r3, r7, #7
 1078 044a 221C     		adds	r2, r4, #0
 1079 044c 1A70     		strb	r2, [r3]
 1080 044e BB1D     		adds	r3, r7, #6
 1081 0450 021C     		adds	r2, r0, #0
 1082 0452 1A70     		strb	r2, [r3]
 1083 0454 7B1D     		adds	r3, r7, #5
 1084 0456 0A1C     		adds	r2, r1, #0
 1085 0458 1A70     		strb	r2, [r3]
 292:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	if(x < 1 || x > 128 || y < 1 || y > 64 || set < 0 || set > 1){  //kolla så värdena är tillåtna
 1086              		.loc 1 292 0
 1087 045a FB1D     		adds	r3, r7, #7
 1088 045c 1B78     		ldrb	r3, [r3]
 1089 045e 002B     		cmp	r3, #0
 1090 0460 00D1     		bne	.LCB829
 1091 0462 CBE0     		b	.L74	@long jump
 1092              	.LCB829:
 1093              		.loc 1 292 0 is_stmt 0 discriminator 1
 1094 0464 FB1D     		adds	r3, r7, #7
 1095 0466 1B78     		ldrb	r3, [r3]
 1096 0468 802B     		cmp	r3, #128
 1097 046a 00D9     		bls	.LCB833
 1098 046c C6E0     		b	.L74	@long jump
 1099              	.LCB833:
 1100              		.loc 1 292 0 discriminator 2
 1101 046e BB1D     		adds	r3, r7, #6
 1102 0470 1B78     		ldrb	r3, [r3]
 1103 0472 002B     		cmp	r3, #0
 1104 0474 00D1     		bne	.LCB837
 1105 0476 C1E0     		b	.L74	@long jump
 1106              	.LCB837:
 1107              		.loc 1 292 0 discriminator 3
 1108 0478 BB1D     		adds	r3, r7, #6
 1109 047a 1B78     		ldrb	r3, [r3]
 1110 047c 402B     		cmp	r3, #64
 1111 047e 00D9     		bls	.LCB841
 1112 0480 BCE0     		b	.L74	@long jump
 1113              	.LCB841:
 1114              		.loc 1 292 0 discriminator 4
 1115 0482 7B1D     		adds	r3, r7, #5
 1116 0484 1B78     		ldrb	r3, [r3]
 1117 0486 012B     		cmp	r3, #1
 1118 0488 00D9     		bls	.LCB845
 1119 048a B7E0     		b	.L74	@long jump
 1120              	.LCB845:
 293:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		return;
 294:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 295:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 296:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	unsigned char index = (y-1)/8;
 1121              		.loc 1 296 0 is_stmt 1
 1122 048c BB1D     		adds	r3, r7, #6
 1123 048e 1B78     		ldrb	r3, [r3]
 1124 0490 013B     		subs	r3, r3, #1
 1125 0492 002B     		cmp	r3, #0
 1126 0494 00DA     		bge	.L57
 1127 0496 0733     		adds	r3, r3, #7
 1128              	.L57:
 1129 0498 DB10     		asrs	r3, r3, #3
 1130 049a 1A00     		movs	r2, r3
 1131 049c 0C23     		movs	r3, #12
 1132 049e FB18     		adds	r3, r7, r3
 1133 04a0 1A70     		strb	r2, [r3]
 297:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	unsigned char bitmask;
 298:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	unsigned char controller;
 299:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	unsigned char x_fysisk;
 300:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 301:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	switch((y-1) % 8){
 1134              		.loc 1 301 0
 1135 04a2 BB1D     		adds	r3, r7, #6
 1136 04a4 1B78     		ldrb	r3, [r3]
 1137 04a6 013B     		subs	r3, r3, #1
 1138 04a8 564A     		ldr	r2, .L75
 1139 04aa 1340     		ands	r3, r2
 1140 04ac 04D5     		bpl	.L58
 1141 04ae 013B     		subs	r3, r3, #1
 1142 04b0 0822     		movs	r2, #8
 1143 04b2 5242     		rsbs	r2, r2, #0
 1144 04b4 1343     		orrs	r3, r2
 1145 04b6 0133     		adds	r3, r3, #1
 1146              	.L58:
 1147 04b8 072B     		cmp	r3, #7
 1148 04ba 2CD8     		bhi	.L59
 1149 04bc 9A00     		lsls	r2, r3, #2
 1150 04be 524B     		ldr	r3, .L75+4
 1151 04c0 D318     		adds	r3, r2, r3
 1152 04c2 1B68     		ldr	r3, [r3]
 1153 04c4 9F46     		mov	pc, r3
 1154              		.section	.rodata
 1155              		.align	2
 1156              	.L61:
 1157 0000 C6040000 		.word	.L60
 1158 0004 D0040000 		.word	.L62
 1159 0008 DA040000 		.word	.L63
 1160 000c E4040000 		.word	.L64
 1161 0010 EE040000 		.word	.L65
 1162 0014 F8040000 		.word	.L66
 1163 0018 02050000 		.word	.L67
 1164 001c 0C050000 		.word	.L68
 1165              		.text
 1166              	.L60:
 302:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case 0:
 303:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			bitmask = 1;
 1167              		.loc 1 303 0
 1168 04c6 0F23     		movs	r3, #15
 1169 04c8 FB18     		adds	r3, r7, r3
 1170 04ca 0122     		movs	r2, #1
 1171 04cc 1A70     		strb	r2, [r3]
 304:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			break;
 1172              		.loc 1 304 0
 1173 04ce 22E0     		b	.L59
 1174              	.L62:
 305:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case 1:
 306:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			bitmask = 2;
 1175              		.loc 1 306 0
 1176 04d0 0F23     		movs	r3, #15
 1177 04d2 FB18     		adds	r3, r7, r3
 1178 04d4 0222     		movs	r2, #2
 1179 04d6 1A70     		strb	r2, [r3]
 307:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			break;
 1180              		.loc 1 307 0
 1181 04d8 1DE0     		b	.L59
 1182              	.L63:
 308:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case 2:
 309:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			bitmask = 4;
 1183              		.loc 1 309 0
 1184 04da 0F23     		movs	r3, #15
 1185 04dc FB18     		adds	r3, r7, r3
 1186 04de 0422     		movs	r2, #4
 1187 04e0 1A70     		strb	r2, [r3]
 310:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			break;
 1188              		.loc 1 310 0
 1189 04e2 18E0     		b	.L59
 1190              	.L64:
 311:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case 3:
 312:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			bitmask = 8;
 1191              		.loc 1 312 0
 1192 04e4 0F23     		movs	r3, #15
 1193 04e6 FB18     		adds	r3, r7, r3
 1194 04e8 0822     		movs	r2, #8
 1195 04ea 1A70     		strb	r2, [r3]
 313:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			break;
 1196              		.loc 1 313 0
 1197 04ec 13E0     		b	.L59
 1198              	.L65:
 314:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case 4:
 315:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			bitmask = 0x10;
 1199              		.loc 1 315 0
 1200 04ee 0F23     		movs	r3, #15
 1201 04f0 FB18     		adds	r3, r7, r3
 1202 04f2 1022     		movs	r2, #16
 1203 04f4 1A70     		strb	r2, [r3]
 316:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			break;
 1204              		.loc 1 316 0
 1205 04f6 0EE0     		b	.L59
 1206              	.L66:
 317:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case 5:
 318:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			bitmask = 0x20;
 1207              		.loc 1 318 0
 1208 04f8 0F23     		movs	r3, #15
 1209 04fa FB18     		adds	r3, r7, r3
 1210 04fc 2022     		movs	r2, #32
 1211 04fe 1A70     		strb	r2, [r3]
 319:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			break;
 1212              		.loc 1 319 0
 1213 0500 09E0     		b	.L59
 1214              	.L67:
 320:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case 6:
 321:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			bitmask = 0x40;
 1215              		.loc 1 321 0
 1216 0502 0F23     		movs	r3, #15
 1217 0504 FB18     		adds	r3, r7, r3
 1218 0506 4022     		movs	r2, #64
 1219 0508 1A70     		strb	r2, [r3]
 322:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			break;
 1220              		.loc 1 322 0
 1221 050a 04E0     		b	.L59
 1222              	.L68:
 323:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		case 7:
 324:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			bitmask = 0x80;
 1223              		.loc 1 324 0
 1224 050c 0F23     		movs	r3, #15
 1225 050e FB18     		adds	r3, r7, r3
 1226 0510 8022     		movs	r2, #128
 1227 0512 1A70     		strb	r2, [r3]
 325:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 			break;
 1228              		.loc 1 325 0
 1229 0514 C046     		nop
 1230              	.L59:
 326:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 327:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 328:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	if(set == 0){
 1231              		.loc 1 328 0
 1232 0516 7B1D     		adds	r3, r7, #5
 1233 0518 1B78     		ldrb	r3, [r3]
 1234 051a 002B     		cmp	r3, #0
 1235 051c 05D1     		bne	.L69
 329:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		bitmask = ~bitmask;
 1236              		.loc 1 329 0
 1237 051e 0F22     		movs	r2, #15
 1238 0520 BB18     		adds	r3, r7, r2
 1239 0522 BA18     		adds	r2, r7, r2
 1240 0524 1278     		ldrb	r2, [r2]
 1241 0526 D243     		mvns	r2, r2
 1242 0528 1A70     		strb	r2, [r3]
 1243              	.L69:
 330:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 331:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 332:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	if(x > 64){
 1244              		.loc 1 332 0
 1245 052a FB1D     		adds	r3, r7, #7
 1246 052c 1B78     		ldrb	r3, [r3]
 1247 052e 402B     		cmp	r3, #64
 1248 0530 0AD9     		bls	.L70
 333:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		controller = B_CS2;
 1249              		.loc 1 333 0
 1250 0532 0E23     		movs	r3, #14
 1251 0534 FB18     		adds	r3, r7, r3
 1252 0536 1022     		movs	r2, #16
 1253 0538 1A70     		strb	r2, [r3]
 334:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		x_fysisk = x - 65;
 1254              		.loc 1 334 0
 1255 053a 0D23     		movs	r3, #13
 1256 053c FB18     		adds	r3, r7, r3
 1257 053e FA1D     		adds	r2, r7, #7
 1258 0540 1278     		ldrb	r2, [r2]
 1259 0542 413A     		subs	r2, r2, #65
 1260 0544 1A70     		strb	r2, [r3]
 1261 0546 09E0     		b	.L71
 1262              	.L70:
 335:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	} else{
 336:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		controller = B_CS1;
 1263              		.loc 1 336 0
 1264 0548 0E23     		movs	r3, #14
 1265 054a FB18     		adds	r3, r7, r3
 1266 054c 0822     		movs	r2, #8
 1267 054e 1A70     		strb	r2, [r3]
 337:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		x_fysisk = x - 1;
 1268              		.loc 1 337 0
 1269 0550 0D23     		movs	r3, #13
 1270 0552 FB18     		adds	r3, r7, r3
 1271 0554 FA1D     		adds	r2, r7, #7
 1272 0556 1278     		ldrb	r2, [r2]
 1273 0558 013A     		subs	r2, r2, #1
 1274 055a 1A70     		strb	r2, [r3]
 1275              	.L71:
 338:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 339:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 340:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD | x_fysisk, controller);
 1276              		.loc 1 340 0
 1277 055c 0D26     		movs	r6, #13
 1278 055e BB19     		adds	r3, r7, r6
 1279 0560 1B78     		ldrb	r3, [r3]
 1280 0562 4022     		movs	r2, #64
 1281 0564 1343     		orrs	r3, r2
 1282 0566 DAB2     		uxtb	r2, r3
 1283 0568 0E25     		movs	r5, #14
 1284 056a 7B19     		adds	r3, r7, r5
 1285 056c 1B78     		ldrb	r3, [r3]
 1286 056e 1900     		movs	r1, r3
 1287 0570 1000     		movs	r0, r2
 1288 0572 FFF7FEFF 		bl	graphic_write_command
 341:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_PAGE | index, controller);
 1289              		.loc 1 341 0
 1290 0576 0C23     		movs	r3, #12
 1291 0578 FB18     		adds	r3, r7, r3
 1292 057a 1B78     		ldrb	r3, [r3]
 1293 057c 4822     		movs	r2, #72
 1294 057e 5242     		rsbs	r2, r2, #0
 1295 0580 1343     		orrs	r3, r2
 1296 0582 DAB2     		uxtb	r2, r3
 1297 0584 7B19     		adds	r3, r7, r5
 1298 0586 1B78     		ldrb	r3, [r3]
 1299 0588 1900     		movs	r1, r3
 1300 058a 1000     		movs	r0, r2
 1301 058c FFF7FEFF 		bl	graphic_write_command
 342:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	unsigned char temp = graphic_read_data(controller);
 1302              		.loc 1 342 0
 1303 0590 0B23     		movs	r3, #11
 1304 0592 FC18     		adds	r4, r7, r3
 1305 0594 7B19     		adds	r3, r7, r5
 1306 0596 1B78     		ldrb	r3, [r3]
 1307 0598 1800     		movs	r0, r3
 1308 059a FFF7FEFF 		bl	graphic_read_data
 1309 059e 0300     		movs	r3, r0
 1310 05a0 2370     		strb	r3, [r4]
 343:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD | x_fysisk, controller);
 1311              		.loc 1 343 0
 1312 05a2 BB19     		adds	r3, r7, r6
 1313 05a4 1B78     		ldrb	r3, [r3]
 1314 05a6 4022     		movs	r2, #64
 1315 05a8 1343     		orrs	r3, r2
 1316 05aa DAB2     		uxtb	r2, r3
 1317 05ac 7B19     		adds	r3, r7, r5
 1318 05ae 1B78     		ldrb	r3, [r3]
 1319 05b0 1900     		movs	r1, r3
 1320 05b2 1000     		movs	r0, r2
 1321 05b4 FFF7FEFF 		bl	graphic_write_command
 344:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 345:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 346:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	if(set == 1){
 1322              		.loc 1 346 0
 1323 05b8 7B1D     		adds	r3, r7, #5
 1324 05ba 1B78     		ldrb	r3, [r3]
 1325 05bc 012B     		cmp	r3, #1
 1326 05be 09D1     		bne	.L72
 347:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		bitmask = (bitmask | temp);
 1327              		.loc 1 347 0
 1328 05c0 0F22     		movs	r2, #15
 1329 05c2 BB18     		adds	r3, r7, r2
 1330 05c4 B918     		adds	r1, r7, r2
 1331 05c6 0B22     		movs	r2, #11
 1332 05c8 BA18     		adds	r2, r7, r2
 1333 05ca 0978     		ldrb	r1, [r1]
 1334 05cc 1278     		ldrb	r2, [r2]
 1335 05ce 0A43     		orrs	r2, r1
 1336 05d0 1A70     		strb	r2, [r3]
 1337 05d2 08E0     		b	.L73
 1338              	.L72:
 348:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	} else{
 349:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		bitmask = (bitmask & temp);
 1339              		.loc 1 349 0
 1340 05d4 0F22     		movs	r2, #15
 1341 05d6 BB18     		adds	r3, r7, r2
 1342 05d8 BA18     		adds	r2, r7, r2
 1343 05da 0B21     		movs	r1, #11
 1344 05dc 7918     		adds	r1, r7, r1
 1345 05de 1278     		ldrb	r2, [r2]
 1346 05e0 0978     		ldrb	r1, [r1]
 1347 05e2 0A40     		ands	r2, r1
 1348 05e4 1A70     		strb	r2, [r3]
 1349              	.L73:
 350:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 351:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 352:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_data(bitmask, controller);
 1350              		.loc 1 352 0
 1351 05e6 0E23     		movs	r3, #14
 1352 05e8 FB18     		adds	r3, r7, r3
 1353 05ea 1A78     		ldrb	r2, [r3]
 1354 05ec 0F23     		movs	r3, #15
 1355 05ee FB18     		adds	r3, r7, r3
 1356 05f0 1B78     		ldrb	r3, [r3]
 1357 05f2 1100     		movs	r1, r2
 1358 05f4 1800     		movs	r0, r3
 1359 05f6 FFF7FEFF 		bl	graphic_write_data
 1360 05fa 00E0     		b	.L53
 1361              	.L74:
 293:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 1362              		.loc 1 293 0
 1363 05fc C046     		nop
 1364              	.L53:
 353:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 1365              		.loc 1 353 0
 1366 05fe BD46     		mov	sp, r7
 1367 0600 05B0     		add	sp, sp, #20
 1368              		@ sp needed
 1369 0602 F0BD     		pop	{r4, r5, r6, r7, pc}
 1370              	.L76:
 1371              		.align	2
 1372              	.L75:
 1373 0604 07000080 		.word	-2147483641
 1374 0608 00000000 		.word	.L61
 1375              		.cfi_endproc
 1376              	.LFE20:
 1378              		.align	1
 1379              		.global	set_object_speed
 1380              		.syntax unified
 1381              		.code	16
 1382              		.thumb_func
 1383              		.fpu softvfp
 1385              	set_object_speed:
 1386              	.LFB21:
 354:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 355:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 356:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void set_object_speed(POBJECT o, int speedX, int speedY){
 1387              		.loc 1 356 0
 1388              		.cfi_startproc
 1389              		@ args = 0, pretend = 0, frame = 16
 1390              		@ frame_needed = 1, uses_anonymous_args = 0
 1391 060c 80B5     		push	{r7, lr}
 1392              		.cfi_def_cfa_offset 8
 1393              		.cfi_offset 7, -8
 1394              		.cfi_offset 14, -4
 1395 060e 84B0     		sub	sp, sp, #16
 1396              		.cfi_def_cfa_offset 24
 1397 0610 00AF     		add	r7, sp, #0
 1398              		.cfi_def_cfa_register 7
 1399 0612 F860     		str	r0, [r7, #12]
 1400 0614 B960     		str	r1, [r7, #8]
 1401 0616 7A60     		str	r2, [r7, #4]
 357:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	o->dirX = speedX;
 1402              		.loc 1 357 0
 1403 0618 FB68     		ldr	r3, [r7, #12]
 1404 061a BA68     		ldr	r2, [r7, #8]
 1405 061c 5A60     		str	r2, [r3, #4]
 358:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	o->dirY = speedY;
 1406              		.loc 1 358 0
 1407 061e FB68     		ldr	r3, [r7, #12]
 1408 0620 7A68     		ldr	r2, [r7, #4]
 1409 0622 9A60     		str	r2, [r3, #8]
 359:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 1410              		.loc 1 359 0
 1411 0624 C046     		nop
 1412 0626 BD46     		mov	sp, r7
 1413 0628 04B0     		add	sp, sp, #16
 1414              		@ sp needed
 1415 062a 80BD     		pop	{r7, pc}
 1416              		.cfi_endproc
 1417              	.LFE21:
 1419              		.align	1
 1420              		.global	draw_object
 1421              		.syntax unified
 1422              		.code	16
 1423              		.thumb_func
 1424              		.fpu softvfp
 1426              	draw_object:
 1427              	.LFB22:
 360:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 361:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void draw_object(POBJECT o){
 1428              		.loc 1 361 0
 1429              		.cfi_startproc
 1430              		@ args = 0, pretend = 0, frame = 16
 1431              		@ frame_needed = 1, uses_anonymous_args = 0
 1432 062c 80B5     		push	{r7, lr}
 1433              		.cfi_def_cfa_offset 8
 1434              		.cfi_offset 7, -8
 1435              		.cfi_offset 14, -4
 1436 062e 84B0     		sub	sp, sp, #16
 1437              		.cfi_def_cfa_offset 24
 1438 0630 00AF     		add	r7, sp, #0
 1439              		.cfi_def_cfa_register 7
 1440 0632 7860     		str	r0, [r7, #4]
 1441              	.LBB6:
 362:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1442              		.loc 1 362 0
 1443 0634 0023     		movs	r3, #0
 1444 0636 FB60     		str	r3, [r7, #12]
 1445 0638 20E0     		b	.L79
 1446              	.L80:
 363:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(o->posX + o->geo->px[i].x, o->posY + o->geo->px[i].y, 1);
 1447              		.loc 1 363 0 discriminator 3
 1448 063a 7B68     		ldr	r3, [r7, #4]
 1449 063c DB68     		ldr	r3, [r3, #12]
 1450 063e DAB2     		uxtb	r2, r3
 1451 0640 7B68     		ldr	r3, [r7, #4]
 1452 0642 1968     		ldr	r1, [r3]
 1453 0644 FB68     		ldr	r3, [r7, #12]
 1454 0646 0433     		adds	r3, r3, #4
 1455 0648 5B00     		lsls	r3, r3, #1
 1456 064a CB18     		adds	r3, r1, r3
 1457 064c 0433     		adds	r3, r3, #4
 1458 064e 1B78     		ldrb	r3, [r3]
 1459 0650 D318     		adds	r3, r2, r3
 1460 0652 D8B2     		uxtb	r0, r3
 1461 0654 7B68     		ldr	r3, [r7, #4]
 1462 0656 1B69     		ldr	r3, [r3, #16]
 1463 0658 DAB2     		uxtb	r2, r3
 1464 065a 7B68     		ldr	r3, [r7, #4]
 1465 065c 1968     		ldr	r1, [r3]
 1466 065e FB68     		ldr	r3, [r7, #12]
 1467 0660 0433     		adds	r3, r3, #4
 1468 0662 5B00     		lsls	r3, r3, #1
 1469 0664 CB18     		adds	r3, r1, r3
 1470 0666 0533     		adds	r3, r3, #5
 1471 0668 1B78     		ldrb	r3, [r3]
 1472 066a D318     		adds	r3, r2, r3
 1473 066c DBB2     		uxtb	r3, r3
 1474 066e 0122     		movs	r2, #1
 1475 0670 1900     		movs	r1, r3
 1476 0672 FFF7FEFF 		bl	pixel
 362:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1477              		.loc 1 362 0 discriminator 3
 1478 0676 FB68     		ldr	r3, [r7, #12]
 1479 0678 0133     		adds	r3, r3, #1
 1480 067a FB60     		str	r3, [r7, #12]
 1481              	.L79:
 362:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1482              		.loc 1 362 0 is_stmt 0 discriminator 1
 1483 067c 7B68     		ldr	r3, [r7, #4]
 1484 067e 1B68     		ldr	r3, [r3]
 1485 0680 1B68     		ldr	r3, [r3]
 1486 0682 FA68     		ldr	r2, [r7, #12]
 1487 0684 9A42     		cmp	r2, r3
 1488 0686 D8DB     		blt	.L80
 1489              	.LBE6:
 364:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 365:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 1490              		.loc 1 365 0 is_stmt 1
 1491 0688 C046     		nop
 1492 068a BD46     		mov	sp, r7
 1493 068c 04B0     		add	sp, sp, #16
 1494              		@ sp needed
 1495 068e 80BD     		pop	{r7, pc}
 1496              		.cfi_endproc
 1497              	.LFE22:
 1499              		.align	1
 1500              		.global	clear_object
 1501              		.syntax unified
 1502              		.code	16
 1503              		.thumb_func
 1504              		.fpu softvfp
 1506              	clear_object:
 1507              	.LFB23:
 366:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 367:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void clear_object(POBJECT o){
 1508              		.loc 1 367 0
 1509              		.cfi_startproc
 1510              		@ args = 0, pretend = 0, frame = 16
 1511              		@ frame_needed = 1, uses_anonymous_args = 0
 1512 0690 80B5     		push	{r7, lr}
 1513              		.cfi_def_cfa_offset 8
 1514              		.cfi_offset 7, -8
 1515              		.cfi_offset 14, -4
 1516 0692 84B0     		sub	sp, sp, #16
 1517              		.cfi_def_cfa_offset 24
 1518 0694 00AF     		add	r7, sp, #0
 1519              		.cfi_def_cfa_register 7
 1520 0696 7860     		str	r0, [r7, #4]
 1521              	.LBB7:
 368:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1522              		.loc 1 368 0
 1523 0698 0023     		movs	r3, #0
 1524 069a FB60     		str	r3, [r7, #12]
 1525 069c 20E0     		b	.L82
 1526              	.L83:
 369:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(o->posX + o->geo->px[i].x, o->posY + o->geo->px[i].y, 0);
 1527              		.loc 1 369 0 discriminator 3
 1528 069e 7B68     		ldr	r3, [r7, #4]
 1529 06a0 DB68     		ldr	r3, [r3, #12]
 1530 06a2 DAB2     		uxtb	r2, r3
 1531 06a4 7B68     		ldr	r3, [r7, #4]
 1532 06a6 1968     		ldr	r1, [r3]
 1533 06a8 FB68     		ldr	r3, [r7, #12]
 1534 06aa 0433     		adds	r3, r3, #4
 1535 06ac 5B00     		lsls	r3, r3, #1
 1536 06ae CB18     		adds	r3, r1, r3
 1537 06b0 0433     		adds	r3, r3, #4
 1538 06b2 1B78     		ldrb	r3, [r3]
 1539 06b4 D318     		adds	r3, r2, r3
 1540 06b6 D8B2     		uxtb	r0, r3
 1541 06b8 7B68     		ldr	r3, [r7, #4]
 1542 06ba 1B69     		ldr	r3, [r3, #16]
 1543 06bc DAB2     		uxtb	r2, r3
 1544 06be 7B68     		ldr	r3, [r7, #4]
 1545 06c0 1968     		ldr	r1, [r3]
 1546 06c2 FB68     		ldr	r3, [r7, #12]
 1547 06c4 0433     		adds	r3, r3, #4
 1548 06c6 5B00     		lsls	r3, r3, #1
 1549 06c8 CB18     		adds	r3, r1, r3
 1550 06ca 0533     		adds	r3, r3, #5
 1551 06cc 1B78     		ldrb	r3, [r3]
 1552 06ce D318     		adds	r3, r2, r3
 1553 06d0 DBB2     		uxtb	r3, r3
 1554 06d2 0022     		movs	r2, #0
 1555 06d4 1900     		movs	r1, r3
 1556 06d6 FFF7FEFF 		bl	pixel
 368:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1557              		.loc 1 368 0 discriminator 3
 1558 06da FB68     		ldr	r3, [r7, #12]
 1559 06dc 0133     		adds	r3, r3, #1
 1560 06de FB60     		str	r3, [r7, #12]
 1561              	.L82:
 368:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1562              		.loc 1 368 0 is_stmt 0 discriminator 1
 1563 06e0 7B68     		ldr	r3, [r7, #4]
 1564 06e2 1B68     		ldr	r3, [r3]
 1565 06e4 1B68     		ldr	r3, [r3]
 1566 06e6 FA68     		ldr	r2, [r7, #12]
 1567 06e8 9A42     		cmp	r2, r3
 1568 06ea D8DB     		blt	.L83
 1569              	.LBE7:
 370:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 371:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 1570              		.loc 1 371 0 is_stmt 1
 1571 06ec C046     		nop
 1572 06ee BD46     		mov	sp, r7
 1573 06f0 04B0     		add	sp, sp, #16
 1574              		@ sp needed
 1575 06f2 80BD     		pop	{r7, pc}
 1576              		.cfi_endproc
 1577              	.LFE23:
 1579              		.align	1
 1580              		.global	move_object
 1581              		.syntax unified
 1582              		.code	16
 1583              		.thumb_func
 1584              		.fpu softvfp
 1586              	move_object:
 1587              	.LFB24:
 372:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 373:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 374:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void move_object(POBJECT object){
 1588              		.loc 1 374 0
 1589              		.cfi_startproc
 1590              		@ args = 0, pretend = 0, frame = 8
 1591              		@ frame_needed = 1, uses_anonymous_args = 0
 1592 06f4 80B5     		push	{r7, lr}
 1593              		.cfi_def_cfa_offset 8
 1594              		.cfi_offset 7, -8
 1595              		.cfi_offset 14, -4
 1596 06f6 82B0     		sub	sp, sp, #8
 1597              		.cfi_def_cfa_offset 16
 1598 06f8 00AF     		add	r7, sp, #0
 1599              		.cfi_def_cfa_register 7
 1600 06fa 7860     		str	r0, [r7, #4]
 375:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	clear_object(object);
 1601              		.loc 1 375 0
 1602 06fc 7B68     		ldr	r3, [r7, #4]
 1603 06fe 1800     		movs	r0, r3
 1604 0700 FFF7FEFF 		bl	clear_object
 376:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	object->posX += object->dirX;
 1605              		.loc 1 376 0
 1606 0704 7B68     		ldr	r3, [r7, #4]
 1607 0706 DA68     		ldr	r2, [r3, #12]
 1608 0708 7B68     		ldr	r3, [r7, #4]
 1609 070a 5B68     		ldr	r3, [r3, #4]
 1610 070c D218     		adds	r2, r2, r3
 1611 070e 7B68     		ldr	r3, [r7, #4]
 1612 0710 DA60     		str	r2, [r3, #12]
 377:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	object->posY += object->dirY;
 1613              		.loc 1 377 0
 1614 0712 7B68     		ldr	r3, [r7, #4]
 1615 0714 1A69     		ldr	r2, [r3, #16]
 1616 0716 7B68     		ldr	r3, [r7, #4]
 1617 0718 9B68     		ldr	r3, [r3, #8]
 1618 071a D218     		adds	r2, r2, r3
 1619 071c 7B68     		ldr	r3, [r7, #4]
 1620 071e 1A61     		str	r2, [r3, #16]
 378:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 379:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	if(object->posX < 1 || object->posX + object->geo->sizeX > 128){
 1621              		.loc 1 379 0
 1622 0720 7B68     		ldr	r3, [r7, #4]
 1623 0722 DB68     		ldr	r3, [r3, #12]
 1624 0724 002B     		cmp	r3, #0
 1625 0726 07DD     		ble	.L85
 1626              		.loc 1 379 0 is_stmt 0 discriminator 1
 1627 0728 7B68     		ldr	r3, [r7, #4]
 1628 072a DA68     		ldr	r2, [r3, #12]
 1629 072c 7B68     		ldr	r3, [r7, #4]
 1630 072e 1B68     		ldr	r3, [r3]
 1631 0730 5B68     		ldr	r3, [r3, #4]
 1632 0732 D318     		adds	r3, r2, r3
 1633 0734 802B     		cmp	r3, #128
 1634 0736 04DD     		ble	.L86
 1635              	.L85:
 380:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		object->dirX = -object->dirX;
 1636              		.loc 1 380 0 is_stmt 1
 1637 0738 7B68     		ldr	r3, [r7, #4]
 1638 073a 5B68     		ldr	r3, [r3, #4]
 1639 073c 5A42     		rsbs	r2, r3, #0
 1640 073e 7B68     		ldr	r3, [r7, #4]
 1641 0740 5A60     		str	r2, [r3, #4]
 1642              	.L86:
 381:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 382:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 383:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	if(object->posY < 1 || object->posY + object->geo->sizeY > 64){
 1643              		.loc 1 383 0
 1644 0742 7B68     		ldr	r3, [r7, #4]
 1645 0744 1B69     		ldr	r3, [r3, #16]
 1646 0746 002B     		cmp	r3, #0
 1647 0748 07DD     		ble	.L87
 1648              		.loc 1 383 0 is_stmt 0 discriminator 1
 1649 074a 7B68     		ldr	r3, [r7, #4]
 1650 074c 1A69     		ldr	r2, [r3, #16]
 1651 074e 7B68     		ldr	r3, [r7, #4]
 1652 0750 1B68     		ldr	r3, [r3]
 1653 0752 9B68     		ldr	r3, [r3, #8]
 1654 0754 D318     		adds	r3, r2, r3
 1655 0756 402B     		cmp	r3, #64
 1656 0758 04DD     		ble	.L88
 1657              	.L87:
 384:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		object->dirY = -object->dirY;
 1658              		.loc 1 384 0 is_stmt 1
 1659 075a 7B68     		ldr	r3, [r7, #4]
 1660 075c 9B68     		ldr	r3, [r3, #8]
 1661 075e 5A42     		rsbs	r2, r3, #0
 1662 0760 7B68     		ldr	r3, [r7, #4]
 1663 0762 9A60     		str	r2, [r3, #8]
 1664              	.L88:
 385:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 386:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	draw_object(object);
 1665              		.loc 1 386 0
 1666 0764 7B68     		ldr	r3, [r7, #4]
 1667 0766 1800     		movs	r0, r3
 1668 0768 FFF7FEFF 		bl	draw_object
 387:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 1669              		.loc 1 387 0
 1670 076c C046     		nop
 1671 076e BD46     		mov	sp, r7
 1672 0770 02B0     		add	sp, sp, #8
 1673              		@ sp needed
 1674 0772 80BD     		pop	{r7, pc}
 1675              		.cfi_endproc
 1676              	.LFE24:
 1678              		.align	1
 1679              		.global	main
 1680              		.syntax unified
 1681              		.code	16
 1682              		.thumb_func
 1683              		.fpu softvfp
 1685              	main:
 1686              	.LFB25:
 388:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 389:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 
 390:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** void main(void)
 391:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** {
 1687              		.loc 1 391 0
 1688              		.cfi_startproc
 1689              		@ args = 0, pretend = 0, frame = 16
 1690              		@ frame_needed = 1, uses_anonymous_args = 0
 1691 0774 80B5     		push	{r7, lr}
 1692              		.cfi_def_cfa_offset 8
 1693              		.cfi_offset 7, -8
 1694              		.cfi_offset 14, -4
 1695 0776 84B0     		sub	sp, sp, #16
 1696              		.cfi_def_cfa_offset 24
 1697 0778 00AF     		add	r7, sp, #0
 1698              		.cfi_def_cfa_register 7
 392:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	init_app();
 1699              		.loc 1 392 0
 1700 077a FFF7FEFF 		bl	init_app
 393:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_initialize();
 1701              		.loc 1 393 0
 1702 077e FFF7FEFF 		bl	graphic_initialize
 394:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	/*
 395:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #ifndef SIMULATOR
 396:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_clear_screen();
 397:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** #endif
 398:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c ****   */
 399:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD | 10, B_CS1|B_CS2);
 1703              		.loc 1 399 0
 1704 0782 1821     		movs	r1, #24
 1705 0784 4A20     		movs	r0, #74
 1706 0786 FFF7FEFF 		bl	graphic_write_command
 400:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_PAGE | 1, B_CS1|B_CS2);
 1707              		.loc 1 400 0
 1708 078a 1821     		movs	r1, #24
 1709 078c B920     		movs	r0, #185
 1710 078e FFF7FEFF 		bl	graphic_write_command
 401:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	graphic_write_data(0xFF, B_CS1|B_CS2);
 1711              		.loc 1 401 0
 1712 0792 1821     		movs	r1, #24
 1713 0794 FF20     		movs	r0, #255
 1714 0796 FFF7FEFF 		bl	graphic_write_data
 1715              	.LBB8:
 402:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 403:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 404:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < 128; i++){ //rita en horisontell linje
 1716              		.loc 1 404 0
 1717 079a 0023     		movs	r3, #0
 1718 079c FB60     		str	r3, [r7, #12]
 1719 079e 09E0     		b	.L90
 1720              	.L91:
 405:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(i, 10, 1);          
 1721              		.loc 1 405 0 discriminator 3
 1722 07a0 FB68     		ldr	r3, [r7, #12]
 1723 07a2 DBB2     		uxtb	r3, r3
 1724 07a4 0122     		movs	r2, #1
 1725 07a6 0A21     		movs	r1, #10
 1726 07a8 1800     		movs	r0, r3
 1727 07aa FFF7FEFF 		bl	pixel
 404:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(i, 10, 1);          
 1728              		.loc 1 404 0 discriminator 3
 1729 07ae FB68     		ldr	r3, [r7, #12]
 1730 07b0 0133     		adds	r3, r3, #1
 1731 07b2 FB60     		str	r3, [r7, #12]
 1732              	.L90:
 404:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(i, 10, 1);          
 1733              		.loc 1 404 0 is_stmt 0 discriminator 1
 1734 07b4 FB68     		ldr	r3, [r7, #12]
 1735 07b6 7F2B     		cmp	r3, #127
 1736 07b8 F2DD     		ble	.L91
 1737              	.LBE8:
 1738              	.LBB9:
 406:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 407:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 408:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < 64; i++){ //rita en vertikal linje
 1739              		.loc 1 408 0 is_stmt 1
 1740 07ba 0023     		movs	r3, #0
 1741 07bc BB60     		str	r3, [r7, #8]
 1742 07be 09E0     		b	.L92
 1743              	.L93:
 409:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 1);
 1744              		.loc 1 409 0 discriminator 3
 1745 07c0 BB68     		ldr	r3, [r7, #8]
 1746 07c2 DBB2     		uxtb	r3, r3
 1747 07c4 0122     		movs	r2, #1
 1748 07c6 1900     		movs	r1, r3
 1749 07c8 0A20     		movs	r0, #10
 1750 07ca FFF7FEFF 		bl	pixel
 408:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 1);
 1751              		.loc 1 408 0 discriminator 3
 1752 07ce BB68     		ldr	r3, [r7, #8]
 1753 07d0 0133     		adds	r3, r3, #1
 1754 07d2 BB60     		str	r3, [r7, #8]
 1755              	.L92:
 408:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 1);
 1756              		.loc 1 408 0 is_stmt 0 discriminator 1
 1757 07d4 BB68     		ldr	r3, [r7, #8]
 1758 07d6 3F2B     		cmp	r3, #63
 1759 07d8 F2DD     		ble	.L93
 1760              	.LBE9:
 410:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 411:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 412:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	delay_milli(500); //vänta 0.5 sekunder
 1761              		.loc 1 412 0 is_stmt 1
 1762 07da FA23     		movs	r3, #250
 1763 07dc 5B00     		lsls	r3, r3, #1
 1764 07de 1800     		movs	r0, r3
 1765 07e0 FFF7FEFF 		bl	delay_milli
 1766              	.LBB10:
 413:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 414:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < 128; i++){ //sudda horisontella linjen
 1767              		.loc 1 414 0
 1768 07e4 0023     		movs	r3, #0
 1769 07e6 7B60     		str	r3, [r7, #4]
 1770 07e8 09E0     		b	.L94
 1771              	.L95:
 415:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(i, 10, 0);
 1772              		.loc 1 415 0 discriminator 3
 1773 07ea 7B68     		ldr	r3, [r7, #4]
 1774 07ec DBB2     		uxtb	r3, r3
 1775 07ee 0022     		movs	r2, #0
 1776 07f0 0A21     		movs	r1, #10
 1777 07f2 1800     		movs	r0, r3
 1778 07f4 FFF7FEFF 		bl	pixel
 414:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(i, 10, 0);
 1779              		.loc 1 414 0 discriminator 3
 1780 07f8 7B68     		ldr	r3, [r7, #4]
 1781 07fa 0133     		adds	r3, r3, #1
 1782 07fc 7B60     		str	r3, [r7, #4]
 1783              	.L94:
 414:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(i, 10, 0);
 1784              		.loc 1 414 0 is_stmt 0 discriminator 1
 1785 07fe 7B68     		ldr	r3, [r7, #4]
 1786 0800 7F2B     		cmp	r3, #127
 1787 0802 F2DD     		ble	.L95
 1788              	.LBE10:
 1789              	.LBB11:
 416:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 417:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 418:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	for(int i = 0; i < 64; i++){ //sudda vertikala linjen
 1790              		.loc 1 418 0 is_stmt 1
 1791 0804 0023     		movs	r3, #0
 1792 0806 3B60     		str	r3, [r7]
 1793 0808 09E0     		b	.L96
 1794              	.L97:
 419:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 0);
 1795              		.loc 1 419 0 discriminator 3
 1796 080a 3B68     		ldr	r3, [r7]
 1797 080c DBB2     		uxtb	r3, r3
 1798 080e 0022     		movs	r2, #0
 1799 0810 1900     		movs	r1, r3
 1800 0812 0A20     		movs	r0, #10
 1801 0814 FFF7FEFF 		bl	pixel
 418:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 0);
 1802              		.loc 1 418 0 discriminator 3
 1803 0818 3B68     		ldr	r3, [r7]
 1804 081a 0133     		adds	r3, r3, #1
 1805 081c 3B60     		str	r3, [r7]
 1806              	.L96:
 418:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 		pixel(10, i, 0);
 1807              		.loc 1 418 0 is_stmt 0 discriminator 1
 1808 081e 3B68     		ldr	r3, [r7]
 1809 0820 3F2B     		cmp	r3, #63
 1810 0822 F2DD     		ble	.L97
 1811              	.LBE11:
 420:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	}
 421:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** 	
 422:C:/Users/heinl/Documents/Moplaborationer/graphicdisplay\startup.c **** }
 1812              		.loc 1 422 0 is_stmt 1
 1813 0824 C046     		nop
 1814 0826 BD46     		mov	sp, r7
 1815 0828 04B0     		add	sp, sp, #16
 1816              		@ sp needed
 1817 082a 80BD     		pop	{r7, pc}
 1818              		.cfi_endproc
 1819              	.LFE25:
 1821              	.Letext0:
 1822              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 1823              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\lock.h"
 1824              		.file 4 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_types.h"
 1825              		.file 5 "c:\\cseapp\\codelite\\tools\\gcc-arm\\lib\\gcc\\arm-none-eabi\\7.2.1\\include\\stddef.h"
 1826              		.file 6 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\reent.h"
 1827              		.file 7 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
