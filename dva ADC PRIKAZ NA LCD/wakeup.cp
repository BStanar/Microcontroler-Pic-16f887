#line 1 "C:/Users/Korisnik/Desktop/budjenje/wakeup.c"

sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D7 at RD3_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D4 at RD0_bit;


sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D7_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD0_bit;

unsigned short count;
int pomocna1,pomocna2;
float rez1,rez2;
int checkpress=1,checktemp=0;
char Temp[16];
char Prit[16];

void interrupt()
{
 int pom;
 if(PIR1.TMR1IF)
 {
 count++;
 PIR1.TMR1IF=0;

 TMR1H=0x0B;
 TMR1L=0xDE;
 }

 if(PIR1.ADIF)
 {
 if(checkpress==1 && checktemp==0)
 {
 pomocna1=ADRESH*256+ADRESL;



 ADCON0.B3=1;
 ADCON0.B2=0;
 checkpress=0;
 checktemp=1;


 pom = TMR1H * 256 + TMR1L;
 while((TMR1H * 256 + TMR1L) < pom+5);

 ADCON0.B1=1;
 }

 else if(checktemp==1 && checkpress==0)
 {
 pomocna2=ADRESH*256+ADRESL;

 ADCON0.B3=0;
 ADCON0.B2=1;
 checkpress=1;
 checktemp=0;

 }

 PIR1.ADIF=0;
 }
}

void main() {

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);



 TRISA.B1=1;
 TRISA.B2=1;

 T1CON=0x31;
 TMR1H=0x0B;
 TMR1L=0xDE;
 ADCON0.B7=1;
 ADCON0.B6=0;
 ADCON0.B5=0;
 ADCON0.B4=0;

 ADCON0.B1=0;
 ADCON0.B0=1;
 ADCON1=0x80;
 INTCON.GIE=1;
 INTCON.PEIE=1;
 PIE1.TMR1IE=1;
 PIR1.TMR1IF=0;
 PIE1.ADIE=1;
 PIR1.ADIF=0;

 count=0;

 checkpress=1;
 checktemp=0;

 while(1)
 {
 if(count==8)
 {

 rez1=(pomocna1*5.0)/1024.0;

 FloatToStr(rez1,Prit);
 Lcd_Out(1,1,Prit);

 rez2=(pomocna2*5.0)/1024.0;

 FloatToStr(rez2,Temp);
 Lcd_Out(2,1,Temp);



 ADCON0.B1=1;

 count=0;
 }
 }



}
