
#  processi memoria comandi



## Codici del comando exit

Una volta eseguito un comando può essere controllato lo stato d'uscita nel seguente modo:
`echo $?`
Questo ci consente di prendere successive decisioni in merito al uscita del comando eseguito.
In generale ogni codice ha un suo significato:
*      1: general errors
*      2: misuse of shell builtins (pretty rare)
*      126: cannot invoke requested command
*      127: command not found error
*      128: invalid argument to “exit”
*      128+n: fatal error signal “n” (for example, kill -9 = 137).
*      130: script terminated by Ctrl-C




## strace

To check only some system call (i.e. open,..) for a given process:

`strace -f -p pid -e open,access,poll,select,connect,recvfrom,sendto [-c]`





## exec comando

anziche generare un processo figlio per eseguire "comando", con exec la shell e' sostituita dal comando. Se exec viene utilizzato in uno script qst termina all'esecuzione di exec



## pidof

Mostra il pid del processo passato come argomento:
`pidof processo`




## ulimit -a

mostra le limitazioni nelle risorse di sistema




## top

sorta di task manager in cui è possibile anche visualizzare la presenza di memoria swap. in X Server esiste un app simile premendo i tasti CTRL+Esc




## free 

To check RAM and swap state:
`free -m`

or sing meminfo:
`watch -n 1 cat /proc/meminfo`

To empty the caches:
`sudo sysctl -w vm.drop_caches=3`




## insmod

"/lib/modules/2.2.17/sound/sound.o" permette l'inserimento di moduli per la gestione di periferiche e di funzionalità nella memoria.Esiste la vecchia versione insmod.old. -f forza l'inserimento anche in caso di incompatibilità, -k rende flessibile la gestione del modulo.




## lsmod /lib/modules/2.2.17/sound/sound.o

Visualizza i moduli caricati in memoria. -c visualizza le configurazioni, -l lista, -r rimuove moduli



## modprobe 

carica moduli di memoria e li testa atraverso configurazioni. con l'opzione -l lista la posizione dei vari moduli




## modinfo modulo

mostra informazioni sul modulo.




## rmmod

rimuove un modulo in memoria. -a rimuove tutti i moduli




## ps

Lists of the processes in execution:

    ps -e

Shows with more details:

    ps aux


Shows the process tree:

    ps faxj

OR

    pstree


Shows all processes for the getty command with customized fields:

    ps -C getty -o user,pid,tty,time,comm

Shows the first 10 processes sorted by CPU usage:

    ps aux | sort -n -k 3 | tail -10

Shows the first 10 processes sorted by Memory usage:

    ps aux | sort -n -k 4 | tail -10


Shows the processes running as a user:

    ps -U feel -u feel u


visualizza ulteriori info sui processi attivi. si utilizzano le opzioni -afx, -a mostra i processi utilizzati da altri utenti, -f definisce una struttura ad albero, -x mostra  processi senza terminali di controllo, u rende l'output human-readble

See the pearl functions: touser, cpumost, memmost, topid, frompid




## pstree ##

Provide the list of process with a tree structure.
See also ps command.



## kill ##

uccide il processo "pid"
`kill pid`

Elenco dei segnali che possono essere mandati al processo
`kill -l`

I segnali più importanti sono: SIGHUP che consente di uccidere tutti i processi figli del processo specificato; SIGINT segnale di interruzione che corrisponde a Cntrl-C; SIGKILL; SIGTSTP che corrisponde a Cntrl-Z; SIGCONT che è il segnale inviato da una shell tramite i comandi fg e bg; SIGWINCH che è per eventi di finestra come resize e cosi via; e, infine SIGUSR1 e SIGUSR2 che permettono comunicazioni inter-processo.



## batch -f file.sh

esegue il file solo quando il carico della CPU scende (di 0.8 per default)




## time

permette di dare info di tempo su un comando (time ls = lo esegue e da info).
Utilizzare /usr/bin/uptime per ottenere maggiori informazioni.




## nohup programma

permette di eseguire un programma in background e rimanendo eseguito anche quando ci si disconnette dal sistema andando a riportare l'output sul file nohup.out nella dir corrente.
Vedere pure il comando 
`disown`
.



## Adjust process priorities ##

The nice command assumes the value of 10.
The priority is a valuerange -20 to 20. The default priority is 0, priority 20 is the lowest possible.

To adjust the priority:

    nice -n num program

### Alter priority on running processes ###


To set the priority or the increment of a running process:

    renice priority pid
    renice -n increment pid

To set the processes belonging to a given user:

    renice -u user



## watch -n num comando

Esegue un comando ripetutamente, ad intervalli di tempo specificati.Gli intervalli preimpostati sono di due secondi, ma questo valore puo essere modificato mediante l'opzione -n. es watch -n 5 tail /var/log/messages




## man [sezione] pagina

La sezione e' un numero. visualizza i manuali dei comandi. -k "parola" cerca all'interno dei manuali la parola (vedere il comando apropos che fa una operazione simile). e' possibile fare una ricerca all'interno del documento. una volta entrati nel manuale digiare /"parola"




## sudo comando

esegue un comando come root. il file /etc/sudoers contiene i nomi degli utenti autorizzatiad invocare sudo. Il comando "sudo -i" consente di utilizzare una console di root. Per abilitare in ubuntu il root digitare "sudo passwd root"; per disabilitare nuovamente digitare "sudo passwd -l root".




## chroot root dir comando

permette di eseguire un comando cambiando la directory di root. Es. chroot /mnt/backtrack /bin/bash esegue la bash sul SO linux presente ne filesystem backtrack!!! Addirittura!




## ldd /usr/bin/comando

permette di fornire info sulle librerie (sorte di .dll) utilizzate dal comando




## crontab

esegue comandi ad una certa data. è necessario che sia attivo il demone crond(attivabile con /etc/rc2.d/S89cron start). -e modifica il file di conf -l lo visualizza -r lo rimuove



## at

The general commands are:
I comandi sono at, batch, atq, e atrm:
*  at esegue i comandi in un momento specificato.
*  atq elenca i lavori in attesa dell’utente, a meno che l’utente non sia il superutente;
in tal caso, tutti i lavori sono elencati.
*  atrm elimina uno dei lavori in attesa, identificati dal loro numero.
*  batch esegue comandi quando permesso dal livello di carico del sistema,
in altre parole, quando il carico medio scende sotto 1.5,
o il valore specificato nella chiamata di atd

To execute at script.sh at 20.00 send an email of the output
and insert the job into the queue a:
`at -m -q a -f script.sh 20.00`

Other possible values of time are "midnight Friday"

To see the list of jobs:
`atq`

To see the detail of the job number 3:
`at -c 3`

To remove the job number 3:
`atrm 3`




## init 0123456Ss

permette di spostarsi sui vari runlevel




## telinit 0123456..

simile a init




## runlevel

visualizza il livello di runlevel corrente




## /etc/inittab

permette di modificare i processi che si avviano sui vari runlevel. Ogni riga è del tipo id:run:azione:processo




## /etc/rc.d/rc.local

è letto da init in fase di avvio. all'interno si possono applicare i comandi che desideriamo avviare in fase di boot. conviene disabilitare i comandi che generano issue e issue.net che rappresentano banner informativi del proprio sistema. di seguito conviene eventualmente eliminarli con il comando -  rm -fr /etc/issue.net /etc/issue




## mesg opt

permette di attivare(y) o disabilitare(n) la comunicazione tra utenti di sistema con l'utilizzo di diversi programmi




## sh file.sh

esegue degli script bash. Usa sh -c help per info su come costruire uno script shell. è possibile eseguire un file.sh anche in qst modo ./file.sh. in qst caso è necessario avere i permessi per farlo, che è possibile ottenere con chmod





## whatis comando

fornisce la descrizione di un comando. è utile il comando makewhatis per creare l'indice delle descrizioni.  il Comando apropos "parola" cerca all'interno di elencho whatis, può essere una alternativa a whatis




## whereis comando

individua il percorso del comando binario, tra cui anche i file di configurazione, i manuali ecc...




## which comando

restituisce il percorso di "comando" utile per capire se il comando e' stato installato





