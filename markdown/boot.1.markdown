
# Boot system #



## Boot kernel parameters ##
Per conoscere tutte le opzioni al time boot:

    man bootparam




## Installare ubuntu senza cd ma solo con la iso ##

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



## scrittura mbr


1)si va in fdisk a cambiare il flag in modo tale che la partizione di linux sia bootable (- fdisk /dev/sda; poi digita a; poi digita la partizione )
2)si utilizza il CD live di ubuntu per esmpio cambiando le opzioni di boot (es root=/dev/sda2 eliminare il parametro boot=casper)
3)una volta avviato il SO scrivere su terminale sudo grub-install /dev/sda

In caso di errori del tipo error: no such disk quando si intende avviare XP provare con i seguenti comandi:
-  update-grub
-  grub-install /dev/sda


## Grub 2 ##

To generate automatically the configuration from the files */etc/default/grub* and
the files located in */etc/grub.d/*:

    grub-mkconfig | grub-script-check
    grub-mkconfig -o /boot/grub/grub.cfg

The main variable to set are:

    GRUB_TIMEOUT - elapsed time for the initial grub menu
    GRUB_DISABLE_OS_PROBER - disable the check of windows OS (grub may be faster by disabling this)
    GRUB_CMDLINE_LINUX - add the kernel extra options on all the entries

