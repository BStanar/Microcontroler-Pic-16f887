sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD2_bit;
sbit LCD_D5 at RD3_bit;
sbit LCD_D6 at RD4_bit;
sbit LCD_D7 at RD5_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD5_bit;
// End LCD module connections

char txt1[] = "hh:mm:ss";
char txt2[] = "dd/mm/yy";
int sati, minute, sekunde, dan, mjesec, godina, sati1, minute1,sekunde1,dan1,mjesec1,godina1;
void ispis_podataka()
{
txt1[0]=sati/10+48;
txt1[1]=sati%10+48;
txt1[3]=minute/10+48;
txt1[4]=minute%10+48;
txt1[6]=sekunde/10+48;
txt1[7]=sekunde%10+48;

txt2[0]=dan/10+48;
txt2[1]=dan%10+48;
txt2[3]=mjesec/10+48;
txt2[4]=mjesec%10+48;
txt2[6]=godina/10+48;
txt2[7]=godina%10+48;

}
void startI2C()
{
SEN_bit=1;
while(SSPIF_bit==0);
SSPIF_bit=0;
}
void stopI2C()
{
PEN_bit=1;
while(SSPIF_bit==0);
SSPIF_bit=0;
}
void resetI2C()
{
RSEN_bit=1;
while(SSPIF_bit==0);
SSPIF_bit=0;
}
void ACK()
{
ACKDT_bit=0;
ACKEN_bit=1;
while(SSPIF_bit==0);
SSPIF_bit=0;

}
void NACK()
{
ACKDT_bit=1;
ACKEN_bit=1;
while(SSPIF_bit==0);
SSPIF_bit=0;
}
char write(char byte)
{
SSPBUF=byte;
while(SSPIF_bit==0);
SSPIF_bit=0;
return SSPCON2.ACKSTAT;

}
char read()
{
RCEN_bit=1;
while(SSPIF_bit==0);
SSPIF_bit=0;
return SSPBUF;
}


void main() {
SSPSTAT.SMP=1;
      SSPCON=0x28;
      SSPADD=9;
    Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

  startI2C();
  write(0xD0);
  write(0x07);
  write(0x00);
  stopI2C();
  while(1)
  {
  startI2C();
  write(0xD0);
  write(0x00);
  resetI2C();
  write(0xD1);
  sekunde1=read();
  sekunde=Bcd2Dec(sekunde1);
  ACK();
  minute1=read();
  minute=Bcd2Dec(minute1);
  ACK();
  sati1=read();
  sati=Bcd2Dec(sati1);
  NACK();
  stopI2C();
  
  ispis_podataka();
  Lcd_Out(1,1,txt1);
  Lcd_Out(2,1,txt2);
  Delay_ms(1000);
  }
  
  

}