
_InitSpi:

	MOVLW      32
	MOVWF      SSPCON+0
	BCF        SSPSTAT+0, 6
	BCF        SSPCON+0, 4
	BCF        SSPSTAT+0, 7
L_end_InitSpi:
	RETURN
; end of _InitSpi

_SpiWrite:

	MOVF       FARG_SpiWrite_dat+0, 0
	MOVWF      SSPBUF+0
L_end_SpiWrite:
	RETURN
; end of _SpiWrite

_main:

	CLRF       ANSEL+0
	CLRF       ANSELH+0
	BCF        TRISC+0, 3
	BSF        TRISC+0, 4
	BCF        TRISC+0, 5
	MOVLW      15
	MOVWF      TRISD+0
	BCF        TRISE+0, 0
	CALL       _InitSpi+0
	BCF        PORTE+0, 0
L_main0:
	MOVF       PORTD+0, 0
	MOVWF      FARG_SpiWrite_dat+0
	CALL       _SpiWrite+0
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
