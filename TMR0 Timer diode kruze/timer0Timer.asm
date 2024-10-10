
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	MOVLW      63
	MOVWF      TMR0+0
L_interrupt0:
L_end_interrupt:
L__interrupt7:
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
	CLRF       TRISB+0
	MOVLW      1
	MOVWF      PORTB+0
	BCF        OPTION_REG+0, 5
	BCF        OPTION_REG+0, 3
	BSF        OPTION_REG+0, 2
	BSF        OPTION_REG+0, 1
	BSF        OPTION_REG+0, 1
	MOVLW      160
	MOVWF      INTCON+0
	MOVLW      63
	MOVWF      TMR0+0
L_main1:
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVLW      40
	XORWF      _count+0, 0
L__main9:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
	MOVF       PORTB+0, 0
	XORLW      128
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	GOTO       L_main5
L_main4:
	MOVLW      1
	MOVWF      PORTB+0
L_main5:
	CLRF       _count+0
	CLRF       _count+1
L_main3:
	GOTO       L_main1
L_end_main:
	GOTO       $+0
; end of _main
