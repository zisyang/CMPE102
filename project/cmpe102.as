opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F628A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 9 "C:\Dropbox\CMPE102\project\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 9 "C:\Dropbox\CMPE102\project\main.c"
	dw 0x3F10 ;#
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_clear
	FNCALL	_main,_DelayMs
	FNCALL	_main,_DS1820_InitTemp
	FNCALL	_main,_lcd_puts
	FNCALL	_main,_DS1820_GetTemp
	FNCALL	_main,_lcd_goto
	FNCALL	_main,___lwdiv
	FNCALL	_main,_disp
	FNCALL	_main,___wmul
	FNCALL	_disp,_long_to_string
	FNCALL	_disp,_lcd_puts
	FNCALL	_long_to_string,_long_to_string_lz
	FNCALL	_DS1820_GetTemp,_DS1820_Write
	FNCALL	_DS1820_GetTemp,_DS1820_Read
	FNCALL	_DS1820_InitTemp,_DS1820_Write
	FNCALL	_lcd_init,_DelayMs
	FNCALL	_lcd_init,_lcd_write
	FNCALL	_lcd_goto,_lcd_write
	FNCALL	_lcd_clear,_lcd_write
	FNCALL	_lcd_clear,_DelayMs
	FNCALL	_lcd_puts,_lcd_write
	FNCALL	_long_to_string_lz,___lwmod
	FNCALL	_long_to_string_lz,___lwdiv
	FNROOT	_main
	global	_x
	global	_y
	global	_a
	global	_p
	global	_CMCON
psect	text387,local,class=CODE,delta=2
global __ptext387
__ptext387:
_CMCON	set	31
	global	_PORTB
_PORTB	set	6
	global	_CARRY
_CARRY	set	24
	global	_DQ
_DQ	set	40
	global	_GIE
_GIE	set	95
	global	_LCD_EN
_LCD_EN	set	42
	global	_LCD_RS
_LCD_RS	set	43
	global	_EEADR
_EEADR	set	155
	global	_EECON1
_EECON1	set	156
	global	_EECON2
_EECON2	set	157
	global	_EEDATA
_EEDATA	set	154
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_RD
_RD	set	1248
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISB6
_TRISB6	set	1078
	global	_WR
_WR	set	1249
	global	_WREN
_WREN	set	1250
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_6:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_1:	
	retlw	32	;' '
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	112	;'p'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	117	;'u'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	105	;'i'
	retlw	115	;'s'
	retlw	0
psect	strings
	
STR_4:	
	retlw	94	;'^'
	retlw	67	;'C'
	retlw	32	;' '
	retlw	40	;'('
	retlw	0
psect	strings
	
STR_5:	
	retlw	94	;'^'
	retlw	70	;'F'
	retlw	41	;')'
	retlw	0
psect	strings
	
STR_3:	
	retlw	46	;'.'
	retlw	48	;'0'
	retlw	0
psect	strings
	
STR_2:	
	retlw	46	;'.'
	retlw	53	;'5'
	retlw	0
psect	strings
	file	"cmpe102.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_x:
       ds      2

_y:
       ds      2

_a:
       ds      1

_p:
       ds      7

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+0Ch)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_DS1820_Write
?_DS1820_Write:	; 0 bytes @ 0x0
	global	??_DS1820_Write
??_DS1820_Write:	; 0 bytes @ 0x0
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x0
	global	?_lcd_write
?_lcd_write:	; 0 bytes @ 0x0
	global	??_lcd_write
??_lcd_write:	; 0 bytes @ 0x0
	global	?_lcd_clear
?_lcd_clear:	; 0 bytes @ 0x0
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_DS1820_InitTemp
?_DS1820_InitTemp:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_DS1820_Read
?_DS1820_Read:	; 2 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x1
	global	lcd_write@_dcnt
lcd_write@_dcnt:	; 1 bytes @ 0x1
	ds	1
	global	??_DS1820_Read
??_DS1820_Read:	; 0 bytes @ 0x2
	global	DelayMs@i
DelayMs@i:	; 1 bytes @ 0x2
	global	lcd_write@c
lcd_write@c:	; 1 bytes @ 0x2
	global	DS1820_Write@_dcnt
DS1820_Write@_dcnt:	; 1 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	?_lcd_puts
?_lcd_puts:	; 0 bytes @ 0x3
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x3
	global	DelayMs@_dcnt
DelayMs@_dcnt:	; 1 bytes @ 0x3
	global	lcd_goto@pos
lcd_goto@pos:	; 1 bytes @ 0x3
	global	DS1820_Write@Data
DS1820_Write@Data:	; 1 bytes @ 0x3
	global	lcd_puts@s
lcd_puts@s:	; 2 bytes @ 0x3
	ds	1
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x4
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x4
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	DS1820_Write@i
DS1820_Write@i:	; 1 bytes @ 0x4
	global	DS1820_Read@Data
DS1820_Read@Data:	; 2 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	1
	global	??_lcd_puts
??_lcd_puts:	; 0 bytes @ 0x5
	global	??_DS1820_InitTemp
??_DS1820_InitTemp:	; 0 bytes @ 0x5
	global	lcd_init@_dcnt
lcd_init@_dcnt:	; 1 bytes @ 0x5
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x6
	global	lcd_init@_dcnt_690
lcd_init@_dcnt_690:	; 1 bytes @ 0x6
	global	DS1820_Read@_dcnt
DS1820_Read@_dcnt:	; 1 bytes @ 0x6
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x6
	ds	1
	global	DS1820_Read@_dcnt_703
DS1820_Read@_dcnt_703:	; 1 bytes @ 0x7
	ds	1
	global	DS1820_Read@_dcnt_704
DS1820_Read@_dcnt_704:	; 1 bytes @ 0x8
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x8
	ds	1
	global	DS1820_Read@Temp
DS1820_Read@Temp:	; 2 bytes @ 0x9
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0xA
	ds	1
	global	DS1820_Read@i
DS1820_Read@i:	; 1 bytes @ 0xB
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xB
	ds	1
	global	?_DS1820_GetTemp
?_DS1820_GetTemp:	; 2 bytes @ 0xC
	ds	1
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xD
	ds	1
	global	??_DS1820_GetTemp
??_DS1820_GetTemp:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_long_to_string_lz
?_long_to_string_lz:	; 0 bytes @ 0x0
	global	long_to_string_lz@input
long_to_string_lz@input:	; 2 bytes @ 0x0
	global	DS1820_GetTemp@Data
DS1820_GetTemp@Data:	; 2 bytes @ 0x0
	ds	2
	global	long_to_string_lz@str
long_to_string_lz@str:	; 1 bytes @ 0x2
	ds	1
	global	long_to_string_lz@numdigits
long_to_string_lz@numdigits:	; 1 bytes @ 0x3
	ds	1
	global	??_long_to_string_lz
??_long_to_string_lz:	; 0 bytes @ 0x4
	ds	2
	global	long_to_string_lz@digit
long_to_string_lz@digit:	; 1 bytes @ 0x6
	ds	1
	global	?_long_to_string
?_long_to_string:	; 0 bytes @ 0x7
	global	long_to_string@input
long_to_string@input:	; 2 bytes @ 0x7
	ds	2
	global	long_to_string@str
long_to_string@str:	; 1 bytes @ 0x9
	ds	1
	global	long_to_string@numdigits
long_to_string@numdigits:	; 1 bytes @ 0xA
	ds	1
	global	??_long_to_string
??_long_to_string:	; 0 bytes @ 0xB
	ds	2
	global	long_to_string@blank
long_to_string@blank:	; 2 bytes @ 0xD
	ds	2
	global	long_to_string@digit
long_to_string@digit:	; 1 bytes @ 0xF
	ds	1
	global	?_disp
?_disp:	; 0 bytes @ 0x10
	global	disp@i
disp@i:	; 2 bytes @ 0x10
	ds	2
	global	??_disp
??_disp:	; 0 bytes @ 0x12
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x14
	ds	2
;;Data sizes: Strings 47, constant 0, data 0, bss 12, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     22      34
;; BANK1           80      0       0
;; BANK2           48      0       0

;;
;; Pointer list with targets:

;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?_DS1820_Read	int  size(1) Largest target is 0
;;
;; ?_DS1820_GetTemp	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; lcd_puts@s	PTR const unsigned char  size(2) Largest target is 16
;;		 -> STR_6(CODE[16]), STR_5(CODE[4]), STR_4(CODE[5]), STR_3(CODE[3]), 
;;		 -> STR_2(CODE[3]), STR_1(CODE[16]), p(BANK0[7]), 
;;
;; long_to_string_lz@str	PTR unsigned char  size(1) Largest target is 7
;;		 -> p(BANK0[7]), 
;;
;; long_to_string@str	PTR unsigned char  size(1) Largest target is 7
;;		 -> p(BANK0[7]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_DS1820_GetTemp
;;   _main->___lwdiv
;;   _DS1820_GetTemp->_DS1820_Read
;;   _DS1820_InitTemp->_DS1820_Write
;;   _lcd_init->_DelayMs
;;   _lcd_goto->_lcd_write
;;   _lcd_clear->_DelayMs
;;   _lcd_puts->_lcd_write
;;   _long_to_string_lz->___lwdiv
;;   ___lwdiv->___wmul
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_disp
;;   _disp->_long_to_string
;;   _long_to_string->_long_to_string_lz
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0    2155
;;                                             20 BANK0      2     2      0
;;                           _lcd_init
;;                          _lcd_clear
;;                            _DelayMs
;;                    _DS1820_InitTemp
;;                           _lcd_puts
;;                     _DS1820_GetTemp
;;                           _lcd_goto
;;                            ___lwdiv
;;                               _disp
;;                             ___wmul
;; ---------------------------------------------------------------------------------
;; (1) _disp                                                 4     2      2     880
;;                                             16 BANK0      4     2      2
;;                     _long_to_string
;;                           _lcd_puts
;; ---------------------------------------------------------------------------------
;; (2) _long_to_string                                       9     5      4     746
;;                                              7 BANK0      9     5      4
;;                  _long_to_string_lz
;; ---------------------------------------------------------------------------------
;; (1) _DS1820_GetTemp                                       4     2      2     322
;;                                             12 COMMON     2     0      2
;;                                              0 BANK0      2     2      0
;;                       _DS1820_Write
;;                        _DS1820_Read
;; ---------------------------------------------------------------------------------
;; (1) _DS1820_InitTemp                                      0     0      0     114
;;                       _DS1820_Write
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             3     3      0     181
;;                                              4 COMMON     3     3      0
;;                            _DelayMs
;;                          _lcd_write
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             1     1      0      89
;;                                              3 COMMON     1     1      0
;;                          _lcd_write
;; ---------------------------------------------------------------------------------
;; (1) _lcd_clear                                            0     0      0     135
;;                          _lcd_write
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (2) _lcd_puts                                             2     0      2     112
;;                                              3 COMMON     2     0      2
;;                          _lcd_write
;; ---------------------------------------------------------------------------------
;; (3) _long_to_string_lz                                    7     3      4     522
;;                                              0 BANK0      7     3      4
;;                            ___lwmod
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (4) ___lwmod                                              6     2      4     159
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (4) ___lwdiv                                              8     4      4     162
;;                                              6 COMMON     8     4      4
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (2) _DS1820_Read                                         12    10      2     185
;;                                              0 COMMON    12    10      2
;; ---------------------------------------------------------------------------------
;; (2) _DS1820_Write                                         5     5      0     114
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; (3) _lcd_write                                            3     3      0      67
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _DelayMs                                              4     4      0      68
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _DelayMs
;;     _lcd_write
;;   _lcd_clear
;;     _lcd_write
;;     _DelayMs
;;   _DelayMs
;;   _DS1820_InitTemp
;;     _DS1820_Write
;;   _lcd_puts
;;     _lcd_write
;;   _DS1820_GetTemp
;;     _DS1820_Write
;;     _DS1820_Read
;;   _lcd_goto
;;     _lcd_write
;;   ___lwdiv
;;     ___wmul (ARG)
;;   _disp
;;     _long_to_string
;;       _long_to_string_lz
;;         ___lwmod
;;         ___lwdiv
;;           ___wmul (ARG)
;;     _lcd_puts
;;       _lcd_write
;;   ___wmul
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50     16      22       3       42.5%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      30       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK2            30      0       0       8        0.0%
;;BANK2               30      0       0       9        0.0%
;;DATA                 0      0      34      10        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 14 in file "C:\Dropbox\CMPE102\project\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_init
;;		_lcd_clear
;;		_DelayMs
;;		_DS1820_InitTemp
;;		_lcd_puts
;;		_DS1820_GetTemp
;;		_lcd_goto
;;		___lwdiv
;;		_disp
;;		___wmul
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Dropbox\CMPE102\project\main.c"
	line	14
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	15
	
l2680:	
;main.c: 15: TRISB = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	16
	
l2682:	
;main.c: 16: CMCON = 0b00000111;
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	17
	
l2684:	
;main.c: 17: TRISA = 0b11110011;
	movlw	(0F3h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	19
	
l2686:	
;main.c: 19: lcd_init();
	fcall	_lcd_init
	line	20
	
l2688:	
;main.c: 20: lcd_clear();
	fcall	_lcd_clear
	line	21
	
l2690:	
;main.c: 21: DelayMs(250);
	movlw	(0FAh)
	fcall	_DelayMs
	line	24
	
l2692:	
;main.c: 24: DS1820_InitTemp();
	fcall	_DS1820_InitTemp
	line	26
	
l2694:	
;main.c: 26: lcd_puts(" Temperature is");
	movlw	low((STR_1-__stringbase))
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	goto	l2696
	line	27
;main.c: 27: while(1)
	
l488:	
	line	30
	
l2696:	
;main.c: 28: {
;main.c: 30: x=DS1820_GetTemp();
	fcall	_DS1820_GetTemp
	movf	(1+(?_DS1820_GetTemp)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_x+1)
	addwf	(_x+1)
	movf	(0+(?_DS1820_GetTemp)),w
	clrf	(_x)
	addwf	(_x)

	line	31
	
l2698:	
;main.c: 31: lcd_goto(40);
	movlw	(028h)
	fcall	_lcd_goto
	line	32
	
l2700:	
;main.c: 32: y=x/20;
	movlw	low(014h)
	movwf	(?___lwdiv)
	movlw	high(014h)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_x),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_y+1)
	addwf	(_y+1)
	movf	(0+(?___lwdiv)),w
	clrf	(_y)
	addwf	(_y)

	line	33
	
l2702:	
;main.c: 33: disp(y);
	movf	(_y+1),w
	clrf	(?_disp+1)
	addwf	(?_disp+1)
	movf	(_y),w
	clrf	(?_disp)
	addwf	(?_disp)

	fcall	_disp
	line	34
	
l2704:	
;main.c: 34: if(y*2<x)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_y+1),w
	movwf	(??_main+0)+0+1
	movf	(_y),w
	movwf	(??_main+0)+0
	movlw	01h
	movwf	btemp+1
u2915:
	clrc
	rlf	(??_main+0)+0,f
	rlf	(??_main+0)+1,f
	decfsz	btemp+1,f
	goto	u2915
	movf	(_x+1),w
	subwf	1+(??_main+0)+0,w
	skipz
	goto	u2925
	movf	(_x),w
	subwf	0+(??_main+0)+0,w
u2925:
	skipnc
	goto	u2921
	goto	u2920
u2921:
	goto	l2708
u2920:
	line	35
	
l2706:	
;main.c: 35: lcd_puts(".5");
	movlw	low((STR_2-__stringbase))
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	goto	l490
	line	36
	
l489:	
	line	37
	
l2708:	
;main.c: 36: else
;main.c: 37: lcd_puts(".0");
	movlw	low((STR_3-__stringbase))
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	
l490:	
	line	38
;main.c: 38: lcd_puts("^C (");
	movlw	low((STR_4-__stringbase))
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	39
	
l2710:	
;main.c: 39: y = (y * 9/5)+32;
	movlw	low(05h)
	movwf	(?___lwdiv)
	movlw	high(05h)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_y+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_y),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(09h)
	movwf	0+(?___wmul)+02h
	movlw	high(09h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	low(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_y)
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(020h)
	movwf	1+(_y)
	line	40
	
l2712:	
;main.c: 40: disp(y);
	movf	(_y+1),w
	clrf	(?_disp+1)
	addwf	(?_disp+1)
	movf	(_y),w
	clrf	(?_disp)
	addwf	(?_disp)

	fcall	_disp
	line	41
	
l2714:	
;main.c: 41: lcd_puts("^F)");
	movlw	low((STR_5-__stringbase))
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	42
	
l2716:	
;main.c: 42: DelayMs(250);
	movlw	(0FAh)
	fcall	_DelayMs
	line	47
	
l2718:	
;main.c: 47: lcd_goto(40);
	movlw	(028h)
	fcall	_lcd_goto
	line	48
	
l2720:	
;main.c: 48: lcd_puts("               ");
	movlw	low((STR_6-__stringbase))
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	49
;main.c: 49: DS1820_InitTemp();
	fcall	_DS1820_InitTemp
	line	50
;main.c: 50: DelayMs(250);
	movlw	(0FAh)
	fcall	_DelayMs
	goto	l2696
	line	52
	
l491:	
	line	27
	goto	l2696
	
l492:	
	line	53
	
l493:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_disp
psect	text388,local,class=CODE,delta=2
global __ptext388
__ptext388:

;; *************** function _disp *****************
;; Defined at:
;;		line 84 in file "C:\Dropbox\CMPE102\project\lcd.c"
;; Parameters:    Size  Location     Type
;;  i               2   16[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_long_to_string
;;		_lcd_puts
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text388
	file	"C:\Dropbox\CMPE102\project\lcd.c"
	line	84
	global	__size_of_disp
	__size_of_disp	equ	__end_of_disp-_disp
	
_disp:	
	opt	stack 4
; Regs used in _disp: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	85
	
l2676:	
;lcd.c: 85: long_to_string (i, p, 3);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(disp@i+1),w
	clrf	(?_long_to_string+1)
	addwf	(?_long_to_string+1)
	movf	(disp@i),w
	clrf	(?_long_to_string)
	addwf	(?_long_to_string)

	movlw	(_p)&0ffh
	movwf	(??_disp+0)+0
	movf	(??_disp+0)+0,w
	movwf	(0+?_long_to_string+02h)
	movlw	(03h)
	movwf	(??_disp+1)+0
	movf	(??_disp+1)+0,w
	movwf	0+(?_long_to_string)+03h
	fcall	_long_to_string
	line	87
	
l2678:	
;lcd.c: 87: lcd_puts(p);
	movlw	(_p&0ffh)
	movwf	(?_lcd_puts)
	movlw	(0x0/2)
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	88
	
l423:	
	return
	opt stack 0
GLOBAL	__end_of_disp
	__end_of_disp:
;; =============== function _disp ends ============

	signat	_disp,4216
	global	_long_to_string
psect	text389,local,class=CODE,delta=2
global __ptext389
__ptext389:

;; *************** function _long_to_string *****************
;; Defined at:
;;		line 42 in file "C:\Dropbox\CMPE102\project\lcd.c"
;; Parameters:    Size  Location     Type
;;  input           2    7[BANK0 ] unsigned int 
;;  str             1    9[BANK0 ] PTR unsigned char 
;;		 -> p(7), 
;;  numdigits       1   10[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  blank           2   13[BANK0 ] int 
;;  digit           1   15[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       9       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_long_to_string_lz
;; This function is called by:
;;		_disp
;; This function uses a non-reentrant model
;;
psect	text389
	file	"C:\Dropbox\CMPE102\project\lcd.c"
	line	42
	global	__size_of_long_to_string
	__size_of_long_to_string	equ	__end_of_long_to_string-_long_to_string
	
_long_to_string:	
	opt	stack 4
; Regs used in _long_to_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	44
	
l2658:	
;lcd.c: 43: char digit;
;lcd.c: 44: int blank = 1;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(long_to_string@blank)
	movlw	high(01h)
	movwf	((long_to_string@blank))+1
	line	45
	
l2660:	
;lcd.c: 45: long_to_string_lz(input, str, numdigits);
	movf	(long_to_string@input+1),w
	clrf	(?_long_to_string_lz+1)
	addwf	(?_long_to_string_lz+1)
	movf	(long_to_string@input),w
	clrf	(?_long_to_string_lz)
	addwf	(?_long_to_string_lz)

	movf	(long_to_string@str),w
	movwf	(??_long_to_string+0)+0
	movf	(??_long_to_string+0)+0,w
	movwf	(0+?_long_to_string_lz+02h)
	movf	(long_to_string@numdigits),w
	movwf	(??_long_to_string+1)+0
	movf	(??_long_to_string+1)+0,w
	movwf	0+(?_long_to_string_lz)+03h
	fcall	_long_to_string_lz
	line	46
	
l2662:	
;lcd.c: 46: for (digit=0; digit < numdigits-1; digit++) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(long_to_string@digit)
	goto	l2674
	
l410:	
	line	47
	
l2664:	
;lcd.c: 47: if (str[digit] == '0') {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(long_to_string@digit),w
	addwf	(long_to_string@str),w
	movwf	(??_long_to_string+0)+0
	movf	0+(??_long_to_string+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorlw	030h
	skipz
	goto	u2881
	goto	u2880
u2881:
	goto	l2670
u2880:
	line	48
	
l2666:	
;lcd.c: 48: if (blank == 1) str[digit] = ' ';
	movlw	01h
	xorwf	(long_to_string@blank),w
	iorwf	(long_to_string@blank+1),w
	skipz
	goto	u2891
	goto	u2890
u2891:
	goto	l2672
u2890:
	
l2668:	
	movlw	(020h)
	movwf	(??_long_to_string+0)+0
	movf	(long_to_string@digit),w
	addwf	(long_to_string@str),w
	movwf	(??_long_to_string+1)+0
	movf	0+(??_long_to_string+1)+0,w
	movwf	fsr0
	movf	(??_long_to_string+0)+0,w
	movwf	indf
	goto	l2672
	
l412:	
	line	49
;lcd.c: 49: }
	goto	l2672
	line	50
	
l411:	
	line	51
	
l2670:	
;lcd.c: 50: else {
;lcd.c: 51: blank = 0;
	clrf	(long_to_string@blank)
	clrf	(long_to_string@blank+1)
	goto	l2672
	line	52
	
l413:	
	line	46
	
l2672:	
	movlw	(01h)
	movwf	(??_long_to_string+0)+0
	movf	(??_long_to_string+0)+0,w
	addwf	(long_to_string@digit),f
	goto	l2674
	
l409:	
	
l2674:	
	movf	(long_to_string@numdigits),w
	addlw	low(-1)
	movwf	(??_long_to_string+0)+0
	movlw	high(-1)
	skipnc
	movlw	(high(-1)+1)&0ffh
	movwf	((??_long_to_string+0)+0)+1
	movf	1+(??_long_to_string+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u2905
	movf	0+(??_long_to_string+0)+0,w
	subwf	(long_to_string@digit),w
u2905:

	skipc
	goto	u2901
	goto	u2900
u2901:
	goto	l2664
u2900:
	goto	l415
	
l414:	
	line	54
	
l415:	
	return
	opt stack 0
GLOBAL	__end_of_long_to_string
	__end_of_long_to_string:
;; =============== function _long_to_string ends ============

	signat	_long_to_string,12408
	global	_DS1820_GetTemp
psect	text390,local,class=CODE,delta=2
global __ptext390
__ptext390:

;; *************** function _DS1820_GetTemp *****************
;; Defined at:
;;		line 42 in file "C:\Dropbox\CMPE102\project\DS1820.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  Data            2    0[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   12[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       0       0       0
;;      Totals:         2       2       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DS1820_Write
;;		_DS1820_Read
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text390
	file	"C:\Dropbox\CMPE102\project\DS1820.c"
	line	42
	global	__size_of_DS1820_GetTemp
	__size_of_DS1820_GetTemp	equ	__end_of_DS1820_GetTemp-_DS1820_GetTemp
	
_DS1820_GetTemp:	
	opt	stack 6
; Regs used in _DS1820_GetTemp: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	46
	
l2646:	
;DS1820.c: 44: unsigned int Data;
;DS1820.c: 46: DQ = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	line	47
	
l2648:	
;DS1820.c: 47: DS1820_Write(0xAA);
	movlw	(0AAh)
	fcall	_DS1820_Write
	line	48
	
l2650:	
;DS1820.c: 48: Data = DS1820_Read();
	fcall	_DS1820_Read
	movf	(1+(?_DS1820_Read)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(DS1820_GetTemp@Data+1)
	addwf	(DS1820_GetTemp@Data+1)
	movf	(0+(?_DS1820_Read)),w
	clrf	(DS1820_GetTemp@Data)
	addwf	(DS1820_GetTemp@Data)

	line	49
	
l2652:	
;DS1820.c: 49: DQ = 0;
	bcf	(40/8),(40)&7
	line	52
	
l2654:	
;DS1820.c: 52: return(Data);
	movf	(DS1820_GetTemp@Data+1),w
	clrf	(?_DS1820_GetTemp+1)
	addwf	(?_DS1820_GetTemp+1)
	movf	(DS1820_GetTemp@Data),w
	clrf	(?_DS1820_GetTemp)
	addwf	(?_DS1820_GetTemp)

	goto	l462
	
l2656:	
	line	53
	
l462:	
	return
	opt stack 0
GLOBAL	__end_of_DS1820_GetTemp
	__end_of_DS1820_GetTemp:
;; =============== function _DS1820_GetTemp ends ============

	signat	_DS1820_GetTemp,90
	global	_DS1820_InitTemp
psect	text391,local,class=CODE,delta=2
global __ptext391
__ptext391:

;; *************** function _DS1820_InitTemp *****************
;; Defined at:
;;		line 28 in file "C:\Dropbox\CMPE102\project\DS1820.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DS1820_Write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text391
	file	"C:\Dropbox\CMPE102\project\DS1820.c"
	line	28
	global	__size_of_DS1820_InitTemp
	__size_of_DS1820_InitTemp	equ	__end_of_DS1820_InitTemp-_DS1820_InitTemp
	
_DS1820_InitTemp:	
	opt	stack 6
; Regs used in _DS1820_InitTemp: [wreg+status,2+status,0+pclath+cstack]
	line	32
	
l2644:	
;DS1820.c: 32: DS1820_Write(0x0C);
	movlw	(0Ch)
	fcall	_DS1820_Write
	line	33
;DS1820.c: 33: DS1820_Write(0x00);
	movlw	(0)
	fcall	_DS1820_Write
	line	36
;DS1820.c: 36: DS1820_Write(0xEE);
	movlw	(0EEh)
	fcall	_DS1820_Write
	line	38
	
l459:	
	return
	opt stack 0
GLOBAL	__end_of_DS1820_InitTemp
	__end_of_DS1820_InitTemp:
;; =============== function _DS1820_InitTemp ends ============

	signat	_DS1820_InitTemp,88
	global	_lcd_init
psect	text392,local,class=CODE,delta=2
global __ptext392
__ptext392:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 154 in file "C:\Dropbox\CMPE102\project\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _dcnt           1    6[COMMON] unsigned char 
;;  _dcnt           1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayMs
;;		_lcd_write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text392
	file	"C:\Dropbox\CMPE102\project\lcd.c"
	line	154
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 6
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	155
	
l2612:	
;lcd.c: 155: LCD_RS = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(43/8),(43)&7
	line	156
	
l2614:	
;lcd.c: 156: DelayMs(15);
	movlw	(0Fh)
	fcall	_DelayMs
	line	157
	
l2616:	
;lcd.c: 157: PORTB = 0x3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	161
	
l2618:	
;lcd.c: 161: ((LCD_EN = 1),(LCD_EN=0));
	bsf	(42/8),(42)&7
	
l2620:	
	bcf	(42/8),(42)&7
	line	162
	
l2622:	
;lcd.c: 162: DelayMs(5);
	movlw	(05h)
	fcall	_DelayMs
	line	163
	
l2624:	
;lcd.c: 163: ((LCD_EN = 1),(LCD_EN=0));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	
l2626:	
	bcf	(42/8),(42)&7
	line	164
;lcd.c: 164: { unsigned char _dcnt; _dcnt = (100)/(12*1000/(4*1000))|1; while(--_dcnt != 0) continue; };
	movlw	(021h)
	movwf	(??_lcd_init+0)+0
	movf	(??_lcd_init+0)+0,w
	movwf	(lcd_init@_dcnt)
	goto	l2628
	
l451:	
	goto	l2628
	
l450:	
	
l2628:	
	movlw	low(01h)
	subwf	(lcd_init@_dcnt),f
	btfss	status,2
	goto	u2861
	goto	u2860
u2861:
	goto	l2628
u2860:
	
l452:	
	line	165
;lcd.c: 165: ((LCD_EN = 1),(LCD_EN=0));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	bcf	(42/8),(42)&7
	line	166
	
l2630:	
;lcd.c: 166: DelayMs(5);
	movlw	(05h)
	fcall	_DelayMs
	line	167
	
l2632:	
;lcd.c: 167: PORTB = 0x2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	168
	
l2634:	
;lcd.c: 168: ((LCD_EN = 1),(LCD_EN=0));
	bsf	(42/8),(42)&7
	
l2636:	
	bcf	(42/8),(42)&7
	line	169
	
l2638:	
;lcd.c: 169: { unsigned char _dcnt; _dcnt = (40)/(12*1000/(4*1000))|1; while(--_dcnt != 0) continue; };
	movlw	(0Dh)
	movwf	(??_lcd_init+0)+0
	movf	(??_lcd_init+0)+0,w
	movwf	(lcd_init@_dcnt_690)
	goto	l2640
	
l454:	
	goto	l2640
	
l453:	
	
l2640:	
	movlw	low(01h)
	subwf	(lcd_init@_dcnt_690),f
	btfss	status,2
	goto	u2871
	goto	u2870
u2871:
	goto	l2640
u2870:
	goto	l2642
	
l455:	
	line	170
	
l2642:	
;lcd.c: 170: lcd_write(0x28);
	movlw	(028h)
	fcall	_lcd_write
	line	171
;lcd.c: 171: lcd_write(0x08);
	movlw	(08h)
	fcall	_lcd_write
	line	172
;lcd.c: 172: lcd_write(0x0C);
	movlw	(0Ch)
	fcall	_lcd_write
	line	173
;lcd.c: 173: lcd_write(0x06);
	movlw	(06h)
	fcall	_lcd_write
	line	174
	
l456:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_goto
psect	text393,local,class=CODE,delta=2
global __ptext393
__ptext393:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 145 in file "C:\Dropbox\CMPE102\project\lcd.c"
;; Parameters:    Size  Location     Type
;;  pos             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  pos             1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text393
	file	"C:\Dropbox\CMPE102\project\lcd.c"
	line	145
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 6
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
;lcd_goto@pos stored from wreg
	movwf	(lcd_goto@pos)
	line	146
	
l2608:	
;lcd.c: 146: LCD_RS = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(43/8),(43)&7
	line	147
	
l2610:	
;lcd.c: 147: lcd_write(0x80+pos);
	movf	(lcd_goto@pos),w
	addlw	080h
	fcall	_lcd_write
	line	148
	
l447:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,4216
	global	_lcd_clear
psect	text394,local,class=CODE,delta=2
global __ptext394
__ptext394:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 109 in file "C:\Dropbox\CMPE102\project\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_write
;;		_DelayMs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text394
	file	"C:\Dropbox\CMPE102\project\lcd.c"
	line	109
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 6
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	110
	
l2604:	
;lcd.c: 110: LCD_RS = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(43/8),(43)&7
	line	111
	
l2606:	
;lcd.c: 111: lcd_write(0x1);
	movlw	(01h)
	fcall	_lcd_write
	line	112
;lcd.c: 112: DelayMs(2);
	movlw	(02h)
	fcall	_DelayMs
	line	113
	
l432:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_lcd_puts
psect	text395,local,class=CODE,delta=2
global __ptext395
__ptext395:

;; *************** function _lcd_puts *****************
;; Defined at:
;;		line 119 in file "C:\Dropbox\CMPE102\project\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    3[COMMON] PTR const unsigned char 
;;		 -> STR_6(16), STR_5(4), STR_4(5), STR_3(3), 
;;		 -> STR_2(3), STR_1(16), p(7), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_write
;; This function is called by:
;;		_disp
;;		_main
;; This function uses a non-reentrant model
;;
psect	text395
	file	"C:\Dropbox\CMPE102\project\lcd.c"
	line	119
	global	__size_of_lcd_puts
	__size_of_lcd_puts	equ	__end_of_lcd_puts-_lcd_puts
	
_lcd_puts:	
	opt	stack 5
; Regs used in _lcd_puts: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	120
	
l2596:	
;lcd.c: 120: LCD_RS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	line	121
;lcd.c: 121: while(*s)
	goto	l2602
	
l436:	
	line	122
	
l2598:	
;lcd.c: 122: lcd_write(*s++);
	movf	(lcd_puts@s+1),w
	movwf	btemp+1
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write
	
l2600:	
	movlw	low(01h)
	addwf	(lcd_puts@s),f
	skipnc
	incf	(lcd_puts@s+1),f
	movlw	high(01h)
	addwf	(lcd_puts@s+1),f
	goto	l2602
	
l435:	
	line	121
	
l2602:	
	movf	(lcd_puts@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u2851
	goto	u2850
u2851:
	goto	l2598
u2850:
	goto	l438
	
l437:	
	line	123
	
l438:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_puts
	__end_of_lcd_puts:
;; =============== function _lcd_puts ends ============

	signat	_lcd_puts,4216
	global	_long_to_string_lz
psect	text396,local,class=CODE,delta=2
global __ptext396
__ptext396:

;; *************** function _long_to_string_lz *****************
;; Defined at:
;;		line 70 in file "C:\Dropbox\CMPE102\project\lcd.c"
;; Parameters:    Size  Location     Type
;;  input           2    0[BANK0 ] unsigned int 
;;  str             1    2[BANK0 ] PTR unsigned char 
;;		 -> p(7), 
;;  numdigits       1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  digit           1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwmod
;;		___lwdiv
;; This function is called by:
;;		_long_to_string
;; This function uses a non-reentrant model
;;
psect	text396
	file	"C:\Dropbox\CMPE102\project\lcd.c"
	line	70
	global	__size_of_long_to_string_lz
	__size_of_long_to_string_lz	equ	__end_of_long_to_string_lz-_long_to_string_lz
	
_long_to_string_lz:	
	opt	stack 4
; Regs used in _long_to_string_lz: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	72
	
l2580:	
;lcd.c: 71: char digit;
;lcd.c: 72: for (digit=numdigits; digit > 0; digit--) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(long_to_string_lz@numdigits),w
	movwf	(??_long_to_string_lz+0)+0
	movf	(??_long_to_string_lz+0)+0,w
	movwf	(long_to_string_lz@digit)
	
l2582:	
	movf	(long_to_string_lz@digit),f
	skipz
	goto	u2831
	goto	u2830
u2831:
	goto	l2586
u2830:
	goto	l2594
	
l2584:	
	goto	l2594
	
l418:	
	line	73
	
l2586:	
;lcd.c: 73: str[digit-1] = (input % 10) + '0';
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(long_to_string_lz@input+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(long_to_string_lz@input),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_long_to_string_lz+0)+0
	movf	(long_to_string_lz@digit),w
	addlw	-1
	addwf	(long_to_string_lz@str),w
	movwf	(??_long_to_string_lz+1)+0
	movf	0+(??_long_to_string_lz+1)+0,w
	movwf	fsr0
	movf	(??_long_to_string_lz+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	74
	
l2588:	
;lcd.c: 74: input = input / 10;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(long_to_string_lz@input+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(long_to_string_lz@input),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(long_to_string_lz@input+1)
	addwf	(long_to_string_lz@input+1)
	movf	(0+(?___lwdiv)),w
	clrf	(long_to_string_lz@input)
	addwf	(long_to_string_lz@input)

	line	72
	
l2590:	
	movlw	low(01h)
	subwf	(long_to_string_lz@digit),f
	
l2592:	
	movf	(long_to_string_lz@digit),f
	skipz
	goto	u2841
	goto	u2840
u2841:
	goto	l2586
u2840:
	goto	l2594
	
l419:	
	line	76
	
l2594:	
;lcd.c: 75: }
;lcd.c: 76: str[numdigits] = 0;
	movf	(long_to_string_lz@numdigits),w
	addwf	(long_to_string_lz@str),w
	movwf	(??_long_to_string_lz+0)+0
	movf	0+(??_long_to_string_lz+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	77
	
l420:	
	return
	opt stack 0
GLOBAL	__end_of_long_to_string_lz
	__end_of_long_to_string_lz:
;; =============== function _long_to_string_lz ends ============

	signat	_long_to_string_lz,12408
	global	___lwmod
psect	text397,local,class=CODE,delta=2
global __ptext397
__ptext397:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_long_to_string_lz
;; This function uses a non-reentrant model
;;
psect	text397
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 4
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l2558:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2771
	goto	u2770
u2771:
	goto	l2576
u2770:
	line	9
	
l2560:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l2566
	
l918:	
	line	11
	
l2562:	
	movlw	01h
	
u2785:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2785
	line	12
	
l2564:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l2566
	line	13
	
l917:	
	line	10
	
l2566:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2791
	goto	u2790
u2791:
	goto	l2562
u2790:
	goto	l2568
	
l919:	
	goto	l2568
	line	14
	
l920:	
	line	15
	
l2568:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2805
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2805:
	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l2572
u2800:
	line	16
	
l2570:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l2572
	
l921:	
	line	17
	
l2572:	
	movlw	01h
	
u2815:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2815
	line	18
	
l2574:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2821
	goto	u2820
u2821:
	goto	l2568
u2820:
	goto	l2576
	
l922:	
	goto	l2576
	line	19
	
l916:	
	line	20
	
l2576:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l923
	
l2578:	
	line	21
	
l923:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text398,local,class=CODE,delta=2
global __ptext398
__ptext398:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[COMMON] unsigned int 
;;  dividend        2    8[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   11[COMMON] unsigned int 
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_long_to_string_lz
;;		_main
;; This function uses a non-reentrant model
;;
psect	text398
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 4
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l2532:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l2534:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2701
	goto	u2700
u2701:
	goto	l2554
u2700:
	line	11
	
l2536:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l2542
	
l908:	
	line	13
	
l2538:	
	movlw	01h
	
u2715:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2715
	line	14
	
l2540:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l2542
	line	15
	
l907:	
	line	12
	
l2542:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2721
	goto	u2720
u2721:
	goto	l2538
u2720:
	goto	l2544
	
l909:	
	goto	l2544
	line	16
	
l910:	
	line	17
	
l2544:	
	movlw	01h
	
u2735:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2735
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2745
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2745:
	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l2550
u2740:
	line	19
	
l2546:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l2548:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l2550
	line	21
	
l911:	
	line	22
	
l2550:	
	movlw	01h
	
u2755:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2755
	line	23
	
l2552:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2761
	goto	u2760
u2761:
	goto	l2544
u2760:
	goto	l2554
	
l912:	
	goto	l2554
	line	24
	
l906:	
	line	25
	
l2554:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l913
	
l2556:	
	line	26
	
l913:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text399,local,class=CODE,delta=2
global __ptext399
__ptext399:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text399
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 7
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l2520:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l2522
	line	6
	
l900:	
	line	7
	
l2522:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2661
	goto	u2660
u2661:
	goto	l901
u2660:
	line	8
	
l2524:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l901:	
	line	9
	movlw	01h
	
u2675:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u2675
	line	10
	
l2526:	
	movlw	01h
	
u2685:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u2685
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2691
	goto	u2690
u2691:
	goto	l2522
u2690:
	goto	l2528
	
l902:	
	line	12
	
l2528:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l903
	
l2530:	
	line	13
	
l903:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_DS1820_Read
psect	text400,local,class=CODE,delta=2
global __ptext400
__ptext400:

;; *************** function _DS1820_Read *****************
;; Defined at:
;;		line 75 in file "C:\Dropbox\CMPE102\project\DS1820.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _dcnt           1    8[COMMON] unsigned char 
;;  _dcnt           1    7[COMMON] unsigned char 
;;  _dcnt           1    6[COMMON] unsigned char 
;;  Temp            2    9[COMMON] unsigned int 
;;  Data            2    4[COMMON] unsigned int 
;;  i               1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         8       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:        12       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DS1820_GetTemp
;; This function uses a non-reentrant model
;;
psect	text400
	file	"C:\Dropbox\CMPE102\project\DS1820.c"
	line	75
	global	__size_of_DS1820_Read
	__size_of_DS1820_Read	equ	__end_of_DS1820_Read-_DS1820_Read
	
_DS1820_Read:	
	opt	stack 6
; Regs used in _DS1820_Read: [wreg+status,2+status,0+btemp+1]
	line	80
	
l2484:	
;DS1820.c: 76: unsigned int Data;
;DS1820.c: 77: unsigned int Temp;
;DS1820.c: 78: unsigned char i;
;DS1820.c: 80: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	81
;DS1820.c: 81: TRISB5 = 0;
	bcf	(1077/8)^080h,(1077)&7
	line	82
;DS1820.c: 82: TRISB6 = 1;
	bsf	(1078/8)^080h,(1078)&7
	line	84
;DS1820.c: 84: DQ = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	line	85
	
l2486:	
;DS1820.c: 85: { unsigned char _dcnt; _dcnt = (10)/(12*1000/(4*1000))|1; while(--_dcnt != 0) continue; };
	movlw	(03h)
	movwf	(??_DS1820_Read+0)+0
	movf	(??_DS1820_Read+0)+0,w
	movwf	(DS1820_Read@_dcnt)
	goto	l2488
	
l474:	
	goto	l2488
	
l473:	
	
l2488:	
	movlw	low(01h)
	subwf	(DS1820_Read@_dcnt),f
	btfss	status,2
	goto	u2591
	goto	u2590
u2591:
	goto	l2488
u2590:
	goto	l2490
	
l475:	
	line	86
	
l2490:	
;DS1820.c: 86: Data = 0;
	clrf	(DS1820_Read@Data)
	clrf	(DS1820_Read@Data+1)
	line	87
	
l2492:	
;DS1820.c: 87: Temp = 1;
	movlw	low(01h)
	movwf	(DS1820_Read@Temp)
	movlw	high(01h)
	movwf	((DS1820_Read@Temp))+1
	line	88
	
l2494:	
;DS1820.c: 88: for (i=1; i<=9; i++) {
	clrf	(DS1820_Read@i)
	bsf	status,0
	rlf	(DS1820_Read@i),f
	
l2496:	
	movlw	(0Ah)
	subwf	(DS1820_Read@i),w
	skipc
	goto	u2601
	goto	u2600
u2601:
	goto	l476
u2600:
	goto	l2516
	
l2498:	
	goto	l2516
	
l476:	
	line	89
;DS1820.c: 89: DQ = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	90
	
l2500:	
;DS1820.c: 90: { unsigned char _dcnt; _dcnt = (10)/(12*1000/(4*1000))|1; while(--_dcnt != 0) continue; };
	movlw	(03h)
	movwf	(??_DS1820_Read+0)+0
	movf	(??_DS1820_Read+0)+0,w
	movwf	(DS1820_Read@_dcnt_703)
	goto	l2502
	
l479:	
	goto	l2502
	
l478:	
	
l2502:	
	movlw	low(01h)
	subwf	(DS1820_Read@_dcnt_703),f
	btfss	status,2
	goto	u2611
	goto	u2610
u2611:
	goto	l2502
u2610:
	
l480:	
	line	91
;DS1820.c: 91: if (DQ == 1) Data += Temp;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(40/8),(40)&7
	goto	u2621
	goto	u2620
u2621:
	goto	l2506
u2620:
	
l2504:	
	movf	(DS1820_Read@Temp),w
	addwf	(DS1820_Read@Data),f
	skipnc
	incf	(DS1820_Read@Data+1),f
	movf	(DS1820_Read@Temp+1),w
	addwf	(DS1820_Read@Data+1),f
	goto	l2506
	
l481:	
	line	92
	
l2506:	
;DS1820.c: 92: Temp = Temp * 2;
	movf	(DS1820_Read@Temp+1),w
	movwf	(??_DS1820_Read+0)+0+1
	movf	(DS1820_Read@Temp),w
	movwf	(??_DS1820_Read+0)+0
	movlw	01h
	movwf	btemp+1
u2635:
	clrc
	rlf	(??_DS1820_Read+0)+0,f
	rlf	(??_DS1820_Read+0)+1,f
	decfsz	btemp+1,f
	goto	u2635
	movf	0+(??_DS1820_Read+0)+0,w
	movwf	(DS1820_Read@Temp)
	movf	1+(??_DS1820_Read+0)+0,w
	movwf	(DS1820_Read@Temp+1)
	line	93
	
l2508:	
;DS1820.c: 93: { unsigned char _dcnt; _dcnt = (10)/(12*1000/(4*1000))|1; while(--_dcnt != 0) continue; };
	movlw	(03h)
	movwf	(??_DS1820_Read+0)+0
	movf	(??_DS1820_Read+0)+0,w
	movwf	(DS1820_Read@_dcnt_704)
	goto	l2510
	
l483:	
	goto	l2510
	
l482:	
	
l2510:	
	movlw	low(01h)
	subwf	(DS1820_Read@_dcnt_704),f
	btfss	status,2
	goto	u2641
	goto	u2640
u2641:
	goto	l2510
u2640:
	goto	l2512
	
l484:	
	line	88
	
l2512:	
	movlw	(01h)
	movwf	(??_DS1820_Read+0)+0
	movf	(??_DS1820_Read+0)+0,w
	addwf	(DS1820_Read@i),f
	
l2514:	
	movlw	(0Ah)
	subwf	(DS1820_Read@i),w
	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l476
u2650:
	goto	l2516
	
l477:	
	line	96
	
l2516:	
;DS1820.c: 94: }
;DS1820.c: 96: return(Data);
	movf	(DS1820_Read@Data+1),w
	clrf	(?_DS1820_Read+1)
	addwf	(?_DS1820_Read+1)
	movf	(DS1820_Read@Data),w
	clrf	(?_DS1820_Read)
	addwf	(?_DS1820_Read)

	goto	l485
	
l2518:	
	line	97
	
l485:	
	return
	opt stack 0
GLOBAL	__end_of_DS1820_Read
	__end_of_DS1820_Read:
;; =============== function _DS1820_Read ends ============

	signat	_DS1820_Read,90
	global	_DS1820_Write
psect	text401,local,class=CODE,delta=2
global __ptext401
__ptext401:

;; *************** function _DS1820_Write *****************
;; Defined at:
;;		line 57 in file "C:\Dropbox\CMPE102\project\DS1820.c"
;; Parameters:    Size  Location     Type
;;  Data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Data            1    3[COMMON] unsigned char 
;;  _dcnt           1    2[COMMON] unsigned char 
;;  i               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DS1820_InitTemp
;;		_DS1820_GetTemp
;; This function uses a non-reentrant model
;;
psect	text401
	file	"C:\Dropbox\CMPE102\project\DS1820.c"
	line	57
	global	__size_of_DS1820_Write
	__size_of_DS1820_Write	equ	__end_of_DS1820_Write-_DS1820_Write
	
_DS1820_Write:	
	opt	stack 6
; Regs used in _DS1820_Write: [wreg+status,2+status,0]
;DS1820_Write@Data stored from wreg
	line	60
	movwf	(DS1820_Write@Data)
	
l2468:	
;DS1820.c: 58: unsigned char i;
;DS1820.c: 60: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	61
;DS1820.c: 61: TRISB5 = 0;
	bcf	(1077/8)^080h,(1077)&7
	line	62
;DS1820.c: 62: TRISB6 = 0;
	bcf	(1078/8)^080h,(1078)&7
	line	64
	
l2470:	
;DS1820.c: 64: for (i=1; i<=8; i++) {
	clrf	(DS1820_Write@i)
	bsf	status,0
	rlf	(DS1820_Write@i),f
	
l2472:	
	movlw	(09h)
	subwf	(DS1820_Write@i),w
	skipc
	goto	u2551
	goto	u2550
u2551:
	goto	l465
u2550:
	goto	l470
	
l2474:	
	goto	l470
	
l465:	
	line	65
;DS1820.c: 65: DQ = (Data & 1);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
	btfss	(DS1820_Write@Data),0
	goto	u2565
	bsf	(40/8),(40)&7
u2565:

	line	66
;DS1820.c: 66: DQ = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	67
	
l2476:	
;DS1820.c: 67: { unsigned char _dcnt; _dcnt = (10)/(12*1000/(4*1000))|1; while(--_dcnt != 0) continue; };
	movlw	(03h)
	movwf	(??_DS1820_Write+0)+0
	movf	(??_DS1820_Write+0)+0,w
	movwf	(DS1820_Write@_dcnt)
	goto	l2478
	
l468:	
	goto	l2478
	
l467:	
	
l2478:	
	movlw	low(01h)
	subwf	(DS1820_Write@_dcnt),f
	btfss	status,2
	goto	u2571
	goto	u2570
u2571:
	goto	l2478
u2570:
	
l469:	
	line	68
;DS1820.c: 68: DQ = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	line	69
	
l2480:	
;DS1820.c: 69: Data = Data >> 1;
	movf	(DS1820_Write@Data),w
	movwf	(??_DS1820_Write+0)+0
	clrc
	rrf	(??_DS1820_Write+0)+0,w
	movwf	(??_DS1820_Write+1)+0
	movf	(??_DS1820_Write+1)+0,w
	movwf	(DS1820_Write@Data)
	line	64
	movlw	(01h)
	movwf	(??_DS1820_Write+0)+0
	movf	(??_DS1820_Write+0)+0,w
	addwf	(DS1820_Write@i),f
	
l2482:	
	movlw	(09h)
	subwf	(DS1820_Write@i),w
	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l465
u2580:
	goto	l470
	
l466:	
	line	72
	
l470:	
	return
	opt stack 0
GLOBAL	__end_of_DS1820_Write
	__end_of_DS1820_Write:
;; =============== function _DS1820_Write ends ============

	signat	_DS1820_Write,4216
	global	_lcd_write
psect	text402,local,class=CODE,delta=2
global __ptext402
__ptext402:

;; *************** function _lcd_write *****************
;; Defined at:
;;		line 95 in file "C:\Dropbox\CMPE102\project\lcd.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    2[COMMON] unsigned char 
;;  _dcnt           1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_clear
;;		_lcd_puts
;;		_lcd_goto
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text402
	file	"C:\Dropbox\CMPE102\project\lcd.c"
	line	95
	global	__size_of_lcd_write
	__size_of_lcd_write	equ	__end_of_lcd_write-_lcd_write
	
_lcd_write:	
	opt	stack 5
; Regs used in _lcd_write: [wreg+status,2+status,0]
;lcd_write@c stored from wreg
	movwf	(lcd_write@c)
	line	96
	
l2454:	
;lcd.c: 96: PORTB = (PORTB & 0xF0) | (c >> 4);
	movf	(lcd_write@c),w
	movwf	(??_lcd_write+0)+0
	movlw	04h
u2535:
	clrc
	rrf	(??_lcd_write+0)+0,f
	addlw	-1
	skipz
	goto	u2535
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(6),w
	andlw	0F0h
	iorwf	0+(??_lcd_write+0)+0,w
	movwf	(6)	;volatile
	line	97
	
l2456:	
;lcd.c: 97: ((LCD_EN = 1),(LCD_EN=0));
	bsf	(42/8),(42)&7
	
l2458:	
	bcf	(42/8),(42)&7
	line	98
;lcd.c: 98: PORTB = (PORTB & 0xF0) | (c & 0x0F);
	movlw	(0Fh)
	andwf	(lcd_write@c),w
	movwf	(??_lcd_write+0)+0
	movf	(6),w
	andlw	0F0h
	iorwf	0+(??_lcd_write+0)+0,w
	movwf	(6)	;volatile
	line	99
	
l2460:	
;lcd.c: 99: ((LCD_EN = 1),(LCD_EN=0));
	bsf	(42/8),(42)&7
	
l2462:	
	bcf	(42/8),(42)&7
	line	100
	
l2464:	
;lcd.c: 100: { unsigned char _dcnt; _dcnt = (40)/(12*1000/(4*1000))|1; while(--_dcnt != 0) continue; };
	movlw	(0Dh)
	movwf	(??_lcd_write+0)+0
	movf	(??_lcd_write+0)+0,w
	movwf	(lcd_write@_dcnt)
	goto	l2466
	
l427:	
	goto	l2466
	
l426:	
	
l2466:	
	movlw	low(01h)
	subwf	(lcd_write@_dcnt),f
	btfss	status,2
	goto	u2541
	goto	u2540
u2541:
	goto	l2466
u2540:
	goto	l429
	
l428:	
	line	101
	
l429:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write
	__end_of_lcd_write:
;; =============== function _lcd_write ends ============

	signat	_lcd_write,4216
	global	_DelayMs
psect	text403,local,class=CODE,delta=2
global __ptext403
__ptext403:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 12 in file "C:\Dropbox\CMPE102\project\delay.c"
;; Parameters:    Size  Location     Type
;;  cnt             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cnt             1    1[COMMON] unsigned char 
;;  _dcnt           1    3[COMMON] unsigned char 
;;  i               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_clear
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text403
	file	"C:\Dropbox\CMPE102\project\delay.c"
	line	12
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 7
; Regs used in _DelayMs: [wreg+status,2+status,0]
;DelayMs@cnt stored from wreg
	movwf	(DelayMs@cnt)
	line	21
;delay.c: 20: unsigned char i;
;delay.c: 21: do {
	
l399:	
	line	22
	
l2446:	
;delay.c: 22: i = 4;
	movlw	(04h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@i)
	line	23
;delay.c: 23: do {
	
l400:	
	line	24
;delay.c: 24: { unsigned char _dcnt; _dcnt = (250)/(12*1000/(4*1000))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@_dcnt)
	goto	l2448
	
l402:	
	goto	l2448
	
l401:	
	
l2448:	
	movlw	low(01h)
	subwf	(DelayMs@_dcnt),f
	btfss	status,2
	goto	u2501
	goto	u2500
u2501:
	goto	l2448
u2500:
	goto	l2450
	
l403:	
	line	25
	
l2450:	
;delay.c: 25: } while(--i);
	movlw	low(01h)
	subwf	(DelayMs@i),f
	btfss	status,2
	goto	u2511
	goto	u2510
u2511:
	goto	l400
u2510:
	goto	l2452
	
l404:	
	line	26
	
l2452:	
;delay.c: 26: } while(--cnt);
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u2521
	goto	u2520
u2521:
	goto	l399
u2520:
	goto	l406
	
l405:	
	line	28
	
l406:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
psect	text404,local,class=CODE,delta=2
global __ptext404
__ptext404:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
