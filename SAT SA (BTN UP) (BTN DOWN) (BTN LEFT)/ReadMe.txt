Ovaj projekat implementira digitalni sat na PIC mikrokontroleru, prikazujući vrijeme na LCD ekranu u formatu hh:mm:ss. 
Vrijeme se može podesiti pomoću tastera povezanih na PORTB, a brojanje vremena se obavlja preko Timer0 prekida.


Hardverske Postavke
LCD Konekcije:

    Kontrolni pinovi:
        LCD_RS na RD0
        LCD_EN na RD1
    Podatkovni pinovi:
        LCD_D4 na RD2
        LCD_D5 na RD3
        LCD_D6 na RD4
        LCD_D7 na RD5