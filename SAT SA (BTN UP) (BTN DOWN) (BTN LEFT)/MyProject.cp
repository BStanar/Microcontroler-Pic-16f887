#line 1 "C:/Users/Ruzic/Desktop/kk/MyProject.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 4 "C:/Users/Ruzic/Desktop/kk/MyProject.c"
sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D7 at RD5_bit;
sbit LCD_D6 at RD4_bit;
sbit LCD_D5 at RD3_bit;
sbit LCD_D4 at RD2_bit;


sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D7_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD2_bit;


void initTimer()
{
 OPTION_REG = 0x07;
 TMR0= 63;
 GIE_bit = 1;
 TMR0IE_bit = 1;
}

uint8_t counter = 0, sekunda = 0, minuta =0, sat = 0, changePosition = 0;
char clock[9];

void setClock()
{
 clock[0] = sat / 10 + 48;
 clock[1] = sat % 10 + 48;
 clock[2] = 58;
 clock[3] = minuta / 10 + 48;
 clock[4] = minuta % 10 + 48;
 clock[5] = 58;
 clock[6] = sekunda / 10 + 48;
 clock[7] = sekunda % 10 + 48;
}


void interrupt()
{
 if(TMR0IF_bit)
 {
 TMR0IF_bit = 0;
 TMR0 = 63;
 counter ++;
 if(counter == 40)
 {
 counter = 0;
 sekunda++;
 if(sekunda < 60)
 return;
 sekunda = 0;
 minuta++;
 if(minuta <60)
 return;
 minuta=0;
 sat++;
 if(sat<24)
 return;
 sat = 0;
 }
 }

 if(RBIF_bit)
 {
 if(PORTB.B0 == 0)
 {
 changePosition++;
 if(changePosition > 3)
 changePosition = 0;
 }
 if(PORTB.B1 == 0)
 {
 if(changePosition == 1)
 {
 if(sat > 0)
 sat--;
 }
 if(changePosition == 2)
 {
 if(minuta > 0)
 minuta --;
 }
 if(changePosition == 3)
 {
 if(sekunda > 0)
 sekunda --;
 }
 }
 if(PORTB.B2 == 0)
 {
 if(changePosition == 1)
 {
 if(sat < 23)
 sat++;
 }
 if(changePosition == 2)
 {
 if(minuta < 59)
 minuta ++;
 }
 if(changePosition == 3)
 {
 if(sekunda < 59)
 sekunda ++;
 }
 }
 RBIF_bit = 0;
 }

}
void initIoC()
{

 ANSELH = 0;
 TRISB.B0 = 1;
 TRISB.B1 = 1;
 TRISB.B2 = 1;
 RBIE_bit = 1;
 IOCB0_bit = 1;
 IOCB1_bit = 1;
 IOCB2_bit = 1;
}

void main() {
Lcd_Init();
Lcd_Cmd(_LCD_CURSOR_OFF);
initTimer();
initIoC();
while(1)
{
 setClock();
 Lcd_Out(1,1,clock);
 switch(changePosition)
 {
 case 0:
 Lcd_Out(2,1,"        ");
 break;
 case 1:
 Lcd_Out(2,1," -      ");
 break;
 case 2:
 Lcd_Out(2,1,"    -   ");
 break;
 case 3:
 Lcd_Out(2,1,"       -");
 break;
 }

}
}
