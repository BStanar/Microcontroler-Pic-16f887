#line 1 "C:/Users/kulas/Desktop/vjezbe miks/zadatak1a/mikroC/MyProject.c"
#line 15 "C:/Users/kulas/Desktop/vjezbe miks/zadatak1a/mikroC/MyProject.c"
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
  PORTC.B0 =1;
 break;
 case 1:
  PORTC.B1 =1;
 break;
 case 2:
  PORTC.B2 =1;
 break;
 case 3:
  PORTC.B3 =1;
 break;
 case 4:
  PORTC.B4 =1;
 break;
 case 5:
  PORTC.B5 =1;
 break;
 case 6:
  PORTC.B6 =1;
 break;
 case 7:
  PORTC.B7 =1;
 break;
 default:
 break;
 }
}
void IskljuciDiodu(){
PORTC=0;
#line 93 "C:/Users/kulas/Desktop/vjezbe miks/zadatak1a/mikroC/MyProject.c"
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
 if( PORTB.B2 ==0){
 IskljuciDiodu();
 if(dioda>0) dioda--;
 else dioda=7;
 UkljuciDiodu(dioda);
 }
 if( PORTB.B3 ==0){
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
 TRISC.B7=0;
 PORTC=0;

}
