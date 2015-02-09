
_ecgVal:

;ECG 20x4.c,29 :: 		void ecgVal(int ecg)
;ECG 20x4.c,31 :: 		eprint = ecg/1000;
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
;ECG 20x4.c,32 :: 		Lcd_Chr(2, 5, eprint+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;ECG 20x4.c,33 :: 		Lcd_Out(2, 6, ".");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,34 :: 		eprint = (ecg/100)%10;
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
;ECG 20x4.c,35 :: 		Lcd_Chr(2, 7, eprint+48); //print 2nd digit
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;ECG 20x4.c,36 :: 		Lcd_Out(2, 8, "V");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,37 :: 		}
L_end_ecgVal:
	RETURN
; end of _ecgVal

_ppgVal:

;ECG 20x4.c,40 :: 		void ppgVal(int ppg)
;ECG 20x4.c,42 :: 		pprint = ppg/1000;
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
;ECG 20x4.c,43 :: 		Lcd_Chr(3, 5, eprint+48);
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      _eprint+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;ECG 20x4.c,44 :: 		Lcd_Out(3, 6, ".");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,45 :: 		eprint = (ppg/100)%10;
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
;ECG 20x4.c,46 :: 		Lcd_Chr(3, 7, eprint+48); //print 2nd digit
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;ECG 20x4.c,47 :: 		Lcd_Out(3, 8, "V");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,48 :: 		}
L_end_ppgVal:
	RETURN
; end of _ppgVal

_HDisp:

;ECG 20x4.c,51 :: 		void HDisp()
;ECG 20x4.c,53 :: 		LCD_Out(1,1,"E");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,54 :: 		Delay_ms(del);
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
;ECG 20x4.c,55 :: 		LCD_Out(1,2,"c");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,56 :: 		Delay_ms(del);
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
;ECG 20x4.c,57 :: 		LCD_Out(1,3,"h");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,58 :: 		Delay_ms(del);
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
;ECG 20x4.c,59 :: 		LCD_Out(1,4,"o");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,60 :: 		Delay_ms(del);
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
;ECG 20x4.c,61 :: 		LCD_Out(1,5,"c");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,62 :: 		Delay_ms(del);
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
;ECG 20x4.c,63 :: 		LCD_Out(1,6,"a");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,64 :: 		Delay_ms(del);
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
;ECG 20x4.c,65 :: 		LCD_Out(1,7,"r");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,66 :: 		Delay_ms(del);
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
;ECG 20x4.c,67 :: 		LCD_Out(1,8,"d");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,68 :: 		Delay_ms(del);
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
;ECG 20x4.c,69 :: 		LCD_Out(1,9,"i");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,70 :: 		Delay_ms(del);
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
;ECG 20x4.c,71 :: 		LCD_Out(1,10,"o");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,72 :: 		Delay_ms(del);
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
;ECG 20x4.c,73 :: 		LCD_Out(1,11,"g");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,74 :: 		Delay_ms(del);
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
;ECG 20x4.c,75 :: 		LCD_Out(1,12,"r");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,76 :: 		Delay_ms(del);
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
;ECG 20x4.c,77 :: 		LCD_Out(1,13,"a");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr17_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,78 :: 		Delay_ms(del);
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
;ECG 20x4.c,79 :: 		LCD_Out(1,14,"m");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr18_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,80 :: 		Delay_ms(del);
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
;ECG 20x4.c,81 :: 		}
L_end_HDisp:
	RETURN
; end of _HDisp

_LDisp:

;ECG 20x4.c,84 :: 		void LDisp()
;ECG 20x4.c,87 :: 		LCD_Out(loadRow,1,"L");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr19_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,88 :: 		Delay_ms(del);
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
;ECG 20x4.c,89 :: 		LCD_Out(loadRow,2,"o");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr20_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,90 :: 		Delay_ms(del);
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
;ECG 20x4.c,91 :: 		LCD_Out(loadRow,3,"a");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr21_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,92 :: 		Delay_ms(del);
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
;ECG 20x4.c,93 :: 		LCD_Out(loadRow,4,"d");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr22_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,94 :: 		Delay_ms(del);
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
;ECG 20x4.c,95 :: 		LCD_Out(loadRow,5,"i");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr23_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,96 :: 		Delay_ms(del);
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
;ECG 20x4.c,97 :: 		LCD_Out(loadRow,6,"n");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr24_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,98 :: 		Delay_ms(del);
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
;ECG 20x4.c,99 :: 		LCD_Out(loadRow,7,"g");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr25_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,100 :: 		Delay_ms(del);
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
;ECG 20x4.c,101 :: 		for(i=0;i<LRep;i++)
	CLRF       LDisp_i_L0+0
	CLRF       LDisp_i_L0+1
L_LDisp21:
	MOVLW      128
	XORWF      LDisp_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LDisp60
	MOVLW      3
	SUBWF      LDisp_i_L0+0, 0
L__LDisp60:
	BTFSC      STATUS+0, 0
	GOTO       L_LDisp22
;ECG 20x4.c,103 :: 		for(j=8;j<11;j++)
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
	GOTO       L__LDisp61
	MOVLW      11
	SUBWF      LDisp_j_L0+0, 0
L__LDisp61:
	BTFSC      STATUS+0, 0
	GOTO       L_LDisp25
;ECG 20x4.c,105 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 20x4.c,106 :: 		LCD_Out(loadRow,j,".");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       LDisp_j_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr26_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,107 :: 		Delay_ms(LDelay);
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
;ECG 20x4.c,108 :: 		LCD_Out(loadRow,j," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       LDisp_j_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr27_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,103 :: 		for(j=8;j<11;j++)
	INCF       LDisp_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       LDisp_j_L0+1, 1
;ECG 20x4.c,109 :: 		}
	GOTO       L_LDisp24
L_LDisp25:
;ECG 20x4.c,101 :: 		for(i=0;i<LRep;i++)
	INCF       LDisp_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       LDisp_i_L0+1, 1
;ECG 20x4.c,110 :: 		}
	GOTO       L_LDisp21
L_LDisp22:
;ECG 20x4.c,111 :: 		}
L_end_LDisp:
	RETURN
; end of _LDisp

_epDisp:

;ECG 20x4.c,114 :: 		void epDisp()
;ECG 20x4.c,116 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 20x4.c,117 :: 		LCD_Out(eRow,1,"E");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr28_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,118 :: 		Delay_ms(del);
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
;ECG 20x4.c,119 :: 		LCD_Out(eRow,2,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr29_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,120 :: 		Delay_ms(del);
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
;ECG 20x4.c,121 :: 		LCD_Out(eRow,3,"G");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr30_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,122 :: 		Delay_ms(del);
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
;ECG 20x4.c,123 :: 		LCD_Out(eRow,4,":");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr31_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,124 :: 		Delay_ms(del);
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
;ECG 20x4.c,125 :: 		LCD_Out(pRow,1,"P");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr32_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,126 :: 		Delay_ms(del);
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
;ECG 20x4.c,127 :: 		LCD_Out(pRow,2,"P");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr33_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,128 :: 		Delay_ms(del);
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
;ECG 20x4.c,129 :: 		LCD_Out(pRow,3,"G");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr34_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,130 :: 		Delay_ms(del);
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
;ECG 20x4.c,131 :: 		LCD_Out(pRow,4,":");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr35_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,132 :: 		Delay_ms(del);
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
;ECG 20x4.c,133 :: 		}
L_end_epDisp:
	RETURN
; end of _epDisp

_checkR:

;ECG 20x4.c,135 :: 		int checkR(int x)
;ECG 20x4.c,137 :: 		if(x>20)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_checkR_x+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkR64
	MOVF       FARG_checkR_x+0, 0
	SUBLW      20
L__checkR64:
	BTFSC      STATUS+0, 0
	GOTO       L_checkR36
;ECG 20x4.c,138 :: 		x=0;
	CLRF       FARG_checkR_x+0
	CLRF       FARG_checkR_x+1
L_checkR36:
;ECG 20x4.c,139 :: 		return x;
	MOVF       FARG_checkR_x+0, 0
	MOVWF      R0+0
	MOVF       FARG_checkR_x+1, 0
	MOVWF      R0+1
;ECG 20x4.c,140 :: 		}
L_end_checkR:
	RETURN
; end of _checkR

_ERotate:

;ECG 20x4.c,143 :: 		void ERotate(int r)
;ECG 20x4.c,146 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 20x4.c,147 :: 		for(j=1;j<21;j++)
	MOVLW      1
	MOVWF      ERotate_j_L0+0
	MOVLW      0
	MOVWF      ERotate_j_L0+1
L_ERotate37:
	MOVLW      128
	XORWF      ERotate_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ERotate66
	MOVLW      21
	SUBWF      ERotate_j_L0+0, 0
L__ERotate66:
	BTFSC      STATUS+0, 0
	GOTO       L_ERotate38
;ECG 20x4.c,149 :: 		LCD_Out(1,j," ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       ERotate_j_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr36_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,147 :: 		for(j=1;j<21;j++)
	INCF       ERotate_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       ERotate_j_L0+1, 1
;ECG 20x4.c,150 :: 		}
	GOTO       L_ERotate37
L_ERotate38:
;ECG 20x4.c,152 :: 		LCD_Out(1,r++,"E");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr37_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,153 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,154 :: 		LCD_Out(1,r++,"c");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr38_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,155 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,156 :: 		LCD_Out(1,r++,"h");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr39_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,157 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,158 :: 		LCD_Out(1,r++,"o");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr40_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,159 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,160 :: 		LCD_Out(1,r++,"c");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr41_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,161 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,162 :: 		LCD_Out(1,r++,"a");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr42_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,163 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,164 :: 		LCD_Out(1,r++,"r");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr43_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,165 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,166 :: 		LCD_Out(1,r++,"d");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr44_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,167 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,168 :: 		LCD_Out(1,r++,"i");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr45_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,169 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,170 :: 		LCD_Out(1,r++,"o");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr46_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,171 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,172 :: 		LCD_Out(1,r++,"g");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr47_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,173 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,174 :: 		LCD_Out(1,r++,"r");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr48_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,175 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,176 :: 		LCD_Out(1,r++,"a");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr49_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,177 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,178 :: 		LCD_Out(1,r++,"m");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr50_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	INCF       FARG_ERotate_r+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_ERotate_r+1, 1
;ECG 20x4.c,179 :: 		r=checkR(r);
	MOVF       FARG_ERotate_r+0, 0
	MOVWF      FARG_checkR_x+0
	MOVF       FARG_ERotate_r+1, 0
	MOVWF      FARG_checkR_x+1
	CALL       _checkR+0
	MOVF       R0+0, 0
	MOVWF      FARG_ERotate_r+0
	MOVF       R0+1, 0
	MOVWF      FARG_ERotate_r+1
;ECG 20x4.c,180 :: 		}
L_end_ERotate:
	RETURN
; end of _ERotate

_byDisp:

;ECG 20x4.c,185 :: 		void byDisp()
;ECG 20x4.c,188 :: 		LCD_Out(byRow,9,"-");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr51_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,189 :: 		Delay_ms(del);
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
;ECG 20x4.c,190 :: 		LCD_Out(byRow,10,"B");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr52_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,191 :: 		Delay_ms(del);
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
;ECG 20x4.c,192 :: 		LCD_Out(byRow,11,"y");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr53_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,193 :: 		Delay_ms(del);
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
;ECG 20x4.c,194 :: 		LCD_Out(byRow,12," ");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr54_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,195 :: 		Delay_ms(del);
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
;ECG 20x4.c,196 :: 		LCD_Out(byRow,13,"P");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr55_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,197 :: 		Delay_ms(del);
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
;ECG 20x4.c,198 :: 		LCD_Out(byRow,14,"r");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr56_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,199 :: 		Delay_ms(del);
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
;ECG 20x4.c,200 :: 		LCD_Out(byRow,15,"o");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr57_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,201 :: 		Delay_ms(del);
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
;ECG 20x4.c,202 :: 		LCD_Out(byRow,16,"f");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr58_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,203 :: 		Delay_ms(del);
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
;ECG 20x4.c,204 :: 		LCD_Out(byRow,17,".");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      17
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr59_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,205 :: 		Delay_ms(del);
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
;ECG 20x4.c,206 :: 		LCD_Out(byRow,18,"M");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      18
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr60_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,207 :: 		Delay_ms(del);
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
;ECG 20x4.c,208 :: 		LCD_Out(byRow,19,"G");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      19
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr61_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,209 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp50:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp50
	DECFSZ     R12+0, 1
	GOTO       L_byDisp50
	NOP
	NOP
;ECG 20x4.c,210 :: 		LCD_Out(byRow,20,"S");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      20
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr62_ECG_3220x4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ECG 20x4.c,211 :: 		Delay_ms(del);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_byDisp51:
	DECFSZ     R13+0, 1
	GOTO       L_byDisp51
	DECFSZ     R12+0, 1
	GOTO       L_byDisp51
	NOP
	NOP
;ECG 20x4.c,212 :: 		}
L_end_byDisp:
	RETURN
; end of _byDisp

_main:

;ECG 20x4.c,215 :: 		void main() {
;ECG 20x4.c,216 :: 		int i=1;
	MOVLW      1
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
;ECG 20x4.c,218 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;ECG 20x4.c,219 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;ECG 20x4.c,220 :: 		ADCON1 = 0x0E;
	MOVLW      14
	MOVWF      ADCON1+0
;ECG 20x4.c,222 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;ECG 20x4.c,223 :: 		HDisp();
	CALL       _HDisp+0
;ECG 20x4.c,224 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 20x4.c,226 :: 		byDisp();
	CALL       _byDisp+0
;ECG 20x4.c,227 :: 		LDisp();
	CALL       _LDisp+0
;ECG 20x4.c,228 :: 		epDisp();
	CALL       _epDisp+0
;ECG 20x4.c,229 :: 		byDisp();
	CALL       _byDisp+0
;ECG 20x4.c,231 :: 		while (1){
L_main52:
;ECG 20x4.c,233 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ECG 20x4.c,235 :: 		ecg = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ecg+0
	MOVF       R0+1, 0
	MOVWF      _ecg+1
;ECG 20x4.c,236 :: 		ppg = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ppg+0
	MOVF       R0+1, 0
	MOVWF      _ppg+1
;ECG 20x4.c,237 :: 		ecgVal(ecg);
	MOVF       _ecg+0, 0
	MOVWF      FARG_ecgVal_ecg+0
	MOVF       _ecg+1, 0
	MOVWF      FARG_ecgVal_ecg+1
	CALL       _ecgVal+0
;ECG 20x4.c,238 :: 		ppgVal(ppg);
	MOVF       _ppg+0, 0
	MOVWF      FARG_ppgVal_ppg+0
	MOVF       _ppg+1, 0
	MOVWF      FARG_ppgVal_ppg+1
	CALL       _ppgVal+0
;ECG 20x4.c,240 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;ECG 20x4.c,241 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main54:
	DECFSZ     R13+0, 1
	GOTO       L_main54
	DECFSZ     R12+0, 1
	GOTO       L_main54
	DECFSZ     R11+0, 1
	GOTO       L_main54
	NOP
	NOP
;ECG 20x4.c,242 :: 		if(i>20)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVF       main_i_L0+0, 0
	SUBLW      20
L__main69:
	BTFSC      STATUS+0, 0
	GOTO       L_main55
;ECG 20x4.c,243 :: 		i=1;
	MOVLW      1
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main55:
;ECG 20x4.c,244 :: 		}
	GOTO       L_main52
;ECG 20x4.c,246 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
