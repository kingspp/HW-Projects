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
// End LCD module connections

//Define Variables
#define del 01
#define LDelay 750
#define LRep 3

// Global Variables
int ecg,ppg;
char eprint,pprint;

//Prints ECG Voltage
void ecgVal(int ecg)
{
  eprint = ecg/1000;
  Lcd_Chr(2, 5, eprint+48);
  Lcd_Chr_CP('.');
  eprint = (ecg/100)%10;
  Lcd_Chr_CP(eprint+48); //print 2nd digit
  Lcd_Chr_CP('V');
}

//Prints PPG Voltage
void ppgVal(int ppg)
{
  pprint = ppg/1000;
  Lcd_Chr(2, 13, eprint+48);
  Lcd_Chr_CP('.');
  eprint = (ppg/100)%10;
  Lcd_Chr_CP(pprint+48); //print 2nd digit
  Lcd_Chr_CP('V');
}

// Prints Echocardiogram
void HDisp()
{
  LCD_Out(1,1,"E");
  Delay_ms(del);
  LCD_Out(1,2,"c");
  Delay_ms(del);
  LCD_Out(1,3,"h");
  Delay_ms(del);
  LCD_Out(1,4,"o");
  Delay_ms(del);
  LCD_Out(1,5,"c");
  Delay_ms(del);
  LCD_Out(1,6,"a");
  Delay_ms(del);
  LCD_Out(1,7,"r");
  Delay_ms(del);
  LCD_Out(1,8,"d");
  Delay_ms(del);
  LCD_Out(1,9,"i");
  Delay_ms(del);
  LCD_Out(1,10,"o");
  Delay_ms(del);
  LCD_Out(1,11,"g");
  Delay_ms(del);
  LCD_Out(1,12,"r");
  Delay_ms(del);
  LCD_Out(1,13,"a");
  Delay_ms(del);
  LCD_Out(1,14,"m");
  Delay_ms(del);
}

//Prints Loading . . .
void LDisp()
{
  int i,j;
  LCD_Out(2,1,"L");
  Delay_ms(del);
  LCD_Out(2,2,"o");
  Delay_ms(del);
  LCD_Out(2,3,"a");
  Delay_ms(del);
  LCD_Out(2,4,"d");
  Delay_ms(del);
  LCD_Out(2,5,"i");
  Delay_ms(del);
  LCD_Out(2,6,"n");
  Delay_ms(del);
  LCD_Out(2,7,"g");
  Delay_ms(del);
  for(i=0;i<LRep;i++)
  {
     for(j=8;j<11;j++)
     {
        Lcd_Cmd(_LCD_CURSOR_OFF);
        LCD_Out(2,j,".");
        Delay_ms(LDelay);
        LCD_Out(2,j," ");
     }
  }
}

//Prints ECG
void epDisp()
{
  Lcd_Cmd(_LCD_CURSOR_OFF);
  LCD_Out(2,1,"E");
  Delay_ms(del);
  LCD_Out(2,2,"C");
  Delay_ms(del);
  LCD_Out(2,3,"G");
  Delay_ms(del);
  LCD_Out(2,4,":");
  Delay_ms(del);
  LCD_Out(2,9,"P");
  Delay_ms(del);
  LCD_Out(2,10,"P");
  Delay_ms(del);
  LCD_Out(2,11,"G");
  Delay_ms(del);
  LCD_Out(2,12,":");
  Delay_ms(del);
}

// Echocardiogram Rotating Display
void ERotate(int r)
{
 int j;
 Lcd_Cmd(_LCD_CURSOR_OFF);
 for(j=1;j<17;j++)
 {
   LCD_Out(1,j," ");
 }
  LCD_Out(1,r++,"E");
  LCD_Out(1,r++,"c");
  LCD_Out(1,r++,"h");
  LCD_Out(1,r++,"o");
  LCD_Out(1,r++,"c");
  LCD_Out(1,r++,"a");
  LCD_Out(1,r++,"r");
  LCD_Out(1,r++,"d");
  LCD_Out(1,r++,"i");
  LCD_Out(1,r++,"o");
  LCD_Out(1,r++,"g");
  LCD_Out(1,r++,"r");
  LCD_Out(1,r++,"a");
  LCD_Out(1,r++,"m");
}

//Prints By Prof. MGS
void byDisp()
{
  Lcd_Cmd(_LCD_CLEAR);
  LCD_Out(1,1,"B");
  Delay_ms(del);
  LCD_Out(1,2,"y");
  Delay_ms(del);
  LCD_Out(1,3," ");
  Delay_ms(del);
  LCD_Out(1,4,"P");
  Delay_ms(del);
  LCD_Out(1,5,"r");
  Delay_ms(del);
  LCD_Out(1,6,"o");
  Delay_ms(del);
  LCD_Out(1,7,"f");
  Delay_ms(del);
  LCD_Out(1,8,".");
  Delay_ms(del);
  LCD_Out(1,9,"M");
  Delay_ms(del);
  LCD_Out(1,10,"G");
  Delay_ms(del);
  LCD_Out(1,11,"S");
  Delay_ms(del);
}

  //Main Function
  void main() {
  int i=1;

  TRISB = 0;
  TRISA = 0xFF;
  ADCON1 = 0x0E;

  Lcd_Init();
  HDisp();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Delay_ms(5000);
  byDisp();
  LDisp();
  epDisp();

  while (1){
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);
    epDisp();
    ecg = ADC_Read(0);
    ppg = ADC_Read(1);
    ecgVal(ecg);
    ppgVal(ppg);
    ERotate(i);
    i++;
    Delay_ms(1000);
    if(i>17)
            i=1;
  }

}