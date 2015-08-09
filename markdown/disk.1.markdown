#Disk management#

##No space left on device##
Disk partition usage:

```
df -h
```

Show a human readable summary:

```
du -h -s <directory>
```

Show the size of directory for the first level:

```bash
du -h --max-depth=1 <directory>
```

Find out the largest directories or files eating disk space:

```bash
du -ha /tmp | sort -n -r | head -n 10
```

Find and remove large files that are open but have been deleted:

```bash
lsof -nP | grep '(deleted)'
```

##The file system is in read-only mode?##
Try to remount the partition with rw options:

```bash
mount -o remount,rw /ftpusers/tmp
```

##Not enough inodes?##
To check for available inodes:

```bash
df -ih
```

If there is not enough inodes you still need to delete large files
even though there is space available.

##Has the disk partition bad sectors?##

```bash
smartctl -a /dev/sda
```

or

```bash
fsck -y -t ext3 /dev/sda8
```

To simulate:

```bash
fsck -N /dev/sda8
```

With `fsck` remember to umount the partition first.

##Is the disk too hot?##

```bash
hddtemp /dev/sda
```

or

```bash
smartctl -d ata -A /dev/sda | grep -i temperature
```

##Deal with RAID##

```bash
## get detail on /dev/md0 raid ##
mdadm --detail /dev/md0

## Find status ##
cat /proc/mdstat
watch cat /proc/mdstat
```

Disks are failing if they show underscores: `|_UUUU|`

To remove disk from an array md0:

```bash
mdadm --manage /dev/md0 --fail /dev/sdb1
mdadm --manage /dev/md0 --remove /dev/sdb1
```

You may need to reboot if the disk are not hot-swappable

To add disk:

```bash
mdadm --manage /dev/md0 --add /dev/sdb1
```

##Create a file image##

```bash
fallocate -l 1G test4.img
```

or

```bash
qemu-img create archlinux.img 8G
```


##Create a RAM disk##
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


## dd ##

To copy an image to an pendrive:

    dd if=/home/nomeutente/nomefile.img of=/dev/sdb bs=10M

### Test performance of Disk with dd ###

To measure throughput (write speed):

    dd if=/dev/zero of=/tmp/test1.img bs=1G count=1 oflag=dsync

To measure latency:

    dd if=/dev/zero of=/tmp/test2.img bs=512 count=1000 oflag=dsync


## hdparm ##

[opt] "/dev/hda"verifica le prestazioni dei dischi. -t verifica le prestazioni in lettura,-T verifica le prestazioni della cache, -c [flag(es 1)] add supporto 32 bit, -d [flag(es 1)] add DMA, -k [flag(es. 1)] consente di mantenere le impostazioni fatte. quindi per l'esecuzione del prog all'avvio mettere hdparm -c1 -d1 -k1 /dev/sda per esempio in /etc/rc.d/rc.local

### Test performance of Disk with hdparm ###

To measure read performance on cache and disk:

    hdparm -Tt /dev/sda


## pwd

indica la posizione corrente nel filesystem





## /etc/fstab

contiene info sui dati di montaggio di filesystem, è possibile impostare se un filesystem è di lettura (ro) o lettura/scrittura(rw) ecc. Esiste anche etc/mtab





## mount

monta un filesystem. i dati di montaggio sono collocati nel file /etc/fstab. Esistono in tutto tre forme di utilizzo del comando: 1)-  mount -a [-fFnrsvw] [-t type] [-O optlist] monta i filesystem che sono presenti nel file /etc/fstab. con -t indichiamo il tipo di file system(per l'elenco ved man mount), -n permette di non modificare mtab, -F fa il montaggio simultaneo dei fs presenti sul file, -v verbose, -r monta il fs in read-only, -w monta il fs in read-write, -O è visto come un filtro per indicare quali filesystem montare in base ad una lista di opzioni (che possono essere viste su man mount) Es. se nel file è presente un riga: /dev/cdrom /mnt/cdrom iso9660 owner,noauto,ro 00 è possibile facilmente utilizzare mount in qst modo -  mount /dev/cdrom oppure -  mount /mnt/cdrom 2) - mount -l lista i filesystem esistenti(cioè visualizza il file /etc/mtab) 3) -  mount [-fnrsvw] [-o options [,...]] device | dir è la forma più comune. Esistono altre due forme di utilizzo -  mount --bind olddir newdir permette di creare una copia su un nuovo punto di mount; -  mount --move olddir newdir permette di spostare il filesystem. Altri esempi: -  mount /dev/cdrom -t iso9660 /mnt/cdrom permette di montare il cd-rom; mount -t iso9660 -o ro,loop=/dev/loop0 immagine.iso /mnt/cdrom permette di montare un file.iso, -  mount monika:/mnt/nfs -t nfs /mnt/nfs permette di montare la partizione presente sul server monika in locale




## umount /mnt/hda2

operazione inversa del mount

