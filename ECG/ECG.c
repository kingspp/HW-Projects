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

#define del 01
int temp;
int ecg,ppg;
char eprint,pprint;


void ecgVal(int ecg)
{
eprint = ecg/1000;
Lcd_Chr(2, 5, eprint+48);
Lcd_Chr_CP('.');
eprint = (ecg/100)%10;
Lcd_Chr_CP(eprint+48); //print 2nd digit
eprint= (ecg/10)%10;
Lcd_Chr_CP(eprint+48); //print 3rd digit
eprint=ecg%10;
Lcd_Chr_CP(eprint+48); //print 4th digit
Lcd_Chr_CP('V');
}

void ppgVal(int ppg)
{
pprint = ppg/1000;
LCD_CMD(148);
Lcd_Chr_CP(pprint+48);
Lcd_Chr_CP('.');
eprint = (ppg/100)%10;
Lcd_Chr_CP(pprint+48); //print 2nd digit
pprint= (ppg/10)%10;
Lcd_Chr_CP(pprint+48); //print 3rd digit
pprint=ppg%10;
Lcd_Chr_CP(pprint+48); //print 4th digit
Lcd_Chr_CP('V');
}

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
LCD_Out(1,9,"o");
Delay_ms(del);
LCD_Out(1,10,"g");
Delay_ms(del);
LCD_Out(1,11,"r");
Delay_ms(del);
LCD_Out(1,12,"a");
Delay_ms(del);
LCD_Out(1,13,"m");
Delay_ms(del);
}


void main() {


TRISB = 0; //PORTB as output
TRISA = 0xFF; //PORTA as input
ADCON1 = 0x0E; // Set AN0 channel pin as analog
//CMCON |= 7; // Disable comparators
Lcd_Init(); //Initialize LCD
HDisp();
LCD_Out(2,1,"ECG:");
LCD_CMD(144);
LCD_OUT_CP("PPG:");
LCD_CMD(208);
LCD_OUT_CP("Options Display");



while (1){
//Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
ecg = ADC_Read(0);
ppg = ADC_Read(1);
ecgVal(ecg);
ppgVal(ppg);
Delay_ms(1);
}

}
