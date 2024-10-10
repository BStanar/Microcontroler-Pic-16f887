#line 1 "C:/Users/Korisnik/Desktop/SPI - Komunikacija dva mikrokontrolera/SPI_Master.c"

void SpiInit()
{

 SSPCON = 0b00100000;
#line 12 "C:/Users/Korisnik/Desktop/SPI - Komunikacija dva mikrokontrolera/SPI_Master.c"
 SSPSTAT.B6=0;
 SSPCON.B4=0;


 SSPSTAT.B7=0;
}

char SpiRead()
{
 while(SSPSTAT.BF==0);
 return SSPBUF;
}



void SpiWrite(char dat)
{
 SSPBUF = dat;
}

void main() {
 ANSEL=0;
 ANSELH=0;

 OPTION_REG.B7=0;

 TRISD=0;
 PORTD=0b10001111;;
 TRISB=0xFF;
 TRISC.B3=0;
 TRISC.B4=1;
 TRISC.B5=0;
 TRISE.B0=0;
 SpiInit();
  PORTE.B0 =0;
 while(1)
 {


 SpiWrite(PORTB);
 PORTD=SpiRead();



 }

}
