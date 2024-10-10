#define SS PORTE.B0
void InitSpi(){
              //config spi
              SSPCON=0b00100000; //spi master mod clk=Fosc/4
              //podesavanje cke i ckp
              SSPSTAT.B6=0; //cke rising edge
              SSPCON.B4=0; //ckp low level
              SSPSTAT.B7=0; //smp middle data
}

void SpiWrite(char dat){
       SSPBUF=dat;
       }
       
void main() {
     ANSEL=0;
     ANSELH=0;
     //OPTION_REG.B7= 1; //omogucavanje pull up otpornika
     TRISC.B3=0; //clk na output
     TRISC.B4=1; //SDI na input
     TRISC.B5=0; //SD0 na otuput
     TRISD=0b00001111;
     TRISE.B0=0;
     InitSpi();
     SS=0;     // konstantno je ukljuèen slejv
     while(1){
        SpiWrite(PORTD); //u bafer registar upisuje sadržaj porta D
        }
}