/*
  Digital Voltmeter based on PIC16F688
  Rajendra Bhatt, Oct 12, 2010
*/

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

char Message1[] = "DVM Project";
unsigned int ADC_Value, DisplayVolt;
char *volt = "00.0";

void main() {
 // ANSEL = 0b00000100; // RA2/AN2 is analog input
  ADCON0 = 0b00001000; // Analog channel select @ AN2
  ADCON1 = 0x00;
 // CMCON0 = 0x07 ; // Disbale comparators
  TRISC = 0b00000000; // PORTC All Outputs
  TRISA = 0b00001100; // PORTA All Outputs, Except RA3 and RA2
  Lcd_Init();        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);             // CLEAR display
  Lcd_Cmd(_LCD_CURSOR_OFF);        // Cursor off
  Lcd_Out(1,1,Message1);
  Lcd_Chr(2,10,'V');

do {

   ADC_Value = ADC_Read(2);
   DisplayVolt = ADC_Value / 2;
   volt[0] = DisplayVolt/1000 + 48;
   volt[1] = (DisplayVolt/100)%10 + 48;
   volt[3] = (DisplayVolt/10)%10 + 48;
   Lcd_Out(2,5,volt);
   delay_ms(100);
  } while(1);

 }