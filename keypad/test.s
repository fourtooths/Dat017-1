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
  25              		.file 1 "C:/Users/heinl/Documents/Moplaborationer/keypad/startup.c"
   1:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** /*
   2:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c ****  * 	startup.c
   3:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c ****  *
   4:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c ****  */
   5:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** #define GPIO_D 0x40020c00 /* MD407 port E */
   6:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 
   7:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
   8:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
   9:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
  10:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
  11:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
  12:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
  13:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15)) 
  14:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** //#define GPIO_ODR_LOW ((volatile unsigned char *)0x40020c14) //Inte säker om detta är rätt 
  15:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 
  16:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  17:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 
  18:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** void startup ( void )
  19:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** {
  26              		.loc 1 19 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  20:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** __asm volatile(
  31              		.loc 1 20 0
  32              		.syntax divided
  33              	@ 20 "C:/Users/heinl/Documents/Moplaborationer/keypad/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  21:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  22:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	" MOV SP,R0\n"
  23:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	" BL main\n"				/* call main */
  24:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	"_exit: B .\n"				/* never return */
  25:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	) ;
  26:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** }
  40              		.loc 1 26 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	app_init
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	app_init:
  56              	.LFB1:
  27:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 
  28:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** void app_init(void)
  29:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** {
  57              		.loc 1 29 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  30:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	/*
  31:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	__asm (
  32:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	"ldr r1,=0x00005555 \n"
  33:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	"ldr r0, =0x40020c00 \n"
  34:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	"str r1,[r0] \n"	
  35:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	)
  36:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** */ 
  37:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	*GPIO_MODER = 0x55005555;
  67              		.loc 1 37 0
  68 0004 054B     		ldr	r3, .L3
  69 0006 064A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  38:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	*GPIO_OTYPER = 0x0000;
  71              		.loc 1 38 0
  72 000a 064B     		ldr	r3, .L3+8
  73 000c 0022     		movs	r2, #0
  74 000e 1A80     		strh	r2, [r3]
  39:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	//int i = *GPIO_PUPDR;
  40:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	*GPIO_PUPDR = 0x55aa0000;
  75              		.loc 1 40 0
  76 0010 054B     		ldr	r3, .L3+12
  77 0012 064A     		ldr	r2, .L3+16
  78 0014 1A60     		str	r2, [r3]
  41:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** }
  79              		.loc 1 41 0
  80 0016 C046     		nop
  81 0018 BD46     		mov	sp, r7
  82              		@ sp needed
  83 001a 80BD     		pop	{r7, pc}
  84              	.L4:
  85              		.align	2
  86              	.L3:
  87 001c 000C0240 		.word	1073875968
  88 0020 55550055 		.word	1426085205
  89 0024 040C0240 		.word	1073875972
  90 0028 0C0C0240 		.word	1073875980
  91 002c 0000AA55 		.word	1437204480
  92              		.cfi_endproc
  93              	.LFE1:
  95              		.align	1
  96              		.global	kbdActive
  97              		.syntax unified
  98              		.code	16
  99              		.thumb_func
 100              		.fpu softvfp
 102              	kbdActive:
 103              	.LFB2:
  42:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 
  43:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** void kbdActive(unsigned char row)
  44:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** {
 104              		.loc 1 44 0
 105              		.cfi_startproc
 106              		@ args = 0, pretend = 0, frame = 8
 107              		@ frame_needed = 1, uses_anonymous_args = 0
 108 0030 80B5     		push	{r7, lr}
 109              		.cfi_def_cfa_offset 8
 110              		.cfi_offset 7, -8
 111              		.cfi_offset 14, -4
 112 0032 82B0     		sub	sp, sp, #8
 113              		.cfi_def_cfa_offset 16
 114 0034 00AF     		add	r7, sp, #0
 115              		.cfi_def_cfa_register 7
 116 0036 0200     		movs	r2, r0
 117 0038 FB1D     		adds	r3, r7, #7
 118 003a 1A70     		strb	r2, [r3]
  45:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	switch(row){
 119              		.loc 1 45 0
 120 003c FB1D     		adds	r3, r7, #7
 121 003e 1B78     		ldrb	r3, [r3]
 122 0040 022B     		cmp	r3, #2
 123 0042 0CD0     		beq	.L7
 124 0044 02DC     		bgt	.L8
 125 0046 012B     		cmp	r3, #1
 126 0048 05D0     		beq	.L9
 127 004a 14E0     		b	.L6
 128              	.L8:
 129 004c 032B     		cmp	r3, #3
 130 004e 0AD0     		beq	.L10
 131 0050 042B     		cmp	r3, #4
 132 0052 0CD0     		beq	.L11
 133 0054 0FE0     		b	.L6
 134              	.L9:
  46:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		case 1: *GPIO_ODR_HIGH = 0x10; break;
 135              		.loc 1 46 0
 136 0056 0B4B     		ldr	r3, .L13
 137 0058 1022     		movs	r2, #16
 138 005a 1A70     		strb	r2, [r3]
 139 005c 0EE0     		b	.L12
 140              	.L7:
  47:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		case 2: *GPIO_ODR_HIGH = 0x20; break;
 141              		.loc 1 47 0
 142 005e 094B     		ldr	r3, .L13
 143 0060 2022     		movs	r2, #32
 144 0062 1A70     		strb	r2, [r3]
 145 0064 0AE0     		b	.L12
 146              	.L10:
  48:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		case 3: *GPIO_ODR_HIGH = 0x40; break;
 147              		.loc 1 48 0
 148 0066 074B     		ldr	r3, .L13
 149 0068 4022     		movs	r2, #64
 150 006a 1A70     		strb	r2, [r3]
 151 006c 06E0     		b	.L12
 152              	.L11:
  49:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		case 4: *GPIO_ODR_HIGH = 0x80; break;
 153              		.loc 1 49 0
 154 006e 054B     		ldr	r3, .L13
 155 0070 8022     		movs	r2, #128
 156 0072 1A70     		strb	r2, [r3]
 157 0074 02E0     		b	.L12
 158              	.L6:
  50:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		default: *GPIO_ODR_HIGH = 0;
 159              		.loc 1 50 0
 160 0076 034B     		ldr	r3, .L13
 161 0078 0022     		movs	r2, #0
 162 007a 1A70     		strb	r2, [r3]
 163              	.L12:
  51:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 
  52:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	}
  53:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** }
 164              		.loc 1 53 0
 165 007c C046     		nop
 166 007e BD46     		mov	sp, r7
 167 0080 02B0     		add	sp, sp, #8
 168              		@ sp needed
 169 0082 80BD     		pop	{r7, pc}
 170              	.L14:
 171              		.align	2
 172              	.L13:
 173 0084 150C0240 		.word	1073875989
 174              		.cfi_endproc
 175              	.LFE2:
 177              		.align	1
 178              		.global	kbdGetCol
 179              		.syntax unified
 180              		.code	16
 181              		.thumb_func
 182              		.fpu softvfp
 184              	kbdGetCol:
 185              	.LFB3:
  54:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 
  55:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** unsigned char kbdGetCol(void)
  56:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** {
 186              		.loc 1 56 0
 187              		.cfi_startproc
 188              		@ args = 0, pretend = 0, frame = 8
 189              		@ frame_needed = 1, uses_anonymous_args = 0
 190 0088 80B5     		push	{r7, lr}
 191              		.cfi_def_cfa_offset 8
 192              		.cfi_offset 7, -8
 193              		.cfi_offset 14, -4
 194 008a 82B0     		sub	sp, sp, #8
 195              		.cfi_def_cfa_offset 16
 196 008c 00AF     		add	r7, sp, #0
 197              		.cfi_def_cfa_register 7
  57:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	unsigned char c = *GPIO_IDR_HIGH;
 198              		.loc 1 57 0
 199 008e 124A     		ldr	r2, .L21
 200 0090 FB1D     		adds	r3, r7, #7
 201 0092 1278     		ldrb	r2, [r2]
 202 0094 1A70     		strb	r2, [r3]
  58:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	
  59:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	if(c&0x8) return 4;
 203              		.loc 1 59 0
 204 0096 FB1D     		adds	r3, r7, #7
 205 0098 1B78     		ldrb	r3, [r3]
 206 009a 0822     		movs	r2, #8
 207 009c 1340     		ands	r3, r2
 208 009e 01D0     		beq	.L16
 209              		.loc 1 59 0 is_stmt 0 discriminator 1
 210 00a0 0423     		movs	r3, #4
 211 00a2 15E0     		b	.L17
 212              	.L16:
  60:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	if(c&0x4) return 3;
 213              		.loc 1 60 0 is_stmt 1
 214 00a4 FB1D     		adds	r3, r7, #7
 215 00a6 1B78     		ldrb	r3, [r3]
 216 00a8 0422     		movs	r2, #4
 217 00aa 1340     		ands	r3, r2
 218 00ac 01D0     		beq	.L18
 219              		.loc 1 60 0 is_stmt 0 discriminator 1
 220 00ae 0323     		movs	r3, #3
 221 00b0 0EE0     		b	.L17
 222              	.L18:
  61:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	if(c&0x2) return 2;
 223              		.loc 1 61 0 is_stmt 1
 224 00b2 FB1D     		adds	r3, r7, #7
 225 00b4 1B78     		ldrb	r3, [r3]
 226 00b6 0222     		movs	r2, #2
 227 00b8 1340     		ands	r3, r2
 228 00ba 01D0     		beq	.L19
 229              		.loc 1 61 0 is_stmt 0 discriminator 1
 230 00bc 0223     		movs	r3, #2
 231 00be 07E0     		b	.L17
 232              	.L19:
  62:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	if(c&0x1) return 1;
 233              		.loc 1 62 0 is_stmt 1
 234 00c0 FB1D     		adds	r3, r7, #7
 235 00c2 1B78     		ldrb	r3, [r3]
 236 00c4 0122     		movs	r2, #1
 237 00c6 1340     		ands	r3, r2
 238 00c8 01D0     		beq	.L20
 239              		.loc 1 62 0 is_stmt 0 discriminator 1
 240 00ca 0123     		movs	r3, #1
 241 00cc 00E0     		b	.L17
 242              	.L20:
  63:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	return 0;
 243              		.loc 1 63 0 is_stmt 1
 244 00ce 0023     		movs	r3, #0
 245              	.L17:
  64:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** }
 246              		.loc 1 64 0
 247 00d0 1800     		movs	r0, r3
 248 00d2 BD46     		mov	sp, r7
 249 00d4 02B0     		add	sp, sp, #8
 250              		@ sp needed
 251 00d6 80BD     		pop	{r7, pc}
 252              	.L22:
 253              		.align	2
 254              	.L21:
 255 00d8 110C0240 		.word	1073875985
 256              		.cfi_endproc
 257              	.LFE3:
 259              		.section	.rodata
 260              		.align	2
 261              	.LC0:
 262 0000 01       		.byte	1
 263 0001 02       		.byte	2
 264 0002 03       		.byte	3
 265 0003 0A       		.byte	10
 266 0004 04       		.byte	4
 267 0005 05       		.byte	5
 268 0006 06       		.byte	6
 269 0007 0B       		.byte	11
 270 0008 07       		.byte	7
 271 0009 08       		.byte	8
 272 000a 09       		.byte	9
 273 000b 0C       		.byte	12
 274 000c 0E       		.byte	14
 275 000d 00       		.byte	0
 276 000e 0F       		.byte	15
 277 000f 0D       		.byte	13
 278              		.text
 279              		.align	1
 280              		.global	keyb
 281              		.syntax unified
 282              		.code	16
 283              		.thumb_func
 284              		.fpu softvfp
 286              	keyb:
 287              	.LFB4:
  65:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 
  66:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** unsigned char keyb(void)
  67:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** {
 288              		.loc 1 67 0
 289              		.cfi_startproc
 290              		@ args = 0, pretend = 0, frame = 24
 291              		@ frame_needed = 1, uses_anonymous_args = 0
 292 00dc B0B5     		push	{r4, r5, r7, lr}
 293              		.cfi_def_cfa_offset 16
 294              		.cfi_offset 4, -16
 295              		.cfi_offset 5, -12
 296              		.cfi_offset 7, -8
 297              		.cfi_offset 14, -4
 298 00de 86B0     		sub	sp, sp, #24
 299              		.cfi_def_cfa_offset 40
 300 00e0 00AF     		add	r7, sp, #0
 301              		.cfi_def_cfa_register 7
  68:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	unsigned char row, col;
  69:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE, 0, 0xF, 0xD};
 302              		.loc 1 69 0
 303 00e2 3B1D     		adds	r3, r7, #4
 304 00e4 1E4A     		ldr	r2, .L29
 305 00e6 13CA     		ldmia	r2!, {r0, r1, r4}
 306 00e8 13C3     		stmia	r3!, {r0, r1, r4}
 307 00ea 1268     		ldr	r2, [r2]
 308 00ec 1A60     		str	r2, [r3]
  70:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	for(row=1; row<=4; row++){
 309              		.loc 1 70 0
 310 00ee 1723     		movs	r3, #23
 311 00f0 FB18     		adds	r3, r7, r3
 312 00f2 0122     		movs	r2, #1
 313 00f4 1A70     		strb	r2, [r3]
 314 00f6 25E0     		b	.L24
 315              	.L27:
  71:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		kbdActive(row);
 316              		.loc 1 71 0
 317 00f8 1723     		movs	r3, #23
 318 00fa FB18     		adds	r3, r7, r3
 319 00fc 1B78     		ldrb	r3, [r3]
 320 00fe 1800     		movs	r0, r3
 321 0100 FFF7FEFF 		bl	kbdActive
  72:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		
  73:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		if(col=kbdGetCol()){
 322              		.loc 1 73 0
 323 0104 1625     		movs	r5, #22
 324 0106 7C19     		adds	r4, r7, r5
 325 0108 FFF7FEFF 		bl	kbdGetCol
 326 010c 0300     		movs	r3, r0
 327 010e 2370     		strb	r3, [r4]
 328 0110 7B19     		adds	r3, r7, r5
 329 0112 1B78     		ldrb	r3, [r3]
 330 0114 002B     		cmp	r3, #0
 331 0116 0FD0     		beq	.L25
  74:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 			kbdActive(0);
 332              		.loc 1 74 0
 333 0118 0020     		movs	r0, #0
 334 011a FFF7FEFF 		bl	kbdActive
  75:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 			
  76:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 			return key[(row-1)*4+(col-1)];
 335              		.loc 1 76 0
 336 011e 1723     		movs	r3, #23
 337 0120 FB18     		adds	r3, r7, r3
 338 0122 1B78     		ldrb	r3, [r3]
 339 0124 013B     		subs	r3, r3, #1
 340 0126 9A00     		lsls	r2, r3, #2
 341 0128 1623     		movs	r3, #22
 342 012a FB18     		adds	r3, r7, r3
 343 012c 1B78     		ldrb	r3, [r3]
 344 012e 013B     		subs	r3, r3, #1
 345 0130 D318     		adds	r3, r2, r3
 346 0132 3A1D     		adds	r2, r7, #4
 347 0134 D35C     		ldrb	r3, [r2, r3]
 348 0136 0EE0     		b	.L28
 349              	.L25:
  70:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		kbdActive(row);
 350              		.loc 1 70 0 discriminator 2
 351 0138 1721     		movs	r1, #23
 352 013a 7B18     		adds	r3, r7, r1
 353 013c 1A78     		ldrb	r2, [r3]
 354 013e 7B18     		adds	r3, r7, r1
 355 0140 0132     		adds	r2, r2, #1
 356 0142 1A70     		strb	r2, [r3]
 357              	.L24:
  70:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		kbdActive(row);
 358              		.loc 1 70 0 is_stmt 0 discriminator 1
 359 0144 1723     		movs	r3, #23
 360 0146 FB18     		adds	r3, r7, r3
 361 0148 1B78     		ldrb	r3, [r3]
 362 014a 042B     		cmp	r3, #4
 363 014c D4D9     		bls	.L27
  77:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		}
  78:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	}
  79:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	kbdActive(0);
 364              		.loc 1 79 0 is_stmt 1
 365 014e 0020     		movs	r0, #0
 366 0150 FFF7FEFF 		bl	kbdActive
  80:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	return 0xff;
 367              		.loc 1 80 0
 368 0154 FF23     		movs	r3, #255
 369              	.L28:
  81:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** }
 370              		.loc 1 81 0 discriminator 1
 371 0156 1800     		movs	r0, r3
 372 0158 BD46     		mov	sp, r7
 373 015a 06B0     		add	sp, sp, #24
 374              		@ sp needed
 375 015c B0BD     		pop	{r4, r5, r7, pc}
 376              	.L30:
 377 015e C046     		.align	2
 378              	.L29:
 379 0160 00000000 		.word	.LC0
 380              		.cfi_endproc
 381              	.LFE4:
 383              		.section	.rodata
 384              		.align	2
 385              	.LC1:
 386 0010 3F       		.byte	63
 387 0011 06       		.byte	6
 388 0012 5B       		.byte	91
 389 0013 4F       		.byte	79
 390 0014 66       		.byte	102
 391 0015 6D       		.byte	109
 392 0016 7D       		.byte	125
 393 0017 07       		.byte	7
 394 0018 7F       		.byte	127
 395 0019 6F       		.byte	111
 396 001a 77       		.byte	119
 397 001b 7C       		.byte	124
 398 001c 39       		.byte	57
 399 001d 5E       		.byte	94
 400 001e 79       		.byte	121
 401 001f 71       		.byte	113
 402              		.text
 403              		.align	1
 404              		.global	out7seg
 405              		.syntax unified
 406              		.code	16
 407              		.thumb_func
 408              		.fpu softvfp
 410              	out7seg:
 411              	.LFB5:
  82:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 
  83:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** void out7seg(unsigned char c)
  84:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** {
 412              		.loc 1 84 0
 413              		.cfi_startproc
 414              		@ args = 0, pretend = 0, frame = 24
 415              		@ frame_needed = 1, uses_anonymous_args = 0
 416 0164 90B5     		push	{r4, r7, lr}
 417              		.cfi_def_cfa_offset 12
 418              		.cfi_offset 4, -12
 419              		.cfi_offset 7, -8
 420              		.cfi_offset 14, -4
 421 0166 87B0     		sub	sp, sp, #28
 422              		.cfi_def_cfa_offset 40
 423 0168 00AF     		add	r7, sp, #0
 424              		.cfi_def_cfa_register 7
 425 016a 0200     		movs	r2, r0
 426 016c FB1D     		adds	r3, r7, #7
 427 016e 1A70     		strb	r2, [r3]
  85:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	unsigned char segcode[]={0x3f, 0x06, 0x5B, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f, 0x77, 0x7c, 0
 428              		.loc 1 85 0
 429 0170 0823     		movs	r3, #8
 430 0172 FB18     		adds	r3, r7, r3
 431 0174 0B4A     		ldr	r2, .L35
 432 0176 13CA     		ldmia	r2!, {r0, r1, r4}
 433 0178 13C3     		stmia	r3!, {r0, r1, r4}
 434 017a 1268     		ldr	r2, [r2]
 435 017c 1A60     		str	r2, [r3]
  86:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	if (c<16){
 436              		.loc 1 86 0
 437 017e FB1D     		adds	r3, r7, #7
 438 0180 1B78     		ldrb	r3, [r3]
 439 0182 0F2B     		cmp	r3, #15
 440 0184 07D8     		bhi	.L32
  87:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		*GPIO_ODR_LOW=segcode[c];
 441              		.loc 1 87 0
 442 0186 FB1D     		adds	r3, r7, #7
 443 0188 1B78     		ldrb	r3, [r3]
 444 018a 0749     		ldr	r1, .L35+4
 445 018c 0822     		movs	r2, #8
 446 018e BA18     		adds	r2, r7, r2
 447 0190 D35C     		ldrb	r3, [r2, r3]
 448 0192 0B70     		strb	r3, [r1]
  88:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	}
  89:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	else{
  90:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		*GPIO_ODR_LOW=0;
  91:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		}	
  92:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** }
 449              		.loc 1 92 0
 450 0194 02E0     		b	.L34
 451              	.L32:
  90:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		}	
 452              		.loc 1 90 0
 453 0196 044B     		ldr	r3, .L35+4
 454 0198 0022     		movs	r2, #0
 455 019a 1A70     		strb	r2, [r3]
 456              	.L34:
 457              		.loc 1 92 0
 458 019c C046     		nop
 459 019e BD46     		mov	sp, r7
 460 01a0 07B0     		add	sp, sp, #28
 461              		@ sp needed
 462 01a2 90BD     		pop	{r4, r7, pc}
 463              	.L36:
 464              		.align	2
 465              	.L35:
 466 01a4 10000000 		.word	.LC1
 467 01a8 140C0240 		.word	1073875988
 468              		.cfi_endproc
 469              	.LFE5:
 471              		.align	1
 472              		.global	main
 473              		.syntax unified
 474              		.code	16
 475              		.thumb_func
 476              		.fpu softvfp
 478              	main:
 479              	.LFB6:
  93:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 
  94:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** void main(void)
  95:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** {
 480              		.loc 1 95 0
 481              		.cfi_startproc
 482              		@ args = 0, pretend = 0, frame = 8
 483              		@ frame_needed = 1, uses_anonymous_args = 0
 484 01ac 80B5     		push	{r7, lr}
 485              		.cfi_def_cfa_offset 8
 486              		.cfi_offset 7, -8
 487              		.cfi_offset 14, -4
 488 01ae 82B0     		sub	sp, sp, #8
 489              		.cfi_def_cfa_offset 16
 490 01b0 00AF     		add	r7, sp, #0
 491              		.cfi_def_cfa_register 7
  96:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	unsigned char c = 0xa;
 492              		.loc 1 96 0
 493 01b2 FB1D     		adds	r3, r7, #7
 494 01b4 0A22     		movs	r2, #10
 495 01b6 1A70     		strb	r2, [r3]
  97:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	app_init();
 496              		.loc 1 97 0
 497 01b8 FFF7FEFF 		bl	app_init
 498              	.L38:
  98:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 	while(1){
  99:C:/Users/heinl/Documents/Moplaborationer/keypad\startup.c **** 		out7seg(keyb());
 499              		.loc 1 99 0 discriminator 1
 500 01bc FFF7FEFF 		bl	keyb
 501 01c0 0300     		movs	r3, r0
 502 01c2 1800     		movs	r0, r3
 503 01c4 FFF7FEFF 		bl	out7seg
 504 01c8 F8E7     		b	.L38
 505              		.cfi_endproc
 506              	.LFE6:
 508              	.Letext0:
