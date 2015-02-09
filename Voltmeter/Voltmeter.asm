
_main:

;Voltmeter.c,25 :: 		void main() {
;Voltmeter.c,27 :: 		ADCON0 = 0b00001000; // Analog channel select @ AN2
	MOVLW      8
	MOVWF      ADCON0+0
;Voltmeter.c,28 :: 		ADCON1 = 0x00;
	CLRF       ADCON1+0
;Voltmeter.c,30 :: 		TRISC = 0b00000000; // PORTC All Outputs
	CLRF       TRISC+0
;Voltmeter.c,31 :: 		TRISA = 0b00001100; // PORTA All Outputs, Except RA3 and RA2
	MOVLW      12
	MOVWF      TRISA+0
;Voltmeter.c,32 :: 		Lcd_Init();        // Initialize LCD
	CALL       _Lcd_Init+0
;Voltmeter.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);             // CLEAR display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Voltmeter.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Voltmeter.c,35 :: 		Lcd_Out(1,1,Message1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Message1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Voltmeter.c,36 :: 		Lcd_Chr(2,10,'V');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      86
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Voltmeter.c,38 :: 		do {
L_main0:
;Voltmeter.c,40 :: 		ADC_Value = ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ADC_Value+0
	MOVF       R0+1, 0
	MOVWF      _ADC_Value+1
;Voltmeter.c,41 :: 		DisplayVolt = ADC_Value / 2;
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _DisplayVolt+0
	MOVF       R2+1, 0
	MOVWF      _DisplayVolt+1
;Voltmeter.c,42 :: 		volt[0] = DisplayVolt/1000 + 48;
	MOVF       _volt+0, 0
	MOVWF      FLOC__main+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Voltmeter.c,43 :: 		volt[1] = (DisplayVolt/100)%10 + 48;
	INCF       _volt+0, 0
	MOVWF      FLOC__main+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _DisplayVolt+0, 0
	MOVWF      R0+0
	MOVF       _DisplayVolt+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Voltmeter.c,44 :: 		volt[3] = (DisplayVolt/10)%10 + 48;
	MOVLW      3
	ADDWF      _volt+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _DisplayVolt+0, 0
	MOVWF      R0+0
	MOVF       _DisplayVolt+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Voltmeter.c,45 :: 		Lcd_Out(2,5,volt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _volt+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Voltmeter.c,46 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Voltmeter.c,47 :: 		} while(1);
	GOTO       L_main0
;Voltmeter.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
