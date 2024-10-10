
_InitTimer0:

	MOVLW      5
	MOVWF      OPTION_REG+0
	MOVLW      102
	MOVWF      TMR0+0
	MOVLW      160
	MOVWF      INTCON+0
L_end_InitTimer0:
	RETURN
; end of _InitTimer0

_InitIoC:

	BSF        TRISB+0, 2
	BSF        TRISB+0, 3
	MOVLW      14
	MOVWF      IOCB+0
	BSF        RBIE_bit+0, BitPos(RBIE_bit+0)
	CLRF       ANSEL+0
	CLRF       ANSELH+0
L_end_InitIoC:
	RETURN
; end of _InitIoC

_UkljuciDiodu:

	GOTO       L_UkljuciDiodu0
L_UkljuciDiodu2:
	BSF        PORTC+0, 0
	GOTO       L_UkljuciDiodu1
L_UkljuciDiodu3:
	BSF        PORTC+0, 1
	GOTO       L_UkljuciDiodu1
L_UkljuciDiodu4:
	BSF        PORTC+0, 2
	GOTO       L_UkljuciDiodu1
L_UkljuciDiodu5:
	BSF        PORTC+0, 3
	GOTO       L_UkljuciDiodu1
L_UkljuciDiodu6:
	BSF        PORTC+0, 4
	GOTO       L_UkljuciDiodu1
L_UkljuciDiodu7:
	BSF        PORTC+0, 5
	GOTO       L_UkljuciDiodu1
L_UkljuciDiodu8:
	BSF        PORTC+0, 6
	GOTO       L_UkljuciDiodu1
L_UkljuciDiodu9:
	BSF        PORTC+0, 7
	GOTO       L_UkljuciDiodu1
L_UkljuciDiodu10:
	GOTO       L_UkljuciDiodu1
L_UkljuciDiodu0:
	MOVLW      0
	XORWF      FARG_UkljuciDiodu_dioda+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UkljuciDiodu26
	MOVLW      0
	XORWF      FARG_UkljuciDiodu_dioda+0, 0
L__UkljuciDiodu26:
	BTFSC      STATUS+0, 2
	GOTO       L_UkljuciDiodu2
	MOVLW      0
	XORWF      FARG_UkljuciDiodu_dioda+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UkljuciDiodu27
	MOVLW      1
	XORWF      FARG_UkljuciDiodu_dioda+0, 0
L__UkljuciDiodu27:
	BTFSC      STATUS+0, 2
	GOTO       L_UkljuciDiodu3
	MOVLW      0
	XORWF      FARG_UkljuciDiodu_dioda+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UkljuciDiodu28
	MOVLW      2
	XORWF      FARG_UkljuciDiodu_dioda+0, 0
L__UkljuciDiodu28:
	BTFSC      STATUS+0, 2
	GOTO       L_UkljuciDiodu4
	MOVLW      0
	XORWF      FARG_UkljuciDiodu_dioda+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UkljuciDiodu29
	MOVLW      3
	XORWF      FARG_UkljuciDiodu_dioda+0, 0
L__UkljuciDiodu29:
	BTFSC      STATUS+0, 2
	GOTO       L_UkljuciDiodu5
	MOVLW      0
	XORWF      FARG_UkljuciDiodu_dioda+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UkljuciDiodu30
	MOVLW      4
	XORWF      FARG_UkljuciDiodu_dioda+0, 0
L__UkljuciDiodu30:
	BTFSC      STATUS+0, 2
	GOTO       L_UkljuciDiodu6
	MOVLW      0
	XORWF      FARG_UkljuciDiodu_dioda+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UkljuciDiodu31
	MOVLW      5
	XORWF      FARG_UkljuciDiodu_dioda+0, 0
L__UkljuciDiodu31:
	BTFSC      STATUS+0, 2
	GOTO       L_UkljuciDiodu7
	MOVLW      0
	XORWF      FARG_UkljuciDiodu_dioda+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UkljuciDiodu32
	MOVLW      6
	XORWF      FARG_UkljuciDiodu_dioda+0, 0
L__UkljuciDiodu32:
	BTFSC      STATUS+0, 2
	GOTO       L_UkljuciDiodu8
	MOVLW      0
	XORWF      FARG_UkljuciDiodu_dioda+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UkljuciDiodu33
	MOVLW      7
	XORWF      FARG_UkljuciDiodu_dioda+0, 0
L__UkljuciDiodu33:
	BTFSC      STATUS+0, 2
	GOTO       L_UkljuciDiodu9
	GOTO       L_UkljuciDiodu10
L_UkljuciDiodu1:
L_end_UkljuciDiodu:
	RETURN
; end of _UkljuciDiodu

_IskljuciDiodu:

	CLRF       PORTC+0
L_end_IskljuciDiodu:
	RETURN
; end of _IskljuciDiodu

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrupt11
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	MOVLW      102
	MOVWF      TMR0+0
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt37
	MOVLW      20
	SUBWF      _count+0, 0
L__Interrupt37:
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt12
	GOTO       L__Interrupt36
L_Interrupt12:
	CLRF       _count+0
	CLRF       _count+1
	MOVLW      0
	XORWF      _upaljeno+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt38
	MOVLW      1
	XORWF      _upaljeno+0, 0
L__Interrupt38:
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt13
	CLRF       _upaljeno+0
	CLRF       _upaljeno+1
	MOVF       _dioda+0, 0
	MOVWF      FARG_UkljuciDiodu_dioda+0
	MOVF       _dioda+1, 0
	MOVWF      FARG_UkljuciDiodu_dioda+1
	CALL       _UkljuciDiodu+0
	GOTO       L_Interrupt14
L_Interrupt13:
	MOVLW      0
	XORWF      _upaljeno+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt39
	MOVLW      0
	XORWF      _upaljeno+0, 0
L__Interrupt39:
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt15
	MOVLW      1
	MOVWF      _upaljeno+0
	MOVLW      0
	MOVWF      _upaljeno+1
	CALL       _IskljuciDiodu+0
L_Interrupt15:
L_Interrupt14:
L_Interrupt11:
	BTFSS      RBIF_bit+0, BitPos(RBIF_bit+0)
	GOTO       L_Interrupt16
	BTFSC      PORTB+0, 2
	GOTO       L_Interrupt17
	CALL       _IskljuciDiodu+0
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _dioda+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt40
	MOVF       _dioda+0, 0
	SUBLW      0
L__Interrupt40:
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt18
	MOVLW      1
	SUBWF      _dioda+0, 1
	BTFSS      STATUS+0, 0
	DECF       _dioda+1, 1
	GOTO       L_Interrupt19
L_Interrupt18:
	MOVLW      7
	MOVWF      _dioda+0
	MOVLW      0
	MOVWF      _dioda+1
L_Interrupt19:
	MOVF       _dioda+0, 0
	MOVWF      FARG_UkljuciDiodu_dioda+0
	MOVF       _dioda+1, 0
	MOVWF      FARG_UkljuciDiodu_dioda+1
	CALL       _UkljuciDiodu+0
L_Interrupt17:
	BTFSC      PORTB+0, 3
	GOTO       L_Interrupt20
	CALL       _IskljuciDiodu+0
	MOVLW      128
	XORWF      _dioda+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt41
	MOVLW      7
	SUBWF      _dioda+0, 0
L__Interrupt41:
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt21
	INCF       _dioda+0, 1
	BTFSC      STATUS+0, 2
	INCF       _dioda+1, 1
	GOTO       L_Interrupt22
L_Interrupt21:
	CLRF       _dioda+0
	CLRF       _dioda+1
L_Interrupt22:
	MOVF       _dioda+0, 0
	MOVWF      FARG_UkljuciDiodu_dioda+0
	MOVF       _dioda+1, 0
	MOVWF      FARG_UkljuciDiodu_dioda+1
	CALL       _UkljuciDiodu+0
L_Interrupt20:
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
L_Interrupt16:
L_end_Interrupt:
L__Interrupt36:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

	CALL       _InitTimer0+0
	CALL       _InitIoC+0
	BCF        TRISC+0, 0
	BCF        TRISC+0, 1
	BCF        TRISC+0, 2
	BCF        TRISC+0, 3
	BCF        TRISC+0, 4
	BCF        TRISC+0, 5
	BCF        TRISC+0, 6
	BCF        TRISC+0, 7
	CLRF       PORTC+0
L_end_main:
	GOTO       $+0
; end of _main
