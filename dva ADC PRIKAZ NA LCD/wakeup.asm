
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;wakeup.c,24 :: 		void interrupt()
;wakeup.c,27 :: 		if(PIR1.TMR1IF)
	BTFSS      PIR1+0, 0
	GOTO       L_interrupt0
;wakeup.c,29 :: 		count++;
	INCF       _count+0, 1
;wakeup.c,30 :: 		PIR1.TMR1IF=0;
	BCF        PIR1+0, 0
;wakeup.c,32 :: 		TMR1H=0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;wakeup.c,33 :: 		TMR1L=0xDE;
	MOVLW      222
	MOVWF      TMR1L+0
;wakeup.c,34 :: 		}
L_interrupt0:
;wakeup.c,36 :: 		if(PIR1.ADIF)
	BTFSS      PIR1+0, 6
	GOTO       L_interrupt1
;wakeup.c,38 :: 		if(checkpress==1 && checktemp==0)
	MOVLW      0
	XORWF      _checkpress+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt18
	MOVLW      1
	XORWF      _checkpress+0, 0
L__interrupt18:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt4
	MOVLW      0
	XORWF      _checktemp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt19
	MOVLW      0
	XORWF      _checktemp+0, 0
L__interrupt19:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt4
L__interrupt15:
;wakeup.c,40 :: 		pomocna1=ADRESH*256+ADRESL;
	MOVF       ADRESH+0, 0
	MOVWF      _pomocna1+1
	CLRF       _pomocna1+0
	MOVF       ADRESL+0, 0
	ADDWF      _pomocna1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _pomocna1+1, 1
;wakeup.c,44 :: 		ADCON0.B3=1;
	BSF        ADCON0+0, 3
;wakeup.c,45 :: 		ADCON0.B2=0;
	BCF        ADCON0+0, 2
;wakeup.c,46 :: 		checkpress=0;
	CLRF       _checkpress+0
	CLRF       _checkpress+1
;wakeup.c,47 :: 		checktemp=1;
	MOVLW      1
	MOVWF      _checktemp+0
	MOVLW      0
	MOVWF      _checktemp+1
;wakeup.c,50 :: 		pom = TMR1H * 256 + TMR1L;
	MOVF       TMR1H+0, 0
	MOVWF      R5+1
	CLRF       R5+0
	MOVF       TMR1L+0, 0
	ADDWF      R5+0, 1
	BTFSC      STATUS+0, 0
	INCF       R5+1, 1
;wakeup.c,51 :: 		while((TMR1H * 256 + TMR1L) < pom+5);
L_interrupt5:
	MOVF       TMR1H+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       TMR1L+0, 0
	ADDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R3+1
	MOVLW      5
	ADDWF      R5+0, 0
	MOVWF      R1+0
	MOVF       R5+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt20
	MOVF       R1+0, 0
	SUBWF      R3+0, 0
L__interrupt20:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt6
	GOTO       L_interrupt5
L_interrupt6:
;wakeup.c,53 :: 		ADCON0.B1=1;
	BSF        ADCON0+0, 1
;wakeup.c,54 :: 		}
	GOTO       L_interrupt7
L_interrupt4:
;wakeup.c,56 :: 		else if(checktemp==1 && checkpress==0)
	MOVLW      0
	XORWF      _checktemp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt21
	MOVLW      1
	XORWF      _checktemp+0, 0
L__interrupt21:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt10
	MOVLW      0
	XORWF      _checkpress+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt22
	MOVLW      0
	XORWF      _checkpress+0, 0
L__interrupt22:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt10
L__interrupt14:
;wakeup.c,58 :: 		pomocna2=ADRESH*256+ADRESL;
	MOVF       ADRESH+0, 0
	MOVWF      _pomocna2+1
	CLRF       _pomocna2+0
	MOVF       ADRESL+0, 0
	ADDWF      _pomocna2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _pomocna2+1, 1
;wakeup.c,60 :: 		ADCON0.B3=0;
	BCF        ADCON0+0, 3
;wakeup.c,61 :: 		ADCON0.B2=1;
	BSF        ADCON0+0, 2
;wakeup.c,62 :: 		checkpress=1;
	MOVLW      1
	MOVWF      _checkpress+0
	MOVLW      0
	MOVWF      _checkpress+1
;wakeup.c,63 :: 		checktemp=0;
	CLRF       _checktemp+0
	CLRF       _checktemp+1
;wakeup.c,65 :: 		}
L_interrupt10:
L_interrupt7:
;wakeup.c,67 :: 		PIR1.ADIF=0;
	BCF        PIR1+0, 6
;wakeup.c,68 :: 		}
L_interrupt1:
;wakeup.c,69 :: 		}
L_end_interrupt:
L__interrupt17:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;wakeup.c,71 :: 		void main() {
;wakeup.c,73 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;wakeup.c,74 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;wakeup.c,75 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;wakeup.c,79 :: 		TRISA.B1=1;
	BSF        TRISA+0, 1
;wakeup.c,80 :: 		TRISA.B2=1;
	BSF        TRISA+0, 2
;wakeup.c,82 :: 		T1CON=0x31;
	MOVLW      49
	MOVWF      T1CON+0
;wakeup.c,83 :: 		TMR1H=0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;wakeup.c,84 :: 		TMR1L=0xDE;
	MOVLW      222
	MOVWF      TMR1L+0
;wakeup.c,85 :: 		ADCON0.B7=1;
	BSF        ADCON0+0, 7
;wakeup.c,86 :: 		ADCON0.B6=0;
	BCF        ADCON0+0, 6
;wakeup.c,87 :: 		ADCON0.B5=0;
	BCF        ADCON0+0, 5
;wakeup.c,88 :: 		ADCON0.B4=0;
	BCF        ADCON0+0, 4
;wakeup.c,90 :: 		ADCON0.B1=0;
	BCF        ADCON0+0, 1
;wakeup.c,91 :: 		ADCON0.B0=1;
	BSF        ADCON0+0, 0
;wakeup.c,92 :: 		ADCON1=0x80;
	MOVLW      128
	MOVWF      ADCON1+0
;wakeup.c,93 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;wakeup.c,94 :: 		INTCON.PEIE=1;
	BSF        INTCON+0, 6
;wakeup.c,95 :: 		PIE1.TMR1IE=1;
	BSF        PIE1+0, 0
;wakeup.c,96 :: 		PIR1.TMR1IF=0;
	BCF        PIR1+0, 0
;wakeup.c,97 :: 		PIE1.ADIE=1;
	BSF        PIE1+0, 6
;wakeup.c,98 :: 		PIR1.ADIF=0;
	BCF        PIR1+0, 6
;wakeup.c,100 :: 		count=0;
	CLRF       _count+0
;wakeup.c,102 :: 		checkpress=1;
	MOVLW      1
	MOVWF      _checkpress+0
	MOVLW      0
	MOVWF      _checkpress+1
;wakeup.c,103 :: 		checktemp=0;
	CLRF       _checktemp+0
	CLRF       _checktemp+1
;wakeup.c,105 :: 		while(1)
L_main11:
;wakeup.c,107 :: 		if(count==8)
	MOVF       _count+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;wakeup.c,110 :: 		rez1=(pomocna1*5.0)/1024.0;
	MOVF       _pomocna1+0, 0
	MOVWF      R0+0
	MOVF       _pomocna1+1, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _rez1+0
	MOVF       R0+1, 0
	MOVWF      _rez1+1
	MOVF       R0+2, 0
	MOVWF      _rez1+2
	MOVF       R0+3, 0
	MOVWF      _rez1+3
;wakeup.c,112 :: 		FloatToStr(rez1,Prit);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _Prit+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;wakeup.c,113 :: 		Lcd_Out(1,1,Prit);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Prit+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;wakeup.c,115 :: 		rez2=(pomocna2*5.0)/1024.0;
	MOVF       _pomocna2+0, 0
	MOVWF      R0+0
	MOVF       _pomocna2+1, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _rez2+0
	MOVF       R0+1, 0
	MOVWF      _rez2+1
	MOVF       R0+2, 0
	MOVWF      _rez2+2
	MOVF       R0+3, 0
	MOVWF      _rez2+3
;wakeup.c,117 :: 		FloatToStr(rez2,Temp);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _Temp+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;wakeup.c,118 :: 		Lcd_Out(2,1,Temp);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;wakeup.c,122 :: 		ADCON0.B1=1;
	BSF        ADCON0+0, 1
;wakeup.c,124 :: 		count=0;
	CLRF       _count+0
;wakeup.c,125 :: 		}
L_main13:
;wakeup.c,126 :: 		}
	GOTO       L_main11
;wakeup.c,130 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
