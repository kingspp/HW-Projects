
_init:

;MyProject.c,22 :: 		void init()
;MyProject.c,24 :: 		int i=0;
	CLRF       init_i_L0+0
	CLRF       init_i_L0+1
;MyProject.c,25 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;MyProject.c,26 :: 		TRISD.F0=0xFF;
	BSF        TRISD+0, 0
;MyProject.c,27 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,29 :: 		Lcd_Out(1,1,"Welcome");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,30 :: 		for(i=0;i<8;i++)
	CLRF       init_i_L0+0
	CLRF       init_i_L0+1
L_init0:
	MOVLW      128
	XORWF      init_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__init17
	MOVLW      8
	SUBWF      init_i_L0+0, 0
L__init17:
	BTFSC      STATUS+0, 0
	GOTO       L_init1
;MyProject.c,31 :: 		slot[i]=0;
	MOVF       init_i_L0+0, 0
	MOVWF      R0+0
	MOVF       init_i_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _slot+0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;MyProject.c,30 :: 		for(i=0;i<8;i++)
	INCF       init_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       init_i_L0+1, 1
;MyProject.c,31 :: 		slot[i]=0;
	GOTO       L_init0
L_init1:
;MyProject.c,32 :: 		}
L_end_init:
	RETURN
; end of _init

_clearLine:

;MyProject.c,34 :: 		void clearLine(int l)
;MyProject.c,37 :: 		for(i=1;i<17;i++)
	MOVLW      1
	MOVWF      clearLine_i_L0+0
	MOVLW      0
	MOVWF      clearLine_i_L0+1
L_clearLine3:
	MOVLW      128
	XORWF      clearLine_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__clearLine19
	MOVLW      17
	SUBWF      clearLine_i_L0+0, 0
L__clearLine19:
	BTFSC      STATUS+0, 0
	GOTO       L_clearLine4
;MyProject.c,38 :: 		LCD_Out(l,i," ");
	MOVF       FARG_clearLine_l+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       clearLine_i_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,37 :: 		for(i=1;i<17;i++)
	INCF       clearLine_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       clearLine_i_L0+1, 1
;MyProject.c,38 :: 		LCD_Out(l,i," ");
	GOTO       L_clearLine3
L_clearLine4:
;MyProject.c,39 :: 		}
L_end_clearLine:
	RETURN
; end of _clearLine

_checkSlot:

;MyProject.c,43 :: 		void checkSlot(int port)
;MyProject.c,46 :: 		for(i=0,j=7;i<8;i++)
	CLRF       R5+0
	CLRF       R5+1
	MOVLW      7
	MOVWF      R7+0
	MOVLW      0
	MOVWF      R7+1
L_checkSlot6:
	MOVLW      128
	XORWF      R5+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkSlot21
	MOVLW      8
	SUBWF      R5+0, 0
L__checkSlot21:
	BTFSC      STATUS+0, 0
	GOTO       L_checkSlot7
;MyProject.c,47 :: 		slot[j]= (port & (mask>>i)) >> j--;
	MOVF       R7+0, 0
	MOVWF      R0+0
	MOVF       R7+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _slot+0
	MOVWF      FSR
	MOVF       R5+0, 0
	MOVWF      R2+0
	MOVF       _mask+0, 0
	MOVWF      R0+0
	MOVF       _mask+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__checkSlot22:
	BTFSC      STATUS+0, 2
	GOTO       L__checkSlot23
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	ADDLW      255
	GOTO       L__checkSlot22
L__checkSlot23:
	MOVF       R0+0, 0
	ANDWF      FARG_checkSlot_port+0, 0
	MOVWF      R3+0
	MOVF       FARG_checkSlot_port+1, 0
	ANDWF      R0+1, 0
	MOVWF      R3+1
	MOVF       R7+0, 0
	MOVWF      R2+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__checkSlot24:
	BTFSC      STATUS+0, 2
	GOTO       L__checkSlot25
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	ADDLW      255
	GOTO       L__checkSlot24
L__checkSlot25:
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVLW      1
	SUBWF      R7+0, 1
	BTFSS      STATUS+0, 0
	DECF       R7+1, 1
;MyProject.c,46 :: 		for(i=0,j=7;i<8;i++)
	INCF       R5+0, 1
	BTFSC      STATUS+0, 2
	INCF       R5+1, 1
;MyProject.c,47 :: 		slot[j]= (port & (mask>>i)) >> j--;
	GOTO       L_checkSlot6
L_checkSlot7:
;MyProject.c,48 :: 		}
L_end_checkSlot:
	RETURN
; end of _checkSlot

_printSlot:

;MyProject.c,50 :: 		void printSlot(){
;MyProject.c,51 :: 		int i=0;
	CLRF       printSlot_i_L0+0
	CLRF       printSlot_i_L0+1
	MOVLW      1
	MOVWF      printSlot_j_L0+0
	MOVLW      0
	MOVWF      printSlot_j_L0+1
;MyProject.c,53 :: 		clearLine(1);
	MOVLW      1
	MOVWF      FARG_clearLine_l+0
	MOVLW      0
	MOVWF      FARG_clearLine_l+1
	CALL       _clearLine+0
;MyProject.c,54 :: 		clearLine(2);
	MOVLW      2
	MOVWF      FARG_clearLine_l+0
	MOVLW      0
	MOVWF      FARG_clearLine_l+1
	CALL       _clearLine+0
;MyProject.c,55 :: 		LCD_Out(1,1,"Slots Free :");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,56 :: 		for(i=0;i<8;i++)
	CLRF       printSlot_i_L0+0
	CLRF       printSlot_i_L0+1
L_printSlot9:
	MOVLW      128
	XORWF      printSlot_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__printSlot27
	MOVLW      8
	SUBWF      printSlot_i_L0+0, 0
L__printSlot27:
	BTFSC      STATUS+0, 0
	GOTO       L_printSlot10
;MyProject.c,58 :: 		if(slot[i]==0){
	MOVF       printSlot_i_L0+0, 0
	MOVWF      R0+0
	MOVF       printSlot_i_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _slot+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__printSlot28
	MOVLW      0
	XORWF      R1+0, 0
L__printSlot28:
	BTFSS      STATUS+0, 2
	GOTO       L_printSlot12
;MyProject.c,59 :: 		char c=i+49;
	MOVLW      49
	ADDWF      printSlot_i_L0+0, 0
	MOVWF      R0+0
	MOVF       printSlot_i_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
;MyProject.c,60 :: 		Lcd_Chr(2,j++,c);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       printSlot_j_L0+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	INCF       printSlot_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       printSlot_j_L0+1, 1
;MyProject.c,61 :: 		LCD_Out(2,j++,",");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       printSlot_j_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       printSlot_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       printSlot_j_L0+1, 1
;MyProject.c,62 :: 		}
L_printSlot12:
;MyProject.c,56 :: 		for(i=0;i<8;i++)
	INCF       printSlot_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       printSlot_i_L0+1, 1
;MyProject.c,63 :: 		}
	GOTO       L_printSlot9
L_printSlot10:
;MyProject.c,64 :: 		}
L_end_printSlot:
	RETURN
; end of _printSlot

_main:

;MyProject.c,67 :: 		void main() {
;MyProject.c,68 :: 		int temp=0x00;
	CLRF       main_temp_L0+0
	CLRF       main_temp_L0+1
;MyProject.c,70 :: 		init();
	CALL       _init+0
;MyProject.c,74 :: 		while (1){
L_main13:
;MyProject.c,76 :: 		if(PORTB!=temp)
	MOVLW      0
	XORWF      main_temp_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVF       main_temp_L0+0, 0
	XORWF      PORTB+0, 0
L__main30:
	BTFSC      STATUS+0, 2
	GOTO       L_main15
;MyProject.c,78 :: 		clearLine(2);
	MOVLW      2
	MOVWF      FARG_clearLine_l+0
	MOVLW      0
	MOVWF      FARG_clearLine_l+1
	CALL       _clearLine+0
;MyProject.c,79 :: 		checkSlot(PORTB);
	MOVF       PORTB+0, 0
	MOVWF      FARG_checkSlot_port+0
	CLRF       FARG_checkSlot_port+1
	CALL       _checkSlot+0
;MyProject.c,80 :: 		printSlot();
	CALL       _printSlot+0
;MyProject.c,81 :: 		temp=PORTB;
	MOVF       PORTB+0, 0
	MOVWF      main_temp_L0+0
	CLRF       main_temp_L0+1
;MyProject.c,82 :: 		}
L_main15:
;MyProject.c,84 :: 		}
	GOTO       L_main13
;MyProject.c,85 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
