
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
	NOP
	GOTO       L_SpiRead0
L_SpiRead1:
	MOVF       SSPBUF+0, 0
	MOVWF      R0+0
L_end_SpiRead:
	RETURN
; end of _SpiRead

_SpiWrite:

	MOVF       FARG_SpiWrite_dat+0, 0
	MOVWF      SSPBUF+0
L_end_SpiWrite:
	RETURN
; end of _SpiWrite

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

	BTFSS      SSPIF_bit+0, BitPos(SSPIF_bit+0)
	GOTO       L_interrupt2
	CALL       _SpiRead+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
	MOVF       PORTB+0, 0
	MOVWF      FARG_SpiWrite_dat+0
	CALL       _SpiWrite+0
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
L_interrupt2:
L_end_interrupt:
L__interrupt9:
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
	BCF        OPTION_REG+0, 7
	CLRF       TRISD+0
	MOVLW      255
	MOVWF      TRISB+0
	BSF        TRISC+0, 3
	BSF        TRISC+0, 4
	BCF        TRISC+0, 5
	BSF        TRISA+0, 5
	CALL       _SpiInit+0
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
	BSF        SSPIE_bit+0, BitPos(SSPIE_bit+0)
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
L_main3:
	NOP
	GOTO       L_main3
L_end_main:
	GOTO       $+0
; end of _main
