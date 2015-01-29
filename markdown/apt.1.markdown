
APT
===


apt-get
-------

* -c=? legge come configurazione il file specificato(anziche' apt.conf)
* -d scarica pkg solamente e non installa
* -s simula ma nn installa
* -y applica si a tutte le domande
* -m prova a continuare se gli archivi non ci sono
* -V mostra i numeri di versione
* -u mostra i pkg che stanno per essere aggiornati.

Comandi:

* update aggiorna la lista dei pacchetti. update dovrebbe sempre essere fatto prima di un upgrade o dist-upgrade
* upgrade esegue un aggiornamento
* install istalla pkg
* remove rimuove pkg
* dist-upgrade aggiornamento della distrib.


apt-cache
---------

* -c=? legge come configurazione il file specificato(anziche' apt.conf)
* -a (è di default) stampa tutte le versioni disponibili.

Comandi:

* search "regex" ricerca di pkg
* depends "pkg" mostra le dipendenze di un pkg
* showpkg "pkg" mostra info di un pkg
* pkgnames "prefix" mostra il nome di un pkg.


## elenco pacchetti installati
1) Creare una lista dei pacchetti installati con il seguente comando:
-    dpkg --get-selections > /home/$USER/lista_pacchetti

2) E' buona norma salvare anche il file /etc/apt/sources.list

3) Per ripristinare i pacchetti sistemiamo il sources.list salvato in precedenza

4) Successivamente diamo da terminale:
-    sudo dpkg --set-selections (simbolo minore) /home/$USER/lista_pacchetti
-    sudo apt-get dselect-upgrade

