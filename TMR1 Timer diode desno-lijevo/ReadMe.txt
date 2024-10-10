Ovaj projekat koristi PIC18F mikrokontroler za pomjeranje LED dioda preko porta PORTB koristeći Timer1 prekide. 
Smjer pomjeranja LED-ova se mijenja kada obrazac dostigne rubove porta.

Timer1 Prekid: Aktivira se svakih 0,5 sekundi (sa preskalerom i inicijalnim vrijednostima).
Pomjeranje LED-ova: LED-ovi na PORTB se pomjeraju lijevo ili desno, a smjer se mijenja kada dostignu rubove.