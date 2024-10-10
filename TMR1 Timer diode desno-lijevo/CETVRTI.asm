
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

	BTFSS      PIR1+0, 0
	GOTO       L_interrupt0
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	MOVLW      222
	MOVWF      TMR1L+0
	MOVLW      11
	MOVWF      TMR1H+0
L_interrupt0:
L_end_interrupt:
L__interrupt12:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

	CLRF       ANSEL+0
	CLRF       ANSELH+0
	MOVLW      49
	MOVWF      T1CON+0
	MOVLW      192
	MOVWF      INTCON+0
	BSF        PIE1+0, 0
	BCF        PIR1+0, 0
	MOVLW      222
	MOVWF      TMR1L+0
	MOVLW      11
	MOVWF      TMR1H+0
	CLRF       TRISB+0
	MOVLW      1
	MOVWF      PORTB+0
L_main1:
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      3
	SUBWF      _count+0, 0
L__main14:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
	CLRF       _count+0
	CLRF       _count+1
	MOVF       _desno+0, 0
	IORWF      _desno+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	MOVF       PORTB+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main5
	CLRF       _desno+0
	CLRF       _desno+1
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	GOTO       L_main6
L_main5:
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
L_main6:
	GOTO       L_main7
L_main4:
	MOVF       _desno+0, 0
	IORWF      _desno+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
	MOVF       PORTB+0, 0
	XORLW      128
	BTFSS      STATUS+0, 2
	GOTO       L_main9
	MOVLW      1
	MOVWF      _desno+0
	MOVLW      0
	MOVWF      _desno+1
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	GOTO       L_main10
L_main9:
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
L_main10:
L_main8:
L_main7:
L_main3:
	GOTO       L_main1
L_end_main:
	GOTO       $+0
; end of _main
