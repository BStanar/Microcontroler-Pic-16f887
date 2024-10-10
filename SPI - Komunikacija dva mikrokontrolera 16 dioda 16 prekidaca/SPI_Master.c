#define SS PORTE.B0
void SpiInit()
{
 //KONFIGURACIJA SPI
 SSPCON = 0b00100000; //SPI master mod, CLK=Fosc/4
/*SSPCON = 0b00100001; //SPI master mod, CLK=Fosc/16
 SSPCON = 0b00100010; //SPI master mod, CLK=Fosc/64
 SSPCON = 0b00100011;  //SPI master mod, CLK=(izlaz TMR2)/2
 SSPCON = 0b00100100;  //SPI slave mod, omogucena kontrola rada pomocu pina SS
 SSPCON = 0b00100101;  // SPI slave mod, SS pin ne kontroliše rad i kože da se koristi kao standardni I/O pin*/
 // Podesavanje CKE  i  CKP
 SSPSTAT.B6=0;
 SSPCON.B4=0;
 // Podesavanje SMP     U SPI master modu odreñuje trenutak u kome se ocitava logicko stanje
 //na prijemnoj liniji
 SSPSTAT.B7=0;
}

char SpiRead()
{
  while(SSPSTAT.BF==0);
  return SSPBUF;
}



void SpiWrite(char dat)  //Pisanje podataka
{
    SSPBUF = dat;
}

void main() {
 ANSEL=0;
 ANSELH=0;
 //konfiguracija PULL UP
 OPTION_REG.B7=0;
 //Konfiguracija izlaza
 TRISD=0;
 PORTD=0b10001111;;
 TRISB=0xFF;
 TRISC.B3=0;
 TRISC.B4=1;
 TRISC.B5=0;
 TRISE.B0=0;
 SpiInit();
  SS=0;
 while(1)
 {


  SpiWrite(PORTB);
  PORTD=SpiRead();
 // Delay_ms(30); //razmislite zasto ne moze bez ovog delay-a?
  

 }

}