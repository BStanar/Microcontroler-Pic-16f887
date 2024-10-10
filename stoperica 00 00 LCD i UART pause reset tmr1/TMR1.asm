
_ispisi:

	CLRF       _i+0
	CLRF       _i+1
L_ispisi0:
	MOVF       _i+0, 0
	ADDWF      FARG_ispisi_textU+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_ispisi1
	BTFSS      TXSTA+0, 1
	GOTO       L_ispisi3
	MOVF       _i+0, 0
	ADDWF      FARG_ispisi_textU+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      TXREG+0
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
L_ispisi3:
	GOTO       L_ispisi0
L_ispisi1:
	MOVLW      32
	MOVWF      TXREG+0
L_end_ispisi:
	RETURN
; end of _ispisi

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_interrupt4
	INCF       _brInterapta+0, 1
	BTFSC      STATUS+0, 2
	INCF       _brInterapta+1, 1
	MOVLW      222
	MOVWF      TMR1L+0
	MOVLW      11
	MOVWF      TMR1H+0
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
L_interrupt4:
L_end_interrupt:
L__interrupt27:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_Format:

	MOVLW      60
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Format_brSekundi+0, 0
	MOVWF      R0+0
	MOVF       FARG_Format_brSekundi+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__Format+2
	MOVF       R0+1, 0
	MOVWF      FLOC__Format+3
	MOVF       FLOC__Format+2, 0
	MOVWF      _brSek+0
	MOVF       FLOC__Format+3, 0
	MOVWF      _brSek+1
	MOVLW      60
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Format_brSekundi+0, 0
	MOVWF      R0+0
	MOVF       FARG_Format_brSekundi+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Format+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Format+1
	MOVF       FLOC__Format+0, 0
	MOVWF      _brMin+0
	MOVF       FLOC__Format+1, 0
	MOVWF      _brMin+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Format+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Format+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      Format_string_L0+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Format+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Format+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      Format_string_L0+1
	MOVLW      58
	MOVWF      Format_string_L0+2
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Format+2, 0
	MOVWF      R0+0
	MOVF       FLOC__Format+3, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      Format_string_L0+3
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Format+2, 0
	MOVWF      R0+0
	MOVF       FLOC__Format+3, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      Format_string_L0+4
	CLRF       Format_string_L0+5
	MOVLW      Format_string_L0+0
	MOVWF      R0+0
L_end_Format:
	RETURN
; end of _Format

_trosi:

L_trosi5:
	BTFSS      PORTA+0, 4
	GOTO       L_trosi6
	GOTO       L_trosi5
L_trosi6:
L_trosi7:
	BTFSS      PORTA+0, 6
	GOTO       L_trosi8
	GOTO       L_trosi7
L_trosi8:
L_end_trosi:
	RETURN
; end of _trosi

_main:

	CLRF       ANSEL+0
	CLRF       ANSELH+0
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
	BSF        TRISA6_bit+0, BitPos(TRISA6_bit+0)
	BSF        TRISA+0, 4
	CLRF       PORTA+0
	CALL       _Lcd_Init+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	BSF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
	BSF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
	BCF        TMR1CS_bit+0, BitPos(TMR1CS_bit+0)
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	MOVLW      222
	MOVWF      TMR1L+0
	MOVLW      11
	MOVWF      TMR1H+0
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	BSF        TXSTA+0, 5
	BCF        TXSTA+0, 4
	BSF        RCSTA+0, 7
	BSF        TXSTA+0, 2
	BCF        BAUDCTL+0, 3
	MOVLW      25
	MOVWF      SPBRG+0
L_main9:
	MOVF       _prvi+0, 0
	IORWF      _prvi+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_TMR1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       _brInterapta+0
	CLRF       _brInterapta+1
L_main11:
	BTFSS      PORTA+0, 6
	GOTO       L_main12
	CLRF       _brInterapta+0
	CLRF       _brInterapta+1
	CLRF       _brSekundi+0
	CLRF       _brSekundi+1
	CLRF       FARG_Format_brSekundi+0
	CLRF       FARG_Format_brSekundi+1
	CALL       _Format+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcpy_from+0
	MOVLW      _string+0
	MOVWF      FARG_strcpy_to+0
	CALL       _strcpy+0
	MOVLW      _string+0
	MOVWF      FARG_ispisi_textU+0
	CALL       _ispisi+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVF       _prvi+0, 0
	IORWF      _prvi+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_TMR1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       _prvi+0
	CLRF       _prvi+1
L_main13:
L_main14:
	BTFSS      PORTA+0, 6
	GOTO       L_main15
	GOTO       L_main14
L_main15:
L_main12:
	BTFSS      PORTA+0, 4
	GOTO       L_main16
	BTFSC      T1CON+0, 0
	GOTO       L_main17
	BSF        T1CON+0, 0
	GOTO       L_main18
L_main17:
	BTFSS      T1CON+0, 0
	GOTO       L_main19
	BCF        T1CON+0, 0
	MOVF       _prvi+0, 0
	IORWF      _prvi+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_TMR1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       _prvi+0
	CLRF       _prvi+1
	BSF        T1CON+0, 0
L_main20:
L_main19:
L_main18:
L_main21:
	BTFSS      PORTA+0, 4
	GOTO       L_main22
	GOTO       L_main21
L_main22:
L_main16:
	BTFSS      T1CON+0, 0
	GOTO       L_main23
	MOVLW      128
	XORWF      _brInterapta+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      2
	SUBWF      _brInterapta+0, 0
L__main31:
	BTFSS      STATUS+0, 0
	GOTO       L_main24
	INCF       _brSekundi+0, 1
	BTFSC      STATUS+0, 2
	INCF       _brSekundi+1, 1
	MOVF       _brSekundi+0, 0
	MOVWF      FARG_Format_brSekundi+0
	MOVF       _brSekundi+1, 0
	MOVWF      FARG_Format_brSekundi+1
	CALL       _Format+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcpy_from+0
	MOVLW      _string+0
	MOVWF      FARG_strcpy_to+0
	CALL       _strcpy+0
	MOVLW      _string+0
	MOVWF      FARG_ispisi_textU+0
	CALL       _ispisi+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _string+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       _brInterapta+0
	CLRF       _brInterapta+1
L_main24:
L_main23:
	GOTO       L_main9
L_end_main:
	GOTO       $+0
; end of _main
