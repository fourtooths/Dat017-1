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
  15              		.bss
  16              		.align	2
  17              	systick_flag:
  18 0000 00000000 		.space	4
  20              		.align	2
  21              	delay_count:
  22 0004 00000000 		.space	4
  24              		.section	.start_section,"ax",%progbits
  25              		.align	1
  26              		.global	startup
  27              		.syntax unified
  28              		.code	16
  29              		.thumb_func
  30              		.fpu softvfp
  32              	startup:
  33              	.LFB0:
  34              		.file 1 "C:/Users/heinl/Documents/Moplaborationer/systick_irq/startup.c"
   1:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define GPIO_D 0x40020c00 /* MD407 port D */
   2:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
   3:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
   4:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
   5:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
   6:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
   7:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
   8:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
   9:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))
  10:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
  11:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
  12:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
  13:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
  14:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
  15:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** static volatile int systick_flag;
  16:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** static volatile int delay_count;
  17:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c ****  
  18:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  19:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
  20:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** void startup ( void )
  21:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** {
  35              		.loc 1 21 0
  36              		.cfi_startproc
  37              		@ Naked Function: prologue and epilogue provided by programmer.
  38              		@ args = 0, pretend = 0, frame = 0
  39              		@ frame_needed = 1, uses_anonymous_args = 0
  22:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** __asm volatile(
  40              		.loc 1 22 0
  41              		.syntax divided
  42              	@ 22 "C:/Users/heinl/Documents/Moplaborationer/systick_irq/startup.c" 1
  43 0000 0248     		 LDR R0,=0x2001C000
  44 0002 8546     	 MOV SP,R0
  45 0004 FFF7FEFF 	 BL main
  46 0008 FEE7     	_exit: B .
  47              	
  48              	@ 0 "" 2
  23:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  24:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	" MOV SP,R0\n"
  25:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	" BL main\n"				/* call main */
  26:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	"_exit: B .\n"				/* never return */
  27:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	) ;
  28:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** }
  49              		.loc 1 28 0
  50              		.thumb
  51              		.syntax unified
  52 000a C046     		nop
  53              		.cfi_endproc
  54              	.LFE0:
  56              		.text
  57              		.align	1
  58              		.global	delay_1mikro
  59              		.syntax unified
  60              		.code	16
  61              		.thumb_func
  62              		.fpu softvfp
  64              	delay_1mikro:
  65              	.LFB1:
  29:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
  30:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #ifdef SIMULATOR
  31:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define DELAY_COUNT 100
  32:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #else
  33:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #define DELAY_COUNT 1000000
  34:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** #endif
  35:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
  36:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** void delay_1mikro(void)
  37:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** {
  66              		.loc 1 37 0
  67              		.cfi_startproc
  68              		@ args = 0, pretend = 0, frame = 0
  69              		@ frame_needed = 1, uses_anonymous_args = 0
  70 0000 80B5     		push	{r7, lr}
  71              		.cfi_def_cfa_offset 8
  72              		.cfi_offset 7, -8
  73              		.cfi_offset 14, -4
  74 0002 00AF     		add	r7, sp, #0
  75              		.cfi_def_cfa_register 7
  38:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	systick_flag=0;
  76              		.loc 1 38 0
  77 0004 084B     		ldr	r3, .L3
  78 0006 0022     		movs	r2, #0
  79 0008 1A60     		str	r2, [r3]
  39:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	*STK_CTRL = 0;
  80              		.loc 1 39 0
  81 000a 084B     		ldr	r3, .L3+4
  82 000c 0022     		movs	r2, #0
  83 000e 1A60     		str	r2, [r3]
  40:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	*STK_LOAD = ( 168 -1 );
  84              		.loc 1 40 0
  85 0010 074B     		ldr	r3, .L3+8
  86 0012 A722     		movs	r2, #167
  87 0014 1A60     		str	r2, [r3]
  41:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	*STK_VAL = 0;
  88              		.loc 1 41 0
  89 0016 074B     		ldr	r3, .L3+12
  90 0018 0022     		movs	r2, #0
  91 001a 1A60     		str	r2, [r3]
  42:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	*STK_CTRL = 7;
  92              		.loc 1 42 0
  93 001c 034B     		ldr	r3, .L3+4
  94 001e 0722     		movs	r2, #7
  95 0020 1A60     		str	r2, [r3]
  43:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
  44:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** }
  96              		.loc 1 44 0
  97 0022 C046     		nop
  98 0024 BD46     		mov	sp, r7
  99              		@ sp needed
 100 0026 80BD     		pop	{r7, pc}
 101              	.L4:
 102              		.align	2
 103              	.L3:
 104 0028 00000000 		.word	systick_flag
 105 002c 10E000E0 		.word	-536813552
 106 0030 14E000E0 		.word	-536813548
 107 0034 18E000E0 		.word	-536813544
 108              		.cfi_endproc
 109              	.LFE1:
 111              		.align	1
 112              		.global	delay
 113              		.syntax unified
 114              		.code	16
 115              		.thumb_func
 116              		.fpu softvfp
 118              	delay:
 119              	.LFB2:
  45:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
  46:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** void delay(unsigned int count)
  47:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** {
 120              		.loc 1 47 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 8
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0038 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 003a 82B0     		sub	sp, sp, #8
 129              		.cfi_def_cfa_offset 16
 130 003c 00AF     		add	r7, sp, #0
 131              		.cfi_def_cfa_register 7
 132 003e 7860     		str	r0, [r7, #4]
  48:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	if( count == 0)
 133              		.loc 1 48 0
 134 0040 7B68     		ldr	r3, [r7, #4]
 135 0042 002B     		cmp	r3, #0
 136 0044 08D0     		beq	.L8
  49:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	return;
  50:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	delay_count = count;
 137              		.loc 1 50 0
 138 0046 7A68     		ldr	r2, [r7, #4]
 139 0048 054B     		ldr	r3, .L9
 140 004a 1A60     		str	r2, [r3]
  51:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	systick_flag = 0;	
 141              		.loc 1 51 0
 142 004c 054B     		ldr	r3, .L9+4
 143 004e 0022     		movs	r2, #0
 144 0050 1A60     		str	r2, [r3]
  52:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	delay_1mikro();
 145              		.loc 1 52 0
 146 0052 FFF7FEFF 		bl	delay_1mikro
 147 0056 00E0     		b	.L5
 148              	.L8:
  49:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	return;
 149              		.loc 1 49 0
 150 0058 C046     		nop
 151              	.L5:
  53:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	
  54:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** }
 152              		.loc 1 54 0
 153 005a BD46     		mov	sp, r7
 154 005c 02B0     		add	sp, sp, #8
 155              		@ sp needed
 156 005e 80BD     		pop	{r7, pc}
 157              	.L10:
 158              		.align	2
 159              	.L9:
 160 0060 04000000 		.word	delay_count
 161 0064 00000000 		.word	systick_flag
 162              		.cfi_endproc
 163              	.LFE2:
 165              		.align	1
 166              		.global	systick_irq_handler
 167              		.syntax unified
 168              		.code	16
 169              		.thumb_func
 170              		.fpu softvfp
 172              	systick_irq_handler:
 173              	.LFB3:
  55:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
  56:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** void systick_irq_handler (void)
  57:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** {
 174              		.loc 1 57 0
 175              		.cfi_startproc
 176              		@ args = 0, pretend = 0, frame = 0
 177              		@ frame_needed = 1, uses_anonymous_args = 0
 178 0068 80B5     		push	{r7, lr}
 179              		.cfi_def_cfa_offset 8
 180              		.cfi_offset 7, -8
 181              		.cfi_offset 14, -4
 182 006a 00AF     		add	r7, sp, #0
 183              		.cfi_def_cfa_register 7
  58:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	*STK_CTRL = 0;
 184              		.loc 1 58 0
 185 006c 0A4B     		ldr	r3, .L15
 186 006e 0022     		movs	r2, #0
 187 0070 1A60     		str	r2, [r3]
  59:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	delay_count -- ;
 188              		.loc 1 59 0
 189 0072 0A4B     		ldr	r3, .L15+4
 190 0074 1B68     		ldr	r3, [r3]
 191 0076 5A1E     		subs	r2, r3, #1
 192 0078 084B     		ldr	r3, .L15+4
 193 007a 1A60     		str	r2, [r3]
  60:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	if( delay_count > 0 )
 194              		.loc 1 60 0
 195 007c 074B     		ldr	r3, .L15+4
 196 007e 1B68     		ldr	r3, [r3]
 197 0080 002B     		cmp	r3, #0
 198 0082 02DD     		ble	.L12
  61:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	delay_1mikro();
 199              		.loc 1 61 0
 200 0084 FFF7FEFF 		bl	delay_1mikro
  62:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	else
  63:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	systick_flag = 1;
  64:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** }
 201              		.loc 1 64 0
 202 0088 02E0     		b	.L14
 203              	.L12:
  63:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** }
 204              		.loc 1 63 0
 205 008a 054B     		ldr	r3, .L15+8
 206 008c 0122     		movs	r2, #1
 207 008e 1A60     		str	r2, [r3]
 208              	.L14:
 209              		.loc 1 64 0
 210 0090 C046     		nop
 211 0092 BD46     		mov	sp, r7
 212              		@ sp needed
 213 0094 80BD     		pop	{r7, pc}
 214              	.L16:
 215 0096 C046     		.align	2
 216              	.L15:
 217 0098 10E000E0 		.word	-536813552
 218 009c 04000000 		.word	delay_count
 219 00a0 00000000 		.word	systick_flag
 220              		.cfi_endproc
 221              	.LFE3:
 223              		.align	1
 224              		.global	init_app
 225              		.syntax unified
 226              		.code	16
 227              		.thumb_func
 228              		.fpu softvfp
 230              	init_app:
 231              	.LFB4:
  65:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
  66:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** void init_app(void)
  67:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** {
 232              		.loc 1 67 0
 233              		.cfi_startproc
 234              		@ args = 0, pretend = 0, frame = 0
 235              		@ frame_needed = 1, uses_anonymous_args = 0
 236 00a4 80B5     		push	{r7, lr}
 237              		.cfi_def_cfa_offset 8
 238              		.cfi_offset 7, -8
 239              		.cfi_offset 14, -4
 240 00a6 00AF     		add	r7, sp, #0
 241              		.cfi_def_cfa_register 7
  68:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	*GPIO_MODER = 0x00005555;
 242              		.loc 1 68 0
 243 00a8 054B     		ldr	r3, .L18
 244 00aa 064A     		ldr	r2, .L18+4
 245 00ac 1A60     		str	r2, [r3]
  69:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	*GPIO_OTYPER = 0x0000;
 246              		.loc 1 69 0
 247 00ae 064B     		ldr	r3, .L18+8
 248 00b0 0022     		movs	r2, #0
 249 00b2 1A80     		strh	r2, [r3]
  70:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	*((void(**)(void))0x2001C03C) = systick_irq_handler;
 250              		.loc 1 70 0
 251 00b4 054B     		ldr	r3, .L18+12
 252 00b6 064A     		ldr	r2, .L18+16
 253 00b8 1A60     		str	r2, [r3]
  71:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
  72:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** }
 254              		.loc 1 72 0
 255 00ba C046     		nop
 256 00bc BD46     		mov	sp, r7
 257              		@ sp needed
 258 00be 80BD     		pop	{r7, pc}
 259              	.L19:
 260              		.align	2
 261              	.L18:
 262 00c0 000C0240 		.word	1073875968
 263 00c4 55550000 		.word	21845
 264 00c8 040C0240 		.word	1073875972
 265 00cc 3CC00120 		.word	536985660
 266 00d0 00000000 		.word	systick_irq_handler
 267              		.cfi_endproc
 268              	.LFE4:
 270              		.align	1
 271              		.global	main
 272              		.syntax unified
 273              		.code	16
 274              		.thumb_func
 275              		.fpu softvfp
 277              	main:
 278              	.LFB5:
  73:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 
  74:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** void main(void)
  75:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** {
 279              		.loc 1 75 0
 280              		.cfi_startproc
 281              		@ args = 0, pretend = 0, frame = 0
 282              		@ frame_needed = 1, uses_anonymous_args = 0
 283 00d4 80B5     		push	{r7, lr}
 284              		.cfi_def_cfa_offset 8
 285              		.cfi_offset 7, -8
 286              		.cfi_offset 14, -4
 287 00d6 00AF     		add	r7, sp, #0
 288              		.cfi_def_cfa_register 7
  76:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	init_app();
 289              		.loc 1 76 0
 290 00d8 FFF7FEFF 		bl	init_app
  77:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	*GPIO_ODR_LOW = 0;
 291              		.loc 1 77 0
 292 00dc 0A4B     		ldr	r3, .L26
 293 00de 0022     		movs	r2, #0
 294 00e0 1A70     		strb	r2, [r3]
  78:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	delay(DELAY_COUNT);
 295              		.loc 1 78 0
 296 00e2 0A4B     		ldr	r3, .L26+4
 297 00e4 1800     		movs	r0, r3
 298 00e6 FFF7FEFF 		bl	delay
  79:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	*GPIO_ODR_LOW = 0xff;
 299              		.loc 1 79 0
 300 00ea 074B     		ldr	r3, .L26
 301 00ec FF22     		movs	r2, #255
 302 00ee 1A70     		strb	r2, [r3]
 303              	.L23:
  80:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	while(1)
  81:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	{
  82:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 		if(systick_flag)
 304              		.loc 1 82 0
 305 00f0 074B     		ldr	r3, .L26+8
 306 00f2 1B68     		ldr	r3, [r3]
 307 00f4 002B     		cmp	r3, #0
 308 00f6 00D1     		bne	.L25
 309 00f8 FAE7     		b	.L23
 310              	.L25:
  83:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 		{
  84:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 			break;
 311              		.loc 1 84 0
 312 00fa C046     		nop
  85:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 		}
  86:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 		//kod som utförs under väntetiden
  87:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	}
  88:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	//kod som "väntar på time-out"
  89:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** 	*GPIO_ODR_LOW = 0;
 313              		.loc 1 89 0
 314 00fc 024B     		ldr	r3, .L26
 315 00fe 0022     		movs	r2, #0
 316 0100 1A70     		strb	r2, [r3]
  90:C:/Users/heinl/Documents/Moplaborationer/systick_irq\startup.c **** }
 317              		.loc 1 90 0
 318 0102 C046     		nop
 319 0104 BD46     		mov	sp, r7
 320              		@ sp needed
 321 0106 80BD     		pop	{r7, pc}
 322              	.L27:
 323              		.align	2
 324              	.L26:
 325 0108 140C0240 		.word	1073875988
 326 010c 40420F00 		.word	1000000
 327 0110 00000000 		.word	systick_flag
 328              		.cfi_endproc
 329              	.LFE5:
 331              	.Letext0:
