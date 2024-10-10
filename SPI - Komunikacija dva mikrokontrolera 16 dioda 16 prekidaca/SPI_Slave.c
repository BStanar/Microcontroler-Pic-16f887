
void SpiInit()
{
 //KONFIGURACIJA SPI
 //SSPCON = 0b00100000; //SPI master mod, CLK=Fosc/4
 //SSPCON = 0b00100001; //SPI master mod, CLK=Fosc/16
 //SSPCON = 0b00100010; //SPI master mod, CLK=Fosc/64
 //SSPCON = 0b00100011;  //SPI master mod, CLK=(izlaz TMR2)/2
 SSPCON = 0b00100100;  //SPI slave mod, omogucena kontrola rada pomocu pina SS
 //SSPCON = 0b00100101;  // SPI slave mod, SS pin ne kontroliše rad i kože da se koristi kao standardni I/O pin
 // Podesavanje CKE  i  CKP
 SSPSTAT.B6=0;
 SSPCON.B4=0;
 // Podesavanje SMP     U SPI master modu odreñuje trenutak u kome se ocitava logicko stanje
 //na prijemnoj liniji
 //SSPSTAT.B7=0;
}

char SpiRead()
{

  while(SSPSTAT.BF==0)
  {
   asm nop;
  }
  return SSPBUF;
}



void SpiWrite(char dat)  //Pisanje podataka
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
 //konfiguracija PULL UP
 OPTION_REG.B7=0;
 //Konfiguracija izlaza
 TRISD=0;
 TRISB=0xFF;
 
 TRISC.B3=1;
 TRISC.B4=1;
 TRISC.B5=0;
 TRISA.B5=1;
  SpiInit();
 //Omogucimo interrupt
 GIE_bit=1;
 PEIE_bit=1;
SSPIE_bit=1;
  SSPIF_bit=0;
 

 while(1)
 {

 }

}