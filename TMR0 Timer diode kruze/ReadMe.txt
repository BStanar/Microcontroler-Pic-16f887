Ovaj projekat koristi PIC mikrokontroler za pomjeranje LED dioda na portu PORTB koristeći Timer0 prekid. 
LED obrazac se pomjera ulijevo, a kada dostigne zadnju LED (poziciju 0b10000000), vraća se na početak (0b00000001).

Glavne Karakteristike

Timer0 Prekid: Timer0 je konfigurisan da generiše prekid svakih 50 ms, a nakon 40 prekida (2 sekunde), LED-ovi se pomjeraju.
LED Pomjeranje: LED-ovi na PORTB se pomjeraju ulijevo i resetuju kada dođu do kraja.