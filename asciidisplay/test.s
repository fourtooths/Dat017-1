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
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "C:/Users/heinl/Documents/Moplaborationer/asciidisplay/startup.c"
   1:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** /*
   2:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c ****  * 	startup.c
   3:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c ****  *
   4:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c ****  */
   5:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
   6:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define GPIO_E 0x40021000 /* MD407 port E */
   7:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
   8:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
   9:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
  10:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  11:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  12:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  13:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  14:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15)) 
  15:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define B_E 0x40 /* Enable-signal */
  16:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define B_SELECT 4 /* Select ASCII-display */
  17:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define B_RW 2 /* 0=Write, 1=Read */
  18:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** #define B_RS 1 /* 0=Control, 1=Data */
  19:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
  20:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  21:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void startup ( void )
  22:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
  26              		.loc 1 22 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  23:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** __asm volatile(
  31              		.loc 1 23 0
  32              		.syntax divided
  33              	@ 23 "C:/Users/heinl/Documents/Moplaborationer/asciidisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  24:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  25:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	" MOV SP,R0\n"
  26:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	" BL main\n"				/* call main */
  27:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	"_exit: B .\n"				/* never return */
  28:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	) ;
  29:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
  40              		.loc 1 29 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	ascii_ctrl_bit_set
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	ascii_ctrl_bit_set:
  56              	.LFB1:
  30:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
  31:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void ascii_ctrl_bit_set( unsigned char x )
  32:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
  57              		.loc 1 32 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 16
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 84B0     		sub	sp, sp, #16
  66              		.cfi_def_cfa_offset 24
  67 0004 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  69 0006 0200     		movs	r2, r0
  70 0008 FB1D     		adds	r3, r7, #7
  71 000a 1A70     		strb	r2, [r3]
  33:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	unsigned char c;
  34:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	c = *GPIO_ODR_LOW;
  72              		.loc 1 34 0
  73 000c 0C4A     		ldr	r2, .L3
  74 000e 0F21     		movs	r1, #15
  75 0010 7B18     		adds	r3, r7, r1
  76 0012 1278     		ldrb	r2, [r2]
  77 0014 1A70     		strb	r2, [r3]
  35:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	c |= ( B_SELECT | x );
  78              		.loc 1 35 0
  79 0016 FA1D     		adds	r2, r7, #7
  80 0018 7B18     		adds	r3, r7, r1
  81 001a 1278     		ldrb	r2, [r2]
  82 001c 1B78     		ldrb	r3, [r3]
  83 001e 1343     		orrs	r3, r2
  84 0020 DAB2     		uxtb	r2, r3
  85 0022 0800     		movs	r0, r1
  86 0024 7B18     		adds	r3, r7, r1
  87 0026 0421     		movs	r1, #4
  88 0028 0A43     		orrs	r2, r1
  89 002a 1A70     		strb	r2, [r3]
  36:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	*GPIO_ODR_LOW = c;
  90              		.loc 1 36 0
  91 002c 044A     		ldr	r2, .L3
  92 002e 0100     		movs	r1, r0
  93 0030 7B18     		adds	r3, r7, r1
  94 0032 1B78     		ldrb	r3, [r3]
  95 0034 1370     		strb	r3, [r2]
  37:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
  96              		.loc 1 37 0
  97 0036 C046     		nop
  98 0038 BD46     		mov	sp, r7
  99 003a 04B0     		add	sp, sp, #16
 100              		@ sp needed
 101 003c 80BD     		pop	{r7, pc}
 102              	.L4:
 103 003e C046     		.align	2
 104              	.L3:
 105 0040 14100240 		.word	1073877012
 106              		.cfi_endproc
 107              	.LFE1:
 109              		.align	1
 110              		.global	ascii_ctrl_bit_clear
 111              		.syntax unified
 112              		.code	16
 113              		.thumb_func
 114              		.fpu softvfp
 116              	ascii_ctrl_bit_clear:
 117              	.LFB2:
  38:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
  39:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void ascii_ctrl_bit_clear( unsigned char x )
  40:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 118              		.loc 1 40 0
 119              		.cfi_startproc
 120              		@ args = 0, pretend = 0, frame = 16
 121              		@ frame_needed = 1, uses_anonymous_args = 0
 122 0044 80B5     		push	{r7, lr}
 123              		.cfi_def_cfa_offset 8
 124              		.cfi_offset 7, -8
 125              		.cfi_offset 14, -4
 126 0046 84B0     		sub	sp, sp, #16
 127              		.cfi_def_cfa_offset 24
 128 0048 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
 130 004a 0200     		movs	r2, r0
 131 004c FB1D     		adds	r3, r7, #7
 132 004e 1A70     		strb	r2, [r3]
  41:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	unsigned char c;
  42:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	c = *GPIO_ODR_LOW;
 133              		.loc 1 42 0
 134 0050 0D4A     		ldr	r2, .L6
 135 0052 0F21     		movs	r1, #15
 136 0054 7B18     		adds	r3, r7, r1
 137 0056 1278     		ldrb	r2, [r2]
 138 0058 1A70     		strb	r2, [r3]
  43:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	c &= ( B_SELECT | ~x );
 139              		.loc 1 43 0
 140 005a FB1D     		adds	r3, r7, #7
 141 005c 1B78     		ldrb	r3, [r3]
 142 005e 5BB2     		sxtb	r3, r3
 143 0060 DB43     		mvns	r3, r3
 144 0062 5BB2     		sxtb	r3, r3
 145 0064 0422     		movs	r2, #4
 146 0066 1343     		orrs	r3, r2
 147 0068 5BB2     		sxtb	r3, r3
 148 006a 7A18     		adds	r2, r7, r1
 149 006c 1278     		ldrb	r2, [r2]
 150 006e 52B2     		sxtb	r2, r2
 151 0070 1340     		ands	r3, r2
 152 0072 5AB2     		sxtb	r2, r3
 153 0074 7B18     		adds	r3, r7, r1
 154 0076 1A70     		strb	r2, [r3]
  44:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	*GPIO_ODR_LOW = c;
 155              		.loc 1 44 0
 156 0078 034A     		ldr	r2, .L6
 157 007a 7B18     		adds	r3, r7, r1
 158 007c 1B78     		ldrb	r3, [r3]
 159 007e 1370     		strb	r3, [r2]
  45:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 160              		.loc 1 45 0
 161 0080 C046     		nop
 162 0082 BD46     		mov	sp, r7
 163 0084 04B0     		add	sp, sp, #16
 164              		@ sp needed
 165 0086 80BD     		pop	{r7, pc}
 166              	.L7:
 167              		.align	2
 168              	.L6:
 169 0088 14100240 		.word	1073877012
 170              		.cfi_endproc
 171              	.LFE2:
 173              		.align	1
 174              		.global	ascii_write_controller
 175              		.syntax unified
 176              		.code	16
 177              		.thumb_func
 178              		.fpu softvfp
 180              	ascii_write_controller:
 181              	.LFB3:
  46:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
  47:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void ascii_write_controller( unsigned char c )
  48:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 182              		.loc 1 48 0
 183              		.cfi_startproc
 184              		@ args = 0, pretend = 0, frame = 8
 185              		@ frame_needed = 1, uses_anonymous_args = 0
 186 008c 80B5     		push	{r7, lr}
 187              		.cfi_def_cfa_offset 8
 188              		.cfi_offset 7, -8
 189              		.cfi_offset 14, -4
 190 008e 82B0     		sub	sp, sp, #8
 191              		.cfi_def_cfa_offset 16
 192 0090 00AF     		add	r7, sp, #0
 193              		.cfi_def_cfa_register 7
 194 0092 0200     		movs	r2, r0
 195 0094 FB1D     		adds	r3, r7, #7
 196 0096 1A70     		strb	r2, [r3]
  49:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set( B_E );
 197              		.loc 1 49 0
 198 0098 4020     		movs	r0, #64
 199 009a FFF7FEFF 		bl	ascii_ctrl_bit_set
  50:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	*GPIO_ODR_HIGH = c;
 200              		.loc 1 50 0
 201 009e 064A     		ldr	r2, .L9
 202 00a0 FB1D     		adds	r3, r7, #7
 203 00a2 1B78     		ldrb	r3, [r3]
 204 00a4 1370     		strb	r3, [r2]
  51:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_E );
 205              		.loc 1 51 0
 206 00a6 4020     		movs	r0, #64
 207 00a8 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  52:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	delay_250ns();
 208              		.loc 1 52 0
 209 00ac FFF7FEFF 		bl	delay_250ns
  53:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 210              		.loc 1 53 0
 211 00b0 C046     		nop
 212 00b2 BD46     		mov	sp, r7
 213 00b4 02B0     		add	sp, sp, #8
 214              		@ sp needed
 215 00b6 80BD     		pop	{r7, pc}
 216              	.L10:
 217              		.align	2
 218              	.L9:
 219 00b8 15100240 		.word	1073877013
 220              		.cfi_endproc
 221              	.LFE3:
 223              		.align	1
 224              		.global	ascii_read_controller
 225              		.syntax unified
 226              		.code	16
 227              		.thumb_func
 228              		.fpu softvfp
 230              	ascii_read_controller:
 231              	.LFB4:
  54:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
  55:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** unsigned char ascii_read_controller( void )
  56:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 232              		.loc 1 56 0
 233              		.cfi_startproc
 234              		@ args = 0, pretend = 0, frame = 8
 235              		@ frame_needed = 1, uses_anonymous_args = 0
 236 00bc 80B5     		push	{r7, lr}
 237              		.cfi_def_cfa_offset 8
 238              		.cfi_offset 7, -8
 239              		.cfi_offset 14, -4
 240 00be 82B0     		sub	sp, sp, #8
 241              		.cfi_def_cfa_offset 16
 242 00c0 00AF     		add	r7, sp, #0
 243              		.cfi_def_cfa_register 7
  57:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	unsigned char c;
  58:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set( B_E );
 244              		.loc 1 58 0
 245 00c2 4020     		movs	r0, #64
 246 00c4 FFF7FEFF 		bl	ascii_ctrl_bit_set
  59:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	delay_250ns();
 247              		.loc 1 59 0
 248 00c8 FFF7FEFF 		bl	delay_250ns
  60:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	delay_250ns();
 249              		.loc 1 60 0
 250 00cc FFF7FEFF 		bl	delay_250ns
  61:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	c = *GPIO_IDR_HIGH;
 251              		.loc 1 61 0
 252 00d0 064A     		ldr	r2, .L13
 253 00d2 FB1D     		adds	r3, r7, #7
 254 00d4 1278     		ldrb	r2, [r2]
 255 00d6 1A70     		strb	r2, [r3]
  62:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_E );
 256              		.loc 1 62 0
 257 00d8 4020     		movs	r0, #64
 258 00da FFF7FEFF 		bl	ascii_ctrl_bit_clear
  63:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	return c;
 259              		.loc 1 63 0
 260 00de FB1D     		adds	r3, r7, #7
 261 00e0 1B78     		ldrb	r3, [r3]
  64:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 262              		.loc 1 64 0
 263 00e2 1800     		movs	r0, r3
 264 00e4 BD46     		mov	sp, r7
 265 00e6 02B0     		add	sp, sp, #8
 266              		@ sp needed
 267 00e8 80BD     		pop	{r7, pc}
 268              	.L14:
 269 00ea C046     		.align	2
 270              	.L13:
 271 00ec 11100240 		.word	1073877009
 272              		.cfi_endproc
 273              	.LFE4:
 275              		.align	1
 276              		.global	ascii_read_status
 277              		.syntax unified
 278              		.code	16
 279              		.thumb_func
 280              		.fpu softvfp
 282              	ascii_read_status:
 283              	.LFB5:
  65:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
  66:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** unsigned char ascii_read_status(void)
  67:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 284              		.loc 1 67 0
 285              		.cfi_startproc
 286              		@ args = 0, pretend = 0, frame = 8
 287              		@ frame_needed = 1, uses_anonymous_args = 0
 288 00f0 90B5     		push	{r4, r7, lr}
 289              		.cfi_def_cfa_offset 12
 290              		.cfi_offset 4, -12
 291              		.cfi_offset 7, -8
 292              		.cfi_offset 14, -4
 293 00f2 83B0     		sub	sp, sp, #12
 294              		.cfi_def_cfa_offset 24
 295 00f4 00AF     		add	r7, sp, #0
 296              		.cfi_def_cfa_register 7
  68:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	unsigned char c;
  69:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	*GPIO_MODER = 0x00005555;
 297              		.loc 1 69 0
 298 00f6 0B4B     		ldr	r3, .L17
 299 00f8 0B4A     		ldr	r2, .L17+4
 300 00fa 1A60     		str	r2, [r3]
  70:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set( B_RW );
 301              		.loc 1 70 0
 302 00fc 0220     		movs	r0, #2
 303 00fe FFF7FEFF 		bl	ascii_ctrl_bit_set
  71:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_RS );
 304              		.loc 1 71 0
 305 0102 0120     		movs	r0, #1
 306 0104 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  72:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	c = ascii_read_controller( );
 307              		.loc 1 72 0
 308 0108 FC1D     		adds	r4, r7, #7
 309 010a FFF7FEFF 		bl	ascii_read_controller
 310 010e 0300     		movs	r3, r0
 311 0110 2370     		strb	r3, [r4]
  73:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
 312              		.loc 1 73 0
 313 0112 044B     		ldr	r3, .L17
 314 0114 054A     		ldr	r2, .L17+8
 315 0116 1A60     		str	r2, [r3]
  74:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	return c;
 316              		.loc 1 74 0
 317 0118 FB1D     		adds	r3, r7, #7
 318 011a 1B78     		ldrb	r3, [r3]
  75:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 319              		.loc 1 75 0
 320 011c 1800     		movs	r0, r3
 321 011e BD46     		mov	sp, r7
 322 0120 03B0     		add	sp, sp, #12
 323              		@ sp needed
 324 0122 90BD     		pop	{r4, r7, pc}
 325              	.L18:
 326              		.align	2
 327              	.L17:
 328 0124 00100240 		.word	1073876992
 329 0128 55550000 		.word	21845
 330 012c 55555555 		.word	1431655765
 331              		.cfi_endproc
 332              	.LFE5:
 334              		.align	1
 335              		.global	ascii_read_data
 336              		.syntax unified
 337              		.code	16
 338              		.thumb_func
 339              		.fpu softvfp
 341              	ascii_read_data:
 342              	.LFB6:
  76:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
  77:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** unsigned char ascii_read_data(void)
  78:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 343              		.loc 1 78 0
 344              		.cfi_startproc
 345              		@ args = 0, pretend = 0, frame = 8
 346              		@ frame_needed = 1, uses_anonymous_args = 0
 347 0130 90B5     		push	{r4, r7, lr}
 348              		.cfi_def_cfa_offset 12
 349              		.cfi_offset 4, -12
 350              		.cfi_offset 7, -8
 351              		.cfi_offset 14, -4
 352 0132 83B0     		sub	sp, sp, #12
 353              		.cfi_def_cfa_offset 24
 354 0134 00AF     		add	r7, sp, #0
 355              		.cfi_def_cfa_register 7
  79:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	*GPIO_MODER = 0x00005555;
 356              		.loc 1 79 0
 357 0136 0B4B     		ldr	r3, .L21
 358 0138 0B4A     		ldr	r2, .L21+4
 359 013a 1A60     		str	r2, [r3]
  80:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 360              		.loc 1 80 0
 361 013c 0120     		movs	r0, #1
 362 013e FFF7FEFF 		bl	ascii_ctrl_bit_set
  81:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 363              		.loc 1 81 0
 364 0142 0220     		movs	r0, #2
 365 0144 FFF7FEFF 		bl	ascii_ctrl_bit_set
  82:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	unsigned char rv = ascii_read_controller();
 366              		.loc 1 82 0
 367 0148 FC1D     		adds	r4, r7, #7
 368 014a FFF7FEFF 		bl	ascii_read_controller
 369 014e 0300     		movs	r3, r0
 370 0150 2370     		strb	r3, [r4]
  83:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
 371              		.loc 1 83 0
 372 0152 044B     		ldr	r3, .L21
 373 0154 054A     		ldr	r2, .L21+8
 374 0156 1A60     		str	r2, [r3]
  84:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	return rv;
 375              		.loc 1 84 0
 376 0158 FB1D     		adds	r3, r7, #7
 377 015a 1B78     		ldrb	r3, [r3]
  85:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 378              		.loc 1 85 0
 379 015c 1800     		movs	r0, r3
 380 015e BD46     		mov	sp, r7
 381 0160 03B0     		add	sp, sp, #12
 382              		@ sp needed
 383 0162 90BD     		pop	{r4, r7, pc}
 384              	.L22:
 385              		.align	2
 386              	.L21:
 387 0164 00100240 		.word	1073876992
 388 0168 55550000 		.word	21845
 389 016c 55555555 		.word	1431655765
 390              		.cfi_endproc
 391              	.LFE6:
 393              		.align	1
 394              		.global	ascii_write_cmd
 395              		.syntax unified
 396              		.code	16
 397              		.thumb_func
 398              		.fpu softvfp
 400              	ascii_write_cmd:
 401              	.LFB7:
  86:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
  87:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void ascii_write_cmd (unsigned char command)
  88:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 402              		.loc 1 88 0
 403              		.cfi_startproc
 404              		@ args = 0, pretend = 0, frame = 8
 405              		@ frame_needed = 1, uses_anonymous_args = 0
 406 0170 80B5     		push	{r7, lr}
 407              		.cfi_def_cfa_offset 8
 408              		.cfi_offset 7, -8
 409              		.cfi_offset 14, -4
 410 0172 82B0     		sub	sp, sp, #8
 411              		.cfi_def_cfa_offset 16
 412 0174 00AF     		add	r7, sp, #0
 413              		.cfi_def_cfa_register 7
 414 0176 0200     		movs	r2, r0
 415 0178 FB1D     		adds	r3, r7, #7
 416 017a 1A70     		strb	r2, [r3]
  89:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_RS );
 417              		.loc 1 89 0
 418 017c 0120     		movs	r0, #1
 419 017e FFF7FEFF 		bl	ascii_ctrl_bit_clear
  90:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_RW );
 420              		.loc 1 90 0
 421 0182 0220     		movs	r0, #2
 422 0184 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  91:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_controller(command);
 423              		.loc 1 91 0
 424 0188 FB1D     		adds	r3, r7, #7
 425 018a 1B78     		ldrb	r3, [r3]
 426 018c 1800     		movs	r0, r3
 427 018e FFF7FEFF 		bl	ascii_write_controller
  92:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 428              		.loc 1 92 0
 429 0192 C046     		nop
 430 0194 BD46     		mov	sp, r7
 431 0196 02B0     		add	sp, sp, #8
 432              		@ sp needed
 433 0198 80BD     		pop	{r7, pc}
 434              		.cfi_endproc
 435              	.LFE7:
 437              		.align	1
 438              		.global	ascii_write_data
 439              		.syntax unified
 440              		.code	16
 441              		.thumb_func
 442              		.fpu softvfp
 444              	ascii_write_data:
 445              	.LFB8:
  93:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
  94:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void ascii_write_data (unsigned char data)
  95:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 446              		.loc 1 95 0
 447              		.cfi_startproc
 448              		@ args = 0, pretend = 0, frame = 8
 449              		@ frame_needed = 1, uses_anonymous_args = 0
 450 019a 80B5     		push	{r7, lr}
 451              		.cfi_def_cfa_offset 8
 452              		.cfi_offset 7, -8
 453              		.cfi_offset 14, -4
 454 019c 82B0     		sub	sp, sp, #8
 455              		.cfi_def_cfa_offset 16
 456 019e 00AF     		add	r7, sp, #0
 457              		.cfi_def_cfa_register 7
 458 01a0 0200     		movs	r2, r0
 459 01a2 FB1D     		adds	r3, r7, #7
 460 01a4 1A70     		strb	r2, [r3]
  96:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_set( B_RS );
 461              		.loc 1 96 0
 462 01a6 0120     		movs	r0, #1
 463 01a8 FFF7FEFF 		bl	ascii_ctrl_bit_set
  97:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_RW );
 464              		.loc 1 97 0
 465 01ac 0220     		movs	r0, #2
 466 01ae FFF7FEFF 		bl	ascii_ctrl_bit_clear
  98:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_controller(data);
 467              		.loc 1 98 0
 468 01b2 FB1D     		adds	r3, r7, #7
 469 01b4 1B78     		ldrb	r3, [r3]
 470 01b6 1800     		movs	r0, r3
 471 01b8 FFF7FEFF 		bl	ascii_write_controller
  99:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 472              		.loc 1 99 0
 473 01bc C046     		nop
 474 01be BD46     		mov	sp, r7
 475 01c0 02B0     		add	sp, sp, #8
 476              		@ sp needed
 477 01c2 80BD     		pop	{r7, pc}
 478              		.cfi_endproc
 479              	.LFE8:
 481              		.align	1
 482              		.global	ascii_command
 483              		.syntax unified
 484              		.code	16
 485              		.thumb_func
 486              		.fpu softvfp
 488              	ascii_command:
 489              	.LFB9:
 100:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
 101:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void ascii_command(unsigned char command){
 490              		.loc 1 101 0
 491              		.cfi_startproc
 492              		@ args = 0, pretend = 0, frame = 8
 493              		@ frame_needed = 1, uses_anonymous_args = 0
 494 01c4 80B5     		push	{r7, lr}
 495              		.cfi_def_cfa_offset 8
 496              		.cfi_offset 7, -8
 497              		.cfi_offset 14, -4
 498 01c6 82B0     		sub	sp, sp, #8
 499              		.cfi_def_cfa_offset 16
 500 01c8 00AF     		add	r7, sp, #0
 501              		.cfi_def_cfa_register 7
 502 01ca 0200     		movs	r2, r0
 503 01cc FB1D     		adds	r3, r7, #7
 504 01ce 1A70     		strb	r2, [r3]
 102:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80); //vänta tills displayen kan ta kommando
 505              		.loc 1 102 0
 506 01d0 C046     		nop
 507              	.L26:
 508              		.loc 1 102 0 is_stmt 0 discriminator 1
 509 01d2 FFF7FEFF 		bl	ascii_read_status
 510 01d6 0300     		movs	r3, r0
 511 01d8 1A00     		movs	r2, r3
 512 01da 8023     		movs	r3, #128
 513 01dc 1340     		ands	r3, r2
 514 01de 802B     		cmp	r3, #128
 515 01e0 F7D0     		beq	.L26
 103:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro(8);
 516              		.loc 1 103 0 is_stmt 1
 517 01e2 0820     		movs	r0, #8
 518 01e4 FFF7FEFF 		bl	delay_mikro
 104:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_cmd(command);
 519              		.loc 1 104 0
 520 01e8 FB1D     		adds	r3, r7, #7
 521 01ea 1B78     		ldrb	r3, [r3]
 522 01ec 1800     		movs	r0, r3
 523 01ee FFF7FEFF 		bl	ascii_write_cmd
 105:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 524              		.loc 1 105 0
 525 01f2 C046     		nop
 526 01f4 BD46     		mov	sp, r7
 527 01f6 02B0     		add	sp, sp, #8
 528              		@ sp needed
 529 01f8 80BD     		pop	{r7, pc}
 530              		.cfi_endproc
 531              	.LFE9:
 533              		.align	1
 534              		.global	ascii_write_char
 535              		.syntax unified
 536              		.code	16
 537              		.thumb_func
 538              		.fpu softvfp
 540              	ascii_write_char:
 541              	.LFB10:
 106:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
 107:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void ascii_write_char (unsigned char chr)
 108:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 542              		.loc 1 108 0
 543              		.cfi_startproc
 544              		@ args = 0, pretend = 0, frame = 8
 545              		@ frame_needed = 1, uses_anonymous_args = 0
 546 01fa 80B5     		push	{r7, lr}
 547              		.cfi_def_cfa_offset 8
 548              		.cfi_offset 7, -8
 549              		.cfi_offset 14, -4
 550 01fc 82B0     		sub	sp, sp, #8
 551              		.cfi_def_cfa_offset 16
 552 01fe 00AF     		add	r7, sp, #0
 553              		.cfi_def_cfa_register 7
 554 0200 0200     		movs	r2, r0
 555 0202 FB1D     		adds	r3, r7, #7
 556 0204 1A70     		strb	r2, [r3]
 557              	.LBB2:
 109:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	while(1)
 110:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 		if(ascii_read_status)
 111:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 		{
 112:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 			delay_mikro(8);
 558              		.loc 1 112 0
 559 0206 0820     		movs	r0, #8
 560 0208 FFF7FEFF 		bl	delay_mikro
 113:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 			ascii_write_data(chr);
 561              		.loc 1 113 0
 562 020c FB1D     		adds	r3, r7, #7
 563 020e 1B78     		ldrb	r3, [r3]
 564 0210 1800     		movs	r0, r3
 565 0212 FFF7FEFF 		bl	ascii_write_data
 114:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 			delay_mikro(43);
 566              		.loc 1 114 0
 567 0216 2B20     		movs	r0, #43
 568 0218 FFF7FEFF 		bl	delay_mikro
 115:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 			break;
 569              		.loc 1 115 0
 570 021c C046     		nop
 571              	.LBE2:
 116:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 		}
 117:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 572              		.loc 1 117 0
 573 021e C046     		nop
 574 0220 BD46     		mov	sp, r7
 575 0222 02B0     		add	sp, sp, #8
 576              		@ sp needed
 577 0224 80BD     		pop	{r7, pc}
 578              		.cfi_endproc
 579              	.LFE10:
 581              		.align	1
 582              		.global	function_set
 583              		.syntax unified
 584              		.code	16
 585              		.thumb_func
 586              		.fpu softvfp
 588              	function_set:
 589              	.LFB11:
 118:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void function_set(void){
 590              		.loc 1 118 0
 591              		.cfi_startproc
 592              		@ args = 0, pretend = 0, frame = 0
 593              		@ frame_needed = 1, uses_anonymous_args = 0
 594 0226 80B5     		push	{r7, lr}
 595              		.cfi_def_cfa_offset 8
 596              		.cfi_offset 7, -8
 597              		.cfi_offset 14, -4
 598 0228 00AF     		add	r7, sp, #0
 599              		.cfi_def_cfa_register 7
 119:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_command(0x38); //2 rader, 5x8 punkter
 600              		.loc 1 119 0
 601 022a 3820     		movs	r0, #56
 602 022c FFF7FEFF 		bl	ascii_command
 120:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro(39);
 603              		.loc 1 120 0
 604 0230 2720     		movs	r0, #39
 605 0232 FFF7FEFF 		bl	delay_mikro
 121:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 606              		.loc 1 121 0
 607 0236 C046     		nop
 608 0238 BD46     		mov	sp, r7
 609              		@ sp needed
 610 023a 80BD     		pop	{r7, pc}
 611              		.cfi_endproc
 612              	.LFE11:
 614              		.align	1
 615              		.global	display_control
 616              		.syntax unified
 617              		.code	16
 618              		.thumb_func
 619              		.fpu softvfp
 621              	display_control:
 622              	.LFB12:
 122:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
 123:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void display_control(void){
 623              		.loc 1 123 0
 624              		.cfi_startproc
 625              		@ args = 0, pretend = 0, frame = 0
 626              		@ frame_needed = 1, uses_anonymous_args = 0
 627 023c 80B5     		push	{r7, lr}
 628              		.cfi_def_cfa_offset 8
 629              		.cfi_offset 7, -8
 630              		.cfi_offset 14, -4
 631 023e 00AF     		add	r7, sp, #0
 632              		.cfi_def_cfa_register 7
 124:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_command(0xE); //tänd display, tänd markör, konstant visning
 633              		.loc 1 124 0
 634 0240 0E20     		movs	r0, #14
 635 0242 FFF7FEFF 		bl	ascii_command
 125:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro(39);
 636              		.loc 1 125 0
 637 0246 2720     		movs	r0, #39
 638 0248 FFF7FEFF 		bl	delay_mikro
 126:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 639              		.loc 1 126 0
 640 024c C046     		nop
 641 024e BD46     		mov	sp, r7
 642              		@ sp needed
 643 0250 80BD     		pop	{r7, pc}
 644              		.cfi_endproc
 645              	.LFE12:
 647              		.align	1
 648              		.global	clear_display
 649              		.syntax unified
 650              		.code	16
 651              		.thumb_func
 652              		.fpu softvfp
 654              	clear_display:
 655              	.LFB13:
 127:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
 128:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void clear_display(void){
 656              		.loc 1 128 0
 657              		.cfi_startproc
 658              		@ args = 0, pretend = 0, frame = 0
 659              		@ frame_needed = 1, uses_anonymous_args = 0
 660 0252 80B5     		push	{r7, lr}
 661              		.cfi_def_cfa_offset 8
 662              		.cfi_offset 7, -8
 663              		.cfi_offset 14, -4
 664 0254 00AF     		add	r7, sp, #0
 665              		.cfi_def_cfa_register 7
 129:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_command(0x1); 
 666              		.loc 1 129 0
 667 0256 0120     		movs	r0, #1
 668 0258 FFF7FEFF 		bl	ascii_command
 130:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	delay_milli(2);
 669              		.loc 1 130 0
 670 025c 0220     		movs	r0, #2
 671 025e FFF7FEFF 		bl	delay_milli
 131:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 672              		.loc 1 131 0
 673 0262 C046     		nop
 674 0264 BD46     		mov	sp, r7
 675              		@ sp needed
 676 0266 80BD     		pop	{r7, pc}
 677              		.cfi_endproc
 678              	.LFE13:
 680              		.align	1
 681              		.global	entry_mode_set
 682              		.syntax unified
 683              		.code	16
 684              		.thumb_func
 685              		.fpu softvfp
 687              	entry_mode_set:
 688              	.LFB14:
 132:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
 133:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void entry_mode_set(void){
 689              		.loc 1 133 0
 690              		.cfi_startproc
 691              		@ args = 0, pretend = 0, frame = 0
 692              		@ frame_needed = 1, uses_anonymous_args = 0
 693 0268 80B5     		push	{r7, lr}
 694              		.cfi_def_cfa_offset 8
 695              		.cfi_offset 7, -8
 696              		.cfi_offset 14, -4
 697 026a 00AF     		add	r7, sp, #0
 698              		.cfi_def_cfa_register 7
 134:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_command(0x4); //adressering med ''increment'', inget skift av adressbufferten
 699              		.loc 1 134 0
 700 026c 0420     		movs	r0, #4
 701 026e FFF7FEFF 		bl	ascii_command
 135:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 702              		.loc 1 135 0
 703 0272 C046     		nop
 704 0274 BD46     		mov	sp, r7
 705              		@ sp needed
 706 0276 80BD     		pop	{r7, pc}
 707              		.cfi_endproc
 708              	.LFE14:
 710              		.align	1
 711              		.global	ascii_init
 712              		.syntax unified
 713              		.code	16
 714              		.thumb_func
 715              		.fpu softvfp
 717              	ascii_init:
 718              	.LFB15:
 136:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
 137:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void ascii_init(void)
 138:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 719              		.loc 1 138 0
 720              		.cfi_startproc
 721              		@ args = 0, pretend = 0, frame = 0
 722              		@ frame_needed = 1, uses_anonymous_args = 0
 723 0278 80B5     		push	{r7, lr}
 724              		.cfi_def_cfa_offset 8
 725              		.cfi_offset 7, -8
 726              		.cfi_offset 14, -4
 727 027a 00AF     		add	r7, sp, #0
 728              		.cfi_def_cfa_register 7
 139:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	function_set();
 729              		.loc 1 139 0
 730 027c FFF7FEFF 		bl	function_set
 140:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	display_control();
 731              		.loc 1 140 0
 732 0280 FFF7FEFF 		bl	display_control
 141:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	clear_display();
 733              		.loc 1 141 0
 734 0284 FFF7FEFF 		bl	clear_display
 142:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	entry_mode_set();
 735              		.loc 1 142 0
 736 0288 FFF7FEFF 		bl	entry_mode_set
 143:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 737              		.loc 1 143 0
 738 028c C046     		nop
 739 028e BD46     		mov	sp, r7
 740              		@ sp needed
 741 0290 80BD     		pop	{r7, pc}
 742              		.cfi_endproc
 743              	.LFE15:
 745              		.align	1
 746              		.global	init_app
 747              		.syntax unified
 748              		.code	16
 749              		.thumb_func
 750              		.fpu softvfp
 752              	init_app:
 753              	.LFB16:
 144:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
 145:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void init_app(void)
 146:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 754              		.loc 1 146 0
 755              		.cfi_startproc
 756              		@ args = 0, pretend = 0, frame = 0
 757              		@ frame_needed = 1, uses_anonymous_args = 0
 758 0292 80B5     		push	{r7, lr}
 759              		.cfi_def_cfa_offset 8
 760              		.cfi_offset 7, -8
 761              		.cfi_offset 14, -4
 762 0294 00AF     		add	r7, sp, #0
 763              		.cfi_def_cfa_register 7
 147:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	*GPIO_MODER=0x00005555;
 764              		.loc 1 147 0
 765 0296 034B     		ldr	r3, .L34
 766 0298 034A     		ldr	r2, .L34+4
 767 029a 1A60     		str	r2, [r3]
 148:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 768              		.loc 1 148 0
 769 029c C046     		nop
 770 029e BD46     		mov	sp, r7
 771              		@ sp needed
 772 02a0 80BD     		pop	{r7, pc}
 773              	.L35:
 774 02a2 C046     		.align	2
 775              	.L34:
 776 02a4 00100240 		.word	1073876992
 777 02a8 55550000 		.word	21845
 778              		.cfi_endproc
 779              	.LFE16:
 781              		.align	1
 782              		.global	ascii_gotoxy
 783              		.syntax unified
 784              		.code	16
 785              		.thumb_func
 786              		.fpu softvfp
 788              	ascii_gotoxy:
 789              	.LFB17:
 149:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
 150:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** void ascii_gotoxy(int x, int y)
 151:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 790              		.loc 1 151 0
 791              		.cfi_startproc
 792              		@ args = 0, pretend = 0, frame = 16
 793              		@ frame_needed = 1, uses_anonymous_args = 0
 794 02ac 80B5     		push	{r7, lr}
 795              		.cfi_def_cfa_offset 8
 796              		.cfi_offset 7, -8
 797              		.cfi_offset 14, -4
 798 02ae 84B0     		sub	sp, sp, #16
 799              		.cfi_def_cfa_offset 24
 800 02b0 00AF     		add	r7, sp, #0
 801              		.cfi_def_cfa_register 7
 802 02b2 7860     		str	r0, [r7, #4]
 803 02b4 3960     		str	r1, [r7]
 152:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	int address = x-1;
 804              		.loc 1 152 0
 805 02b6 7B68     		ldr	r3, [r7, #4]
 806 02b8 013B     		subs	r3, r3, #1
 807 02ba FB60     		str	r3, [r7, #12]
 153:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	if(y==2)
 808              		.loc 1 153 0
 809 02bc 3B68     		ldr	r3, [r7]
 810 02be 022B     		cmp	r3, #2
 811 02c0 02D1     		bne	.L37
 154:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	{
 155:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 		address = address + 0x40;
 812              		.loc 1 155 0
 813 02c2 FB68     		ldr	r3, [r7, #12]
 814 02c4 4033     		adds	r3, r3, #64
 815 02c6 FB60     		str	r3, [r7, #12]
 816              	.L37:
 156:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	}
 157:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_write_cmd(0x80|address);
 817              		.loc 1 157 0
 818 02c8 FB68     		ldr	r3, [r7, #12]
 819 02ca 5BB2     		sxtb	r3, r3
 820 02cc 8022     		movs	r2, #128
 821 02ce 5242     		rsbs	r2, r2, #0
 822 02d0 1343     		orrs	r3, r2
 823 02d2 5BB2     		sxtb	r3, r3
 824 02d4 DBB2     		uxtb	r3, r3
 825 02d6 1800     		movs	r0, r3
 826 02d8 FFF7FEFF 		bl	ascii_write_cmd
 158:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	delay_mikro(39);
 827              		.loc 1 158 0
 828 02dc 2720     		movs	r0, #39
 829 02de FFF7FEFF 		bl	delay_mikro
 159:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 830              		.loc 1 159 0
 831 02e2 C046     		nop
 832 02e4 BD46     		mov	sp, r7
 833 02e6 04B0     		add	sp, sp, #16
 834              		@ sp needed
 835 02e8 80BD     		pop	{r7, pc}
 836              		.cfi_endproc
 837              	.LFE17:
 839              		.section	.rodata
 840              		.align	2
 841              	.LC0:
 842 0000 416C6661 		.ascii	"Alfanumerisk\000"
 842      6E756D65 
 842      7269736B 
 842      00
 843 000d 000000   		.align	2
 844              	.LC2:
 845 0010 44697370 		.ascii	"Display - test\000"
 845      6C617920 
 845      2D207465 
 845      737400
 846              		.text
 847              		.align	1
 848              		.global	main
 849              		.syntax unified
 850              		.code	16
 851              		.thumb_func
 852              		.fpu softvfp
 854              	main:
 855              	.LFB18:
 160:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 
 161:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** int main(int argc, char **argv)
 162:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** {
 856              		.loc 1 162 0
 857              		.cfi_startproc
 858              		@ args = 0, pretend = 0, frame = 48
 859              		@ frame_needed = 1, uses_anonymous_args = 0
 860 02ea B0B5     		push	{r4, r5, r7, lr}
 861              		.cfi_def_cfa_offset 16
 862              		.cfi_offset 4, -16
 863              		.cfi_offset 5, -12
 864              		.cfi_offset 7, -8
 865              		.cfi_offset 14, -4
 866 02ec 8CB0     		sub	sp, sp, #48
 867              		.cfi_def_cfa_offset 64
 868 02ee 00AF     		add	r7, sp, #0
 869              		.cfi_def_cfa_register 7
 870 02f0 7860     		str	r0, [r7, #4]
 871 02f2 3960     		str	r1, [r7]
 163:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	char *s;
 164:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	char test1[]="Alfanumerisk";
 872              		.loc 1 164 0
 873 02f4 1C24     		movs	r4, #28
 874 02f6 3B19     		adds	r3, r7, r4
 875 02f8 1D4A     		ldr	r2, .L44
 876 02fa 23CA     		ldmia	r2!, {r0, r1, r5}
 877 02fc 23C3     		stmia	r3!, {r0, r1, r5}
 878 02fe 1278     		ldrb	r2, [r2]
 879 0300 1A70     		strb	r2, [r3]
 165:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	char test2[]="Display - test";
 880              		.loc 1 165 0
 881 0302 0C23     		movs	r3, #12
 882 0304 FB18     		adds	r3, r7, r3
 883 0306 1B4A     		ldr	r2, .L44+4
 884 0308 23CA     		ldmia	r2!, {r0, r1, r5}
 885 030a 23C3     		stmia	r3!, {r0, r1, r5}
 886 030c 1188     		ldrh	r1, [r2]
 887 030e 1980     		strh	r1, [r3]
 888 0310 9278     		ldrb	r2, [r2, #2]
 889 0312 9A70     		strb	r2, [r3, #2]
 166:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	
 167:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	init_app();
 890              		.loc 1 167 0
 891 0314 FFF7FEFF 		bl	init_app
 168:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_init();
 892              		.loc 1 168 0
 893 0318 FFF7FEFF 		bl	ascii_init
 169:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_gotoxy(1,1);
 894              		.loc 1 169 0
 895 031c 0121     		movs	r1, #1
 896 031e 0120     		movs	r0, #1
 897 0320 FFF7FEFF 		bl	ascii_gotoxy
 170:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	s=test1;
 898              		.loc 1 170 0
 899 0324 3B19     		adds	r3, r7, r4
 900 0326 FB62     		str	r3, [r7, #44]
 171:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	while(*s)
 901              		.loc 1 171 0
 902 0328 06E0     		b	.L39
 903              	.L40:
 172:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	{
 173:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 		ascii_write_char(*s++);
 904              		.loc 1 173 0
 905 032a FB6A     		ldr	r3, [r7, #44]
 906 032c 5A1C     		adds	r2, r3, #1
 907 032e FA62     		str	r2, [r7, #44]
 908 0330 1B78     		ldrb	r3, [r3]
 909 0332 1800     		movs	r0, r3
 910 0334 FFF7FEFF 		bl	ascii_write_char
 911              	.L39:
 171:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	while(*s)
 912              		.loc 1 171 0
 913 0338 FB6A     		ldr	r3, [r7, #44]
 914 033a 1B78     		ldrb	r3, [r3]
 915 033c 002B     		cmp	r3, #0
 916 033e F4D1     		bne	.L40
 174:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	}
 175:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	
 176:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	ascii_gotoxy(1,2);
 917              		.loc 1 176 0
 918 0340 0221     		movs	r1, #2
 919 0342 0120     		movs	r0, #1
 920 0344 FFF7FEFF 		bl	ascii_gotoxy
 177:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	s = test2;
 921              		.loc 1 177 0
 922 0348 0C23     		movs	r3, #12
 923 034a FB18     		adds	r3, r7, r3
 924 034c FB62     		str	r3, [r7, #44]
 178:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	while(*s){
 925              		.loc 1 178 0
 926 034e 06E0     		b	.L41
 927              	.L42:
 179:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 		ascii_write_char(*s++);
 928              		.loc 1 179 0
 929 0350 FB6A     		ldr	r3, [r7, #44]
 930 0352 5A1C     		adds	r2, r3, #1
 931 0354 FA62     		str	r2, [r7, #44]
 932 0356 1B78     		ldrb	r3, [r3]
 933 0358 1800     		movs	r0, r3
 934 035a FFF7FEFF 		bl	ascii_write_char
 935              	.L41:
 178:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	while(*s){
 936              		.loc 1 178 0
 937 035e FB6A     		ldr	r3, [r7, #44]
 938 0360 1B78     		ldrb	r3, [r3]
 939 0362 002B     		cmp	r3, #0
 940 0364 F4D1     		bne	.L42
 180:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	}
 181:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** 	return 0;
 941              		.loc 1 181 0
 942 0366 0023     		movs	r3, #0
 182:C:/Users/heinl/Documents/Moplaborationer/asciidisplay\startup.c **** }
 943              		.loc 1 182 0
 944 0368 1800     		movs	r0, r3
 945 036a BD46     		mov	sp, r7
 946 036c 0CB0     		add	sp, sp, #48
 947              		@ sp needed
 948 036e B0BD     		pop	{r4, r5, r7, pc}
 949              	.L45:
 950              		.align	2
 951              	.L44:
 952 0370 00000000 		.word	.LC0
 953 0374 10000000 		.word	.LC2
 954              		.cfi_endproc
 955              	.LFE18:
 957              	.Letext0:
