Ovaj projekat koristi PIC mikrokontroler za implementaciju brojača sekundi pomoću Timer1 prekida 
i prikazuje rezultat na dva 7-segmentna displeja. Brojač se povećava svake sekunde, a korisnik može 
startovati i pauzirati brojač pomoću dugmeta povezanim na PORTA.B4.

Glavne Karakteristike

    Timer1 Prekid: Timer1 generiše prekid svake sekunde.
    7-segmentni prikaz: Vrijednost brojača (u sekundama) se prikazuje na dva 7-segmentna displeja, koristeći dekodirane cifre iz niza cifre[].
    Kontrola preko dugmeta:
    Dugme na PORTA.B4 kontroliše start i pauzu brojača.
    Dugme na PORTA.B5 resetuje brojač na 0.