
_Brojac:

	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Brojac_cnt+0, 0
	MOVWF      R0+0
	MOVF       FARG_Brojac_cnt+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      Brojac_jed_L0+0
	MOVF       R0+1, 0
	MOVWF      Brojac_jed_L0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Brojac_cnt+0, 0
	MOVWF      R0+0
	MOVF       FARG_Brojac_cnt+1, 0
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
	MOVWF      Brojac_des_L0+0
	MOVF       R0+1, 0
	MOVWF      Brojac_des_L0+1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_Brojac_cnt+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Brojac18
	MOVF       FARG_Brojac_cnt+0, 0
	SUBLW      9
L__Brojac18:
	BTFSC      STATUS+0, 0
	GOTO       L_Brojac0
	BCF        PORTE+0, 0
	BSF        PORTE+0, 1
	BCF        PORTE+0, 2
	MOVF       Brojac_des_L0+0, 0
	ADDLW      _cifre+0
	MOVWF      R0+0
	MOVLW      hi_addr(_cifre+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      Brojac_des_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Brojac1:
	DECFSZ     R13+0, 1
	GOTO       L_Brojac1
	DECFSZ     R12+0, 1
	GOTO       L_Brojac1
	NOP
	BCF        PORTE+0, 0
	BCF        PORTE+0, 1
	BSF        PORTE+0, 2
	MOVF       Brojac_jed_L0+0, 0
	ADDLW      _cifre+0
	MOVWF      R0+0
	MOVLW      hi_addr(_cifre+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      Brojac_jed_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Brojac2:
	DECFSZ     R13+0, 1
	GOTO       L_Brojac2
	DECFSZ     R12+0, 1
	GOTO       L_Brojac2
	NOP
	GOTO       L_Brojac3
L_Brojac0:
	BCF        PORTE+0, 0
	BCF        PORTE+0, 1
	BSF        PORTE+0, 2
	MOVF       Brojac_jed_L0+0, 0
	ADDLW      _cifre+0
	MOVWF      R0+0
	MOVLW      hi_addr(_cifre+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      Brojac_jed_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Brojac4:
	DECFSZ     R13+0, 1
	GOTO       L_Brojac4
	DECFSZ     R12+0, 1
	GOTO       L_Brojac4
	NOP
L_Brojac3:
L_end_Brojac:
	RETURN
; end of _Brojac

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

	BTFSS      PIR1+0, 0
	GOTO       L_interrupt5
	BCF        PIR1+0, 0
	MOVLW      11
	MOVWF      TMR1H+0
	MOVLW      222
	MOVWF      TMR1L+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
L_interrupt5:
L_end_interrupt:
L__interrupt20:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_trosiVreme:

L_trosiVreme6:
	BTFSS      PORTA+0, 4
	GOTO       L_trosiVreme7
	GOTO       L_trosiVreme6
L_trosiVreme7:
L_end_trosiVreme:
	RETURN
; end of _trosiVreme

_main:

	CLRF       ANSEL+0
	CLRF       ANSELH+0
	CLRF       TRISC+0
	CLRF       TRISE+0
	BSF        TRISA+0, 4
	BSF        TRISA+0, 5
	MOVLW      49
	MOVWF      T1CON+0
	BSF        INTCON+0, 7
	BSF        INTCON+0, 6
	BSF        PIE1+0, 0
	BCF        PIR1+0, 0
	MOVLW      11
	MOVWF      TMR1H+0
	MOVLW      222
	MOVWF      TMR1L+0
L_main8:
	BTFSS      PORTA+0, 5
	GOTO       L_main10
	CLRF       _sec+0
	CLRF       _sec+1
L_main10:
	BTFSS      PORTA+0, 4
	GOTO       L_main11
	BTFSC      T1CON+0, 0
	GOTO       L_main12
	BSF        T1CON+0, 0
	GOTO       L_main13
L_main12:
	BTFSS      T1CON+0, 0
	GOTO       L_main14
	BCF        T1CON+0, 0
L_main14:
L_main13:
	CALL       _trosiVreme+0
L_main11:
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      3
	SUBWF      _count+0, 0
L__main23:
	BTFSS      STATUS+0, 0
	GOTO       L_main15
	INCF       _sec+0, 1
	BTFSC      STATUS+0, 2
	INCF       _sec+1, 1
	MOVLW      0
	XORWF      _sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      99
	XORWF      _sec+0, 0
L__main24:
	BTFSS      STATUS+0, 2
	GOTO       L_main16
	CLRF       _sec+0
	CLRF       _sec+1
L_main16:
	CLRF       _count+0
	CLRF       _count+1
L_main15:
	MOVF       _sec+0, 0
	MOVWF      FARG_Brojac_cnt+0
	MOVF       _sec+1, 0
	MOVWF      FARG_Brojac_cnt+1
	CALL       _Brojac+0
	GOTO       L_main8
L_end_main:
	GOTO       $+0
; end of _main
