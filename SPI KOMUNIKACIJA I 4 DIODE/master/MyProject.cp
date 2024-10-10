#line 1 "C:/Users/kulas/Desktop/vjezbe miks/zadatak3b/master/MyProject.c"

void InitSpi(){

 SSPCON=0b00100000;

 SSPSTAT.B6=0;
 SSPCON.B4=0;
 SSPSTAT.B7=0;
}

void SpiWrite(char dat){
 SSPBUF=dat;
 }

void main() {
 ANSEL=0;
 ANSELH=0;

 TRISC.B3=0;
 TRISC.B4=1;
 TRISC.B5=0;
 TRISD=0b00001111;
 TRISE.B0=0;
 InitSpi();
  PORTE.B0 =0;
 while(1){
 SpiWrite(PORTD);
 }
}
