void SpiInit(){

     SSPCON=0b00100100; //spi slave mod, kontorla pomocu pina SS
     
     SSPSTAT.B6=0; //cke rising edge
     SSPCON.B4=0; // ckp low level
     //SSPSTAT.B7=0 podešava se samo u master modu
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
      //OPTION_REG.B7=0; //pull up   omoguæen
      TRISD=0b11110000;

      TRISC.B3=1; //sck input
      TRISC.B4=1; //sdi input
      TRISC.B5=0; //sdo output
      TRISA.B5=1; // ss input

      GIE_bit=1;
      PEIE_bit=1;
      SSPIE_bit=1;
      SSPIF_bit=0; //po defaultu, nema potrebe pisati
      SpiInit();

      while(1){}


}