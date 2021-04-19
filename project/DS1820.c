// --- DS1820.C ----------------------------
//
//  DS1820 Driver Routines
//     (N/C)!  RC1:  RST    (1 = start comm.  0 = terminate)
//     RC3:  DQ     (1k resistor between)
//     (N/C)!  RC2:  CLK    (pulse low = clock)
//
// ------------------------------------------------

// Revision History
//   11/20/00  Modification of Slave_D.C for temerature mode
//   03/20/01  Added InitTemp and GetTemp routines for Thermometer 

void DS1820_InitTemp(void);
unsigned int DS1820_GetTemp(void);
void DS1820_Write(unsigned char Data);
int DS1820_Read(void);


static bit DQ   @ ((unsigned)&PORTA*8+0);       // DS1820 - DQ
//static bit DQ2	 @ ((unsigned)&PORTA*8+7);

//static bit DQ   @ ((unsigned)&PORTB*8+6);       // DS1820 - DQ
//static bit CLK  @ ((unsigned)&PORTB*8+5);       // DS1820 - CLK
//static bit RST  @ ((unsigned)&PORTB*8+4);       // DS1820 - RST

void DS1820_InitTemp(void)
{
// Sets up the config register to poll continuously for Temp.
// DS1820 also starts taking temperature readings.
//	RST =1;
       		DS1820_Write(0x0C); 
		DS1820_Write(0x00);
//	RST =0;
//	RST =1;
		DS1820_Write(0xEE); 
//	RST =0;
} // End DS1820_InitTemp


unsigned int DS1820_GetTemp(void)
{
// Returns hex value of last temperature reading.
unsigned int Data;
//	RST =1;
DQ = 1;
		DS1820_Write(0xAA); 
		Data = DS1820_Read();
DQ = 0;
//	RST =0;	
//	Data = Data / 2;
return(Data);
} // End DS1820_GetTemp


void DS1820_Write(unsigned char Data)
{
   unsigned char i;
       
   TRISB4 = 0;
   TRISB5 = 0;
   TRISB6 = 0;
  
   for (i=1; i<=8; i++) {
      DQ = (Data & 1);
DQ = 0;
		DelayUs(10);   
DQ = 1;  
      Data = Data >> 1;
      }

   }   

int DS1820_Read(void)
{
   unsigned int Data;
   unsigned int Temp;
   unsigned char i;
   
   TRISB4 = 0;
   TRISB5 = 0;
   TRISB6 = 1;

DQ = 1;
DelayUs(10);
   Data   = 0;
   Temp   = 1;
   for (i=1; i<=9; i++) {
	DQ = 0;
	DelayUs(10);
      if (DQ == 1) Data += Temp;      
      Temp = Temp * 2;  
		DelayUs(10);  
      }      

   return(Data);
}
      


