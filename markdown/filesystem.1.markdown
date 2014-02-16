
#  filesystem dischi



## create a RAM disk

In order to create a disk into the ram:

`mkdir -p /media/ramdisk`


`mount -t tmpfs -o size=2048M tmpfs /media/ramdisk`

To unmount:
`umount /media/ramdisk`




## Ricavare l'UUID a partire dal file dev

Restituisce l'uuid e il tipo di filesystem:
`sudo blkid /dev/xxx`





## Tune percentuale spazio riservato

Set la percentuale di spazio riservato al 1% anziché a 5%:

`sudo tune -m 1 /dev/sda1`

Controllare il reversed blocks:

`sudo  tune2fs -l /dev/sda1`




## df

visualizza info sui dischi




## du -h -s

fornisce info sullo spazio occupato del disco.




## fdisk

"/dev/hda"app per la gestione di partizione




## qtparted 

app per la gestione di partizione




## mkreiserfs /dev/hda1

crea un reiserfs




## mk2fs

"/dev/hda1"crea un ext2




## mkswap

"/dev/hda1"crea uno spazio swap




## swapon

"/dev/hda1"avviene subito dopo mkswap




## mkfs <dispositivo> -t <tipo file system>

crea filesystem. è un comando più generico degli altri




## hdparm 

[opt] "/dev/hda"verifica le prestazioni dei dischi. -t verifica le prestazioni in lettura,-T verifica le prestazioni della cache, -c [flag(es 1)] add supporto 32 bit, -d [flag(es 1)] add DMA, -k [flag(es. 1)] consente di mantenere le impostazioni fatte. quindi per l'esecuzione del prog all'avvio mettere hdparm -c1 -d1 -k1 /dev/sda per esempio in /etc/rc.d/rc.local




## pwd

indica la posizione corrente nel filesystem





## /etc/fstab

contiene info sui dati di montaggio di filesystem, è possibile impostare se un filesystem è di lettura (ro) o lettura/scrittura(rw) ecc. Esiste anche etc/mtab





## mount

monta un filesystem. i dati di montaggio sono collocati nel file /etc/fstab. Esistono in tutto tre forme di utilizzo del comando: 1)-  mount -a [-fFnrsvw] [-t type] [-O optlist] monta i filesystem che sono presenti nel file /etc/fstab. con -t indichiamo il tipo di file system(per l'elenco ved man mount), -n permette di non modificare mtab, -F fa il montaggio simultaneo dei fs presenti sul file, -v verbose, -r monta il fs in read-only, -w monta il fs in read-write, -O è visto come un filtro per indicare quali filesystem montare in base ad una lista di opzioni (che possono essere viste su man mount) Es. se nel file è presente un riga: /dev/cdrom /mnt/cdrom iso9660 owner,noauto,ro 00 è possibile facilmente utilizzare mount in qst modo -  mount /dev/cdrom oppure -  mount /mnt/cdrom 2) - mount -l lista i filesystem esistenti(cioè visualizza il file /etc/mtab) 3) -  mount [-fnrsvw] [-o options [,...]] device | dir è la forma più comune. Esistono altre due forme di utilizzo -  mount --bind olddir newdir permette di creare una copia su un nuovo punto di mount; -  mount --move olddir newdir permette di spostare il filesystem. Altri esempi: -  mount /dev/cdrom -t iso9660 /mnt/cdrom permette di montare il cd-rom; mount -t iso9660 -o ro,loop=/dev/loop0 immagine.iso /mnt/cdrom permette di montare un file.iso, -  mount monika:/mnt/nfs -t nfs /mnt/nfs permette di montare la partizione presente sul server monika in locale




## umount /mnt/hda2

operazione inversa del mount





