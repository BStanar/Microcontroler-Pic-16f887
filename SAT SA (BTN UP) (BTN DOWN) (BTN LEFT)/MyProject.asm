
_initTimer:

;MyProject.c,20 :: 		void initTimer()
;MyProject.c,22 :: 		OPTION_REG = 0x07;
	MOVLW      7
	MOVWF      OPTION_REG+0
;MyProject.c,23 :: 		TMR0= 63;
	MOVLW      63
	MOVWF      TMR0+0
;MyProject.c,24 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;MyProject.c,25 :: 		TMR0IE_bit = 1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;MyProject.c,26 :: 		}
L_end_initTimer:
	RETURN
; end of _initTimer

_setClock:

;MyProject.c,31 :: 		void setClock()
;MyProject.c,33 :: 		clock[0] = sat / 10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _sat+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+0
;MyProject.c,34 :: 		clock[1] = sat % 10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _sat+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+1
;MyProject.c,35 :: 		clock[2] = 58;
	MOVLW      58
	MOVWF      _clock+2
;MyProject.c,36 :: 		clock[3] = minuta / 10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minuta+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+3
;MyProject.c,37 :: 		clock[4] = minuta % 10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minuta+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+4
;MyProject.c,38 :: 		clock[5] = 58;
	MOVLW      58
	MOVWF      _clock+5
;MyProject.c,39 :: 		clock[6] = sekunda / 10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _sekunda+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+6
;MyProject.c,40 :: 		clock[7] = sekunda % 10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _sekunda+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+7
;MyProject.c,41 :: 		}
L_end_setClock:
	RETURN
; end of _setClock

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,44 :: 		void interrupt()
;MyProject.c,46 :: 		if(TMR0IF_bit)
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt0
;MyProject.c,48 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;MyProject.c,49 :: 		TMR0 = 63;
	MOVLW      63
	MOVWF      TMR0+0
;MyProject.c,50 :: 		counter ++;
	INCF       _counter+0, 1
;MyProject.c,51 :: 		if(counter == 40)
	MOVF       _counter+0, 0
	XORLW      40
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt1
;MyProject.c,53 :: 		counter = 0;
	CLRF       _counter+0
;MyProject.c,54 :: 		sekunda++;
	INCF       _sekunda+0, 1
;MyProject.c,55 :: 		if(sekunda < 60)
	MOVLW      60
	SUBWF      _sekunda+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt2
;MyProject.c,56 :: 		return;
	GOTO       L__interrupt33
L_interrupt2:
;MyProject.c,57 :: 		sekunda = 0;
	CLRF       _sekunda+0
;MyProject.c,58 :: 		minuta++;
	INCF       _minuta+0, 1
;MyProject.c,59 :: 		if(minuta <60)
	MOVLW      60
	SUBWF      _minuta+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt3
;MyProject.c,60 :: 		return;
	GOTO       L__interrupt33
L_interrupt3:
;MyProject.c,61 :: 		minuta=0;
	CLRF       _minuta+0
;MyProject.c,62 :: 		sat++;
	INCF       _sat+0, 1
;MyProject.c,63 :: 		if(sat<24)
	MOVLW      24
	SUBWF      _sat+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt4
;MyProject.c,64 :: 		return;
	GOTO       L__interrupt33
L_interrupt4:
;MyProject.c,65 :: 		sat = 0;
	CLRF       _sat+0
;MyProject.c,66 :: 		}
L_interrupt1:
;MyProject.c,67 :: 		}
L_interrupt0:
;MyProject.c,69 :: 		if(RBIF_bit)
	BTFSS      RBIF_bit+0, BitPos(RBIF_bit+0)
	GOTO       L_interrupt5
;MyProject.c,71 :: 		if(PORTB.B0 == 0)
	BTFSC      PORTB+0, 0
	GOTO       L_interrupt6
;MyProject.c,73 :: 		changePosition++;
	INCF       _changePosition+0, 1
;MyProject.c,74 :: 		if(changePosition > 3)
	MOVF       _changePosition+0, 0
	SUBLW      3
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt7
;MyProject.c,75 :: 		changePosition = 0;
	CLRF       _changePosition+0
L_interrupt7:
;MyProject.c,76 :: 		}
L_interrupt6:
;MyProject.c,77 :: 		if(PORTB.B1 == 0)
	BTFSC      PORTB+0, 1
	GOTO       L_interrupt8
;MyProject.c,79 :: 		if(changePosition == 1)
	MOVF       _changePosition+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt9
;MyProject.c,81 :: 		if(sat > 0)
	MOVF       _sat+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt10
;MyProject.c,82 :: 		sat--;
	DECF       _sat+0, 1
L_interrupt10:
;MyProject.c,83 :: 		}
L_interrupt9:
;MyProject.c,84 :: 		if(changePosition == 2)
	MOVF       _changePosition+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt11
;MyProject.c,86 :: 		if(minuta > 0)
	MOVF       _minuta+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt12
;MyProject.c,87 :: 		minuta --;
	DECF       _minuta+0, 1
L_interrupt12:
;MyProject.c,88 :: 		}
L_interrupt11:
;MyProject.c,89 :: 		if(changePosition == 3)
	MOVF       _changePosition+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt13
;MyProject.c,91 :: 		if(sekunda > 0)
	MOVF       _sekunda+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt14
;MyProject.c,92 :: 		sekunda --;
	DECF       _sekunda+0, 1
L_interrupt14:
;MyProject.c,93 :: 		}
L_interrupt13:
;MyProject.c,94 :: 		}
L_interrupt8:
;MyProject.c,95 :: 		if(PORTB.B2 == 0)
	BTFSC      PORTB+0, 2
	GOTO       L_interrupt15
;MyProject.c,97 :: 		if(changePosition == 1)
	MOVF       _changePosition+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt16
;MyProject.c,99 :: 		if(sat < 23)
	MOVLW      23
	SUBWF      _sat+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt17
;MyProject.c,100 :: 		sat++;
	INCF       _sat+0, 1
L_interrupt17:
;MyProject.c,101 :: 		}
L_interrupt16:
;MyProject.c,102 :: 		if(changePosition == 2)
	MOVF       _changePosition+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt18
;MyProject.c,104 :: 		if(minuta < 59)
	MOVLW      59
	SUBWF      _minuta+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt19
;MyProject.c,105 :: 		minuta ++;
	INCF       _minuta+0, 1
L_interrupt19:
;MyProject.c,106 :: 		}
L_interrupt18:
;MyProject.c,107 :: 		if(changePosition == 3)
	MOVF       _changePosition+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt20
;MyProject.c,109 :: 		if(sekunda < 59)
	MOVLW      59
	SUBWF      _sekunda+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt21
;MyProject.c,110 :: 		sekunda ++;
	INCF       _sekunda+0, 1
L_interrupt21:
;MyProject.c,111 :: 		}
L_interrupt20:
;MyProject.c,112 :: 		}
L_interrupt15:
;MyProject.c,113 :: 		RBIF_bit = 0;
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
;MyProject.c,114 :: 		}
L_interrupt5:
;MyProject.c,116 :: 		}
L_end_interrupt:
L__interrupt33:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_initIoC:

;MyProject.c,117 :: 		void initIoC()
;MyProject.c,120 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;MyProject.c,121 :: 		TRISB.B0 = 1;
	BSF        TRISB+0, 0
;MyProject.c,122 :: 		TRISB.B1 = 1;
	BSF        TRISB+0, 1
;MyProject.c,123 :: 		TRISB.B2 = 1;
	BSF        TRISB+0, 2
;MyProject.c,124 :: 		RBIE_bit = 1;
	BSF        RBIE_bit+0, BitPos(RBIE_bit+0)
;MyProject.c,125 :: 		IOCB0_bit = 1;
	BSF        IOCB0_bit+0, BitPos(IOCB0_bit+0)
;MyProject.c,126 :: 		IOCB1_bit = 1;
	BSF        IOCB1_bit+0, BitPos(IOCB1_bit+0)
;MyProject.c,127 :: 		IOCB2_bit = 1;
	BSF        IOCB2_bit+0, BitPos(IOCB2_bit+0)
;MyProject.c,128 :: 		}
L_end_initIoC:
	RETURN
; end of _initIoC

_main:

;MyProject.c,130 :: 		void main() {
;MyProject.c,131 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,132 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,133 :: 		initTimer();
	CALL       _initTimer+0
;MyProject.c,134 :: 		initIoC();
	CALL       _initIoC+0
;MyProject.c,135 :: 		while(1)
L_main22:
;MyProject.c,137 :: 		setClock();
	CALL       _setClock+0
;MyProject.c,138 :: 		Lcd_Out(1,1,clock);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,139 :: 		switch(changePosition)
	GOTO       L_main24
;MyProject.c,141 :: 		case 0:
L_main26:
;MyProject.c,142 :: 		Lcd_Out(2,1,"        ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,143 :: 		break;
	GOTO       L_main25
;MyProject.c,144 :: 		case 1:
L_main27:
;MyProject.c,145 :: 		Lcd_Out(2,1," -      ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,146 :: 		break;
	GOTO       L_main25
;MyProject.c,147 :: 		case 2:
L_main28:
;MyProject.c,148 :: 		Lcd_Out(2,1,"    -   ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,149 :: 		break;
	GOTO       L_main25
;MyProject.c,150 :: 		case 3:
L_main29:
;MyProject.c,151 :: 		Lcd_Out(2,1,"       -");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,152 :: 		break;
	GOTO       L_main25
;MyProject.c,153 :: 		}
L_main24:
	MOVF       _changePosition+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main26
	MOVF       _changePosition+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main27
	MOVF       _changePosition+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main28
	MOVF       _changePosition+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main29
L_main25:
;MyProject.c,155 :: 		}
	GOTO       L_main22
;MyProject.c,156 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
