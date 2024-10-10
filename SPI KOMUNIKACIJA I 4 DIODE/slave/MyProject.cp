#line 1 "C:/Users/kulas/Desktop/vjezbe miks/zadatak3b/slave/MyProject.c"
void SpiInit(){

 SSPCON=0b00100100;

 SSPSTAT.B6=0;
 SSPCON.B4=0;

}

char SpiRead(){
 while(SSPSTAT.BF==0);
 return SSPBUF;
 }

void Interrupt(){
 if(SSPIF_bit){
 PORTD=SpiRead();
 SSPIF_bit=0;
 }
}
void main() {
 ANSEL=0;
 ANSELH=0;

 TRISD=0b11110000;

 TRISC.B3=1;
 TRISC.B4=1;
 TRISC.B5=0;
 TRISA.B5=1;

 GIE_bit=1;
 PEIE_bit=1;
 SSPIE_bit=1;
 SSPIF_bit=0;
 SpiInit();

 while(1){}


}
