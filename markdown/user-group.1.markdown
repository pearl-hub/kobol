
-  user &amp; group



## finger

[-sl][utente][@macchina]ottieni info su un utente o sulla macchina, quale e' l'ultima volta che è acceduto al sistema. -s forma breve, -l forma estesa.




## adduser

"utente"aggiunge un utente




## groupadd gruppo

aggiunge un gruppo




## passwd

serve a cambiare la password




## sudo

Da rivedere




## su

permette di cambiare utente




## whoami 





## who

fornisce info sugli utenti connessi al sistema



## last

Show the last users that accessed into the system.
Ogni accesso viene di solito memorizzato su un file quando esiste /var/log/wtmp.
Con last si può visualizzare tale file. n indica le righe da visualizzare.
con -f indichiamo un altro file es /var/log/secure,
-d permette di conoscere in login remoti nn solo l'utente ma il nome host e l'IP associato,
-i è like -d ma l'IP è in forma 0.0.0.0

To show the last accesses of the user feel:
`last feel`





## lastb

gli accessi BAD vengono memorizzati in /var/log/btmp  e visualizzati con tale comando. Le opzioni sono le stesse del comando last





## w -f utente

mostra gli utenti collegati al sistema e cosa stanno facendo.-f indica il terminale, IDLE indica il tempo in cui l'utente non ha fatto nulla, JCPU e' il tempo totale di CPU usato da quell'utente, PCPU e' il tempo totale di CPU usato per quel dato momento





