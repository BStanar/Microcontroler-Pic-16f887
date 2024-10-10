int count=0, sec=0;
const unsigned char cifre []={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

void Brojac(int cnt)
{
  int br=cnt;
  int jed=br%10;
  int des=(br/10)%10;
  if(br>9)
  {
      PORTE.B0=0;PORTE.B1=1;PORTE.B2=0;
      PORTC=cifre[des];
      Delay_ms(10);
        //stampamo jed
      PORTE.B0=0;PORTE.B1=0;PORTE.B2=1;
      PORTC=cifre[jed];
      Delay_ms(10);
  }
  else
  {
      PORTE.B0=0;PORTE.B1=0;PORTE.B2=1;
      PORTC=cifre[jed];
      Delay_ms(10);
  }
}
void interrupt()
{
  if(PIR1.TMR1IF)
  {
   PIR1.TMR1IF = 0;
   TMR1H = 0b00001011;
   TMR1L = 0b11011110;
   count++;
  }
}
void trosiVreme()
{
     while(PORTA.B4==1)
     {/*trosi vrijeme*/}
}

void main() 
{
    ANSEL  = 0;
    ANSELH = 0;
    TRISC=0;
    TRISE=0;
    TRISA.B4=1;
    TRISA.B5=1;

    T1CON = 0x31;
    INTCON.GIE = 1;
    INTCON.PEIE = 1;
    PIE1.TMR1IE = 1;
    PIR1.TMR1IF = 0;


    TMR1H = 0b00001011;
    TMR1L = 0b11011110;
    while(1)
    {
          if(PORTA.B5==1)
          {
            sec=0;
          }
          if(porta.b4==1)
          {
              if(T1CON.TMR1ON==0)
                 T1CON.TMR1ON=1;
              else if(T1CON.TMR1ON==1)
                 T1CON.TMR1ON=0;
              trosiVreme(); //da broji impulse na RA4}
         }

        if(count>=3)
        {
           sec++;
           if(sec==99)
              sec=0;
           count=0;
        }
        Brojac(sec);
    }
}