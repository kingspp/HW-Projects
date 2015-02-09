
_ecgVal:

;ECG 16x2.c,26 :: 		void ecgVal(int ecg)
;ECG 16x2.c,28 :: 		eprint = ecg/1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_ecgVal_ecg+0, 0
	MOVWF      R0+0
	MOVF       FARG_ecgVal_ecg+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _eprint+0
;ECG 16x2.c,29 :: 		Lcd_Chr(2, 5, eprint+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;ECG 16x2.c,30 :: 		Lcd_Chr_CP('.');
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;ECG 16x2.c,31 :: 		eprint = (ecg/100)%10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_ecgVal_ecg+0, 0
	MOVWF      R0+0
	MOVF       FARG_ecgVal_ecg+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _eprint+0
;ECG 16x2.c,32 :: 		Lcd_Chr_CP(eprint+48); //print 2nd digit
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;ECG 16x2.c,33 :: 		Lcd_Chr_CP('V');
	MOVLW      86
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;ECG 16x2.c,34 :: 		}
L_end_ecgVal:
	RETURN
; end of _ecgVal

_ppgVal:

;ECG 16x2.c,37 :: 		void ppgVal(int ppg)
;ECG 16x2.c,39 :: 		pprint = ppg/1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_ppgVal_ppg+0, 0
	MOVWF      R0+0
	MOVF       FARG_ppgVal_ppg+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _pprint+0
;ECG 16x2.c,40 :: 		Lcd_Chr(2, 13, eprint+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      _eprint+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;ECG 16x2.c,41 :: 		Lcd_Chr_CP('.');
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;ECG 16x2.c,42 :: 		eprint = (ppg/100)%10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_ppgVal_ppg+0, 0
	MOVWF      R0+0
	MOVF       FARG_ppgVal_ppg+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _eprint+0
;ECG 16x2.c,43 :: 		Lcd_Chr_CP(pprint+48); //print 2nd digit
	MOVLW      48
	ADDWF      _pprint+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;ECG 16x2.c,44 :: 		Lcd_Chr_CP('V');
	MOVLW      86
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;ECG 16x2.c,45 :: 		}
L_end_ppgVal:
	RETURN
; end of _ppgVal

_HDisp:

;ECG 16x2.c,48 :: 		void HDisp()
;ECG 16x2.c,50 :: 		LCD_Out(1,1,"E");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,51 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp0:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp0
	DECFSZ     R12+0, 1
	GOTO       L_HDisp0
	NOP
	NOP
;ECG 16x2.c,52 :: 		LCD_Out(1,2,"c");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,53 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp1:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp1
	DECFSZ     R12+0, 1
	GOTO       L_HDisp1
	NOP
	NOP
;ECG 16x2.c,54 :: 		LCD_Out(1,3,"h");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,55 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp2:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp2
	DECFSZ     R12+0, 1
	GOTO       L_HDisp2
	NOP
	NOP
;ECG 16x2.c,56 :: 		LCD_Out(1,4,"o");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,57 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp3:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp3
	DECFSZ     R12+0, 1
	GOTO       L_HDisp3
	NOP
	NOP
;ECG 16x2.c,58 :: 		LCD_Out(1,5,"c");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,59 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp4:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp4
	DECFSZ     R12+0, 1
	GOTO       L_HDisp4
	NOP
	NOP
;ECG 16x2.c,60 :: 		LCD_Out(1,6,"a");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,61 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp5:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp5
	DECFSZ     R12+0, 1
	GOTO       L_HDisp5
	NOP
	NOP
;ECG 16x2.c,62 :: 		LCD_Out(1,7,"r");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,63 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp6:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp6
	DECFSZ     R12+0, 1
	GOTO       L_HDisp6
	NOP
	NOP
;ECG 16x2.c,64 :: 		LCD_Out(1,8,"d");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,65 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp7:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp7
	DECFSZ     R12+0, 1
	GOTO       L_HDisp7
	NOP
	NOP
;ECG 16x2.c,66 :: 		LCD_Out(1,9,"i");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,67 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp8:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp8
	DECFSZ     R12+0, 1
	GOTO       L_HDisp8
	NOP
	NOP
;ECG 16x2.c,68 :: 		LCD_Out(1,10,"o");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,69 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp9:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp9
	DECFSZ     R12+0, 1
	GOTO       L_HDisp9
	NOP
	NOP
;ECG 16x2.c,70 :: 		LCD_Out(1,11,"g");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,71 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp10:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp10
	DECFSZ     R12+0, 1
	GOTO       L_HDisp10
	NOP
	NOP
;ECG 16x2.c,72 :: 		LCD_Out(1,12,"r");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,73 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp11:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp11
	DECFSZ     R12+0, 1
	GOTO       L_HDisp11
	NOP
	NOP
;ECG 16x2.c,74 :: 		LCD_Out(1,13,"a");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,75 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp12:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp12
	DECFSZ     R12+0, 1
	GOTO       L_HDisp12
	NOP
	NOP
;ECG 16x2.c,76 :: 		LCD_Out(1,14,"m");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,77 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_HDisp13:
	DECFSZ     R13+0, 1
	GOTO       L_HDisp13
	DECFSZ     R12+0, 1
	GOTO       L_HDisp13
	NOP
	NOP
;ECG 16x2.c,78 :: 		}
L_end_HDisp:
	RETURN
; end of _HDisp

_LDisp:

;ECG 16x2.c,81 :: 		void LDisp()
;ECG 16x2.c,84 :: 		LCD_Out(2,1,"L");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,85 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_LDisp14:
	DECFSZ     R13+0, 1
	GOTO       L_LDisp14
	DECFSZ     R12+0, 1
	GOTO       L_LDisp14
	NOP
	NOP
;ECG 16x2.c,86 :: 		LCD_Out(2,2,"o");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,87 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_LDisp15:
	DECFSZ     R13+0, 1
	GOTO       L_LDisp15
	DECFSZ     R12+0, 1
	GOTO       L_LDisp15
	NOP
	NOP
;ECG 16x2.c,88 :: 		LCD_Out(2,3,"a");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr17_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,89 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_LDisp16:
	DECFSZ     R13+0, 1
	GOTO       L_LDisp16
	DECFSZ     R12+0, 1
	GOTO       L_LDisp16
	NOP
	NOP
;ECG 16x2.c,90 :: 		LCD_Out(2,4,"d");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr18_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,91 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_LDisp17:
	DECFSZ     R13+0, 1
	GOTO       L_LDisp17
	DECFSZ     R12+0, 1
	GOTO       L_LDisp17
	NOP
	NOP
;ECG 16x2.c,92 :: 		LCD_Out(2,5,"i");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr19_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,93 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_LDisp18:
	DECFSZ     R13+0, 1
	GOTO       L_LDisp18
	DECFSZ     R12+0, 1
	GOTO       L_LDisp18
	NOP
	NOP
;ECG 16x2.c,94 :: 		LCD_Out(2,6,"n");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr20_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,95 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_LDisp19:
	DECFSZ     R13+0, 1
	GOTO       L_LDisp19
	DECFSZ     R12+0, 1
	GOTO       L_LDisp19
	NOP
	NOP
;ECG 16x2.c,96 :: 		LCD_Out(2,7,"g");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr21_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,97 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_LDisp20:
	DECFSZ     R13+0, 1
	GOTO       L_LDisp20
	DECFSZ     R12+0, 1
	GOTO       L_LDisp20
	NOP
	NOP
;ECG 16x2.c,98 :: 		for(i=0;i<LRep;i++)
	CLRF       LDisp_i_L0+0
	CLRF       LDisp_i_L0+1
L_LDisp21:
	MOVLW      128
	XORWF      LDisp_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LDisp59
	MOVLW      3
	SUBWF      LDisp_i_L0+0, 0
L__LDisp59:
	BTFSC      STATUS+0, 0
	GOTO       L_LDisp22
;ECG 16x2.c,100 :: 		for(j=8;j<11;j++)
	MOVLW      8
	MOVWF      LDisp_j_L0+0
	MOVLW      0
	MOVWF      LDisp_j_L0+1
L_LDisp24:
	MOVLW      128
	XORWF      LDisp_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LDisp60
	MOVLW      11
	SUBWF      LDisp_j_L0+0, 0
L__LDisp60:
	BTFSC      STATUS+0, 0
	GOTO       L_LDisp25
;ECG 16x2.c,102 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 16x2.c,103 :: 		LCD_Out(2,j,".");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       LDisp_j_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr22_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,104 :: 		Delay_ms(LDelay);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_LDisp27:
	DECFSZ     R13+0, 1
	GOTO       L_LDisp27
	DECFSZ     R12+0, 1
	GOTO       L_LDisp27
	DECFSZ     R11+0, 1
	GOTO       L_LDisp27
	NOP
	NOP
;ECG 16x2.c,105 :: 		LCD_Out(2,j," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       LDisp_j_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr23_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,100 :: 		for(j=8;j<11;j++)
	INCF       LDisp_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       LDisp_j_L0+1, 1
;ECG 16x2.c,106 :: 		}
	GOTO       L_LDisp24
L_LDisp25:
;ECG 16x2.c,98 :: 		for(i=0;i<LRep;i++)
	INCF       LDisp_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       LDisp_i_L0+1, 1
;ECG 16x2.c,107 :: 		}
	GOTO       L_LDisp21
L_LDisp22:
;ECG 16x2.c,108 :: 		}
L_end_LDisp:
	RETURN
; end of _LDisp

_epDisp:

;ECG 16x2.c,111 :: 		void epDisp()
;ECG 16x2.c,113 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 16x2.c,114 :: 		LCD_Out(2,1,"E");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr24_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,115 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_epDisp28:
	DECFSZ     R13+0, 1
	GOTO       L_epDisp28
	DECFSZ     R12+0, 1
	GOTO       L_epDisp28
	NOP
	NOP
;ECG 16x2.c,116 :: 		LCD_Out(2,2,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr25_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,117 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_epDisp29:
	DECFSZ     R13+0, 1
	GOTO       L_epDisp29
	DECFSZ     R12+0, 1
	GOTO       L_epDisp29
	NOP
	NOP
;ECG 16x2.c,118 :: 		LCD_Out(2,3,"G");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr26_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,119 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_epDisp30:
	DECFSZ     R13+0, 1
	GOTO       L_epDisp30
	DECFSZ     R12+0, 1
	GOTO       L_epDisp30
	NOP
	NOP
;ECG 16x2.c,120 :: 		LCD_Out(2,4,":");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr27_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,121 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_epDisp31:
	DECFSZ     R13+0, 1
	GOTO       L_epDisp31
	DECFSZ     R12+0, 1
	GOTO       L_epDisp31
	NOP
	NOP
;ECG 16x2.c,122 :: 		LCD_Out(2,9,"P");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr28_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,123 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_epDisp32:
	DECFSZ     R13+0, 1
	GOTO       L_epDisp32
	DECFSZ     R12+0, 1
	GOTO       L_epDisp32
	NOP
	NOP
;ECG 16x2.c,124 :: 		LCD_Out(2,10,"P");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr29_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,125 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_epDisp33:
	DECFSZ     R13+0, 1
	GOTO       L_epDisp33
	DECFSZ     R12+0, 1
	GOTO       L_epDisp33
	NOP
	NOP
;ECG 16x2.c,126 :: 		LCD_Out(2,11,"G");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr30_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,127 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_epDisp34:
	DECFSZ     R13+0, 1
	GOTO       L_epDisp34
	DECFSZ     R12+0, 1
	GOTO       L_epDisp34
	NOP
	NOP
;ECG 16x2.c,128 :: 		LCD_Out(2,12,":");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr31_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,129 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_epDisp35:
	DECFSZ     R13+0, 1
	GOTO       L_epDisp35
	DECFSZ     R12+0, 1
	GOTO       L_epDisp35
	NOP
	NOP
;ECG 16x2.c,130 :: 		}
L_end_epDisp:
	RETURN
; end of _epDisp

_ERotate:

;ECG 16x2.c,133 :: 		void ERotate(int r)
;ECG 16x2.c,136 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 16x2.c,137 :: 		for(j=1;j<17;j++)
	MOVLW      1
	MOVWF      ERotate_j_L0+0
	MOVLW      0
	MOVWF      ERotate_j_L0+1
L_ERotate36:
	MOVLW      128
	XORWF      ERotate_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ERotate63
	MOVLW      17
	SUBWF      ERotate_j_L0+0, 0
L__ERotate63:
	BTFSC      STATUS+0, 0
	GOTO       L_ERotate37
;ECG 16x2.c,139 :: 		LCD_Out(1,j," ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       ERotate_j_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr32_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,137 :: 		for(j=1;j<17;j++)
	INCF       ERotate_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       ERotate_j_L0+1, 1
;ECG 16x2.c,140 :: 		}
	GOTO       L_ERotate36
L_ERotate37:
;ECG 16x2.c,141 :: 		LCD_Out(1,r++,"E");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr33_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,142 :: 		LCD_Out(1,r++,"c");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr34_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,143 :: 		LCD_Out(1,r++,"h");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr35_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,144 :: 		LCD_Out(1,r++,"o");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr36_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,145 :: 		LCD_Out(1,r++,"c");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr37_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,146 :: 		LCD_Out(1,r++,"a");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr38_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,147 :: 		LCD_Out(1,r++,"r");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr39_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,148 :: 		LCD_Out(1,r++,"d");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr40_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,149 :: 		LCD_Out(1,r++,"i");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr41_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,150 :: 		LCD_Out(1,r++,"o");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr42_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,151 :: 		LCD_Out(1,r++,"g");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr43_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,152 :: 		LCD_Out(1,r++,"r");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr44_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,153 :: 		LCD_Out(1,r++,"a");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr45_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,154 :: 		LCD_Out(1,r++,"m");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr46_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 16x2.c,155 :: 		}
L_end_ERotate:
	RETURN
; end of _ERotate

_byDisp:

;ECG 16x2.c,158 :: 		void byDisp()
;ECG 16x2.c,160 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 16x2.c,161 :: 		LCD_Out(1,1,"B");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr47_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,162 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp39:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp39
	DECFSZ     R12+0, 1
	GOTO       L_byDisp39
	NOP
	NOP
;ECG 16x2.c,163 :: 		LCD_Out(1,2,"y");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr48_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,164 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp40:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp40
	DECFSZ     R12+0, 1
	GOTO       L_byDisp40
	NOP
	NOP
;ECG 16x2.c,165 :: 		LCD_Out(1,3," ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr49_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,166 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp41:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp41
	DECFSZ     R12+0, 1
	GOTO       L_byDisp41
	NOP
	NOP
;ECG 16x2.c,167 :: 		LCD_Out(1,4,"P");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr50_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,168 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp42:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp42
	DECFSZ     R12+0, 1
	GOTO       L_byDisp42
	NOP
	NOP
;ECG 16x2.c,169 :: 		LCD_Out(1,5,"r");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr51_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,170 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp43:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp43
	DECFSZ     R12+0, 1
	GOTO       L_byDisp43
	NOP
	NOP
;ECG 16x2.c,171 :: 		LCD_Out(1,6,"o");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr52_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,172 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp44:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp44
	DECFSZ     R12+0, 1
	GOTO       L_byDisp44
	NOP
	NOP
;ECG 16x2.c,173 :: 		LCD_Out(1,7,"f");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr53_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,174 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp45:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp45
	DECFSZ     R12+0, 1
	GOTO       L_byDisp45
	NOP
	NOP
;ECG 16x2.c,175 :: 		LCD_Out(1,8,".");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr54_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,176 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp46:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp46
	DECFSZ     R12+0, 1
	GOTO       L_byDisp46
	NOP
	NOP
;ECG 16x2.c,177 :: 		LCD_Out(1,9,"M");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr55_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,178 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp47:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp47
	DECFSZ     R12+0, 1
	GOTO       L_byDisp47
	NOP
	NOP
;ECG 16x2.c,179 :: 		LCD_Out(1,10,"G");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr56_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,180 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp48:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp48
	DECFSZ     R12+0, 1
	GOTO       L_byDisp48
	NOP
	NOP
;ECG 16x2.c,181 :: 		LCD_Out(1,11,"S");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr57_ECG_3216x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 16x2.c,182 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp49:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp49
	DECFSZ     R12+0, 1
	GOTO       L_byDisp49
	NOP
	NOP
;ECG 16x2.c,183 :: 		}
L_end_byDisp:
	RETURN
; end of _byDisp

_main:

;ECG 16x2.c,186 :: 		void main() {
;ECG 16x2.c,187 :: 		int i=1;
	MOVLW      1
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
;ECG 16x2.c,189 :: 		TRISB = 0;
	CLRF       TRISB+0
;ECG 16x2.c,190 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;ECG 16x2.c,191 :: 		ADCON1 = 0x0E;
	MOVLW      14
	MOVWF      ADCON1+0
;ECG 16x2.c,193 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;ECG 16x2.c,194 :: 		HDisp();
	CALL       _HDisp+0
;ECG 16x2.c,195 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 16x2.c,196 :: 		Delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main50:
	DECFSZ     R13+0, 1
	GOTO       L_main50
	DECFSZ     R12+0, 1
	GOTO       L_main50
	DECFSZ     R11+0, 1
	GOTO       L_main50
	NOP
	NOP
;ECG 16x2.c,197 :: 		byDisp();
	CALL       _byDisp+0
;ECG 16x2.c,198 :: 		LDisp();
	CALL       _LDisp+0
;ECG 16x2.c,199 :: 		epDisp();
	CALL       _epDisp+0
;ECG 16x2.c,201 :: 		while (1){
L_main51:
;ECG 16x2.c,202 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 16x2.c,203 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 16x2.c,204 :: 		epDisp();
	CALL       _epDisp+0
;ECG 16x2.c,205 :: 		ecg = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ecg+0
	MOVF       R0+1, 0
	MOVWF      _ecg+1
;ECG 16x2.c,206 :: 		ppg = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ppg+0
	MOVF       R0+1, 0
	MOVWF      _ppg+1
;ECG 16x2.c,207 :: 		ecgVal(ecg);
	MOVF       _ecg+0, 0
	MOVWF      FARG_ecgVal_ecg+0
	MOVF       _ecg+1, 0
	MOVWF      FARG_ecgVal_ecg+1
	CALL       _ecgVal+0
;ECG 16x2.c,208 :: 		ppgVal(ppg);
	MOVF       _ppg+0, 0
	MOVWF      FARG_ppgVal_ppg+0
	MOVF       _ppg+1, 0
	MOVWF      FARG_ppgVal_ppg+1
	CALL       _ppgVal+0
;ECG 16x2.c,209 :: 		ERotate(i);
	MOVF       main_i_L0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       main_i_L0+1, 0
	MOVWF      FARG_ERotate_r+1
	CALL       _ERotate+0
;ECG 16x2.c,210 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;ECG 16x2.c,211 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main53:
	DECFSZ     R13+0, 1
	GOTO       L_main53
	DECFSZ     R12+0, 1
	GOTO       L_main53
	DECFSZ     R11+0, 1
	GOTO       L_main53
	NOP
	NOP
;ECG 16x2.c,212 :: 		if(i>17)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVF       main_i_L0+0, 0
	SUBLW      17
L__main66:
	BTFSC      STATUS+0, 0
	GOTO       L_main54
;ECG 16x2.c,213 :: 		i=1;
	MOVLW      1
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main54:
;ECG 16x2.c,214 :: 		}
	GOTO       L_main51
;ECG 16x2.c,216 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
