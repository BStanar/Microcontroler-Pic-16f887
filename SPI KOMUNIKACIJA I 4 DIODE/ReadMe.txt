Ovaj projekat implementira SPI (Serial Peripheral Interface) komunikaciju između dva PIC mikrokontrolera. 
Jedan mikrokontroler radi u master modu, a drugi u slave modu. Master šalje podatke preko SPI linije, 
dok slave prima te podatke i prikazuje ih na PORTD. Oba mikrokontrolera koriste SPI prekide za sinhronizaciju podataka.


Hardverska Postavka
Master Konekcije:

    SCK (Serial Clock): Povezan na RC3
    SDI (Serial Data In): Povezan na RC4
    SDO (Serial Data Out): Povezan na RC5
    SS (Slave Select): Povezan na RE0 za kontrolu slave uređaja

Slave Konekcije:

    SCK (Serial Clock): Povezan na RC3
    SDI (Serial Data In): Povezan na RC4
    SDO (Serial Data Out): Povezan na RC5
    SS (Slave Select): Povezan na RA5