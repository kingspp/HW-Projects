// LCD module connections
sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;
//Definitions
#define outPut 0x00
#define inPut  0xff

//Row Definitions
#define loadRow 2
#define byRow 4
#define eRow 2
#define pRow 3

//Delay Definitions
#define HDelay 1
#define LDelay 1
#define ByDelay 1
#define EPDelay 1
#define RDelay 500

//Loop Definitions
#define LRep 0

//Scaling Factor
#define sf 2

// Global Variables
int ecg,ppg;
char eprint,pprint;


//Functions
// Prints Echocardiogram
void HDisp()
{
  LCD_Out(1,1,"E");
  Delay_ms(HDelay);
  LCD_Out(1,2,"c");
  Delay_ms(HDelay);
  LCD_Out(1,3,"h");
  Delay_ms(HDelay);
  LCD_Out(1,4,"o");
  Delay_ms(HDelay);
  LCD_Out(1,5,"c");
  Delay_ms(HDelay);
  LCD_Out(1,6,"a");
  Delay_ms(HDelay);
  LCD_Out(1,7,"r");
  Delay_ms(HDelay);
  LCD_Out(1,8,"d");
  Delay_ms(HDelay);
  LCD_Out(1,9,"i");
  Delay_ms(HDelay);
  LCD_Out(1,10,"o");
  Delay_ms(HDelay);
  LCD_Out(1,11,"g");
  Delay_ms(HDelay);
  LCD_Out(1,12,"r");
  Delay_ms(HDelay);
  LCD_Out(1,13,"a");
  Delay_ms(HDelay);
  LCD_Out(1,14,"m");
  Delay_ms(HDelay);
}

//Prints By kingspp
void byDisp()
{
//  Lcd_Cmd(_LCD_CLEAR);
  LCD_Out(byRow,9,"-");
  Delay_ms(ByDelay);
  LCD_Out(byRow,10,"B");
  Delay_ms(ByDelay);
  LCD_Out(byRow,11,"y");
  Delay_ms(ByDelay);
  LCD_Out(byRow,12," ");
  Delay_ms(ByDelay);
  LCD_Out(byRow,13,"K");
  Delay_ms(ByDelay);
  LCD_Out(byRow,14,"i");
  Delay_ms(ByDelay);
  LCD_Out(byRow,15,"n");
  Delay_ms(ByDelay);
  LCD_Out(byRow,16,"g");
  Delay_ms(ByDelay);
  LCD_Out(byRow,17,"s");
  Delay_ms(ByDelay);
  LCD_Out(byRow,18,"p");
  Delay_ms(ByDelay);
  LCD_Out(byRow,19,"p");
  Delay_ms(ByDelay);
}

//Prints Loading . . .
void LDisp()
{
  int i,j;
  LCD_Out(loadRow,1,"L");
  Delay_ms(LDelay);
  LCD_Out(loadRow,2,"o");
  Delay_ms(LDelay);
  LCD_Out(loadRow,3,"a");
  Delay_ms(LDelay);
  LCD_Out(loadRow,4,"d");
  Delay_ms(LDelay);
  LCD_Out(loadRow,5,"i");
  Delay_ms(LDelay);
  LCD_Out(loadRow,6,"n");
  Delay_ms(LDelay);
  LCD_Out(loadRow,7,"g");
  Delay_ms(LDelay);
  for(i=0;i<3;i++)
  {
     for(j=8;j<11;j++)
     {
        Lcd_Cmd(_LCD_CURSOR_OFF);
        LCD_Out(2,j,".");
        Delay_ms(750);
        LCD_Out(2,j," ");
     }
  }
}

//Function for Rotating Display
int checkR(int x)
{
if(x>20)
x=0;
return x;
}

// Echocardiogram Rotating Display
void ERotate(int r)
{
 int j;
 Lcd_Cmd(_LCD_CURSOR_OFF);
 for(j=1;j<21;j++)
 {
   LCD_Out(1,j," ");
 }

  LCD_Out(1,r++,"E");
  r=checkR(r);
  LCD_Out(1,r++,"c");
  r=checkR(r);
  LCD_Out(1,r++,"h");
  r=checkR(r);
  LCD_Out(1,r++,"o");
  r=checkR(r);
  LCD_Out(1,r++,"c");
  r=checkR(r);
  LCD_Out(1,r++,"a");
  r=checkR(r);
  LCD_Out(1,r++,"r");
  r=checkR(r);
  LCD_Out(1,r++,"d");
  r=checkR(r);
  LCD_Out(1,r++,"i");
  r=checkR(r);
  LCD_Out(1,r++,"o");
  r=checkR(r);
  LCD_Out(1,r++,"g");
  r=checkR(r);
  LCD_Out(1,r++,"r");
  r=checkR(r);
  LCD_Out(1,r++,"a");
  r=checkR(r);
  LCD_Out(1,r++,"m");
  r=checkR(r);
}

//Prints ECG: PPG:
void epDisp()
{
  Lcd_Cmd(_LCD_CURSOR_OFF);
  LCD_Out(eRow,1,"E");
  Delay_ms(EPDelay);
  LCD_Out(eRow,2,"C");
  Delay_ms(EPDelay);
  LCD_Out(eRow,3,"G");
  Delay_ms(EPDelay);
  LCD_Out(eRow,4,":");
  Delay_ms(EPDelay);
  LCD_Out(pRow,1,"P");
  Delay_ms(EPDelay);
  LCD_Out(pRow,2,"P");
  Delay_ms(EPDelay);
  LCD_Out(pRow,3,"G");
  Delay_ms(EPDelay);
  LCD_Out(pRow,4,":");
  Delay_ms(EPDelay);
}

//Prints ECG Voltage
void ecgVal(int ecg)
{
   char *volt = "00.0";
   volt[0] = ecg/1000 + 48;
   volt[1] = (ecg/100)%10 + 48;
   volt[3] = (ecg/10)%10 + 48;
   Lcd_Out(2,5,volt);
   Lcd_Chr(2,9,'V');
}

//Prints PPG Voltage
void ppgVal(int ppg)
{
  char *volt = "00.0";
   volt[0] = ppg/1000 + 48;
   volt[1] = (ppg/100)%10 + 48;
   volt[3] = (ppg/10)%10 + 48;
   Lcd_Out(3,5,volt);
   Lcd_Chr(3,9,'V');
}

// Main Function
void main() {
char chVAL[16];
unsigned int adc_value=0;
  int i=1;
  char temp[7];
  TRISC = 0b00000000; // PORTC All Outputs
  TRISA = 0b00001100; // PORTA All Outputs, Except RA3 and RA2
  ADCON0 = 0b10001000; // Analog channel select @ AN2 & AN1

  Lcd_Init();// Initialize LCD
  HDisp();
  byDisp();
  LDisp();
  Lcd_Cmd(_LCD_CLEAR);
  byDisp();
  epDisp();
  
  while(1)
  {
   ERotate(i);
   ecg = ADC_Read(2);
   ppg = ADC_Read(3);
   ecgVal(ecg/sf);
   ppgVal(ppg/sf);
   Delay_ms(RDelay);
   i++;
   if(i>20)
   i=1;
  }
}