
_SpiInit:

;SPI_Master.c,2 :: 		void SpiInit()
;SPI_Master.c,5 :: 		SSPCON = 0b00100000; //SPI master mod, CLK=Fosc/4
	MOVLW      32
	MOVWF      SSPCON+0
;SPI_Master.c,12 :: 		SSPSTAT.B6=0;
	BCF        SSPSTAT+0, 6
;SPI_Master.c,13 :: 		SSPCON.B4=0;
	BCF        SSPCON+0, 4
;SPI_Master.c,16 :: 		SSPSTAT.B7=0;
	BCF        SSPSTAT+0, 7
;SPI_Master.c,17 :: 		}
L_end_SpiInit:
	RETURN
; end of _SpiInit

_SpiRead:

;SPI_Master.c,19 :: 		char SpiRead()
;SPI_Master.c,21 :: 		while(SSPSTAT.BF==0);
L_SpiRead0:
	BTFSC      SSPSTAT+0, 0
	GOTO       L_SpiRead1
	GOTO       L_SpiRead0
L_SpiRead1:
;SPI_Master.c,22 :: 		return SSPBUF;
	MOVF       SSPBUF+0, 0
	MOVWF      R0+0
;SPI_Master.c,23 :: 		}
L_end_SpiRead:
	RETURN
; end of _SpiRead

_SpiWrite:

;SPI_Master.c,27 :: 		void SpiWrite(char dat)  //Pisanje podataka
;SPI_Master.c,29 :: 		SSPBUF = dat;
	MOVF       FARG_SpiWrite_dat+0, 0
	MOVWF      SSPBUF+0
;SPI_Master.c,30 :: 		}
L_end_SpiWrite:
	RETURN
; end of _SpiWrite

_main:

;SPI_Master.c,32 :: 		void main() {
;SPI_Master.c,33 :: 		ANSEL=0;
	CLRF       ANSEL+0
;SPI_Master.c,34 :: 		ANSELH=0;
	CLRF       ANSELH+0
;SPI_Master.c,36 :: 		OPTION_REG.B7=0;
	BCF        OPTION_REG+0, 7
;SPI_Master.c,38 :: 		TRISD=0;
	CLRF       TRISD+0
;SPI_Master.c,39 :: 		PORTD=0b10001111;;
	MOVLW      143
	MOVWF      PORTD+0
;SPI_Master.c,40 :: 		TRISB=0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;SPI_Master.c,41 :: 		TRISC.B3=0;
	BCF        TRISC+0, 3
;SPI_Master.c,42 :: 		TRISC.B4=1;
	BSF        TRISC+0, 4
;SPI_Master.c,43 :: 		TRISC.B5=0;
	BCF        TRISC+0, 5
;SPI_Master.c,44 :: 		TRISE.B0=0;
	BCF        TRISE+0, 0
;SPI_Master.c,45 :: 		SpiInit();
	CALL       _SpiInit+0
;SPI_Master.c,46 :: 		SS=0;
	BCF        PORTE+0, 0
;SPI_Master.c,47 :: 		while(1)
L_main2:
;SPI_Master.c,51 :: 		SpiWrite(PORTB);
	MOVF       PORTB+0, 0
	MOVWF      FARG_SpiWrite_dat+0
	CALL       _SpiWrite+0
;SPI_Master.c,52 :: 		PORTD=SpiRead();
	CALL       _SpiRead+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;SPI_Master.c,56 :: 		}
	GOTO       L_main2
;SPI_Master.c,58 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
