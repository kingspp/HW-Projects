/*
Car-Parking Project
@Author: Prathyush SP

This program is used to diplay the free slots in the car parking lot.
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

//Declare Slots
int slot[8];
//Masking Variables
int mask=0x80;

// Initialization Function
void init()
{
	int i=0;
	TRISB = 0xFF;
	TRISD.F0=0xFF;
	Lcd_Init();
	Lcd_Cmd(_LCD_CURSOR_OFF);
	Lcd_Out(1,1,"Welcome");
	for(i=0;i<8;i++)
		slot[i]=0;
}

//Cear Line Function
void clearLine(int l)
{
	int i;
	for(i=1;i<17;i++)
		LCD_Out(l,i," ");
}

//Check Slot Function (Most Important Function)
void checkSlot(int port)
{
	int i,j;
	for(i=0,j=7;i<8;i++)
		slot[j]= (port & (mask>>i)) >> j--; //(Most Important Logic)
}

//Print Slot Function
void printSlot(){
	int i=0;
	int j=1;
	clearLine(1);
	clearLine(2);
	LCD_Out(1,1,"Slots Free :");
	for(i=0;i<8;i++)
	{
		if(slot[i]==0){
			char c=i+49;
			Lcd_Chr(2,j++,c);
			LCD_Out(2,j++,",");
		}
	}
}

//Main Function
void main() {
	int temp=0x00;
	int i=1;
	init();
        while (1){

		if(PORTB!=temp)
		{
			clearLine(2);
			checkSlot(PORTB);
			printSlot();
			temp=PORTB;
		}

	}
}
