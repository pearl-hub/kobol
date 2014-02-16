
#  Ripristino e installazione di sistemi GNU Linux



## Opzioni di avvio del kernel

Per conoscere tutte le opzioni al time boot: 
`man bootparam`




## Installare ubuntu senza cd ma solo con la iso

Per prima cosa, scaricare l’immagine ISO di Ubuntu e posizionatela nella root directory (“/”), adesso digitate:

`sudo gedit /boot/grub/grub.cfg`


A fine file aggiungete il seguente codice:


menuentry "Ubuntu 10.04 desktop" {
loopback loop /ubuntu-10.04-desktop-i386.iso
linux (loop)/casper/vmlinuz boot=casper iso-scan/filename=/ubuntu-10.04-desktop-i386.iso noeject noprompt –
initrd (loop)/casper/initrd.lz
}


Adesso riavviate il sistema e troverete nel grub la voce “Ubuntu”, selezionatela e….partirà l’installazione di Ubuntu 10.04 :)



## Installare Grub nel MBR e in un'altra partizione utilizzando chainloader

Entrare in gurb con privilegi di root:
`sudo grub`

Per conoscere la partizione in cui è installato il proprio GRUB:
`find /boot/grub/stage1`

Dal risultato ottenuto definire che quella partizione è la partizione principale
`root (hd0,0)`


Installare il grub nel MBR:
`setup (hd0)`

E per la partizione:
`setup (hd0,0)`




## elenco pacchetti installati


1) Creare una lista dei pacchetti installati con il seguente comando:
-    dpkg --get-selections > /home/$USER/lista_pacchetti

2) E' buona norma salvare anche il file /etc/apt/sources.list

3) Per ripristinare i pacchetti sistemiamo il sources.list salvato in precedenza

4) Successivamente diamo da terminale:
-    sudo dpkg --set-selections (simbolo minore) /home/$USER/lista_pacchetti
-    sudo apt-get dselect-upgrade





## scrittura mbr


1)si va in fdisk a cambiare il flag in modo tale che la partizione di linux sia bootable (- fdisk /dev/sda; poi digita a; poi digita la partizione )
2)si utilizza il CD live di ubuntu per esmpio cambiando le opzioni di boot (es root=/dev/sda2 eliminare il parametro boot=casper)
3)una volta avviato il SO scrivere su terminale sudo grub-install /dev/sda

In caso di errori del tipo error: no such disk quando si intende avviare XP provare con i seguenti comandi:
-  update-grub
-  grub-install /dev/sda





