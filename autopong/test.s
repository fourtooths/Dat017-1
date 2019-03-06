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
  56              	.LFB0:
  57              		.file 1 "C:/Users/heinl/Documents/Moplaborationer/autopong/startup.c"
   1:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
   2:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** //för initieringar
   3:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define portE 0x40021000
   4:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define portModerE ((volatile unsigned int*) (portE))
   5:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define portOtyperE ((volatile unsigned short*) (portE + 4))
   6:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define portOspeedrE ((volatile unsigned int*) (portE + 8))
   7:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define portPupdrE ((volatile unsigned int*) (portE + 0xC))
   8:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
   9:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** //för data
  10:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define portIdrLowE ((volatile unsigned char*) (portE + 0x10))
  11:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define portIdrHighE ((volatile unsigned char*) (portE + 0x11))
  12:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define portOdrLowE ((volatile unsigned char*) (portE + 0x14))
  13:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define portOdrHighE ((volatile unsigned char*) (portE + 0x15))
  14:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  15:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** //för styrregister
  16:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define B_E 0x40
  17:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define B_SELECT 0x4
  18:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define B_RW 0x2
  19:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define B_RS 0x1
  20:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define B_RST 0x20
  21:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define B_CS2 0x10
  22:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define B_CS1 0x8
  23:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  24:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  25:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** //för LCD
  26:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define LCD_OFF 0x3E
  27:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define LCD_ON 0x3F
  28:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define LCD_DISP_START 0xC0
  29:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define LCD_SET_ADD 0x40
  30:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define LCD_SET_PAGE 0xB8
  31:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define LCD_BUSY 0x80
  32:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  33:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  34:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  35:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** //för delay
  36:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define stk_ctrl (volatile unsigned int*) 0xE000E010
  37:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define stk_load (volatile unsigned int*) 0xE000E014
  38:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define stk_val (volatile unsigned int*) 0xE000E018
  39:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  40:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  41:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** #define MAX_POINTS 20
  42:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  43:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  44:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** typedef unsigned char uint8_t;
  45:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  46:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** typedef struct tPoint{
  47:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	unsigned char x;
  48:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	unsigned char y;
  49:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }POINT;
  50:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  51:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  52:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** typedef struct tGeometry{
  53:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	int numPoints;
  54:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	int sizeX;
  55:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	int sizeY;
  56:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	POINT px[MAX_POINTS];
  57:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** } GEOMETRY, *PGEOMETRY;
  58:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  59:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  60:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** typedef struct tObject{
  61:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	PGEOMETRY geo;
  62:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	int dirX, dirY;
  63:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	int posX, posY;
  64:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	void(*draw)(struct tObject*);    //rita i position x och y
  65:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	void(*clear)(struct tObject*);   //radera objektet
  66:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	void(*move)(struct tObject*); 
  67:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	void(*set_speed)(struct tObject*, int, int);
  68:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** } OBJECT, *POBJECT;
  69:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  70:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** GEOMETRY ball_geometry = 
  71:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** {
  72:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	12,         //numPoints
  73:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	4, 4,       //sizeX, sizeY
  74:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	{
  75:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		//px[0, 1, 2, ....]
  76:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		{0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2}, 
  77:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		{1, 3}, {2, 0}, {2, 1}, {2, 2}, {2, 3}, 
  78:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		{3, 2}
  79:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
  80:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** };
  81:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  82:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  83:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  84:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** __attribute__((naked))
  85:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** __attribute__((section(".start_section")))
  86:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void startup(void){
  58              		.loc 1 86 0
  59              		.cfi_startproc
  60              		@ Naked Function: prologue and epilogue provided by programmer.
  61              		@ args = 0, pretend = 0, frame = 0
  62              		@ frame_needed = 1, uses_anonymous_args = 0
  87:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	__asm volatile(
  63              		.loc 1 87 0
  64              		.syntax divided
  65              	@ 87 "C:/Users/heinl/Documents/Moplaborationer/autopong/startup.c" 1
  66 0000 0248     		 LDR R0,=0x2001C000
  67 0002 8546     	 MOV SP, R0
  68 0004 FFF7FEFF 	 BL main
  69 0008 FEE7     	 B . 
  70              	
  71              	@ 0 "" 2
  88:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	" LDR R0,=0x2001C000\n"
  89:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	" MOV SP, R0\n"
  90:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	" BL main\n"
  91:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	" B . \n"
  92:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	);
  93:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
  72              		.loc 1 93 0
  73              		.thumb
  74              		.syntax unified
  75 000a C046     		nop
  76              		.cfi_endproc
  77              	.LFE0:
  79              		.text
  80              		.align	1
  81              		.global	delay_250ns
  82              		.syntax unified
  83              		.code	16
  84              		.thumb_func
  85              		.fpu softvfp
  87              	delay_250ns:
  88              	.LFB1:
  94:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  95:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
  96:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** //Delay funktioner
  97:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void delay_250ns(void){
  89              		.loc 1 97 0
  90              		.cfi_startproc
  91              		@ args = 0, pretend = 0, frame = 0
  92              		@ frame_needed = 1, uses_anonymous_args = 0
  93 0000 80B5     		push	{r7, lr}
  94              		.cfi_def_cfa_offset 8
  95              		.cfi_offset 7, -8
  96              		.cfi_offset 14, -4
  97 0002 00AF     		add	r7, sp, #0
  98              		.cfi_def_cfa_register 7
  98:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	/*
  99:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*stk_ctrl = 0x00000000;
 100:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*stk_load = 0x00021001;
 101:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*stk_val = 0x00000000;
 102:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*stk_ctrl = 0x00000101;
 103:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	while(((*stk_ctrl) & 0x00010000) == 0);
 104:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*stk_ctrl = 0x00000000;
 105:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*/
 106:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
  99              		.loc 1 106 0
 100 0004 C046     		nop
 101 0006 BD46     		mov	sp, r7
 102              		@ sp needed
 103 0008 80BD     		pop	{r7, pc}
 104              		.cfi_endproc
 105              	.LFE1:
 107              		.align	1
 108              		.global	delay_500ns
 109              		.syntax unified
 110              		.code	16
 111              		.thumb_func
 112              		.fpu softvfp
 114              	delay_500ns:
 115              	.LFB2:
 107:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 108:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void delay_500ns(void){
 116              		.loc 1 108 0
 117              		.cfi_startproc
 118              		@ args = 0, pretend = 0, frame = 0
 119              		@ frame_needed = 1, uses_anonymous_args = 0
 120 000a 80B5     		push	{r7, lr}
 121              		.cfi_def_cfa_offset 8
 122              		.cfi_offset 7, -8
 123              		.cfi_offset 14, -4
 124 000c 00AF     		add	r7, sp, #0
 125              		.cfi_def_cfa_register 7
 109:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	delay_250ns();
 126              		.loc 1 109 0
 127 000e FFF7FEFF 		bl	delay_250ns
 110:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	delay_250ns();
 128              		.loc 1 110 0
 129 0012 FFF7FEFF 		bl	delay_250ns
 111:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 130              		.loc 1 111 0
 131 0016 C046     		nop
 132 0018 BD46     		mov	sp, r7
 133              		@ sp needed
 134 001a 80BD     		pop	{r7, pc}
 135              		.cfi_endproc
 136              	.LFE2:
 138              		.align	1
 139              		.global	delay_mikro
 140              		.syntax unified
 141              		.code	16
 142              		.thumb_func
 143              		.fpu softvfp
 145              	delay_mikro:
 146              	.LFB3:
 112:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 113:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 114:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 115:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void delay_mikro(unsigned int us){
 147              		.loc 1 115 0
 148              		.cfi_startproc
 149              		@ args = 0, pretend = 0, frame = 8
 150              		@ frame_needed = 1, uses_anonymous_args = 0
 151 001c 80B5     		push	{r7, lr}
 152              		.cfi_def_cfa_offset 8
 153              		.cfi_offset 7, -8
 154              		.cfi_offset 14, -4
 155 001e 82B0     		sub	sp, sp, #8
 156              		.cfi_def_cfa_offset 16
 157 0020 00AF     		add	r7, sp, #0
 158              		.cfi_def_cfa_register 7
 159 0022 7860     		str	r0, [r7, #4]
 116:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	/*
 117:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	for(int i = 0; i < us; i++){
 118:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		for(int w = 0; w < 4; w++){
 119:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			delay_250ns();
 120:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		}
 121:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 122:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	 */
 123:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 160              		.loc 1 123 0
 161 0024 C046     		nop
 162 0026 BD46     		mov	sp, r7
 163 0028 02B0     		add	sp, sp, #8
 164              		@ sp needed
 165 002a 80BD     		pop	{r7, pc}
 166              		.cfi_endproc
 167              	.LFE3:
 169              		.align	1
 170              		.global	delay_milli
 171              		.syntax unified
 172              		.code	16
 173              		.thumb_func
 174              		.fpu softvfp
 176              	delay_milli:
 177              	.LFB4:
 124:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 125:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void delay_milli(unsigned int ms){
 178              		.loc 1 125 0
 179              		.cfi_startproc
 180              		@ args = 0, pretend = 0, frame = 8
 181              		@ frame_needed = 1, uses_anonymous_args = 0
 182 002c 80B5     		push	{r7, lr}
 183              		.cfi_def_cfa_offset 8
 184              		.cfi_offset 7, -8
 185              		.cfi_offset 14, -4
 186 002e 82B0     		sub	sp, sp, #8
 187              		.cfi_def_cfa_offset 16
 188 0030 00AF     		add	r7, sp, #0
 189              		.cfi_def_cfa_register 7
 190 0032 7860     		str	r0, [r7, #4]
 126:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	/*
 127:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	unsigned int us = ms * 1000;
 128:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	delay_mikro(us);
 129:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	 */
 130:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 131:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 191              		.loc 1 131 0
 192 0034 C046     		nop
 193 0036 BD46     		mov	sp, r7
 194 0038 02B0     		add	sp, sp, #8
 195              		@ sp needed
 196 003a 80BD     		pop	{r7, pc}
 197              		.cfi_endproc
 198              	.LFE4:
 200              		.align	1
 201              		.global	graphic_ctrl_bit_set
 202              		.syntax unified
 203              		.code	16
 204              		.thumb_func
 205              		.fpu softvfp
 207              	graphic_ctrl_bit_set:
 208              	.LFB5:
 132:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 133:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 134:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 135:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 136:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** //Välj grafisk display och ettställ de bitar som är 1 i x
 137:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void graphic_ctrl_bit_set(uint8_t x){
 209              		.loc 1 137 0
 210              		.cfi_startproc
 211              		@ args = 0, pretend = 0, frame = 8
 212              		@ frame_needed = 1, uses_anonymous_args = 0
 213 003c 80B5     		push	{r7, lr}
 214              		.cfi_def_cfa_offset 8
 215              		.cfi_offset 7, -8
 216              		.cfi_offset 14, -4
 217 003e 82B0     		sub	sp, sp, #8
 218              		.cfi_def_cfa_offset 16
 219 0040 00AF     		add	r7, sp, #0
 220              		.cfi_def_cfa_register 7
 221 0042 0200     		movs	r2, r0
 222 0044 FB1D     		adds	r3, r7, #7
 223 0046 1A70     		strb	r2, [r3]
 138:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*portOdrLowE |= x & ~B_SELECT;
 224              		.loc 1 138 0
 225 0048 094B     		ldr	r3, .L7
 226 004a 1B78     		ldrb	r3, [r3]
 227 004c DBB2     		uxtb	r3, r3
 228 004e 5AB2     		sxtb	r2, r3
 229 0050 FB1D     		adds	r3, r7, #7
 230 0052 1B78     		ldrb	r3, [r3]
 231 0054 5BB2     		sxtb	r3, r3
 232 0056 0421     		movs	r1, #4
 233 0058 8B43     		bics	r3, r1
 234 005a 5BB2     		sxtb	r3, r3
 235 005c 1343     		orrs	r3, r2
 236 005e 5AB2     		sxtb	r2, r3
 237 0060 034B     		ldr	r3, .L7
 238 0062 D2B2     		uxtb	r2, r2
 239 0064 1A70     		strb	r2, [r3]
 139:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 240              		.loc 1 139 0
 241 0066 C046     		nop
 242 0068 BD46     		mov	sp, r7
 243 006a 02B0     		add	sp, sp, #8
 244              		@ sp needed
 245 006c 80BD     		pop	{r7, pc}
 246              	.L8:
 247 006e C046     		.align	2
 248              	.L7:
 249 0070 14100240 		.word	1073877012
 250              		.cfi_endproc
 251              	.LFE5:
 253              		.align	1
 254              		.global	graphic_ctrl_bit_clear
 255              		.syntax unified
 256              		.code	16
 257              		.thumb_func
 258              		.fpu softvfp
 260              	graphic_ctrl_bit_clear:
 261              	.LFB6:
 140:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 141:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 142:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** //Välj grafisk display och nollställ de bitar som är 1 i x
 143:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void graphic_ctrl_bit_clear(uint8_t x){
 262              		.loc 1 143 0
 263              		.cfi_startproc
 264              		@ args = 0, pretend = 0, frame = 8
 265              		@ frame_needed = 1, uses_anonymous_args = 0
 266 0074 80B5     		push	{r7, lr}
 267              		.cfi_def_cfa_offset 8
 268              		.cfi_offset 7, -8
 269              		.cfi_offset 14, -4
 270 0076 82B0     		sub	sp, sp, #8
 271              		.cfi_def_cfa_offset 16
 272 0078 00AF     		add	r7, sp, #0
 273              		.cfi_def_cfa_register 7
 274 007a 0200     		movs	r2, r0
 275 007c FB1D     		adds	r3, r7, #7
 276 007e 1A70     		strb	r2, [r3]
 144:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*portOdrLowE &= (~x & ~B_SELECT);
 277              		.loc 1 144 0
 278 0080 084B     		ldr	r3, .L10
 279 0082 1B78     		ldrb	r3, [r3]
 280 0084 DBB2     		uxtb	r3, r3
 281 0086 FA1D     		adds	r2, r7, #7
 282 0088 1278     		ldrb	r2, [r2]
 283 008a D243     		mvns	r2, r2
 284 008c D2B2     		uxtb	r2, r2
 285 008e 1340     		ands	r3, r2
 286 0090 DBB2     		uxtb	r3, r3
 287 0092 044A     		ldr	r2, .L10
 288 0094 0421     		movs	r1, #4
 289 0096 8B43     		bics	r3, r1
 290 0098 DBB2     		uxtb	r3, r3
 291 009a 1370     		strb	r3, [r2]
 145:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 292              		.loc 1 145 0
 293 009c C046     		nop
 294 009e BD46     		mov	sp, r7
 295 00a0 02B0     		add	sp, sp, #8
 296              		@ sp needed
 297 00a2 80BD     		pop	{r7, pc}
 298              	.L11:
 299              		.align	2
 300              	.L10:
 301 00a4 14100240 		.word	1073877012
 302              		.cfi_endproc
 303              	.LFE6:
 305              		.align	1
 306              		.global	select_controller
 307              		.syntax unified
 308              		.code	16
 309              		.thumb_func
 310              		.fpu softvfp
 312              	select_controller:
 313              	.LFB7:
 146:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 147:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 148:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** //Konfigurera CS-signalerna
 149:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void select_controller(uint8_t controller){
 314              		.loc 1 149 0
 315              		.cfi_startproc
 316              		@ args = 0, pretend = 0, frame = 8
 317              		@ frame_needed = 1, uses_anonymous_args = 0
 318 00a8 80B5     		push	{r7, lr}
 319              		.cfi_def_cfa_offset 8
 320              		.cfi_offset 7, -8
 321              		.cfi_offset 14, -4
 322 00aa 82B0     		sub	sp, sp, #8
 323              		.cfi_def_cfa_offset 16
 324 00ac 00AF     		add	r7, sp, #0
 325              		.cfi_def_cfa_register 7
 326 00ae 0200     		movs	r2, r0
 327 00b0 FB1D     		adds	r3, r7, #7
 328 00b2 1A70     		strb	r2, [r3]
 150:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	switch(controller){
 329              		.loc 1 150 0
 330 00b4 FB1D     		adds	r3, r7, #7
 331 00b6 1B78     		ldrb	r3, [r3]
 332 00b8 082B     		cmp	r3, #8
 333 00ba 0CD0     		beq	.L14
 334 00bc 02DC     		bgt	.L15
 335 00be 002B     		cmp	r3, #0
 336 00c0 05D0     		beq	.L16
 337 00c2 19E0     		b	.L13
 338              	.L15:
 339 00c4 102B     		cmp	r3, #16
 340 00c6 0DD0     		beq	.L17
 341 00c8 182B     		cmp	r3, #24
 342 00ca 12D0     		beq	.L18
 343 00cc 14E0     		b	.L13
 344              	.L16:
 151:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case 0:
 152:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			graphic_ctrl_bit_clear(B_CS1 | B_CS2);
 345              		.loc 1 152 0
 346 00ce 1820     		movs	r0, #24
 347 00d0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 153:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			break;
 348              		.loc 1 153 0
 349 00d4 13E0     		b	.L19
 350              	.L14:
 154:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case B_CS1:
 155:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			graphic_ctrl_bit_set(B_CS1);
 351              		.loc 1 155 0
 352 00d6 0820     		movs	r0, #8
 353 00d8 FFF7FEFF 		bl	graphic_ctrl_bit_set
 156:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			graphic_ctrl_bit_clear(B_CS2);
 354              		.loc 1 156 0
 355 00dc 1020     		movs	r0, #16
 356 00de FFF7FEFF 		bl	graphic_ctrl_bit_clear
 157:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			break;
 357              		.loc 1 157 0
 358 00e2 0CE0     		b	.L19
 359              	.L17:
 158:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case B_CS2:
 159:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			graphic_ctrl_bit_set(B_CS2);
 360              		.loc 1 159 0
 361 00e4 1020     		movs	r0, #16
 362 00e6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 160:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			graphic_ctrl_bit_clear(B_CS1);
 363              		.loc 1 160 0
 364 00ea 0820     		movs	r0, #8
 365 00ec FFF7FEFF 		bl	graphic_ctrl_bit_clear
 161:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			break;
 366              		.loc 1 161 0
 367 00f0 05E0     		b	.L19
 368              	.L18:
 162:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case (B_CS1 | B_CS2):
 163:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			graphic_ctrl_bit_set(B_CS1 | B_CS2);
 369              		.loc 1 163 0
 370 00f2 1820     		movs	r0, #24
 371 00f4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 372              	.L13:
 164:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		default:
 165:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			graphic_ctrl_bit_clear(B_CS1 | B_CS2);
 373              		.loc 1 165 0
 374 00f8 1820     		movs	r0, #24
 375 00fa FFF7FEFF 		bl	graphic_ctrl_bit_clear
 376              	.L19:
 166:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 167:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 377              		.loc 1 167 0
 378 00fe C046     		nop
 379 0100 BD46     		mov	sp, r7
 380 0102 02B0     		add	sp, sp, #8
 381              		@ sp needed
 382 0104 80BD     		pop	{r7, pc}
 383              		.cfi_endproc
 384              	.LFE7:
 386              		.align	1
 387              		.global	graphic_wait_ready
 388              		.syntax unified
 389              		.code	16
 390              		.thumb_func
 391              		.fpu softvfp
 393              	graphic_wait_ready:
 394              	.LFB8:
 168:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 169:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 170:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 171:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 172:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 173:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** //Undersök ''busy'' flaggan, och returnera från funktion när den blir 0
 174:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void graphic_wait_ready(void){
 395              		.loc 1 174 0
 396              		.cfi_startproc
 397              		@ args = 0, pretend = 0, frame = 0
 398              		@ frame_needed = 1, uses_anonymous_args = 0
 399 0106 80B5     		push	{r7, lr}
 400              		.cfi_def_cfa_offset 8
 401              		.cfi_offset 7, -8
 402              		.cfi_offset 14, -4
 403 0108 00AF     		add	r7, sp, #0
 404              		.cfi_def_cfa_register 7
 175:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 405              		.loc 1 175 0
 406 010a 4020     		movs	r0, #64
 407 010c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 176:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 177:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*portModerE = 0x00005555;  //15-8 utgång, 7-0 ingång
 408              		.loc 1 177 0
 409 0110 124B     		ldr	r3, .L23
 410 0112 134A     		ldr	r2, .L23+4
 411 0114 1A60     		str	r2, [r3]
 178:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 412              		.loc 1 178 0
 413 0116 0120     		movs	r0, #1
 414 0118 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 179:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RW); //Gör så vi kollar status
 415              		.loc 1 179 0
 416 011c 0220     		movs	r0, #2
 417 011e FFF7FEFF 		bl	graphic_ctrl_bit_set
 180:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	delay_500ns();
 418              		.loc 1 180 0
 419 0122 FFF7FEFF 		bl	delay_500ns
 181:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 182:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	while(*portIdrHighE & 1<<7){ //gör detta medan busy-flaggan inte är 0
 420              		.loc 1 182 0
 421 0126 09E0     		b	.L21
 422              	.L22:
 183:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		graphic_ctrl_bit_set(B_E);
 423              		.loc 1 183 0
 424 0128 4020     		movs	r0, #64
 425 012a FFF7FEFF 		bl	graphic_ctrl_bit_set
 184:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		delay_500ns();
 426              		.loc 1 184 0
 427 012e FFF7FEFF 		bl	delay_500ns
 185:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		graphic_ctrl_bit_clear(B_E);
 428              		.loc 1 185 0
 429 0132 4020     		movs	r0, #64
 430 0134 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 186:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		delay_500ns();
 431              		.loc 1 186 0
 432 0138 FFF7FEFF 		bl	delay_500ns
 433              	.L21:
 182:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		graphic_ctrl_bit_set(B_E);
 434              		.loc 1 182 0
 435 013c 094B     		ldr	r3, .L23+8
 436 013e 1B78     		ldrb	r3, [r3]
 437 0140 DBB2     		uxtb	r3, r3
 438 0142 5BB2     		sxtb	r3, r3
 439 0144 002B     		cmp	r3, #0
 440 0146 EFDB     		blt	.L22
 187:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 188:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 189:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 441              		.loc 1 189 0
 442 0148 4020     		movs	r0, #64
 443 014a FFF7FEFF 		bl	graphic_ctrl_bit_set
 190:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*portModerE = 0x55555555; //15-0 utgång
 444              		.loc 1 190 0
 445 014e 034B     		ldr	r3, .L23
 446 0150 054A     		ldr	r2, .L23+12
 447 0152 1A60     		str	r2, [r3]
 191:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 448              		.loc 1 191 0
 449 0154 C046     		nop
 450 0156 BD46     		mov	sp, r7
 451              		@ sp needed
 452 0158 80BD     		pop	{r7, pc}
 453              	.L24:
 454 015a C046     		.align	2
 455              	.L23:
 456 015c 00100240 		.word	1073876992
 457 0160 55550000 		.word	21845
 458 0164 11100240 		.word	1073877009
 459 0168 55555555 		.word	1431655765
 460              		.cfi_endproc
 461              	.LFE8:
 463              		.align	1
 464              		.global	graphic_read
 465              		.syntax unified
 466              		.code	16
 467              		.thumb_func
 468              		.fpu softvfp
 470              	graphic_read:
 471              	.LFB9:
 192:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 193:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 194:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 195:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** unsigned char graphic_read(unsigned char controller){
 472              		.loc 1 195 0
 473              		.cfi_startproc
 474              		@ args = 0, pretend = 0, frame = 16
 475              		@ frame_needed = 1, uses_anonymous_args = 0
 476 016c 80B5     		push	{r7, lr}
 477              		.cfi_def_cfa_offset 8
 478              		.cfi_offset 7, -8
 479              		.cfi_offset 14, -4
 480 016e 84B0     		sub	sp, sp, #16
 481              		.cfi_def_cfa_offset 24
 482 0170 00AF     		add	r7, sp, #0
 483              		.cfi_def_cfa_register 7
 484 0172 0200     		movs	r2, r0
 485 0174 FB1D     		adds	r3, r7, #7
 486 0176 1A70     		strb	r2, [r3]
 196:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 487              		.loc 1 196 0
 488 0178 4020     		movs	r0, #64
 489 017a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 197:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 198:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*portModerE = 0x00005555;  //15-8 utgång, 7-0 ingång
 490              		.loc 1 198 0
 491 017e 1D4B     		ldr	r3, .L29
 492 0180 1D4A     		ldr	r2, .L29+4
 493 0182 1A60     		str	r2, [r3]
 199:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 494              		.loc 1 199 0
 495 0184 0120     		movs	r0, #1
 496 0186 FFF7FEFF 		bl	graphic_ctrl_bit_set
 200:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RW); //Gör så vi kan läsa data
 497              		.loc 1 200 0
 498 018a 0220     		movs	r0, #2
 499 018c FFF7FEFF 		bl	graphic_ctrl_bit_set
 201:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	select_controller(controller);
 500              		.loc 1 201 0
 501 0190 FB1D     		adds	r3, r7, #7
 502 0192 1B78     		ldrb	r3, [r3]
 503 0194 1800     		movs	r0, r3
 504 0196 FFF7FEFF 		bl	select_controller
 202:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	delay_500ns();
 505              		.loc 1 202 0
 506 019a FFF7FEFF 		bl	delay_500ns
 203:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 507              		.loc 1 203 0
 508 019e 4020     		movs	r0, #64
 509 01a0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 204:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	delay_500ns();
 510              		.loc 1 204 0
 511 01a4 FFF7FEFF 		bl	delay_500ns
 205:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	unsigned char RV = *portIdrHighE;
 512              		.loc 1 205 0
 513 01a8 144A     		ldr	r2, .L29+8
 514 01aa 0F23     		movs	r3, #15
 515 01ac FB18     		adds	r3, r7, r3
 516 01ae 1278     		ldrb	r2, [r2]
 517 01b0 1A70     		strb	r2, [r3]
 206:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 518              		.loc 1 206 0
 519 01b2 4020     		movs	r0, #64
 520 01b4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 207:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*portModerE = 0x55555555; //15-0 utgång
 521              		.loc 1 207 0
 522 01b8 0E4B     		ldr	r3, .L29
 523 01ba 114A     		ldr	r2, .L29+12
 524 01bc 1A60     		str	r2, [r3]
 208:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 209:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	if (controller == B_CS1){
 525              		.loc 1 209 0
 526 01be FB1D     		adds	r3, r7, #7
 527 01c0 1B78     		ldrb	r3, [r3]
 528 01c2 082B     		cmp	r3, #8
 529 01c4 05D1     		bne	.L26
 210:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		select_controller(B_CS1);
 530              		.loc 1 210 0
 531 01c6 0820     		movs	r0, #8
 532 01c8 FFF7FEFF 		bl	select_controller
 211:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		graphic_wait_ready();
 533              		.loc 1 211 0
 534 01cc FFF7FEFF 		bl	graphic_wait_ready
 535 01d0 08E0     		b	.L27
 536              	.L26:
 212:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	} else if (controller == B_CS2){
 537              		.loc 1 212 0
 538 01d2 FB1D     		adds	r3, r7, #7
 539 01d4 1B78     		ldrb	r3, [r3]
 540 01d6 102B     		cmp	r3, #16
 541 01d8 04D1     		bne	.L27
 213:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		select_controller(B_CS2);
 542              		.loc 1 213 0
 543 01da 1020     		movs	r0, #16
 544 01dc FFF7FEFF 		bl	select_controller
 214:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		graphic_wait_ready();
 545              		.loc 1 214 0
 546 01e0 FFF7FEFF 		bl	graphic_wait_ready
 547              	.L27:
 215:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 216:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	return RV;
 548              		.loc 1 216 0
 549 01e4 0F23     		movs	r3, #15
 550 01e6 FB18     		adds	r3, r7, r3
 551 01e8 1B78     		ldrb	r3, [r3]
 217:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 552              		.loc 1 217 0
 553 01ea 1800     		movs	r0, r3
 554 01ec BD46     		mov	sp, r7
 555 01ee 04B0     		add	sp, sp, #16
 556              		@ sp needed
 557 01f0 80BD     		pop	{r7, pc}
 558              	.L30:
 559 01f2 C046     		.align	2
 560              	.L29:
 561 01f4 00100240 		.word	1073876992
 562 01f8 55550000 		.word	21845
 563 01fc 11100240 		.word	1073877009
 564 0200 55555555 		.word	1431655765
 565              		.cfi_endproc
 566              	.LFE9:
 568              		.align	1
 569              		.global	graphic_write
 570              		.syntax unified
 571              		.code	16
 572              		.thumb_func
 573              		.fpu softvfp
 575              	graphic_write:
 576              	.LFB10:
 218:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 219:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 220:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void graphic_write(unsigned char value, unsigned char controller){
 577              		.loc 1 220 0
 578              		.cfi_startproc
 579              		@ args = 0, pretend = 0, frame = 8
 580              		@ frame_needed = 1, uses_anonymous_args = 0
 581 0204 80B5     		push	{r7, lr}
 582              		.cfi_def_cfa_offset 8
 583              		.cfi_offset 7, -8
 584              		.cfi_offset 14, -4
 585 0206 82B0     		sub	sp, sp, #8
 586              		.cfi_def_cfa_offset 16
 587 0208 00AF     		add	r7, sp, #0
 588              		.cfi_def_cfa_register 7
 589 020a 0200     		movs	r2, r0
 590 020c FB1D     		adds	r3, r7, #7
 591 020e 1A70     		strb	r2, [r3]
 592 0210 BB1D     		adds	r3, r7, #6
 593 0212 0A1C     		adds	r2, r1, #0
 594 0214 1A70     		strb	r2, [r3]
 221:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*portOdrHighE = value;
 595              		.loc 1 221 0
 596 0216 1A4A     		ldr	r2, .L34
 597 0218 FB1D     		adds	r3, r7, #7
 598 021a 1B78     		ldrb	r3, [r3]
 599 021c 1370     		strb	r3, [r2]
 222:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	select_controller(controller);
 600              		.loc 1 222 0
 601 021e BB1D     		adds	r3, r7, #6
 602 0220 1B78     		ldrb	r3, [r3]
 603 0222 1800     		movs	r0, r3
 604 0224 FFF7FEFF 		bl	select_controller
 223:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	delay_500ns();
 605              		.loc 1 223 0
 606 0228 FFF7FEFF 		bl	delay_500ns
 224:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 607              		.loc 1 224 0
 608 022c 4020     		movs	r0, #64
 609 022e FFF7FEFF 		bl	graphic_ctrl_bit_set
 225:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	delay_500ns();
 610              		.loc 1 225 0
 611 0232 FFF7FEFF 		bl	delay_500ns
 226:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 612              		.loc 1 226 0
 613 0236 4020     		movs	r0, #64
 614 0238 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 227:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 228:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	if (controller & B_CS1){
 615              		.loc 1 228 0
 616 023c BB1D     		adds	r3, r7, #6
 617 023e 1B78     		ldrb	r3, [r3]
 618 0240 0822     		movs	r2, #8
 619 0242 1340     		ands	r3, r2
 620 0244 05D0     		beq	.L32
 229:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		select_controller(B_CS1);
 621              		.loc 1 229 0
 622 0246 0820     		movs	r0, #8
 623 0248 FFF7FEFF 		bl	select_controller
 230:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		graphic_wait_ready();
 624              		.loc 1 230 0
 625 024c FFF7FEFF 		bl	graphic_wait_ready
 626 0250 09E0     		b	.L33
 627              	.L32:
 231:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	} else if (controller & B_CS2){
 628              		.loc 1 231 0
 629 0252 BB1D     		adds	r3, r7, #6
 630 0254 1B78     		ldrb	r3, [r3]
 631 0256 1022     		movs	r2, #16
 632 0258 1340     		ands	r3, r2
 633 025a 04D0     		beq	.L33
 232:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		select_controller(B_CS2);
 634              		.loc 1 232 0
 635 025c 1020     		movs	r0, #16
 636 025e FFF7FEFF 		bl	select_controller
 233:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		graphic_wait_ready();
 637              		.loc 1 233 0
 638 0262 FFF7FEFF 		bl	graphic_wait_ready
 639              	.L33:
 234:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 235:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 236:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*portOdrHighE = 0;
 640              		.loc 1 236 0
 641 0266 064B     		ldr	r3, .L34
 642 0268 0022     		movs	r2, #0
 643 026a 1A70     		strb	r2, [r3]
 237:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 644              		.loc 1 237 0
 645 026c 4020     		movs	r0, #64
 646 026e FFF7FEFF 		bl	graphic_ctrl_bit_set
 238:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	select_controller(0);
 647              		.loc 1 238 0
 648 0272 0020     		movs	r0, #0
 649 0274 FFF7FEFF 		bl	select_controller
 239:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 650              		.loc 1 239 0
 651 0278 C046     		nop
 652 027a BD46     		mov	sp, r7
 653 027c 02B0     		add	sp, sp, #8
 654              		@ sp needed
 655 027e 80BD     		pop	{r7, pc}
 656              	.L35:
 657              		.align	2
 658              	.L34:
 659 0280 15100240 		.word	1073877013
 660              		.cfi_endproc
 661              	.LFE10:
 663              		.align	1
 664              		.global	graphic_write_command
 665              		.syntax unified
 666              		.code	16
 667              		.thumb_func
 668              		.fpu softvfp
 670              	graphic_write_command:
 671              	.LFB11:
 240:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 241:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 242:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 672              		.loc 1 242 0
 673              		.cfi_startproc
 674              		@ args = 0, pretend = 0, frame = 8
 675              		@ frame_needed = 1, uses_anonymous_args = 0
 676 0284 80B5     		push	{r7, lr}
 677              		.cfi_def_cfa_offset 8
 678              		.cfi_offset 7, -8
 679              		.cfi_offset 14, -4
 680 0286 82B0     		sub	sp, sp, #8
 681              		.cfi_def_cfa_offset 16
 682 0288 00AF     		add	r7, sp, #0
 683              		.cfi_def_cfa_register 7
 684 028a 0200     		movs	r2, r0
 685 028c FB1D     		adds	r3, r7, #7
 686 028e 1A70     		strb	r2, [r3]
 687 0290 BB1D     		adds	r3, r7, #6
 688 0292 0A1C     		adds	r2, r1, #0
 689 0294 1A70     		strb	r2, [r3]
 243:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 690              		.loc 1 243 0
 691 0296 4020     		movs	r0, #64
 692 0298 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 244:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	select_controller(controller);
 693              		.loc 1 244 0
 694 029c BB1D     		adds	r3, r7, #6
 695 029e 1B78     		ldrb	r3, [r3]
 696 02a0 1800     		movs	r0, r3
 697 02a2 FFF7FEFF 		bl	select_controller
 245:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 698              		.loc 1 245 0
 699 02a6 0120     		movs	r0, #1
 700 02a8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 246:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 701              		.loc 1 246 0
 702 02ac 0220     		movs	r0, #2
 703 02ae FFF7FEFF 		bl	graphic_ctrl_bit_clear
 247:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_write(command, controller);
 704              		.loc 1 247 0
 705 02b2 BB1D     		adds	r3, r7, #6
 706 02b4 1A78     		ldrb	r2, [r3]
 707 02b6 FB1D     		adds	r3, r7, #7
 708 02b8 1B78     		ldrb	r3, [r3]
 709 02ba 1100     		movs	r1, r2
 710 02bc 1800     		movs	r0, r3
 711 02be FFF7FEFF 		bl	graphic_write
 248:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 712              		.loc 1 248 0
 713 02c2 C046     		nop
 714 02c4 BD46     		mov	sp, r7
 715 02c6 02B0     		add	sp, sp, #8
 716              		@ sp needed
 717 02c8 80BD     		pop	{r7, pc}
 718              		.cfi_endproc
 719              	.LFE11:
 721              		.align	1
 722              		.global	graphic_write_data
 723              		.syntax unified
 724              		.code	16
 725              		.thumb_func
 726              		.fpu softvfp
 728              	graphic_write_data:
 729              	.LFB12:
 249:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 250:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void graphic_write_data(uint8_t data, uint8_t controller){
 730              		.loc 1 250 0
 731              		.cfi_startproc
 732              		@ args = 0, pretend = 0, frame = 8
 733              		@ frame_needed = 1, uses_anonymous_args = 0
 734 02ca 80B5     		push	{r7, lr}
 735              		.cfi_def_cfa_offset 8
 736              		.cfi_offset 7, -8
 737              		.cfi_offset 14, -4
 738 02cc 82B0     		sub	sp, sp, #8
 739              		.cfi_def_cfa_offset 16
 740 02ce 00AF     		add	r7, sp, #0
 741              		.cfi_def_cfa_register 7
 742 02d0 0200     		movs	r2, r0
 743 02d2 FB1D     		adds	r3, r7, #7
 744 02d4 1A70     		strb	r2, [r3]
 745 02d6 BB1D     		adds	r3, r7, #6
 746 02d8 0A1C     		adds	r2, r1, #0
 747 02da 1A70     		strb	r2, [r3]
 251:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 748              		.loc 1 251 0
 749 02dc 4020     		movs	r0, #64
 750 02de FFF7FEFF 		bl	graphic_ctrl_bit_clear
 252:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	select_controller(controller);
 751              		.loc 1 252 0
 752 02e2 BB1D     		adds	r3, r7, #6
 753 02e4 1B78     		ldrb	r3, [r3]
 754 02e6 1800     		movs	r0, r3
 755 02e8 FFF7FEFF 		bl	select_controller
 253:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 756              		.loc 1 253 0
 757 02ec 0120     		movs	r0, #1
 758 02ee FFF7FEFF 		bl	graphic_ctrl_bit_set
 254:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 759              		.loc 1 254 0
 760 02f2 0220     		movs	r0, #2
 761 02f4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 255:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_write(data, controller);
 762              		.loc 1 255 0
 763 02f8 BB1D     		adds	r3, r7, #6
 764 02fa 1A78     		ldrb	r2, [r3]
 765 02fc FB1D     		adds	r3, r7, #7
 766 02fe 1B78     		ldrb	r3, [r3]
 767 0300 1100     		movs	r1, r2
 768 0302 1800     		movs	r0, r3
 769 0304 FFF7FEFF 		bl	graphic_write
 256:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 770              		.loc 1 256 0
 771 0308 C046     		nop
 772 030a BD46     		mov	sp, r7
 773 030c 02B0     		add	sp, sp, #8
 774              		@ sp needed
 775 030e 80BD     		pop	{r7, pc}
 776              		.cfi_endproc
 777              	.LFE12:
 779              		.align	1
 780              		.global	graphic_read_data
 781              		.syntax unified
 782              		.code	16
 783              		.thumb_func
 784              		.fpu softvfp
 786              	graphic_read_data:
 787              	.LFB13:
 257:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 258:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** unsigned char graphic_read_data(unsigned char controller){
 788              		.loc 1 258 0
 789              		.cfi_startproc
 790              		@ args = 0, pretend = 0, frame = 8
 791              		@ frame_needed = 1, uses_anonymous_args = 0
 792 0310 80B5     		push	{r7, lr}
 793              		.cfi_def_cfa_offset 8
 794              		.cfi_offset 7, -8
 795              		.cfi_offset 14, -4
 796 0312 82B0     		sub	sp, sp, #8
 797              		.cfi_def_cfa_offset 16
 798 0314 00AF     		add	r7, sp, #0
 799              		.cfi_def_cfa_register 7
 800 0316 0200     		movs	r2, r0
 801 0318 FB1D     		adds	r3, r7, #7
 802 031a 1A70     		strb	r2, [r3]
 259:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_read(controller); //Nonsens
 803              		.loc 1 259 0
 804 031c FB1D     		adds	r3, r7, #7
 805 031e 1B78     		ldrb	r3, [r3]
 806 0320 1800     		movs	r0, r3
 807 0322 FFF7FEFF 		bl	graphic_read
 260:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	return graphic_read(controller); //korrekt data
 808              		.loc 1 260 0
 809 0326 FB1D     		adds	r3, r7, #7
 810 0328 1B78     		ldrb	r3, [r3]
 811 032a 1800     		movs	r0, r3
 812 032c FFF7FEFF 		bl	graphic_read
 813 0330 0300     		movs	r3, r0
 261:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 814              		.loc 1 261 0
 815 0332 1800     		movs	r0, r3
 816 0334 BD46     		mov	sp, r7
 817 0336 02B0     		add	sp, sp, #8
 818              		@ sp needed
 819 0338 80BD     		pop	{r7, pc}
 820              		.cfi_endproc
 821              	.LFE13:
 823              		.align	1
 824              		.global	init_app
 825              		.syntax unified
 826              		.code	16
 827              		.thumb_func
 828              		.fpu softvfp
 830              	init_app:
 831              	.LFB14:
 262:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 263:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 264:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 265:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void init_app(void){
 832              		.loc 1 265 0
 833              		.cfi_startproc
 834              		@ args = 0, pretend = 0, frame = 0
 835              		@ frame_needed = 1, uses_anonymous_args = 0
 836 033a 80B5     		push	{r7, lr}
 837              		.cfi_def_cfa_offset 8
 838              		.cfi_offset 7, -8
 839              		.cfi_offset 14, -4
 840 033c 00AF     		add	r7, sp, #0
 841              		.cfi_def_cfa_register 7
 266:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	*portModerE = 0x55555555; //15-0 utport
 842              		.loc 1 266 0
 843 033e 034B     		ldr	r3, .L41
 844 0340 034A     		ldr	r2, .L41+4
 845 0342 1A60     		str	r2, [r3]
 267:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 846              		.loc 1 267 0
 847 0344 C046     		nop
 848 0346 BD46     		mov	sp, r7
 849              		@ sp needed
 850 0348 80BD     		pop	{r7, pc}
 851              	.L42:
 852 034a C046     		.align	2
 853              	.L41:
 854 034c 00100240 		.word	1073876992
 855 0350 55555555 		.word	1431655765
 856              		.cfi_endproc
 857              	.LFE14:
 859              		.align	1
 860              		.global	graphic_initialize
 861              		.syntax unified
 862              		.code	16
 863              		.thumb_func
 864              		.fpu softvfp
 866              	graphic_initialize:
 867              	.LFB15:
 268:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 269:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void graphic_initialize(void){
 868              		.loc 1 269 0
 869              		.cfi_startproc
 870              		@ args = 0, pretend = 0, frame = 0
 871              		@ frame_needed = 1, uses_anonymous_args = 0
 872 0354 80B5     		push	{r7, lr}
 873              		.cfi_def_cfa_offset 8
 874              		.cfi_offset 7, -8
 875              		.cfi_offset 14, -4
 876 0356 00AF     		add	r7, sp, #0
 877              		.cfi_def_cfa_register 7
 270:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 878              		.loc 1 270 0
 879 0358 4020     		movs	r0, #64
 880 035a FFF7FEFF 		bl	graphic_ctrl_bit_set
 271:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	delay_mikro(10);
 881              		.loc 1 271 0
 882 035e 0A20     		movs	r0, #10
 883 0360 FFF7FEFF 		bl	delay_mikro
 272:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 884              		.loc 1 272 0
 885 0364 7820     		movs	r0, #120
 886 0366 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 273:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	delay_milli(30);
 887              		.loc 1 273 0
 888 036a 1E20     		movs	r0, #30
 889 036c FFF7FEFF 		bl	delay_milli
 274:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RST);
 890              		.loc 1 274 0
 891 0370 2020     		movs	r0, #32
 892 0372 FFF7FEFF 		bl	graphic_ctrl_bit_set
 275:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 893              		.loc 1 275 0
 894 0376 1821     		movs	r1, #24
 895 0378 3E20     		movs	r0, #62
 896 037a FFF7FEFF 		bl	graphic_write_command
 276:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_write_command(LCD_ON, B_CS1|B_CS2);         //toggla display
 897              		.loc 1 276 0
 898 037e 1821     		movs	r1, #24
 899 0380 3F20     		movs	r0, #63
 900 0382 FFF7FEFF 		bl	graphic_write_command
 277:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2); //start=0
 901              		.loc 1 277 0
 902 0386 1821     		movs	r1, #24
 903 0388 C020     		movs	r0, #192
 904 038a FFF7FEFF 		bl	graphic_write_command
 278:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);    //add=0
 905              		.loc 1 278 0
 906 038e 1821     		movs	r1, #24
 907 0390 4020     		movs	r0, #64
 908 0392 FFF7FEFF 		bl	graphic_write_command
 279:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);   //page=0
 909              		.loc 1 279 0
 910 0396 1821     		movs	r1, #24
 911 0398 B820     		movs	r0, #184
 912 039a FFF7FEFF 		bl	graphic_write_command
 280:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	select_controller(0);                               //deaktivera båda CS-signalerna
 913              		.loc 1 280 0
 914 039e 0020     		movs	r0, #0
 915 03a0 FFF7FEFF 		bl	select_controller
 281:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 916              		.loc 1 281 0
 917 03a4 C046     		nop
 918 03a6 BD46     		mov	sp, r7
 919              		@ sp needed
 920 03a8 80BD     		pop	{r7, pc}
 921              		.cfi_endproc
 922              	.LFE15:
 924              		.align	1
 925              		.global	graphic_clear_screen
 926              		.syntax unified
 927              		.code	16
 928              		.thumb_func
 929              		.fpu softvfp
 931              	graphic_clear_screen:
 932              	.LFB16:
 282:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 283:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 284:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void graphic_clear_screen(void){
 933              		.loc 1 284 0
 934              		.cfi_startproc
 935              		@ args = 0, pretend = 0, frame = 8
 936              		@ frame_needed = 1, uses_anonymous_args = 0
 937 03aa 80B5     		push	{r7, lr}
 938              		.cfi_def_cfa_offset 8
 939              		.cfi_offset 7, -8
 940              		.cfi_offset 14, -4
 941 03ac 82B0     		sub	sp, sp, #8
 942              		.cfi_def_cfa_offset 16
 943 03ae 00AF     		add	r7, sp, #0
 944              		.cfi_def_cfa_register 7
 945              	.LBB2:
 285:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	for (int i = 0; i<=7; i++){
 946              		.loc 1 285 0
 947 03b0 0023     		movs	r3, #0
 948 03b2 7B60     		str	r3, [r7, #4]
 949 03b4 1EE0     		b	.L45
 950              	.L48:
 286:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		graphic_write_command(LCD_SET_PAGE | i, B_CS1|B_CS2);
 951              		.loc 1 286 0
 952 03b6 7B68     		ldr	r3, [r7, #4]
 953 03b8 5BB2     		sxtb	r3, r3
 954 03ba 4822     		movs	r2, #72
 955 03bc 5242     		rsbs	r2, r2, #0
 956 03be 1343     		orrs	r3, r2
 957 03c0 5BB2     		sxtb	r3, r3
 958 03c2 DBB2     		uxtb	r3, r3
 959 03c4 1821     		movs	r1, #24
 960 03c6 1800     		movs	r0, r3
 961 03c8 FFF7FEFF 		bl	graphic_write_command
 287:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 962              		.loc 1 287 0
 963 03cc 1821     		movs	r1, #24
 964 03ce 4020     		movs	r0, #64
 965 03d0 FFF7FEFF 		bl	graphic_write_command
 966              	.LBB3:
 288:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		for(int w = 0; w<=63; w++){
 967              		.loc 1 288 0
 968 03d4 0023     		movs	r3, #0
 969 03d6 3B60     		str	r3, [r7]
 970 03d8 06E0     		b	.L46
 971              	.L47:
 289:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			graphic_write_data(0, B_CS1|B_CS2);
 972              		.loc 1 289 0 discriminator 3
 973 03da 1821     		movs	r1, #24
 974 03dc 0020     		movs	r0, #0
 975 03de FFF7FEFF 		bl	graphic_write_data
 288:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		for(int w = 0; w<=63; w++){
 976              		.loc 1 288 0 discriminator 3
 977 03e2 3B68     		ldr	r3, [r7]
 978 03e4 0133     		adds	r3, r3, #1
 979 03e6 3B60     		str	r3, [r7]
 980              	.L46:
 288:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		for(int w = 0; w<=63; w++){
 981              		.loc 1 288 0 is_stmt 0 discriminator 1
 982 03e8 3B68     		ldr	r3, [r7]
 983 03ea 3F2B     		cmp	r3, #63
 984 03ec F5DD     		ble	.L47
 985              	.LBE3:
 285:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		graphic_write_command(LCD_SET_PAGE | i, B_CS1|B_CS2);
 986              		.loc 1 285 0 is_stmt 1 discriminator 2
 987 03ee 7B68     		ldr	r3, [r7, #4]
 988 03f0 0133     		adds	r3, r3, #1
 989 03f2 7B60     		str	r3, [r7, #4]
 990              	.L45:
 285:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		graphic_write_command(LCD_SET_PAGE | i, B_CS1|B_CS2);
 991              		.loc 1 285 0 is_stmt 0 discriminator 1
 992 03f4 7B68     		ldr	r3, [r7, #4]
 993 03f6 072B     		cmp	r3, #7
 994 03f8 DDDD     		ble	.L48
 995              	.LBE2:
 290:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		}
 291:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 292:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 996              		.loc 1 292 0 is_stmt 1
 997 03fa C046     		nop
 998 03fc BD46     		mov	sp, r7
 999 03fe 02B0     		add	sp, sp, #8
 1000              		@ sp needed
 1001 0400 80BD     		pop	{r7, pc}
 1002              		.cfi_endproc
 1003              	.LFE16:
 1005              		.align	1
 1006              		.global	pixel
 1007              		.syntax unified
 1008              		.code	16
 1009              		.thumb_func
 1010              		.fpu softvfp
 1012              	pixel:
 1013              	.LFB17:
 293:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 294:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 295:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void pixel(unsigned char x, unsigned char y, unsigned char set){
 1014              		.loc 1 295 0
 1015              		.cfi_startproc
 1016              		@ args = 0, pretend = 0, frame = 16
 1017              		@ frame_needed = 1, uses_anonymous_args = 0
 1018 0402 F0B5     		push	{r4, r5, r6, r7, lr}
 1019              		.cfi_def_cfa_offset 20
 1020              		.cfi_offset 4, -20
 1021              		.cfi_offset 5, -16
 1022              		.cfi_offset 6, -12
 1023              		.cfi_offset 7, -8
 1024              		.cfi_offset 14, -4
 1025 0404 85B0     		sub	sp, sp, #20
 1026              		.cfi_def_cfa_offset 40
 1027 0406 00AF     		add	r7, sp, #0
 1028              		.cfi_def_cfa_register 7
 1029 0408 0400     		movs	r4, r0
 1030 040a 0800     		movs	r0, r1
 1031 040c 1100     		movs	r1, r2
 1032 040e FB1D     		adds	r3, r7, #7
 1033 0410 221C     		adds	r2, r4, #0
 1034 0412 1A70     		strb	r2, [r3]
 1035 0414 BB1D     		adds	r3, r7, #6
 1036 0416 021C     		adds	r2, r0, #0
 1037 0418 1A70     		strb	r2, [r3]
 1038 041a 7B1D     		adds	r3, r7, #5
 1039 041c 0A1C     		adds	r2, r1, #0
 1040 041e 1A70     		strb	r2, [r3]
 296:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	if(x < 1 || x > 128 || y < 1 || y > 64 || set < 0 || set > 1){  //kolla så värdena är tillåtna
 1041              		.loc 1 296 0
 1042 0420 FB1D     		adds	r3, r7, #7
 1043 0422 1B78     		ldrb	r3, [r3]
 1044 0424 002B     		cmp	r3, #0
 1045 0426 00D1     		bne	.LCB788
 1046 0428 CBE0     		b	.L70	@long jump
 1047              	.LCB788:
 1048              		.loc 1 296 0 is_stmt 0 discriminator 1
 1049 042a FB1D     		adds	r3, r7, #7
 1050 042c 1B78     		ldrb	r3, [r3]
 1051 042e 802B     		cmp	r3, #128
 1052 0430 00D9     		bls	.LCB792
 1053 0432 C6E0     		b	.L70	@long jump
 1054              	.LCB792:
 1055              		.loc 1 296 0 discriminator 2
 1056 0434 BB1D     		adds	r3, r7, #6
 1057 0436 1B78     		ldrb	r3, [r3]
 1058 0438 002B     		cmp	r3, #0
 1059 043a 00D1     		bne	.LCB796
 1060 043c C1E0     		b	.L70	@long jump
 1061              	.LCB796:
 1062              		.loc 1 296 0 discriminator 3
 1063 043e BB1D     		adds	r3, r7, #6
 1064 0440 1B78     		ldrb	r3, [r3]
 1065 0442 402B     		cmp	r3, #64
 1066 0444 00D9     		bls	.LCB800
 1067 0446 BCE0     		b	.L70	@long jump
 1068              	.LCB800:
 1069              		.loc 1 296 0 discriminator 4
 1070 0448 7B1D     		adds	r3, r7, #5
 1071 044a 1B78     		ldrb	r3, [r3]
 1072 044c 012B     		cmp	r3, #1
 1073 044e 00D9     		bls	.LCB804
 1074 0450 B7E0     		b	.L70	@long jump
 1075              	.LCB804:
 297:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		return;
 298:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 299:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 300:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	unsigned char index = (y-1)/8;
 1076              		.loc 1 300 0 is_stmt 1
 1077 0452 BB1D     		adds	r3, r7, #6
 1078 0454 1B78     		ldrb	r3, [r3]
 1079 0456 013B     		subs	r3, r3, #1
 1080 0458 002B     		cmp	r3, #0
 1081 045a 00DA     		bge	.L53
 1082 045c 0733     		adds	r3, r3, #7
 1083              	.L53:
 1084 045e DB10     		asrs	r3, r3, #3
 1085 0460 1A00     		movs	r2, r3
 1086 0462 0C23     		movs	r3, #12
 1087 0464 FB18     		adds	r3, r7, r3
 1088 0466 1A70     		strb	r2, [r3]
 301:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	unsigned char bitmask;
 302:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	unsigned char controller;
 303:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	unsigned char x_fysisk;
 304:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 305:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	switch((y-1) % 8){
 1089              		.loc 1 305 0
 1090 0468 BB1D     		adds	r3, r7, #6
 1091 046a 1B78     		ldrb	r3, [r3]
 1092 046c 013B     		subs	r3, r3, #1
 1093 046e 574A     		ldr	r2, .L71
 1094 0470 1340     		ands	r3, r2
 1095 0472 04D5     		bpl	.L54
 1096 0474 013B     		subs	r3, r3, #1
 1097 0476 0822     		movs	r2, #8
 1098 0478 5242     		rsbs	r2, r2, #0
 1099 047a 1343     		orrs	r3, r2
 1100 047c 0133     		adds	r3, r3, #1
 1101              	.L54:
 1102 047e 072B     		cmp	r3, #7
 1103 0480 2CD8     		bhi	.L55
 1104 0482 9A00     		lsls	r2, r3, #2
 1105 0484 524B     		ldr	r3, .L71+4
 1106 0486 D318     		adds	r3, r2, r3
 1107 0488 1B68     		ldr	r3, [r3]
 1108 048a 9F46     		mov	pc, r3
 1109              		.section	.rodata
 1110              		.align	2
 1111              	.L57:
 1112 0000 8C040000 		.word	.L56
 1113 0004 96040000 		.word	.L58
 1114 0008 A0040000 		.word	.L59
 1115 000c AA040000 		.word	.L60
 1116 0010 B4040000 		.word	.L61
 1117 0014 BE040000 		.word	.L62
 1118 0018 C8040000 		.word	.L63
 1119 001c D2040000 		.word	.L64
 1120              		.text
 1121              	.L56:
 306:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case 0:
 307:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			bitmask = 1;
 1122              		.loc 1 307 0
 1123 048c 0F23     		movs	r3, #15
 1124 048e FB18     		adds	r3, r7, r3
 1125 0490 0122     		movs	r2, #1
 1126 0492 1A70     		strb	r2, [r3]
 308:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			break;
 1127              		.loc 1 308 0
 1128 0494 22E0     		b	.L55
 1129              	.L58:
 309:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case 1:
 310:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			bitmask = 2;
 1130              		.loc 1 310 0
 1131 0496 0F23     		movs	r3, #15
 1132 0498 FB18     		adds	r3, r7, r3
 1133 049a 0222     		movs	r2, #2
 1134 049c 1A70     		strb	r2, [r3]
 311:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			break;
 1135              		.loc 1 311 0
 1136 049e 1DE0     		b	.L55
 1137              	.L59:
 312:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case 2:
 313:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			bitmask = 4;
 1138              		.loc 1 313 0
 1139 04a0 0F23     		movs	r3, #15
 1140 04a2 FB18     		adds	r3, r7, r3
 1141 04a4 0422     		movs	r2, #4
 1142 04a6 1A70     		strb	r2, [r3]
 314:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			break;
 1143              		.loc 1 314 0
 1144 04a8 18E0     		b	.L55
 1145              	.L60:
 315:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case 3:
 316:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			bitmask = 8;
 1146              		.loc 1 316 0
 1147 04aa 0F23     		movs	r3, #15
 1148 04ac FB18     		adds	r3, r7, r3
 1149 04ae 0822     		movs	r2, #8
 1150 04b0 1A70     		strb	r2, [r3]
 317:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			break;
 1151              		.loc 1 317 0
 1152 04b2 13E0     		b	.L55
 1153              	.L61:
 318:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case 4:
 319:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			bitmask = 0x10;
 1154              		.loc 1 319 0
 1155 04b4 0F23     		movs	r3, #15
 1156 04b6 FB18     		adds	r3, r7, r3
 1157 04b8 1022     		movs	r2, #16
 1158 04ba 1A70     		strb	r2, [r3]
 320:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			break;
 1159              		.loc 1 320 0
 1160 04bc 0EE0     		b	.L55
 1161              	.L62:
 321:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case 5:
 322:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			bitmask = 0x20;
 1162              		.loc 1 322 0
 1163 04be 0F23     		movs	r3, #15
 1164 04c0 FB18     		adds	r3, r7, r3
 1165 04c2 2022     		movs	r2, #32
 1166 04c4 1A70     		strb	r2, [r3]
 323:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			break;
 1167              		.loc 1 323 0
 1168 04c6 09E0     		b	.L55
 1169              	.L63:
 324:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case 6:
 325:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			bitmask = 0x40;
 1170              		.loc 1 325 0
 1171 04c8 0F23     		movs	r3, #15
 1172 04ca FB18     		adds	r3, r7, r3
 1173 04cc 4022     		movs	r2, #64
 1174 04ce 1A70     		strb	r2, [r3]
 326:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			break;
 1175              		.loc 1 326 0
 1176 04d0 04E0     		b	.L55
 1177              	.L64:
 327:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		case 7:
 328:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			bitmask = 0x80;
 1178              		.loc 1 328 0
 1179 04d2 0F23     		movs	r3, #15
 1180 04d4 FB18     		adds	r3, r7, r3
 1181 04d6 8022     		movs	r2, #128
 1182 04d8 1A70     		strb	r2, [r3]
 329:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			break;
 1183              		.loc 1 329 0
 1184 04da C046     		nop
 1185              	.L55:
 330:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 331:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 332:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	if(set == 0){
 1186              		.loc 1 332 0
 1187 04dc 7B1D     		adds	r3, r7, #5
 1188 04de 1B78     		ldrb	r3, [r3]
 1189 04e0 002B     		cmp	r3, #0
 1190 04e2 05D1     		bne	.L65
 333:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		bitmask = ~bitmask;
 1191              		.loc 1 333 0
 1192 04e4 0F22     		movs	r2, #15
 1193 04e6 BB18     		adds	r3, r7, r2
 1194 04e8 BA18     		adds	r2, r7, r2
 1195 04ea 1278     		ldrb	r2, [r2]
 1196 04ec D243     		mvns	r2, r2
 1197 04ee 1A70     		strb	r2, [r3]
 1198              	.L65:
 334:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 335:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 336:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	if(x > 64){
 1199              		.loc 1 336 0
 1200 04f0 FB1D     		adds	r3, r7, #7
 1201 04f2 1B78     		ldrb	r3, [r3]
 1202 04f4 402B     		cmp	r3, #64
 1203 04f6 0AD9     		bls	.L66
 337:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		controller = B_CS2;
 1204              		.loc 1 337 0
 1205 04f8 0E23     		movs	r3, #14
 1206 04fa FB18     		adds	r3, r7, r3
 1207 04fc 1022     		movs	r2, #16
 1208 04fe 1A70     		strb	r2, [r3]
 338:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		x_fysisk = x - 65;
 1209              		.loc 1 338 0
 1210 0500 0D23     		movs	r3, #13
 1211 0502 FB18     		adds	r3, r7, r3
 1212 0504 FA1D     		adds	r2, r7, #7
 1213 0506 1278     		ldrb	r2, [r2]
 1214 0508 413A     		subs	r2, r2, #65
 1215 050a 1A70     		strb	r2, [r3]
 1216 050c 09E0     		b	.L67
 1217              	.L66:
 339:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	} else{
 340:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		controller = B_CS1;
 1218              		.loc 1 340 0
 1219 050e 0E23     		movs	r3, #14
 1220 0510 FB18     		adds	r3, r7, r3
 1221 0512 0822     		movs	r2, #8
 1222 0514 1A70     		strb	r2, [r3]
 341:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		x_fysisk = x - 1;
 1223              		.loc 1 341 0
 1224 0516 0D23     		movs	r3, #13
 1225 0518 FB18     		adds	r3, r7, r3
 1226 051a FA1D     		adds	r2, r7, #7
 1227 051c 1278     		ldrb	r2, [r2]
 1228 051e 013A     		subs	r2, r2, #1
 1229 0520 1A70     		strb	r2, [r3]
 1230              	.L67:
 342:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 343:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 344:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD | x_fysisk, controller);
 1231              		.loc 1 344 0
 1232 0522 0D26     		movs	r6, #13
 1233 0524 BB19     		adds	r3, r7, r6
 1234 0526 1B78     		ldrb	r3, [r3]
 1235 0528 4022     		movs	r2, #64
 1236 052a 1343     		orrs	r3, r2
 1237 052c DAB2     		uxtb	r2, r3
 1238 052e 0E25     		movs	r5, #14
 1239 0530 7B19     		adds	r3, r7, r5
 1240 0532 1B78     		ldrb	r3, [r3]
 1241 0534 1900     		movs	r1, r3
 1242 0536 1000     		movs	r0, r2
 1243 0538 FFF7FEFF 		bl	graphic_write_command
 345:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_write_command(LCD_SET_PAGE | index, controller);
 1244              		.loc 1 345 0
 1245 053c 0C23     		movs	r3, #12
 1246 053e FB18     		adds	r3, r7, r3
 1247 0540 1B78     		ldrb	r3, [r3]
 1248 0542 4822     		movs	r2, #72
 1249 0544 5242     		rsbs	r2, r2, #0
 1250 0546 1343     		orrs	r3, r2
 1251 0548 DAB2     		uxtb	r2, r3
 1252 054a 7B19     		adds	r3, r7, r5
 1253 054c 1B78     		ldrb	r3, [r3]
 1254 054e 1900     		movs	r1, r3
 1255 0550 1000     		movs	r0, r2
 1256 0552 FFF7FEFF 		bl	graphic_write_command
 346:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	unsigned char temp = graphic_read_data(controller);
 1257              		.loc 1 346 0
 1258 0556 0B23     		movs	r3, #11
 1259 0558 FC18     		adds	r4, r7, r3
 1260 055a 7B19     		adds	r3, r7, r5
 1261 055c 1B78     		ldrb	r3, [r3]
 1262 055e 1800     		movs	r0, r3
 1263 0560 FFF7FEFF 		bl	graphic_read_data
 1264 0564 0300     		movs	r3, r0
 1265 0566 2370     		strb	r3, [r4]
 347:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD | x_fysisk, controller);
 1266              		.loc 1 347 0
 1267 0568 BB19     		adds	r3, r7, r6
 1268 056a 1B78     		ldrb	r3, [r3]
 1269 056c 4022     		movs	r2, #64
 1270 056e 1343     		orrs	r3, r2
 1271 0570 DAB2     		uxtb	r2, r3
 1272 0572 7B19     		adds	r3, r7, r5
 1273 0574 1B78     		ldrb	r3, [r3]
 1274 0576 1900     		movs	r1, r3
 1275 0578 1000     		movs	r0, r2
 1276 057a FFF7FEFF 		bl	graphic_write_command
 348:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 349:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 350:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	if(set == 1){
 1277              		.loc 1 350 0
 1278 057e 7B1D     		adds	r3, r7, #5
 1279 0580 1B78     		ldrb	r3, [r3]
 1280 0582 012B     		cmp	r3, #1
 1281 0584 09D1     		bne	.L68
 351:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		bitmask = (bitmask | temp);
 1282              		.loc 1 351 0
 1283 0586 0F22     		movs	r2, #15
 1284 0588 BB18     		adds	r3, r7, r2
 1285 058a B918     		adds	r1, r7, r2
 1286 058c 0B22     		movs	r2, #11
 1287 058e BA18     		adds	r2, r7, r2
 1288 0590 0978     		ldrb	r1, [r1]
 1289 0592 1278     		ldrb	r2, [r2]
 1290 0594 0A43     		orrs	r2, r1
 1291 0596 1A70     		strb	r2, [r3]
 1292 0598 08E0     		b	.L69
 1293              	.L68:
 352:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	} else{
 353:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		bitmask = (bitmask & temp);
 1294              		.loc 1 353 0
 1295 059a 0F22     		movs	r2, #15
 1296 059c BB18     		adds	r3, r7, r2
 1297 059e BA18     		adds	r2, r7, r2
 1298 05a0 0B21     		movs	r1, #11
 1299 05a2 7918     		adds	r1, r7, r1
 1300 05a4 1278     		ldrb	r2, [r2]
 1301 05a6 0978     		ldrb	r1, [r1]
 1302 05a8 0A40     		ands	r2, r1
 1303 05aa 1A70     		strb	r2, [r3]
 1304              	.L69:
 354:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 355:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 356:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_write_data(bitmask, controller);
 1305              		.loc 1 356 0
 1306 05ac 0E23     		movs	r3, #14
 1307 05ae FB18     		adds	r3, r7, r3
 1308 05b0 1A78     		ldrb	r2, [r3]
 1309 05b2 0F23     		movs	r3, #15
 1310 05b4 FB18     		adds	r3, r7, r3
 1311 05b6 1B78     		ldrb	r3, [r3]
 1312 05b8 1100     		movs	r1, r2
 1313 05ba 1800     		movs	r0, r3
 1314 05bc FFF7FEFF 		bl	graphic_write_data
 1315 05c0 00E0     		b	.L49
 1316              	.L70:
 297:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 1317              		.loc 1 297 0
 1318 05c2 C046     		nop
 1319              	.L49:
 357:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 1320              		.loc 1 357 0
 1321 05c4 BD46     		mov	sp, r7
 1322 05c6 05B0     		add	sp, sp, #20
 1323              		@ sp needed
 1324 05c8 F0BD     		pop	{r4, r5, r6, r7, pc}
 1325              	.L72:
 1326 05ca C046     		.align	2
 1327              	.L71:
 1328 05cc 07000080 		.word	-2147483641
 1329 05d0 00000000 		.word	.L57
 1330              		.cfi_endproc
 1331              	.LFE17:
 1333              		.align	1
 1334              		.global	set_object_speed
 1335              		.syntax unified
 1336              		.code	16
 1337              		.thumb_func
 1338              		.fpu softvfp
 1340              	set_object_speed:
 1341              	.LFB18:
 358:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 359:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 360:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void set_object_speed(POBJECT o, int speedX, int speedY){
 1342              		.loc 1 360 0
 1343              		.cfi_startproc
 1344              		@ args = 0, pretend = 0, frame = 16
 1345              		@ frame_needed = 1, uses_anonymous_args = 0
 1346 05d4 80B5     		push	{r7, lr}
 1347              		.cfi_def_cfa_offset 8
 1348              		.cfi_offset 7, -8
 1349              		.cfi_offset 14, -4
 1350 05d6 84B0     		sub	sp, sp, #16
 1351              		.cfi_def_cfa_offset 24
 1352 05d8 00AF     		add	r7, sp, #0
 1353              		.cfi_def_cfa_register 7
 1354 05da F860     		str	r0, [r7, #12]
 1355 05dc B960     		str	r1, [r7, #8]
 1356 05de 7A60     		str	r2, [r7, #4]
 361:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	o->dirX = speedX;
 1357              		.loc 1 361 0
 1358 05e0 FB68     		ldr	r3, [r7, #12]
 1359 05e2 BA68     		ldr	r2, [r7, #8]
 1360 05e4 5A60     		str	r2, [r3, #4]
 362:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	o->dirY = speedY;
 1361              		.loc 1 362 0
 1362 05e6 FB68     		ldr	r3, [r7, #12]
 1363 05e8 7A68     		ldr	r2, [r7, #4]
 1364 05ea 9A60     		str	r2, [r3, #8]
 363:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 1365              		.loc 1 363 0
 1366 05ec C046     		nop
 1367 05ee BD46     		mov	sp, r7
 1368 05f0 04B0     		add	sp, sp, #16
 1369              		@ sp needed
 1370 05f2 80BD     		pop	{r7, pc}
 1371              		.cfi_endproc
 1372              	.LFE18:
 1374              		.align	1
 1375              		.global	draw_object
 1376              		.syntax unified
 1377              		.code	16
 1378              		.thumb_func
 1379              		.fpu softvfp
 1381              	draw_object:
 1382              	.LFB19:
 364:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 365:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void draw_object(POBJECT o){
 1383              		.loc 1 365 0
 1384              		.cfi_startproc
 1385              		@ args = 0, pretend = 0, frame = 16
 1386              		@ frame_needed = 1, uses_anonymous_args = 0
 1387 05f4 80B5     		push	{r7, lr}
 1388              		.cfi_def_cfa_offset 8
 1389              		.cfi_offset 7, -8
 1390              		.cfi_offset 14, -4
 1391 05f6 84B0     		sub	sp, sp, #16
 1392              		.cfi_def_cfa_offset 24
 1393 05f8 00AF     		add	r7, sp, #0
 1394              		.cfi_def_cfa_register 7
 1395 05fa 7860     		str	r0, [r7, #4]
 1396              	.LBB4:
 366:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1397              		.loc 1 366 0
 1398 05fc 0023     		movs	r3, #0
 1399 05fe FB60     		str	r3, [r7, #12]
 1400 0600 20E0     		b	.L75
 1401              	.L76:
 367:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		pixel(o->posX + o->geo->px[i].x, o->posY + o->geo->px[i].y, 1);
 1402              		.loc 1 367 0 discriminator 3
 1403 0602 7B68     		ldr	r3, [r7, #4]
 1404 0604 DB68     		ldr	r3, [r3, #12]
 1405 0606 DAB2     		uxtb	r2, r3
 1406 0608 7B68     		ldr	r3, [r7, #4]
 1407 060a 1968     		ldr	r1, [r3]
 1408 060c FB68     		ldr	r3, [r7, #12]
 1409 060e 0433     		adds	r3, r3, #4
 1410 0610 5B00     		lsls	r3, r3, #1
 1411 0612 CB18     		adds	r3, r1, r3
 1412 0614 0433     		adds	r3, r3, #4
 1413 0616 1B78     		ldrb	r3, [r3]
 1414 0618 D318     		adds	r3, r2, r3
 1415 061a D8B2     		uxtb	r0, r3
 1416 061c 7B68     		ldr	r3, [r7, #4]
 1417 061e 1B69     		ldr	r3, [r3, #16]
 1418 0620 DAB2     		uxtb	r2, r3
 1419 0622 7B68     		ldr	r3, [r7, #4]
 1420 0624 1968     		ldr	r1, [r3]
 1421 0626 FB68     		ldr	r3, [r7, #12]
 1422 0628 0433     		adds	r3, r3, #4
 1423 062a 5B00     		lsls	r3, r3, #1
 1424 062c CB18     		adds	r3, r1, r3
 1425 062e 0533     		adds	r3, r3, #5
 1426 0630 1B78     		ldrb	r3, [r3]
 1427 0632 D318     		adds	r3, r2, r3
 1428 0634 DBB2     		uxtb	r3, r3
 1429 0636 0122     		movs	r2, #1
 1430 0638 1900     		movs	r1, r3
 1431 063a FFF7FEFF 		bl	pixel
 366:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1432              		.loc 1 366 0 discriminator 3
 1433 063e FB68     		ldr	r3, [r7, #12]
 1434 0640 0133     		adds	r3, r3, #1
 1435 0642 FB60     		str	r3, [r7, #12]
 1436              	.L75:
 366:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1437              		.loc 1 366 0 is_stmt 0 discriminator 1
 1438 0644 7B68     		ldr	r3, [r7, #4]
 1439 0646 1B68     		ldr	r3, [r3]
 1440 0648 1B68     		ldr	r3, [r3]
 1441 064a FA68     		ldr	r2, [r7, #12]
 1442 064c 9A42     		cmp	r2, r3
 1443 064e D8DB     		blt	.L76
 1444              	.LBE4:
 368:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 369:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 1445              		.loc 1 369 0 is_stmt 1
 1446 0650 C046     		nop
 1447 0652 BD46     		mov	sp, r7
 1448 0654 04B0     		add	sp, sp, #16
 1449              		@ sp needed
 1450 0656 80BD     		pop	{r7, pc}
 1451              		.cfi_endproc
 1452              	.LFE19:
 1454              		.align	1
 1455              		.global	clear_object
 1456              		.syntax unified
 1457              		.code	16
 1458              		.thumb_func
 1459              		.fpu softvfp
 1461              	clear_object:
 1462              	.LFB20:
 370:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 371:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void clear_object(POBJECT o){
 1463              		.loc 1 371 0
 1464              		.cfi_startproc
 1465              		@ args = 0, pretend = 0, frame = 16
 1466              		@ frame_needed = 1, uses_anonymous_args = 0
 1467 0658 80B5     		push	{r7, lr}
 1468              		.cfi_def_cfa_offset 8
 1469              		.cfi_offset 7, -8
 1470              		.cfi_offset 14, -4
 1471 065a 84B0     		sub	sp, sp, #16
 1472              		.cfi_def_cfa_offset 24
 1473 065c 00AF     		add	r7, sp, #0
 1474              		.cfi_def_cfa_register 7
 1475 065e 7860     		str	r0, [r7, #4]
 1476              	.LBB5:
 372:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1477              		.loc 1 372 0
 1478 0660 0023     		movs	r3, #0
 1479 0662 FB60     		str	r3, [r7, #12]
 1480 0664 20E0     		b	.L78
 1481              	.L79:
 373:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		pixel(o->posX + o->geo->px[i].x, o->posY + o->geo->px[i].y, 0);
 1482              		.loc 1 373 0 discriminator 3
 1483 0666 7B68     		ldr	r3, [r7, #4]
 1484 0668 DB68     		ldr	r3, [r3, #12]
 1485 066a DAB2     		uxtb	r2, r3
 1486 066c 7B68     		ldr	r3, [r7, #4]
 1487 066e 1968     		ldr	r1, [r3]
 1488 0670 FB68     		ldr	r3, [r7, #12]
 1489 0672 0433     		adds	r3, r3, #4
 1490 0674 5B00     		lsls	r3, r3, #1
 1491 0676 CB18     		adds	r3, r1, r3
 1492 0678 0433     		adds	r3, r3, #4
 1493 067a 1B78     		ldrb	r3, [r3]
 1494 067c D318     		adds	r3, r2, r3
 1495 067e D8B2     		uxtb	r0, r3
 1496 0680 7B68     		ldr	r3, [r7, #4]
 1497 0682 1B69     		ldr	r3, [r3, #16]
 1498 0684 DAB2     		uxtb	r2, r3
 1499 0686 7B68     		ldr	r3, [r7, #4]
 1500 0688 1968     		ldr	r1, [r3]
 1501 068a FB68     		ldr	r3, [r7, #12]
 1502 068c 0433     		adds	r3, r3, #4
 1503 068e 5B00     		lsls	r3, r3, #1
 1504 0690 CB18     		adds	r3, r1, r3
 1505 0692 0533     		adds	r3, r3, #5
 1506 0694 1B78     		ldrb	r3, [r3]
 1507 0696 D318     		adds	r3, r2, r3
 1508 0698 DBB2     		uxtb	r3, r3
 1509 069a 0022     		movs	r2, #0
 1510 069c 1900     		movs	r1, r3
 1511 069e FFF7FEFF 		bl	pixel
 372:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1512              		.loc 1 372 0 discriminator 3
 1513 06a2 FB68     		ldr	r3, [r7, #12]
 1514 06a4 0133     		adds	r3, r3, #1
 1515 06a6 FB60     		str	r3, [r7, #12]
 1516              	.L78:
 372:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	for(int i = 0; i < o->geo->numPoints; i++){
 1517              		.loc 1 372 0 is_stmt 0 discriminator 1
 1518 06a8 7B68     		ldr	r3, [r7, #4]
 1519 06aa 1B68     		ldr	r3, [r3]
 1520 06ac 1B68     		ldr	r3, [r3]
 1521 06ae FA68     		ldr	r2, [r7, #12]
 1522 06b0 9A42     		cmp	r2, r3
 1523 06b2 D8DB     		blt	.L79
 1524              	.LBE5:
 374:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 375:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 1525              		.loc 1 375 0 is_stmt 1
 1526 06b4 C046     		nop
 1527 06b6 BD46     		mov	sp, r7
 1528 06b8 04B0     		add	sp, sp, #16
 1529              		@ sp needed
 1530 06ba 80BD     		pop	{r7, pc}
 1531              		.cfi_endproc
 1532              	.LFE20:
 1534              		.align	1
 1535              		.global	move_object
 1536              		.syntax unified
 1537              		.code	16
 1538              		.thumb_func
 1539              		.fpu softvfp
 1541              	move_object:
 1542              	.LFB21:
 376:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 377:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 378:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void move_object(POBJECT object){
 1543              		.loc 1 378 0
 1544              		.cfi_startproc
 1545              		@ args = 0, pretend = 0, frame = 8
 1546              		@ frame_needed = 1, uses_anonymous_args = 0
 1547 06bc 90B5     		push	{r4, r7, lr}
 1548              		.cfi_def_cfa_offset 12
 1549              		.cfi_offset 4, -12
 1550              		.cfi_offset 7, -8
 1551              		.cfi_offset 14, -4
 1552 06be 83B0     		sub	sp, sp, #12
 1553              		.cfi_def_cfa_offset 24
 1554 06c0 00AF     		add	r7, sp, #0
 1555              		.cfi_def_cfa_register 7
 1556 06c2 7860     		str	r0, [r7, #4]
 379:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	if(object->posX >118){
 1557              		.loc 1 379 0
 1558 06c4 7B68     		ldr	r3, [r7, #4]
 1559 06c6 DB68     		ldr	r3, [r3, #12]
 1560 06c8 762B     		cmp	r3, #118
 1561 06ca 09DD     		ble	.L81
 380:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		object->set_speed(object, -2, object->dirY);
 1562              		.loc 1 380 0
 1563 06cc 7B68     		ldr	r3, [r7, #4]
 1564 06ce 1C6A     		ldr	r4, [r3, #32]
 1565 06d0 7B68     		ldr	r3, [r7, #4]
 1566 06d2 9A68     		ldr	r2, [r3, #8]
 1567 06d4 0223     		movs	r3, #2
 1568 06d6 5942     		rsbs	r1, r3, #0
 1569 06d8 7B68     		ldr	r3, [r7, #4]
 1570 06da 1800     		movs	r0, r3
 1571 06dc A047     		blx	r4
 1572              	.LVL0:
 1573 06de 0BE0     		b	.L82
 1574              	.L81:
 381:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	} else if (object->posX <10){
 1575              		.loc 1 381 0
 1576 06e0 7B68     		ldr	r3, [r7, #4]
 1577 06e2 DB68     		ldr	r3, [r3, #12]
 1578 06e4 092B     		cmp	r3, #9
 1579 06e6 07DC     		bgt	.L82
 382:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		object->set_speed(object, 2, object->dirY);
 1580              		.loc 1 382 0
 1581 06e8 7B68     		ldr	r3, [r7, #4]
 1582 06ea 1C6A     		ldr	r4, [r3, #32]
 1583 06ec 7B68     		ldr	r3, [r7, #4]
 1584 06ee 9A68     		ldr	r2, [r3, #8]
 1585 06f0 7B68     		ldr	r3, [r7, #4]
 1586 06f2 0221     		movs	r1, #2
 1587 06f4 1800     		movs	r0, r3
 1588 06f6 A047     		blx	r4
 1589              	.LVL1:
 1590              	.L82:
 383:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 384:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	if (object->posY <10){
 1591              		.loc 1 384 0
 1592 06f8 7B68     		ldr	r3, [r7, #4]
 1593 06fa 1B69     		ldr	r3, [r3, #16]
 1594 06fc 092B     		cmp	r3, #9
 1595 06fe 08DC     		bgt	.L83
 385:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		object->set_speed(object, object->dirX, 2);
 1596              		.loc 1 385 0
 1597 0700 7B68     		ldr	r3, [r7, #4]
 1598 0702 1C6A     		ldr	r4, [r3, #32]
 1599 0704 7B68     		ldr	r3, [r7, #4]
 1600 0706 5968     		ldr	r1, [r3, #4]
 1601 0708 7B68     		ldr	r3, [r7, #4]
 1602 070a 0222     		movs	r2, #2
 1603 070c 1800     		movs	r0, r3
 1604 070e A047     		blx	r4
 1605              	.LVL2:
 1606 0710 0CE0     		b	.L84
 1607              	.L83:
 386:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	} else if (object->posY >54){
 1608              		.loc 1 386 0
 1609 0712 7B68     		ldr	r3, [r7, #4]
 1610 0714 1B69     		ldr	r3, [r3, #16]
 1611 0716 362B     		cmp	r3, #54
 1612 0718 08DD     		ble	.L84
 387:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		object->set_speed(object, object->dirX, -2);
 1613              		.loc 1 387 0
 1614 071a 7B68     		ldr	r3, [r7, #4]
 1615 071c 1C6A     		ldr	r4, [r3, #32]
 1616 071e 7B68     		ldr	r3, [r7, #4]
 1617 0720 5968     		ldr	r1, [r3, #4]
 1618 0722 0223     		movs	r3, #2
 1619 0724 5A42     		rsbs	r2, r3, #0
 1620 0726 7B68     		ldr	r3, [r7, #4]
 1621 0728 1800     		movs	r0, r3
 1622 072a A047     		blx	r4
 1623              	.LVL3:
 1624              	.L84:
 388:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 389:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	clear_object(object);
 1625              		.loc 1 389 0
 1626 072c 7B68     		ldr	r3, [r7, #4]
 1627 072e 1800     		movs	r0, r3
 1628 0730 FFF7FEFF 		bl	clear_object
 390:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	object->posX += object->dirX;
 1629              		.loc 1 390 0
 1630 0734 7B68     		ldr	r3, [r7, #4]
 1631 0736 DA68     		ldr	r2, [r3, #12]
 1632 0738 7B68     		ldr	r3, [r7, #4]
 1633 073a 5B68     		ldr	r3, [r3, #4]
 1634 073c D218     		adds	r2, r2, r3
 1635 073e 7B68     		ldr	r3, [r7, #4]
 1636 0740 DA60     		str	r2, [r3, #12]
 391:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	object->posY += object->dirY;
 1637              		.loc 1 391 0
 1638 0742 7B68     		ldr	r3, [r7, #4]
 1639 0744 1A69     		ldr	r2, [r3, #16]
 1640 0746 7B68     		ldr	r3, [r7, #4]
 1641 0748 9B68     		ldr	r3, [r3, #8]
 1642 074a D218     		adds	r2, r2, r3
 1643 074c 7B68     		ldr	r3, [r7, #4]
 1644 074e 1A61     		str	r2, [r3, #16]
 392:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 393:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	if(object->posX < 1 || object->posX + object->geo->sizeX > 128){
 1645              		.loc 1 393 0
 1646 0750 7B68     		ldr	r3, [r7, #4]
 1647 0752 DB68     		ldr	r3, [r3, #12]
 1648 0754 002B     		cmp	r3, #0
 1649 0756 07DD     		ble	.L85
 1650              		.loc 1 393 0 is_stmt 0 discriminator 1
 1651 0758 7B68     		ldr	r3, [r7, #4]
 1652 075a DA68     		ldr	r2, [r3, #12]
 1653 075c 7B68     		ldr	r3, [r7, #4]
 1654 075e 1B68     		ldr	r3, [r3]
 1655 0760 5B68     		ldr	r3, [r3, #4]
 1656 0762 D318     		adds	r3, r2, r3
 1657 0764 802B     		cmp	r3, #128
 1658 0766 04DD     		ble	.L86
 1659              	.L85:
 394:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		object->dirX = -object->dirX;
 1660              		.loc 1 394 0 is_stmt 1
 1661 0768 7B68     		ldr	r3, [r7, #4]
 1662 076a 5B68     		ldr	r3, [r3, #4]
 1663 076c 5A42     		rsbs	r2, r3, #0
 1664 076e 7B68     		ldr	r3, [r7, #4]
 1665 0770 5A60     		str	r2, [r3, #4]
 1666              	.L86:
 395:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 396:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 397:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	if(object->posY < 1 || object->posY + object->geo->sizeY > 64){
 1667              		.loc 1 397 0
 1668 0772 7B68     		ldr	r3, [r7, #4]
 1669 0774 1B69     		ldr	r3, [r3, #16]
 1670 0776 002B     		cmp	r3, #0
 1671 0778 07DD     		ble	.L87
 1672              		.loc 1 397 0 is_stmt 0 discriminator 1
 1673 077a 7B68     		ldr	r3, [r7, #4]
 1674 077c 1A69     		ldr	r2, [r3, #16]
 1675 077e 7B68     		ldr	r3, [r7, #4]
 1676 0780 1B68     		ldr	r3, [r3]
 1677 0782 9B68     		ldr	r3, [r3, #8]
 1678 0784 D318     		adds	r3, r2, r3
 1679 0786 402B     		cmp	r3, #64
 1680 0788 04DD     		ble	.L88
 1681              	.L87:
 398:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		object->dirY = -object->dirY;
 1682              		.loc 1 398 0 is_stmt 1
 1683 078a 7B68     		ldr	r3, [r7, #4]
 1684 078c 9B68     		ldr	r3, [r3, #8]
 1685 078e 5A42     		rsbs	r2, r3, #0
 1686 0790 7B68     		ldr	r3, [r7, #4]
 1687 0792 9A60     		str	r2, [r3, #8]
 1688              	.L88:
 399:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	}
 400:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	draw_object(object);
 1689              		.loc 1 400 0
 1690 0794 7B68     		ldr	r3, [r7, #4]
 1691 0796 1800     		movs	r0, r3
 1692 0798 FFF7FEFF 		bl	draw_object
 401:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** }
 1693              		.loc 1 401 0
 1694 079c C046     		nop
 1695 079e BD46     		mov	sp, r7
 1696 07a0 03B0     		add	sp, sp, #12
 1697              		@ sp needed
 1698 07a2 90BD     		pop	{r4, r7, pc}
 1699              		.cfi_endproc
 1700              	.LFE21:
 1702              		.data
 1703              		.align	2
 1706              	ball:
 1707 0034 00000000 		.word	ball_geometry
 1708 0038 00000000 		.word	0
 1709 003c 00000000 		.word	0
 1710 0040 01000000 		.word	1
 1711 0044 01000000 		.word	1
 1712 0048 00000000 		.word	draw_object
 1713 004c 00000000 		.word	clear_object
 1714 0050 00000000 		.word	move_object
 1715 0054 00000000 		.word	set_object_speed
 1716              		.text
 1717              		.align	1
 1718              		.global	main
 1719              		.syntax unified
 1720              		.code	16
 1721              		.thumb_func
 1722              		.fpu softvfp
 1724              	main:
 1725              	.LFB22:
 402:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 403:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 404:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 405:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** static OBJECT ball = 
 406:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** {
 407:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	&ball_geometry,
 408:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	0, 0,
 409:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	1, 1,
 410:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	draw_object,
 411:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	clear_object,
 412:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	move_object,
 413:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	set_object_speed
 414:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** };
 415:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 416:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 417:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 418:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 
 419:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** void main(void)
 420:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** {
 1726              		.loc 1 420 0
 1727              		.cfi_startproc
 1728              		@ args = 0, pretend = 0, frame = 8
 1729              		@ frame_needed = 1, uses_anonymous_args = 0
 1730 07a4 80B5     		push	{r7, lr}
 1731              		.cfi_def_cfa_offset 8
 1732              		.cfi_offset 7, -8
 1733              		.cfi_offset 14, -4
 1734 07a6 82B0     		sub	sp, sp, #8
 1735              		.cfi_def_cfa_offset 16
 1736 07a8 00AF     		add	r7, sp, #0
 1737              		.cfi_def_cfa_register 7
 421:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	char c;
 422:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	POBJECT p = &ball;
 1738              		.loc 1 422 0
 1739 07aa 214B     		ldr	r3, .L97
 1740 07ac 7B60     		str	r3, [r7, #4]
 423:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	app_init();
 1741              		.loc 1 423 0
 1742 07ae FFF7FEFF 		bl	app_init
 424:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	init_app();
 1743              		.loc 1 424 0
 1744 07b2 FFF7FEFF 		bl	init_app
 425:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_initialize();
 1745              		.loc 1 425 0
 1746 07b6 FFF7FEFF 		bl	graphic_initialize
 426:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	graphic_clear_screen();
 1747              		.loc 1 426 0
 1748 07ba FFF7FEFF 		bl	graphic_clear_screen
 1749              	.L96:
 1750              	.LBB6:
 427:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	
 428:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 	while (1){
 429:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		p->move(p);
 1751              		.loc 1 429 0
 1752 07be 7B68     		ldr	r3, [r7, #4]
 1753 07c0 DB69     		ldr	r3, [r3, #28]
 1754 07c2 7A68     		ldr	r2, [r7, #4]
 1755 07c4 1000     		movs	r0, r2
 1756 07c6 9847     		blx	r3
 1757              	.LVL4:
 430:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		delay_milli(40);
 1758              		.loc 1 430 0
 1759 07c8 2820     		movs	r0, #40
 1760 07ca FFF7FEFF 		bl	delay_milli
 431:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		c=keyb();
 1761              		.loc 1 431 0
 1762 07ce FFF7FEFF 		bl	keyb
 1763 07d2 0200     		movs	r2, r0
 1764 07d4 FB1C     		adds	r3, r7, #3
 1765 07d6 1A70     		strb	r2, [r3]
 432:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		switch(c){
 1766              		.loc 1 432 0
 1767 07d8 FB1C     		adds	r3, r7, #3
 1768 07da 1B78     		ldrb	r3, [r3]
 1769 07dc 042B     		cmp	r3, #4
 1770 07de 0FD0     		beq	.L91
 1771 07e0 02DC     		bgt	.L92
 1772 07e2 022B     		cmp	r3, #2
 1773 07e4 14D0     		beq	.L93
 1774 07e6 22E0     		b	.L90
 1775              	.L92:
 1776 07e8 062B     		cmp	r3, #6
 1777 07ea 02D0     		beq	.L94
 1778 07ec 082B     		cmp	r3, #8
 1779 07ee 17D0     		beq	.L95
 1780 07f0 1DE0     		b	.L90
 1781              	.L94:
 433:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			case 6: p->set_speed(p,2,0); break;
 1782              		.loc 1 433 0
 1783 07f2 7B68     		ldr	r3, [r7, #4]
 1784 07f4 1B6A     		ldr	r3, [r3, #32]
 1785 07f6 7868     		ldr	r0, [r7, #4]
 1786 07f8 0022     		movs	r2, #0
 1787 07fa 0221     		movs	r1, #2
 1788 07fc 9847     		blx	r3
 1789              	.LVL5:
 1790 07fe 16E0     		b	.L90
 1791              	.L91:
 434:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			case 4: p->set_speed(p,-2,0); break;
 1792              		.loc 1 434 0
 1793 0800 7B68     		ldr	r3, [r7, #4]
 1794 0802 1B6A     		ldr	r3, [r3, #32]
 1795 0804 0222     		movs	r2, #2
 1796 0806 5142     		rsbs	r1, r2, #0
 1797 0808 7868     		ldr	r0, [r7, #4]
 1798 080a 0022     		movs	r2, #0
 1799 080c 9847     		blx	r3
 1800              	.LVL6:
 1801 080e 0EE0     		b	.L90
 1802              	.L93:
 435:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			case 2: p->set_speed(p,0,-2); break;
 1803              		.loc 1 435 0
 1804 0810 7B68     		ldr	r3, [r7, #4]
 1805 0812 1B6A     		ldr	r3, [r3, #32]
 1806 0814 0222     		movs	r2, #2
 1807 0816 5242     		rsbs	r2, r2, #0
 1808 0818 7868     		ldr	r0, [r7, #4]
 1809 081a 0021     		movs	r1, #0
 1810 081c 9847     		blx	r3
 1811              	.LVL7:
 1812 081e 06E0     		b	.L90
 1813              	.L95:
 436:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 			case 8: p->set_speed(p,0,2); break;
 1814              		.loc 1 436 0
 1815 0820 7B68     		ldr	r3, [r7, #4]
 1816 0822 1B6A     		ldr	r3, [r3, #32]
 1817 0824 7868     		ldr	r0, [r7, #4]
 1818 0826 0222     		movs	r2, #2
 1819 0828 0021     		movs	r1, #0
 1820 082a 9847     		blx	r3
 1821              	.LVL8:
 1822 082c C046     		nop
 1823              	.L90:
 1824              	.LBE6:
 428:C:/Users/heinl/Documents/Moplaborationer/autopong\startup.c **** 		p->move(p);
 1825              		.loc 1 428 0
 1826 082e C6E7     		b	.L96
 1827              	.L98:
 1828              		.align	2
 1829              	.L97:
 1830 0830 34000000 		.word	ball
 1831              		.cfi_endproc
 1832              	.LFE22:
 1834              	.Letext0:
