Ovaj projekat koristi PIC mikrokontroler za mjerenje analognog pritiska i temperature putem ADC (Analog-to-Digital Converter) 
kanala i prikazuje te vrijednosti na LCD ekranu. Vrijednosti se očitavaju naizmjenično za pritisak i temperaturu, 
koristeći Timer1 za upravljanje intervalima mjerenja.

Hardverske Postavke

LCD Konekcije:

    Kontrolni pinovi:
        LCD_RS na RD4
        LCD_EN na RD5
    Podatkovni pinovi:
        LCD_D4 na RD0
        LCD_D5 na RD1
        LCD_D6 na RD2
        LCD_D7 na RD3
    Pinovi za smjer: Postavljeni su pomoću TRISD registara.

ADC Konekcije:

    Senzori pritiska i temperature: Očitavanja se vrše putem pinova RA1 i RA2 koristeći ADC.