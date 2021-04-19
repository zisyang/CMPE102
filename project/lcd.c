//Display to lcd

#include "lcd.h"
#include "delay.h"


static bit LCD_RS        @ ((unsigned)&PORTA*8+3);        // Register select
static bit LCD_EN        @ ((unsigned)&PORTA*8+2);        // Enable

#define        LCD_STROBE        ((LCD_EN = 1),(LCD_EN=0))


unsigned char a;


void long_to_string_lz (unsigned int input, char *str, char numdigits);
void long_to_string (unsigned int input, char *str, char numdigits);

void disp(unsigned int i);
unsigned int x;
unsigned int y;


char p[7];




/*
*********************************************************************************************************
* long_to_string()
*
* Description : Convert a "long" to a null-terminated string
*               (base = decimal)
* Arguments   : input = number to be converted
*               str = pointer to string (i.e. display buffer)
*               numdigits = number of digits to display
* Returns     : none
*********************************************************************************************************
*/
void long_to_string (unsigned int input, char *str, char numdigits)
{
  char digit;
  int blank = 1;
  long_to_string_lz(input, str, numdigits);
  for (digit=0; digit < numdigits-1; digit++) {
    if (str[digit] == '0') {
      if (blank == 1) str[digit] = ' ';
    }
    else {
      blank = 0;
    }
  }
}


/*
*********************************************************************************************************
* long_to_string_lz()
*
* Description : Convert a "long" to a null-terminated string, with leading zeros
*               (base = decimal)
* Arguments   : input = number to be converted
*               str = pointer to string (i.e. display buffer)
*               numdigits = number of digits to display
* Returns     : none
*********************************************************************************************************
*/
void long_to_string_lz (unsigned int input, char *str, char numdigits)
{
  char digit;
  for (digit=numdigits; digit > 0; digit--) {
    str[digit-1] = (input % 10) + '0';
    input = input / 10;
  }
  str[numdigits] = 0;    // null-terminate the string
}





void disp(unsigned int i)
{
 long_to_string (i, p, 3);
//lcd_goto(a);
lcd_puts(p);
}


/* write a byte to the LCD in 4 bit mode */

void
lcd_write(unsigned char c)
{
        PORTB = (PORTB & 0xF0) |  (c >> 4);
        LCD_STROBE;
        PORTB = (PORTB & 0xF0) |  (c & 0x0F);
        LCD_STROBE;
        DelayUs(40);
}

/*
 *         Clear and home the LCD
 */

void
lcd_clear(void)
{
        LCD_RS = 0;
        lcd_write(0x1);
        DelayMs(2);
}

/* write a string of chars to the LCD */

void
lcd_puts(const char * s)
{
        LCD_RS = 1;        // write characters
        while(*s)
                lcd_write(*s++);
}

/* write one character to the LCD */

void
lcd_putch(char c)
{
        LCD_RS = 1;        // write characters
        PORTB = (PORTB & 0xF0) |  (c >> 4);
        LCD_STROBE;
        PORTB = (PORTB & 0xF0) |  (c & 0x0F);
        LCD_STROBE;
        DelayUs(40);
}


/*
 * Go to the specified position
 */

void
lcd_goto(unsigned char pos)
{
        LCD_RS = 0;
        lcd_write(0x80+pos);
}

/* initialise the LCD - put into 4 bit mode */

void
lcd_init(void)
{
        LCD_RS = 0;        // write control bytes
        DelayMs(15);        // power on delay
        PORTB = 0x3;        // attention!

//        PORTB &= 0x0F; to select higher bits of port b

        LCD_STROBE;
        DelayMs(5);
        LCD_STROBE;
        DelayUs(100);
        LCD_STROBE;
        DelayMs(5);
        PORTB = 0x2;        // set 4 bit mode
        LCD_STROBE;
        DelayUs(40);
        lcd_write(0x28);        // 4 bit mode, 1/16 duty, 5x8 font
        lcd_write(0x08);        // display off
        lcd_write(0x0C);        // display on, curson off
        lcd_write(0x06);        // entry mode
}


