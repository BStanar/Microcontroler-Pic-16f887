#line 1 "C:/Users/Bojan/Desktop/TMR0 Timer invertuje diode/timer0Timer.c"
int count = 0;
void interrupt()
{
 if(TMR0IF_bit)
 {
 count++;
 TMR0IF_bit = 0;
 TMR0 = 63;
 }
}

void main()
{
 ANSEL = 0;
 ANSELH = 0;

 TRISB = 0;
 PORTB = 0b0000001;

 OPTION_REG.T0CS=0;
 OPTION_REG.PSA=0;
 OPTION_REG.PS2=1;
 OPTION_REG.PS1=1;
 OPTION_REG.PS1=1;

 INTCON = 0xA0;
 TMR0=63;
 while(1)
 {
 if(count==40)
 {

 if(PORTB!=0b10000000)
 {
 PORTB=PORTB<<1;

 }
 else
 {
 PORTB=0b00000001;

 }
 count=0;
 }
 }
}
