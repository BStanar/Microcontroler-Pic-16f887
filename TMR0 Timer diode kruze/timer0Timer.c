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
      // OPTION_REG = 0x07;
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
                   //PORTB=~PORTB;   //invertuje bitove
                   if(PORTB!=0b10000000)
                   {
                         PORTB=PORTB<<1;
                         //count = 0;
                   }
                   else
                   {
                          PORTB=0b00000001;
                          //count = 0;
                   }
                   count=0;
            }
      }
}