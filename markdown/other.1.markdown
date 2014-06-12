
#  altro



## /etc/termcap

e' un elenco di tutti i terminali che il sistema conosce, e come controllano il cursore (es. xterm, minix opp console che e' un terminale di tipo vt100, ecc). l'aggiunta di un terminale al sistema consiste nel inserire una voce in qst file.




## TERM

e' una variabile d'ambiente per impostare il tipo di console per linux




## PATH

variabile d'ambiente costituito da un elenco separato da : delle directory in cui la shell deve cercare i programmi. Talvolta e' presente anche la directory corrente "." ma cio puo essere pericoloso! La variabile e' impostata sul file /etc/profile ed e' comune a tutti gli utenti! in qst modo si evita di impostare a proprio piacimento la variabile PATH per ogni utente uno per uno sul file .bashrc




## PS1

variabile d'ambiente che serve per personalizzare il prompt. Viene impostato dal file /etc/profile. Es. PS1='$PWD>' opp PS1="\u@\h:\w\$ " opp PS1="\[\033[1;34m\]\u@\h:\w\$ \033[0m " opp PS1='\[\e[34;1m\]\u@\h:\w\$ \[\e[0m\]' opp PS1='\[\033[01;31m\]\h \[\033[01;34m\]\W \$ \[\033[00m\]'. In qst esempio si usano particolari apici `comando` qst permettono di valutare e di fornire l'output al posto degli apici e del comando!!!!! Es.PS1='`hostname`:`pwd`-  ' opp PS1='! ${PWD/- $HOME/~}$ ' opp  PS1='%n@%m:%~%-  '





## loadkeys it

carica la tastiera in italiano




## cal

visualizza un calenadrio. -1 un mese -3 tre mesi -y un anno ecc




## expr

comando utilissimo per operazioni aritmetiche ( matematica ) tra stringhe




## date

visualizza la data
It is possible to show previous dates. Examples:

`$ date --date='10 seconds ago'`


`$ date --date='1 days ago'`


`$ date --date='yesterday'`


Date epoch:
`date +%s`

Date format using the epoch:
`date --date='@number'`

To change the TIMEZONE (the values can be found in /usr/share/zoneinfo):
`TZ=Japan date`



## hwclock --show

visualizza la data




## hwclock --date='7/15/2000 16:45:05'

imposta la data. con --utc si specifica la data in formato UTC




## hwclock --systohc &amp; 

imposta la data dell'orologio hw a partire da quello di sistema




## hwclock --hctosys &amp; 

imposta la data di sistema a partire da quella dell hw




## rdate -sp tempo.cstv.to.cnr.it

sincronizza l'ora di sistema




## ispellconfig

permette di configurare l'utilità di controllo ortografico ispell





##  echo laboratoio | ispell -a

effettua il controllo ortografico




## Wildcards - caratteri jolly - espressioni regolari

permettono di agire su una lista numerosa di ?le. I metacaratteri supportati dalla gran parte delle shell sono: * espande zero o più caratteri, ? espande un unico carattere, [a-z] espande un carattere nell?intervallo a-z(altri es. [A-Za-z] che corrisponde a [:alpha:]; opp [0-9] che corrisponde a [:digit:]; opp [A-Za-z0-9] che corrisponde [:alnum:]),  [abc] espande un carattere nell'insieme (a, b, c), ^ vieta la corrispondenza successiva (ad esempio [^abc]), ~ rappresenta la home directory dell'utente. Per disabilitare l'uso dei metacaratteri è necessario anteporre il carattere '\'. Qst permette di usare [ opp ] come dei caratteri. Altri operatori sono es. R? indica l'opzione; R+ indica uno o più d uno; R{5} significa 5 coppie;R{2,5} indica tra 2 e 5; R{2,} indica 2 o più; ^r una r solo se inizia in una linea; r$ una r solo se è alla fine di una linea; \n rapp la nuova linea; Road|Street indica l'unione; . rappresenta qualunque carattere. Ad es. '[A-Z]( [a-z])' serve per indicare anche lo spazio, ma è importante l'uso delle apici per far capire che si tratta di uno stessa espressione regolare. Vedere cmq man flex nella sezione PATTERNS opp man awk nella sez regular expr per una più dettagliata rappr. Nell'esempio che segue viene dimostrato come utilizzare un comando della shell associandolo con il metacarattere '*' per rimuovere tutti i file che hanno 'stat' come parte iniziale del nome: $ rm -fr stat*.




## lex flex

analizzatori lessicali (non conosco bene)




</dicts>
