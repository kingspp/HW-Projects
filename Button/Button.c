

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

sbit SW_Inc at RB7_bit;
sbit SW_Dec at RB6_bit;

//Delay Definitions
#define SwDelay 150

char LcdStr[]="0000000", *LcdPtr;
int num=1000;


//Clear Line Functions
void LcdClearLine(int line)
{
int i=0;
for(;i<21;i++)
Lcd_Out(line,i," ");
}



int FreqInc(){
  LcdClearLine(2);
  num=num+100;
  IntToStr(num, LcdStr);
  LcdPtr= Ltrim(LcdStr);
  Lcd_Out(2, 1, LcdPtr);
  Lcd_Out_CP("Hz");
  Delay_ms(SwDelay);

}

int FreqDec(){
  LcdClearLine(2);
  num=num-100;
  IntToStr(num, LcdStr);
  LcdPtr= Ltrim(LcdStr);
  Lcd_Out(2, 1, LcdPtr);
  Lcd_Out_CP("Hz");
  Delay_ms(SwDelay);
}

void UpdateLCD()
{
sprinti(LcdStr, "%2d", num);

}

void main() {
int sum=1000;
TRISB=0xff;

Lcd_Init();
LCD_Cmd(1);
Delay_ms(2000);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1,1,"Key Test");
Lcd_Out(2,1,LcdStr);


while(1) {
   if(PORTB.F6==1)
   FreqInc();
   else if (PORTB.F7==1)
   FreqDec();
}


}