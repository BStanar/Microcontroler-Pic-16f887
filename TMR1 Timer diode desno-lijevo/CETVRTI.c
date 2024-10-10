int desno=1, count=0;
void interrupt()
{
     if(PIR1.TMR1IF==1)
     {
         TMR1IF_bit=0;
         count++;
         tmr1l=0xDE;
         tmr1h=0x0B;
                       
     }
}
void main() 
{
     ansel=0;
     anselh=0;
     
     t1con=0x31;
     intcon=0b11000000;
     pie1.TMR1IE=1;
     pir1.TMR1IF=0;
     tmr1l=0xDE;
     tmr1h=0x0B;
     trisb=0;
     portb=0b00000001;
     

     
     while (1)
     {
              if(count>=3)
              {
                    count=0;
                    if(desno)
                    {
                             if(portb==0b00000001)
                             {
                                 desno=0;
                                 portb=portb<<1;   //zbog kasnjenja prvi put vrati
                             }
                             else
                             {
                                 portb=portb>>1;
                             }
                    }
                    else if(!desno)
                    {
                              if(portb==0b10000000  )
                              {
                                 desno=1;
                                 portb=portb>>1;
                              }
                              else
                              {
                                  portb=portb<<1;
                              }
                    }
              }
     }
}