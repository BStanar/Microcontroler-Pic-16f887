Ovaj projekat implementira SPI komunikaciju između dva PIC mikrokontrolera: jedan je konfigurisan kao master, 
a drugi kao slave. Master šalje podatke sa porta B, dok slave prima podatke i prikazuje ih na portu D. Pored toga, 
slave šalje nazad podatke sa svog porta B master uređaju.


Hardverske Postavke
Master Konekcije:

    SCK (Serial Clock): RC3
    SDI (Serial Data In): RC4
    SDO (Serial Data Out): RC5
    SS (Slave Select): RE0

Slave Konekcije:

    SCK (Serial Clock): RC3
    SDI (Serial Data In): RC4
    SDO (Serial Data Out): RC5
    SS (Slave Select): RA5