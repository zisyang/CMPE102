//   PIC16F628A to DS1820 

#include        <pic.h>
#include        "lcd.c"
#include   "delay.h"
#include        "DS1820.c"


__CONFIG(0x3F10);


//main function
void main(void)
{
        TRISB = 0b00000000;         // first 4 outputs rest inputs
        CMCON = 0b00000111;                // disable comparators
        TRISA = 0b11110011;

        lcd_init();
        lcd_clear();
        DelayMs(250);

//		int m = 0;
DS1820_InitTemp();

			lcd_puts(" Temperature is");
		while(1)
		{

			x=DS1820_GetTemp();
			lcd_goto(40);
			y=x/20;
			disp(y);
			if(y*2<x)
				lcd_puts(".5");
			else
				lcd_puts(".0");
			lcd_puts("^C (");
			y = (y * 9/5)+32;
			disp(y);
			lcd_puts("^F)");
			DelayMs(250);
	
//			lcd_goto(40);
//			disp(m); m++;
//			DelayMs(1000);
			lcd_goto(40);
			lcd_puts("               ");		
			DS1820_InitTemp();
			DelayMs(250);
			
		}
}

