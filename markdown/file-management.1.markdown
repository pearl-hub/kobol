
#  gestione file



## less

To watch the changing in the tail of the file press Shift+f.



## lsof

Shows open port with related process:
`lsof -i`

To show the open files of a process given the name:
`lsof -p $(pgrep -f firefox)`

or 
`lsof -p $(pidof firefox)`
.
Visualizza i file aperti del sistema. Per ciascun file mostra il processo che lo ha aperto.
Se si vuole indicare una specifica cartella:
`lsof +D /media/usb`

Se si vuole indicare un intera partizione:
`lsof /dev/sdb1`





## umask

Permette di cambiare i permessi alla creazione di un file o directory
Per visualizzare il valore corrente in modo simbolico:
`umask -S`


Per cambiare permettere la lettura scrittura e esecuzione per il proprietario e gli appartenenti al gruppo e altri solo la lettura:
`umask u=rwx,g=r,o=r`





## read variable

E' utilizzato negli script e consente la lettura dallo stdIn(tipicamente tastiera), la stringa andrÃ  in "variabile". E' possibile redirigere in qst modo read "var" < "file"




## file file

indica il formato di un file o dir




## mktemp

crea un file temporaneo univoco




## find dir -name file
permette di ricercare file.
Trovare tutti i file creati oggi:
`find -maxdepth 1 -mtime 0 -type f`

Cancellare le cartelle vuote:
`find . -type d -exec rmdir {} \;`

Cancellare tutti i file .pyc:
`find . -depth -type f -name *.pyc -exec rm {} \;`

Cancellare tutte le directory .svn:
`find . -depth -type d -name .svn -exec rm -Rf {} \;`

Delete all the files that are NOT '\*.php':
`find ~/sources/ -type f -not -name '*.php' -delete`

con -cmin "minuti" e mmin "minuti" fa la ricerca di file cambiati e modificati nell'arco di "minuti".
un utilizzo più complesso e' find ~/ -name 'core\*' -exec "comando" {} \; che Cancella tutti i file core presenti nella directory home dell'utente. Con vicino "COMANDO" c'e' {}, allora find sostituisce "{}" con il percorso completo del file selezionato.


Find the files modified on a specific date(works for find version >=4.3.3):
`find . -type f -name "*.py" -newermt 2013-02-07 ! -newermt 2013-02-08 -ls`




## locate -e -i file /slocate file

fa la ricerca come find, ma su un file indicizzato creato con il comando updatedb. locate controlla solo sul database, quindi i file ottenuti dai risultati possono non esistere. -e stampa solo i file veramente esistenti; -i igonra il case; -l num stampa i primi num risuktati.




## updatedb

-o "file" scrive il DB su "file"; --database-root "Path" fa lo scan solo a partire da path. controllare /etc/updatedb.conf per guardare le regole utilizzate.




## cmp

simile a diff




## diff

Denota differenze tra 2 o più file.-urN option.
Per creare una patch basta digitare:
`diff "file" "file" > patch`
 oppure nel caso di patch binaria:
`diff -a --binary bin bin.2 > patch`
.
Al fine di applicare la patch ad un file usare il comando patch.



## patch

Serve per applicare una patch (creata con il comando diff) ad un file vecchio:

`patch originfile diffpatch`
.
Per patch binarie:
`patch -binary originfile diffpatch`
.
In realta', il file patch contiene gia' il file di destinazione su cui applicare la patch.
Quindi, di solito si usa:
`patch -p0 < patchfile`

dove il numero dopo -p si riferisce a quanti leading slashes passare a partire della radice
del percorso.



## basename file

restituisce il nome del file. utile per gli script per conoscere il nome dello script stesso con basename $0




## dirname file

simile a basename, ma visualizza il percorso e non il nome del file.




## ls path

lista i file di una directory. -a permette di visualizzare file nascosti (sono file che iniziano con . es .bash), -l da info su permessi dimensioni e proprietari




## uniq file

elimina in un file righe ripetute




## more [numero di linea da cui partire] file

permette di leggere il contenuto di un file un po alla volta. viene utilizzato in combinazione con comandi con la pipe es ls -a | more





## ln file origin file link

effettua un hard link collegandosi al numero inode del file rappresentando il file origine nella sua interezza. Con l'opzione -s è possibile creare un link simbolico che a collegamento al nome del file permettendo anche di cambiare i permessi.




## rm file

rimuove file e directory.-r rimuove anche il contenuto della directory, -i versione interattiva, -f forza la rimozione senza avvertirti nuovamente





## rsync -avz --exclude pippo.\* --delete <server>:/web/ web/

permette di replicare una directory presente su un sistema server





## cp

copia un file. con -l fa un link; -i rende interattivo avvisandoti della sovrascrittura; -R copia ricorsivamente per le subDir; -d fa un backup dei file dest per evitare l'override; --preserve preserva alcuni attributi quali i link ad essi associati ecc




## scp

copia sicura con ssh
`scp file.tgz madrid@server.com:/`

Per limitare la banda durante la copia (ad es. di 10 kbs)
`scp -l10 pippo@serverciccio:/home/zutaniddu/* .`





## rsync [opt] dirSour dirDest

Fa una sincronizzazione dei dati veloce e flessibile per il backup. -a indica che si vuole ricorsione e che si vuole preservare permessi proprietari etc..,-z si effettua un trasferimento compresso, -g si preserva il gruppo, -r ricorsivo, -b si rinominano i files che si trovano gia' in destinazione e che potrebbero essere riscritti, -u controlla i time-stamp per verificare se il file gia' esistente in dest e piu' nuovo di quello che si sta trasferendo, in tal caso il file non viene trasmesso, -v verbose




## chattr [opt] file /lschattr

cambia gli attibuti di un file in ext2-3. (+/- add o sub attributi del tipo: i=lo rende immutevole; a=è possibile solo l'append; c=comprime direttamente sul disco; d candida per il backup con il comando "dump"; u=non cancellabile; R= applica ricorsivamente gli attibuti ai file di una cartella e delle sotto cartelle




## chown proprietario file/dir

permette di cambiare il proprietario del file. -R rende possibile la ricorsione per le subfile o subdir




## chmod 700 file

imposta i permessi. esiste la versione ottale, opp -  chmod u+rwx,go-rwx gsg.tex




## tee file

copia lo standard input allo std output e al file




## read

legge righe da una file




## puts

scrive righe da un file




## fmt -w 60 doc.txt > d.txt

formatta il file doc con un numero 60 di colonne




## fold -w 60 -s doc.txt > d.txt

simile a fmt ma permette di non troncare le parole al termine delle colonne




## pdffonts file.pdf

è molto importante in quanto elenca i font utilizzati nel documento




## pdfimages file.pdf

estrae dal file le immagini




## pdfinfo file.pdf

da info sul file




## xpdf .pdf

visualizzatore di pdf




## pico

è un editor di testo presente nel pacchetto sw pine




## nano

editor di testo




## vi

editor di testo




## tac ##

Concatenate and print files in reverse. See cat :)

## cat ##

Show line numbers:

    cat -n file

Minimal file editor (press ctrl+c to exit):

    cat > file

To prepend text to a file:

    echo "text to prepend" | cat - file

## head -n file ##

mostra le prime n righe
## tail -n file

mostra le ultime n righe




## mc

Midnight Commander




## rmdir dir

rimuove una dir




## mv oldFile newFile

permette di rinominare o di spostare un file




## cd -  ..

(-) permette di andare all dir precedente (..) alla directory superiore





## wc file

permette di un file di ottenere num di caratteri(-c), num di righe(-l), num di parole(-w)





## gv file/kghostview file/ggv file

permette di visualizzare file .ps o .pdf




## xdvi file.dvi

visualizza file .dvi in modalità X window




## tr -s '\000' < prova.doc |tr -d '[:cntrl:]' > prova.txt

permette di modificare un file o standard input. -d cancella caratteri in questo caso cntrl, -s rimpiazza con una singola occorrenza una sequenza di caratteri presente nel SET '000"'. il file finale viene diventa prova.txt





## md5sum file

fornisce l'impronta o digest del file per verificare l'autenticita'. vedere anche sum, cksum, sha1sum




## split -b 1m moni.tif

suddivide un file. -b "dim" indica la dimensione di ogni blocco. per ricomporre -  cat xaa xab xac > moni.tif




## source file

permette di ricaricare un file di configurazione che è stato modificato senza dover uscire e rientrare nel sistema. es. bash .bashrc interpreta l'argomento come uno script di shell e lo esegue




## touch file

aggiorna i time stamp del file che sono: Data di creazione, Data di modifica, Data di accesso





