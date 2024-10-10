#define LED1 PORTC.B0
#define LED2 PORTC.B1
#define LED3 PORTC.B2
#define LED4 PORTC.B3
#define LED5 PORTC.B4
#define LED6 PORTC.B5
#define LED7 PORTC.B6
#define LED8 PORTC.B7


#define BTN_LEFT PORTB.B2
#define BTN_RIGHT PORTB.B3


int upaljeno=0, count;
int dioda=7;
void InitTimer0(){
     OPTION_REG=0x05;
     TMR0=102;
     INTCON=0xA0;
}

void InitIoC(){
     TRISB.B2=1;
     TRISB.B3=1;
     IOCB=0x0E;
     RBIE_bit=1;
     ANSEL=0;
     ANSELH=0;
}

void UkljuciDiodu(int dioda){
switch(dioda)
{
 case 0:
      LED1=1;
      break;
 case 1:
      LED2=1;
      break;
 case 2:
      LED3=1;
      break;
 case 3:
      LED4=1;
      break;
 case 4:
      LED5=1;
      break;
 case 5:
      LED6=1;
      break;
 case 6:
      LED7=1;
      break;
 case 7:
      LED8=1;
      break;
 default:
         break;
 }
}
void IskljuciDiodu(){
PORTC=0;
/*switch(dioda){
 case 0:
      PORTC.B0=0;
      break;
 case 1:
      PORTC.B1=0;
      break;
 case 2:
      PORTC.B2=0;
      break;
 case 3:
      PORTC.B3=0;
      break;
 case 4:
      PORTC.B4=0;
      break;
 case 5:
      PORTC.B5=0;
      break;
 case 6:
      PORTC.B6=0;
      break;
 case 7:
      PORTC.B7=0;
      break;
 default:
         break;
 }  */
}

void Interrupt(){
     if(TMR0IF_bit)
     {
      TMR0IF_bit=0;
      TMR0=102;

      count++;
      if(count<20){return;}
      count=0;
      if(upaljeno==1){ upaljeno=0; UkljuciDiodu(dioda);}
      else if(upaljeno==0){upaljeno=1; IskljuciDiodu();}

}
      if(RBIF_bit)
      {
       if(BTN_LEFT==0){
                       IskljuciDiodu();
                       if(dioda>0) dioda--;
                       else dioda=7;
                       UkljuciDiodu(dioda);
                            }
       if(BTN_RIGHT==0){                 //ne znam što radi naopako left i right u proteusu
                        IskljuciDiodu();
                        if(dioda<7) dioda++;
                        else dioda=0;
                        UkljuciDiodu(dioda);
                            }
       
      RBIF_bit=0;

      }
}
void main() {
         InitTimer0();
         InitIoC();
         TRISC.B0=0;
         TRISC.B1=0;
         TRISC.B2=0;
         TRISC.B3=0;
         TRISC.B4=0;
         TRISC.B5=0;
         TRISC.B6=0;
         TRISC.B7=0;        //izlazi, diode
         PORTC=0;

}