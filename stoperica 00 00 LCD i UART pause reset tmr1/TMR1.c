sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;
sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;

char string[6];
int i=0;
int prvi = 1;
int brInterapta = 0;
int brSekundi = 0;
int brMin;
int brSek;

void ispisi(char *textU)
{
      for(i=0; textU[i]!='\0';)
      {
           if(TXSTA.TRMT==1)
           {
               TXREG=textU[i];
               i++;
           }
      }
      TXREG=' ';
}
void interrupt()
{
     if(TMR1IF_bit)
     {
           brInterapta++;
           TMR1L = 0XDE;
           TMR1H = 0x0B;
           TMR1IF_bit = 0;
     }
}
char Format(int brSekundi)
{
        char string[6];
        brSek = brSekundi % 60;
        brMin = brSekundi /60;

        string[0] = brMin/10 + 48;
        string[1] = brMin%10 + 48;
        string[2] = ':';
        string[3] = brSek/10 + 48;
        string[4] = brSek%10 + 48;
        string[5] = '\0';
        return string;
}
void trosi()
{
     while(porta.b4==1)
     {}
     while(porta.b6==1)
     {}
}

void main()
{
      ANSEL  = 0x00;
      ANSELH = 0;
      C1ON_bit = 0;
      C2ON_bit = 0;

      TRISA6_bit =1;
      TrisA.B4=1;
      PORTA = 0;

      Lcd_Init();
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Cmd(_LCD_CURSOR_OFF);

      T1CKPS0_bit = 1;
      T1CKPS1_bit = 1;
      TMR1CS_bit = 0;
      TMR1ON_bit= 1;
      TMR1L = 0XDE;
      TMR1H = 0x0B;

      GIE_bit = 1;
      PEIE_bit = 1;
      TMR1IE_bit = 1;
      TMR1IF_bit = 0;

      TXSTA.TXEN=1;
      TXSTA.SYNC=0;
      RCSTA.SPEN=1;

      TXSTA.BRGH=1;
      BAUDCTL.BRG16=0;
      SPBRG = 25;

      while(1)
      {
             if(prvi)
             {
                Lcd_Out(1,1,"Klikni");
                brInterapta = 0;
             }
             if(PORTA.B6==1)
             {
                  brInterapta = 0;
                  brSekundi = 0;
                  strcpy(string,Format(brSekundi));
                  ispisi(string);
                  Lcd_Out(2,1,string);
                  if(prvi)
                  {
                         Lcd_Cmd(_LCD_CLEAR);
                         Lcd_Out(1,1,"Tatster pritisnut!");
                         prvi = 0;
                  }
                  //trosi();
                  while(PORTA.B6)
                  {}
             }
             if(porta.b4==1)
             {
                  if(t1con.TMR1ON==0)
                  {
                       t1con.tmr1on=1;
                  }
                  else if(t1con.TMR1ON==1)
                  {
                        t1con.tmr1on=0;
                        if(prvi)
                        {
                               Lcd_Cmd(_LCD_CLEAR);
                               Lcd_Out(1,1,"Tatster pritisnut!");
                               prvi = 0;
                               t1con.tmr1on=1; //prvi put ipak nemoj gasit tajmer1
                        }
                  }
                  //trosi();
                  while(PORTA.B4)
                  {}
             }
             if(t1con.TMR1ON==1)
             {
                   if( brInterapta >=2 )  //zadrska je 0,5s jer je 4MHz a prescaler je 8
                   {
                        brSekundi ++;
                        strcpy(string,Format(brSekundi));
                        ispisi(string);
                        Lcd_Out(2,1,string);

                        brInterapta = 0;
                   }
             }
      }
}