
#  sistema hardware



## xev

consente di ottenere informazioni su eventi dei dispositivi di input quali tastiera e mouse




## halt/ shutdown

To reboot:
`shutdown -r`

To halt:
`shutdown -h`

To reboot the system right now:
`shutdown -r now`

To reboot the next minute with a message:
`shutdown -r +1 "Restarting..."`

To cancel the shutdown:
`shutdown -c`




## uname -a

fonisce info sul sistema tra cui il nome della macchina. con -r da la versione del kernel. uname -r viene utilizzato per esempio in qst caso: apt-get install build-essential linux-kernel-`uname -r`




## arch

da informazione sull' architettura del sistema (es. i386)




## lspcmcia(pccardctl)/lspci

visualizza schede





## lpc

avvia un programma per la gestione delle code di stampa. Esistono comandi che possono essere visualizzati con ? o help "comando"




## lsusb

lista le usb




## lshw

mostra tutti i dispositivi hardware. Estremamente utile quando si vuole sapere il file in /dev/* corrispondente ad un dato dispositivo.




## lpr -Plpt1 file

Permette la stampa di un file. Dove lpt1 rappresenta la porta parallela, il dispositivo /dev/lpt1.




## lprm num

rimuove un processo di stampa indicato col numero num. i processi esistenti possono essere visualizzati con lpq




## mpage -t -1 -Plp -bA4 documento.ps

stampe un .ps -1 indica il num di pag per foglio, lp indica la porta parallela




## lp file

permette di formattare un file per la stampa aggiungendo ora, nome num di pag ecc




## cdrecord -scanbus

visualizza le periferiche CD




## cdrecord -v speed=4 dev=0,0,0 -data dati.iso

Masterizza. Esiste anche cdrdao per masterizzare




## mkisofs

opp genisoimagecrea file .iso. -r permette nomi lunghi dei file e generazione di subDir senza limite, permette inoltre di applicare permessi gruppi ecc, anche -D consente profodità illimitata per i filesystem iso9660, -input-charset definisce il set di caratteri da usare (il più comune è -input-charset cp437), -j creazione di un fs per il mondo MS windows, -b permette di produrre CD avviabile in boot. ES.  mkisofs -r -l -o immagine.iso dati/ è possibile montarlo in questo modo mount -t iso9660 -o ro,loop=/dev/loop0 immagine.iso /mnt/cdrom




## dmesg -n

permette di dare info avvenute all'avvio. con -n indichiamo il tipo di runlevel che ci interessa. Utile per conoscere il nome dei dispositivi Es. dmesg | grep ttyS permette di conoscere il nome del modem ecc





## vlock

blocca la console testo per evitare intrusioni. un comando analogo per X server è xlock





## play -v 10 file

permette di aprire molti formati audio tra cui gli mp3. -v è l'opzione per il volume





