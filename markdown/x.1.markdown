
-  X WINDOW



## xte

Si trova nel pacchetto xautomation:
`sudo apt-get install xautomation`

Esempi d'uso:
*   Per scrivere una stringa nell'app in focus - 
`xte 'sleep 5' 'str hello world' 'key Return'`

*   Per muovere il mouse in una certa posizione dello schermo - 
`xte 'sleep 1' 'mousemove 9999 0'`





## xterm -rightbar -bg white -fg black
apre un terminale per X windows. -bg è il background, -fg è il foreground, -rightbar con la barra a destra. premendo con il tasto destro del mouse e CTRL è possibile avere dei menu per configurazioni.


## xclock
visualizza l'ora -analog, -digital, -update "sec", -hands "colore" 


## xvidtune
serve per configurare le freq del monitor e altro ancora..


## xset
è un utilità che permette di configurare diversi device tra cui mouse monitor ecc, provare xset --help che è fatto bene. Es. per inserire i path dei font -  xset fp+ /usr/X11R6/lib/fonts/directory/ opp per rimuovere -   xset fp- /usr/X11R6/lib/fonts/directory/


## xsetpointer
permette di mostrare e configurare dispositivi di puntamento per l'ambiente grafico


## xsetroot -solid blue
permette di configurare lo sfondo dell'ambiente



## Server X
Si tratta del programma che gestisce l?interfaccia gra?ca e accetta le connessioni di rete per la gestione remota.


## Client X
Sono tutti i programmi che utilizzano l?ambiente gra?co gestito dal Server X, sia sulla macchina locale che su computer in rete.


## Protocollo X
Rappresenta il protocollo di comunicazione utilizzato dal Server X e dai relativi client.


## Window Manager
Sono particolari software diretti a gestire le ?nestre ed ulteriori componenti sopra il Server X agendo anch?essi come client.


## Ambienti desktop
sono l'evoluzione di questi ultimi perchè offrono la possibilità di gestire eventi in maniera intuitiva tramite il mouse, la periferica di puntamento largamente diffusa.

## Il server XFree86
è una implementazione di X Window System, un potente e complesso ambiente gra?co per sistemi operativi Unix.



## /etc/X11/XF86Config opp /etc/X11/xorg.conf
è un file di configurazione per configurare il Server X. è composto da diverse sezioni ognuna delle quali diretta a config i diversi dispositivi.Esiste anche una sezione XInput dedicata ai disp più particolari quali tavolette grafiche. eistono diversi comandi che permettono di conf auto il file quali: xf86config, XF86Setup, xf86cfg.


## startx
Avvia X Server, deve essere utilizzato dopo la config del file xorg.conf/XF86Config. Possono accadere degli errori all'avvio che possono essere visualizzate in qst modo: startx 2> errori.txt


## xinit
da utilizzare quando startx non funziona


## CNTRL F1....F6
permette in modalità X Server di aprire un terminale in caso di problemi


## linux single
al prompt di lilo permette di avviare linux in modalità runlevel 2 senza avviare X Server


## mkfontdir
Il comando serve per aggiornare il fonts.dir della cartella corrente. fonts.dir è presente in ogni cartella dei font(tipo /usr/X11/lib/fonts/..) specificati nel file di conf xorg.conf, e contiene l'elenco dei font di un certo tipo.


## xlsfonts 
elenca tutti i font attualmente disponibili all?uso e riconosciuti dal Server X elencandoli in una lunga lista organizzata di base alfabeticamente ma facilmente con?gurabile secondo le proprio esigenze con le opzioni presenti.


## .xinitrc
qst file applicato nella propria dir home viene all'avvio eseguito e ci permette di avviare comandi in fase di boot es. xsetroot -solid Gray exec xterm &amp; exec fvwm Nell'esempio presentato si sceglie di utilizzare il Window Manager fvwm con lo sfondo del colore grigio. Viene inoltre lanciato il programma xterm.


## .twmrc
simile a .initrc bisognerebbe studiarlo


## xmodmap
e' un programma per interpretare i segnali da tastiera


## bitmap
avvia un programma di disegno




