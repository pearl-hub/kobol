
-  svn - subversion


## svn - semplice

Le operazioni classiche compiute normalmente sono:
Aggiornare la copia locale alla revisione più recente
`svn update`

Commit della copia locale
`svn commit`

Aggiungere file nella copia locale per aggiornare il contenuto della cartella .svn
`svn add file`

Rimuovere file nella copia locale per aggiornare il contenuto della cartella .svn
`svn remove file`





## svn - avanzato


Regredire ad una versione già “committed”
`svn merge -c -REV`
dove REV è il numero di revisione che si intende recuperare.

Comprimere una directory escludendo i metadati SVN
`tar cvf sdk.tar --exclude=\.svn sdk/`


Eliminare gli spazi bianchi nel nome del file
`svn st | awk '{if ($1 ~ "?") print $2}' | xargs svn add`


Rimuovere spazi o tabulazioni alla fine della riga
`sed 's/[ \t]*$//' file1 > file2`


Inviare SVN diff verso Meld
`svn diff --diff-cmd='meld' -r 100:BASE FILE`


per visualizzare cosa è cambiato dalla versione “BASE” alla revisione “100″

Quanti file ci sono nel repository SVN?
`svn log -v --xml file:///path/to/rep | grep kind=\"file\"|wc -l`


Accedere ad un repository SVN su una porta differente
Editare il file di configurazione
`/home/cicciobomba/.subversion/config`
e sotto la sezione [tunnels] aggiungere questa linea ciccio_diverso = /usr/bin/ssh -p 12345
Adesso è possibile accedere al repository SVN tramite SSH sulla porta 12345 scrivendo
`sudo svn co svn+ ciccio_diverso://root@192.168.50.51/svn-repo/progettino`


Rimozione ricorsiva delle directory .svn. Questo comando l’ho sempre usato per eliminare i file “compilati” di Python
`find . -name "*.pyc" -exec rm '{}' ';`
, ma può essere usato anche per eliminare le directory “.svn”
`find -name .svn -delete`


Evitare le directory .svn usando find
`find . -name .svn -prune -o -print`




