
_ispis_podataka:

;MyProject.c,19 :: 		void ispis_podataka()
;MyProject.c,21 :: 		txt1[0]=sati/10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sati+0, 0
	MOVWF      R0+0
	MOVF       _sati+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt1+0
;MyProject.c,22 :: 		txt1[1]=sati%10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sati+0, 0
	MOVWF      R0+0
	MOVF       _sati+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt1+1
;MyProject.c,23 :: 		txt1[3]=minute/10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _minute+0, 0
	MOVWF      R0+0
	MOVF       _minute+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt1+3
;MyProject.c,24 :: 		txt1[4]=minute%10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _minute+0, 0
	MOVWF      R0+0
	MOVF       _minute+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt1+4
;MyProject.c,25 :: 		txt1[6]=sekunde/10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sekunde+0, 0
	MOVWF      R0+0
	MOVF       _sekunde+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt1+6
;MyProject.c,26 :: 		txt1[7]=sekunde%10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sekunde+0, 0
	MOVWF      R0+0
	MOVF       _sekunde+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt1+7
;MyProject.c,28 :: 		txt2[0]=dan/10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _dan+0, 0
	MOVWF      R0+0
	MOVF       _dan+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt2+0
;MyProject.c,29 :: 		txt2[1]=dan%10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _dan+0, 0
	MOVWF      R0+0
	MOVF       _dan+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt2+1
;MyProject.c,30 :: 		txt2[3]=mjesec/10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _mjesec+0, 0
	MOVWF      R0+0
	MOVF       _mjesec+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt2+3
;MyProject.c,31 :: 		txt2[4]=mjesec%10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _mjesec+0, 0
	MOVWF      R0+0
	MOVF       _mjesec+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt2+4
;MyProject.c,32 :: 		txt2[6]=godina/10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _godina+0, 0
	MOVWF      R0+0
	MOVF       _godina+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt2+6
;MyProject.c,33 :: 		txt2[7]=godina%10+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _godina+0, 0
	MOVWF      R0+0
	MOVF       _godina+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt2+7
;MyProject.c,35 :: 		}
L_end_ispis_podataka:
	RETURN
; end of _ispis_podataka

_startI2C:

;MyProject.c,36 :: 		void startI2C()
;MyProject.c,38 :: 		SEN_bit=1;
	BSF        SEN_bit+0, BitPos(SEN_bit+0)
;MyProject.c,39 :: 		while(SSPIF_bit==0);
L_startI2C0:
	BTFSC      SSPIF_bit+0, BitPos(SSPIF_bit+0)
	GOTO       L_startI2C1
	GOTO       L_startI2C0
L_startI2C1:
;MyProject.c,40 :: 		SSPIF_bit=0;
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
;MyProject.c,41 :: 		}
L_end_startI2C:
	RETURN
; end of _startI2C

_stopI2C:

;MyProject.c,42 :: 		void stopI2C()
;MyProject.c,44 :: 		PEN_bit=1;
	BSF        PEN_bit+0, BitPos(PEN_bit+0)
;MyProject.c,45 :: 		while(SSPIF_bit==0);
L_stopI2C2:
	BTFSC      SSPIF_bit+0, BitPos(SSPIF_bit+0)
	GOTO       L_stopI2C3
	GOTO       L_stopI2C2
L_stopI2C3:
;MyProject.c,46 :: 		SSPIF_bit=0;
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
;MyProject.c,47 :: 		}
L_end_stopI2C:
	RETURN
; end of _stopI2C

_resetI2C:

;MyProject.c,48 :: 		void resetI2C()
;MyProject.c,50 :: 		RSEN_bit=1;
	BSF        RSEN_bit+0, BitPos(RSEN_bit+0)
;MyProject.c,51 :: 		while(SSPIF_bit==0);
L_resetI2C4:
	BTFSC      SSPIF_bit+0, BitPos(SSPIF_bit+0)
	GOTO       L_resetI2C5
	GOTO       L_resetI2C4
L_resetI2C5:
;MyProject.c,52 :: 		SSPIF_bit=0;
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
;MyProject.c,53 :: 		}
L_end_resetI2C:
	RETURN
; end of _resetI2C

_ACK:

;MyProject.c,54 :: 		void ACK()
;MyProject.c,56 :: 		ACKDT_bit=0;
	BCF        ACKDT_bit+0, BitPos(ACKDT_bit+0)
;MyProject.c,57 :: 		ACKEN_bit=1;
	BSF        ACKEN_bit+0, BitPos(ACKEN_bit+0)
;MyProject.c,58 :: 		while(SSPIF_bit==0);
L_ACK6:
	BTFSC      SSPIF_bit+0, BitPos(SSPIF_bit+0)
	GOTO       L_ACK7
	GOTO       L_ACK6
L_ACK7:
;MyProject.c,59 :: 		SSPIF_bit=0;
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
;MyProject.c,61 :: 		}
L_end_ACK:
	RETURN
; end of _ACK

_NACK:

;MyProject.c,62 :: 		void NACK()
;MyProject.c,64 :: 		ACKDT_bit=1;
	BSF        ACKDT_bit+0, BitPos(ACKDT_bit+0)
;MyProject.c,65 :: 		ACKEN_bit=1;
	BSF        ACKEN_bit+0, BitPos(ACKEN_bit+0)
;MyProject.c,66 :: 		while(SSPIF_bit==0);
L_NACK8:
	BTFSC      SSPIF_bit+0, BitPos(SSPIF_bit+0)
	GOTO       L_NACK9
	GOTO       L_NACK8
L_NACK9:
;MyProject.c,67 :: 		SSPIF_bit=0;
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
;MyProject.c,68 :: 		}
L_end_NACK:
	RETURN
; end of _NACK

_write:

;MyProject.c,69 :: 		char write(char byte)
;MyProject.c,71 :: 		SSPBUF=byte;
	MOVF       FARG_write_byte+0, 0
	MOVWF      SSPBUF+0
;MyProject.c,72 :: 		while(SSPIF_bit==0);
L_write10:
	BTFSC      SSPIF_bit+0, BitPos(SSPIF_bit+0)
	GOTO       L_write11
	GOTO       L_write10
L_write11:
;MyProject.c,73 :: 		SSPIF_bit=0;
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
;MyProject.c,74 :: 		return SSPCON2.ACKSTAT;
	MOVLW      0
	BTFSC      SSPCON2+0, 6
	MOVLW      1
	MOVWF      R0+0
;MyProject.c,76 :: 		}
L_end_write:
	RETURN
; end of _write

_read:

;MyProject.c,77 :: 		char read()
;MyProject.c,79 :: 		RCEN_bit=1;
	BSF        RCEN_bit+0, BitPos(RCEN_bit+0)
;MyProject.c,80 :: 		while(SSPIF_bit==0);
L_read12:
	BTFSC      SSPIF_bit+0, BitPos(SSPIF_bit+0)
	GOTO       L_read13
	GOTO       L_read12
L_read13:
;MyProject.c,81 :: 		SSPIF_bit=0;
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
;MyProject.c,82 :: 		return SSPBUF;
	MOVF       SSPBUF+0, 0
	MOVWF      R0+0
;MyProject.c,83 :: 		}
L_end_read:
	RETURN
; end of _read

_main:

;MyProject.c,86 :: 		void main() {
;MyProject.c,87 :: 		SSPSTAT.SMP=1;
	BSF        SSPSTAT+0, 7
;MyProject.c,88 :: 		SSPCON=0x28;
	MOVLW      40
	MOVWF      SSPCON+0
;MyProject.c,89 :: 		SSPADD=9;
	MOVLW      9
	MOVWF      SSPADD+0
;MyProject.c,90 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.c,91 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,92 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,94 :: 		startI2C();
	CALL       _startI2C+0
;MyProject.c,95 :: 		write(0xD0);
	MOVLW      208
	MOVWF      FARG_write_byte+0
	CALL       _write+0
;MyProject.c,96 :: 		write(0x07);
	MOVLW      7
	MOVWF      FARG_write_byte+0
	CALL       _write+0
;MyProject.c,97 :: 		write(0x00);
	CLRF       FARG_write_byte+0
	CALL       _write+0
;MyProject.c,98 :: 		stopI2C();
	CALL       _stopI2C+0
;MyProject.c,99 :: 		while(1)
L_main14:
;MyProject.c,101 :: 		startI2C();
	CALL       _startI2C+0
;MyProject.c,102 :: 		write(0xD0);
	MOVLW      208
	MOVWF      FARG_write_byte+0
	CALL       _write+0
;MyProject.c,103 :: 		write(0x00);
	CLRF       FARG_write_byte+0
	CALL       _write+0
;MyProject.c,104 :: 		resetI2C();
	CALL       _resetI2C+0
;MyProject.c,105 :: 		write(0xD1);
	MOVLW      209
	MOVWF      FARG_write_byte+0
	CALL       _write+0
;MyProject.c,106 :: 		sekunde1=read();
	CALL       _read+0
	MOVF       R0+0, 0
	MOVWF      _sekunde1+0
	CLRF       _sekunde1+1
;MyProject.c,107 :: 		sekunde=Bcd2Dec(sekunde1);
	MOVF       _sekunde1+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _sekunde+0
	CLRF       _sekunde+1
;MyProject.c,108 :: 		ACK();
	CALL       _ACK+0
;MyProject.c,109 :: 		minute1=read();
	CALL       _read+0
	MOVF       R0+0, 0
	MOVWF      _minute1+0
	CLRF       _minute1+1
;MyProject.c,110 :: 		minute=Bcd2Dec(minute1);
	MOVF       _minute1+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _minute+0
	CLRF       _minute+1
;MyProject.c,111 :: 		ACK();
	CALL       _ACK+0
;MyProject.c,112 :: 		sati1=read();
	CALL       _read+0
	MOVF       R0+0, 0
	MOVWF      _sati1+0
	CLRF       _sati1+1
;MyProject.c,113 :: 		sati=Bcd2Dec(sati1);
	MOVF       _sati1+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _sati+0
	CLRF       _sati+1
;MyProject.c,114 :: 		NACK();
	CALL       _NACK+0
;MyProject.c,115 :: 		stopI2C();
	CALL       _stopI2C+0
;MyProject.c,117 :: 		ispis_podataka();
	CALL       _ispis_podataka+0
;MyProject.c,118 :: 		Lcd_Out(1,1,txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,119 :: 		Lcd_Out(2,1,txt2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,120 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
;MyProject.c,121 :: 		}
	GOTO       L_main14
;MyProject.c,125 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
