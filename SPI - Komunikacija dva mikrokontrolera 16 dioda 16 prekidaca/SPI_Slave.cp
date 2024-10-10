#line 1 "C:/Users/Nikola/Desktop/SPI - Komunikacija dva mikrokontrolera/SPI_Slave.c"

void SpiInit()
{





 SSPCON = 0b00100100;


 SSPSTAT.B6=0;
 SSPCON.B4=0;



}

char SpiRead()
{

 while(SSPSTAT.BF==0)
 {
 asm nop;
 }
 return SSPBUF;
}



void SpiWrite(char dat)
{
 SSPBUF = dat;
}


void interrupt()
{
 if( SSPIF_bit)
 {
 PORTD=SpiRead();
 SpiWrite(PORTB);
 SSPIF_bit=0;
 }
}

void main() {
 ANSEL=0;
 ANSELH=0;

 OPTION_REG.B7=0;

 TRISD=0;
 TRISB=0xFF;

 TRISC.B3=1;
 TRISC.B4=1;
 TRISC.B5=0;
 TRISA.B5=1;
 SpiInit();

 GIE_bit=1;
 PEIE_bit=1;
SSPIE_bit=1;
 SSPIF_bit=0;


 while(1)
 {
 asm nop;
 }

}
