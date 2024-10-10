
_SpiInit:

	MOVLW      36
	MOVWF      SSPCON+0
	BCF        SSPSTAT+0, 6
	BCF        SSPCON+0, 4
L_end_SpiInit:
	RETURN
; end of _SpiInit

_SpiRead:

L_SpiRead0:
	BTFSC      SSPSTAT+0, 0
	GOTO       L_SpiRead1
	GOTO       L_SpiRead0
L_SpiRead1:
	MOVF       SSPBUF+0, 0
	MOVWF      R0+0
L_end_SpiRead:
	RETURN
; end of _SpiRead

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

	BTFSS      SSPIF_bit+0, BitPos(SSPIF_bit+0)
	GOTO       L_Interrupt2
	CALL       _SpiRead+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
L_Interrupt2:
L_end_Interrupt:
L__Interrupt8:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

	CLRF       ANSEL+0
	CLRF       ANSELH+0
	MOVLW      240
	MOVWF      TRISD+0
	BSF        TRISC+0, 3
	BSF        TRISC+0, 4
	BCF        TRISC+0, 5
	BSF        TRISA+0, 5
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
	BSF        SSPIE_bit+0, BitPos(SSPIE_bit+0)
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
	CALL       _SpiInit+0
L_main3:
	GOTO       L_main3
L_end_main:
	GOTO       $+0
; end of _main
