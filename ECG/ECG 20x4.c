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

//Define Variables
#define del 01
#define LDelay 750
#define LRep 3
#define eRow 2
#define pRow 3
#define loadRow 2
#define byRow 4

// Global Variables
int ecg,ppg;
char eprint,pprint;

//Prints ECG Voltage
void ecgVal(int ecg)
{
  eprint = ecg/1000;
  Lcd_Chr(2, 5, eprint+48);
  Lcd_Out(2, 6, ".");
  eprint = (ecg/100)%10;
  Lcd_Chr(2, 7, eprint+48); //print 2nd digit
  Lcd_Out(2, 8, "V");
}

//Prints PPG Voltage
void ppgVal(int ppg)
{
  pprint = ppg/1000;
  Lcd_Chr(3, 5, eprint+48);
  Lcd_Out(3, 6, ".");
  eprint = (ppg/100)%10;
  Lcd_Chr(3, 7, eprint+48); //print 2nd digit
  Lcd_Out(3, 8, "V");
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
  LCD_Out(loadRow,1,"L");
  Delay_ms(del);
  LCD_Out(loadRow,2,"o");
  Delay_ms(del);
  LCD_Out(loadRow,3,"a");
  Delay_ms(del);
  LCD_Out(loadRow,4,"d");
  Delay_ms(del);
  LCD_Out(loadRow,5,"i");
  Delay_ms(del);
  LCD_Out(loadRow,6,"n");
  Delay_ms(del);
  LCD_Out(loadRow,7,"g");
  Delay_ms(del);
  for(i=0;i<LRep;i++)
  {
     for(j=8;j<11;j++)
     {
        Lcd_Cmd(_LCD_CURSOR_OFF);
        LCD_Out(loadRow,j,".");
        Delay_ms(LDelay);
        LCD_Out(loadRow,j," ");
     }
  }
}

//Prints ECG
void epDisp()
{
  Lcd_Cmd(_LCD_CURSOR_OFF);
  LCD_Out(eRow,1,"E");
  Delay_ms(del);
  LCD_Out(eRow,2,"C");
  Delay_ms(del);
  LCD_Out(eRow,3,"G");
  Delay_ms(del);
  LCD_Out(eRow,4,":");
  Delay_ms(del);
  LCD_Out(pRow,1,"P");
  Delay_ms(del);
  LCD_Out(pRow,2,"P");
  Delay_ms(del);
  LCD_Out(pRow,3,"G");
  Delay_ms(del);
  LCD_Out(pRow,4,":");
  Delay_ms(del);
}

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



//Prints By Prof. MGS
void byDisp()
{
//  Lcd_Cmd(_LCD_CLEAR);
  LCD_Out(byRow,9,"-");
  Delay_ms(del);
  LCD_Out(byRow,10,"B");
  Delay_ms(del);
  LCD_Out(byRow,11,"y");
  Delay_ms(del);
  LCD_Out(byRow,12," ");
  Delay_ms(del);
  LCD_Out(byRow,13,"P");
  Delay_ms(del);
  LCD_Out(byRow,14,"r");
  Delay_ms(del);
  LCD_Out(byRow,15,"o");
  Delay_ms(del);
  LCD_Out(byRow,16,"f");
  Delay_ms(del);
  LCD_Out(byRow,17,".");
  Delay_ms(del);
  LCD_Out(byRow,18,"M");
  Delay_ms(del);
  LCD_Out(byRow,19,"G");
  Delay_ms(del);
  LCD_Out(byRow,20,"S");
  Delay_ms(del);
}

  //Main Function
  void main() {
  int i=1;

  TRISB = 0x00;
  TRISA = 0xFF;
  ADCON1 = 0x80;

  Lcd_Init();
  HDisp();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  //Delay_ms(5000);
  byDisp();
  LDisp();
  epDisp();
  byDisp();

  while (1){
    //Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);

    ecg = ADC_Read(0);
    ppg = ADC_Read(1);
    ecgVal(ecg);
    ppgVal(ppg);
   // ERotate(i);
    i++;
    Delay_ms(1000);
    if(i>20)
            i=1;
  }

}