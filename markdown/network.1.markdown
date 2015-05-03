
#  network

## netcfg

1. Define a network in /etc/network.d/ called mynetwork (copy one of the examples in the examples directory)
2. Connection:
`netcfg mynetwork`

3. Disconnection:
`netcfg down mynetwork`

4. To Access at the menu any time (require dialog package):
`netcfg-menu`



## automatic connection

You need to install the following package:
* wpa\_actiond - for automatic/roaming wireless connection
* ifplugd - for automatic ethernet connection

To connect profile during boot:
1. Edit /etc/rc.conf
NETWORKS=(mynetwork yournetwork)
DAEMONS=(... net-profiles ...)

To connect to wireless networks with roaming support:
1. Edit /etc/rc.conf
WIRELESS\_INTERFACE="wlan0"
DAEMONS=(... net-auto-wireless ...)

To connect to wired networks:
1. edit /etc/rc.conf
WIRED\_INTERFACE="eth0"
DAEMONS=(... net-auto-wired ...)


## network

Use /etc/rc.conf to configure the network (interfaces, dhcp or static ip, gateway, etc...)
To restart the daemon:
`/etc/rc.d/network restart`



## Create a daemon to change mac

1. Create a script set-hw-addr in /etc/rc.d/
2. In rc.conf put it prior to network daemon:
DAEMONS=(... set-hw-addr network ...)
3. Look at the source in https://wiki.archlinux.org/index.php/Configuring\_Network-Change\_MAC.2Fhardware\_address



## tc

Il comando tc serve alla configurazione del traffico in ingresso e uscita di una
interfaccia di rete attraverso tecniche di shaping, scheduling, accodamento, etc..

Per rimuovere il qdisc esistente: 
`tc qdisc del dev $eth root`

Per mostrare il qdisc esistente: 
`tc -s qdisc show dev $eth`

## ufw (Uncomplicated  Firewall)

Enable the firewall with the default rules defined in /etc/ufw/before6.rules

    ufw enable

Allow traffic for ssh:

    ufw allow ssh/tcp

It is possible to see the effect of the operation via iptables:

    iptables -L -vn

### Logging and status ###

Enable logging (visible with dmesg):

    ufw logging on

To check the status and remove the rule number 4:

    ufw status numbered
    ufw delete 4

#### Limit ###

To limit access for ssh to a single IP for 6 simultaneous connections every 30 secs:

    ufw limit ssh/cp


## iptables ##

General syntax:
`iptables [-t table] command [match] [target/jump] `


### DISPLAY ###

Display (-L) numbered (--line-numbers) firewall rules without DNS resolution (-n):

`iptables -n -L -v --line-numbers`

### SET DEFAULT POLICY ###

`iptables -P INPUT DROP`


### DELETE FIREWALL RULES ###

Delete the rule numbered four (using --line-numbers to get the number):

`iptables -D INPUT 4`

Delete from a particular rule:

`iptables -D INPUT -s 202.54.1.1 -j DROP`

Delete all rules:
`iptables -F`

Delete a chain:
`iptables -X`

Delete all rule for a table:
`iptables -t [nat|mangle] -F`


### INSERT OR APPEND FIREWALL RULES ###

To insert in position 2:
`iptables -I INPUT 2 -s 202.54.1.2 -j DROP`

To append:
`iptables -A INPUT -i eth1 -s 192.168.0.0/24 -j DROP`


### NAT ###

Destination NAT:
`iptables -t nat -A PREROUTING -p tcp -d 80.182.53.192 -dport 80 -j DNAT -to-destination 10.0.0.2:80`

Source NAT:
`iptables -t nat -A POSTROUTING -o ppp0 -j SNAT -to-source 150.92.48.25`

Redirect:
`iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 10000`

Masquerade (change the source IP with the public one):
`iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE`


### SAVE/RESTORE ###

Serve per salvare l'insieme di regole (rule-set) all'interno di un file. -c serve a mantenere memorizzati i contatori dei byte e dei pacchetti. Qst opzione può servire quando occorre chiudere il firewall, in qst modo le info relative alle quantità di byte e pacchetti rimangono comunque memorizzate. -t indica quali tabelle memorizzare (nat, mangle, filter, raw) nel file se omesso memorizza tutte le tabelle nel file.

`iptables-save [-c] [-t table] > /etc/iptables/mytables.rules`


Serve a caricare il file fornito da iptables-save nel kernel.  -c serve a mantenere memorizzati i contatori dei byte e dei pacchetti. Qst opzione può servire quando occorre chiudere il firewall, in qst modo le info relative alle quantità di byte e pacchetti rimangono comunque memorizzate.-n dice a iptables-restore di non sovrascrivere le regole precedenti. Di default le regole gia' esistenti vengono eliminate.

`iptables-restore [-c] [-n] < /etc/iptables/mytables.rules`



### VARIOUS EXAMPLES ###

To block port 80 on IP range:
`iptables -A INPUT -i eth1 -p tcp -s 192.168.1.0/24 --dport 80 -j DROP`


To block traffic for Facebook:
Get the IP:
`host -t a www.facebook.com`

Get the belonging CIDR associated:
`whois 69.171.228.40 | grep CIDR`

Block all the outgoing traffic for that CIDR:
`iptables -A OUTPUT -p tcp -d 69.171.224.0/19 -j DROP`


To Log packets in /var/log/messages:
`iptables -A INPUT -i eth1 -s 10.0.0.0/8 -j LOG --log-prefix "IP_SPOOF A: "`


To log for 5 minutes with a limit of 5 entries:
`iptables -A INPUT -i eth1 -s 10.0.0.0/8 -m limit --limit 5/m --limit-burst 7 -j LOG --log-prefix "IP_SPOOF A: "`


To drop packates from a MAC address:
`iptables -A INPUT -m mac --mac-source 00:0F:EA:91:04:08 -j DROP`


To block a ping request:
`iptables -A INPUT -p icmp --icmp-type echo-request -j DROP`

Other icmp-type are:
*  echo-reply
*  destination-unreachable
*  time-exceeded

To open a range of ports (supposing the default policy is DROP):

`iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 7000:7010 -j ACCEPT `

To open for a range of IPs:

`iptables -A INPUT -p tcp -dport 80 -m iprange --src-range 192.168.1.100-192.168.1.200 -j ACCEPT`


To limit to 3 connections for the same host (--syn is equivalent to --tcp-flags SYN,RST,ACK,FIN SYN):

`iptables -A INPUT -p tcp -dport 22 --syn -m connlimit --connlimit-above 3 -j REJECT`



## ipset ##
Allow to keep the iptables rule simple by creating set of addresses or ports
that be defined in entries of iptables.

### Set of ports ###

To accept all incoming packets towards email ports (23, 110 and 143),
we can create an *EmailPorts* set:

    ipset create EmailPorts bitmap:port range 0-65535 comment
    ipset add EmailPorts 23 comment SMTP
    ipset add EmailPorts 110 comment POP3
    ipset add EmailPorts 143 comment IMAP
    ipset add EmailPorts 152-155 comment "Additional ports range"

To list the sets:

    ipset list

To create the iptables rule:

    iptables -A INPUT -s 192.0.2.0/24 -p tcp -m set --match-set EmailPorts dst -j ACCEPT

### Set of hosts/subnet ###
To accept packets from trusted hosts towards email ports:

    ipset create TrustedHosts hash:ip family inet comment
    ipset ad TrustedHosts 192.0.2.10 comment "Alice"
    ipset ad TrustedHosts 192.0.2.15 comment "Bob"

    iptables -A INPUT -p tcp --dport 22 -m set --match-set TrustedHosts src -m set --match-set EmailPorts dst -j ACCEPT

To create a subnet:

    ipset create NetworkList hash:net
    ipset add NetworkList 10.1.0.0/24

### Combine hosts, protocols and ports ###

    ipset create AppSupport hash:ip,port
    ipset add AppSupport 203.0.113.15,tcp:5000
    ipset add AppSupport 203.0.113.15,tcp:5000
    ipset add AppSupport 203.0.113.15,tcp:5000

    iptables -A INPUT -m set --match-set AppSupport src,dst -j ACCEPT


### Save and restore ###
    ipset save > /path/to/ipset.save
    ipset restore < /path/to/ipset.save


## nfs ##

Server side:
Pacchetti necessari:apt-get install nfs-kernel-server nfs-common portmap. PASSI DA FARE: 1) scrivere in /etc/exports i permessi (es /home/ 192.168.210.128/24(rw)) leggere il manuale (man exports). 2) Riavviare il server: /etc/init.d/nfs-kernel-server restart oppure con exportfs -a. 3) Per verificare l'esportazione showmount -e
Client side:
Pacchetti necessari:apt-get install portmap nfs-common. PASSI DA FARE: mount 192.168.210.1:/home/ /mnt/HomeDiUbuntu 2) Se si vuole avviare al boot si modifica /etc/fstab cosi: 192.168.210.1:/home/ /mnt/HomeDiUbuntu nfs rsize=8192,wsize=8192,timeo=14,intr



## mtr

Combine ping and traceroute in one tool giving info about packet loss:
`mtr --no-dns 192.168.1.1`

To give a report:
`mtr --report 192.168.1.1`



## traceroute

To track the route for a TCP connection in a particular port to a host:
`traceroute -T -p 3306 192.168.1.1`

To check if a TCP connection is working you can also use telnet:
`telnet 192.168.1.1 3306`




## tcptraceroute

To track the route for a TCP connection in a particular port to a host:
`tcptraceroute -np 3306 192.168.1.1`

To check if a TCP connection is working you can also use telnet:
`telnet 192.168.1.1 3306`




## hping

Modes are:
*  --udp
*  --tcp (default)
*  --icmp
*  --scan
*  --listen
*  --rawip

Makes a traceroute:
`sudo hping3 --traceroute -V --udp www.google.com`


Sends only one packet from port 6000 (-S syn/-A ack/-F fin) on 80 port:
`sudo hping3 -c 1 -V -S -p 80 -s 6000 192.168.1.1`

Choose an arbitrary source IP and send packets to port 80 with interval 1500msec:
`sudo hping3 --spoof 1.2.3.4 -S 10.20.30.40 -p 80 -i u1500`

Also with random source IP:
`sudo hping3 192.168.1.1 --udp --rand-source`


Scan the port (using -S syn/-A ack/-F fin): 
`sudo hping3 192.168.1.1 -S --scan 1-1024`




## netcat ##

The option -p correspond always to the local port.
The option -z is used for port scanning but not for sending data.

###Connect mode###

To check connection to server.com:8080 from source port 1025 waiting for one second:
`nc -w1 -z -u -p 1025 server.com 8080`

To send a message from client to server:
`echo "nc is awesome!" | nc localhost 8080`

###Listen mode###

To continuosly (with -z) listen for UDP packets:
`nc -l -p 8080 -z localhost`

To send a message from server to client:
echo "Yeah, it is true!" | nc -l -p 8080


### Execute remotely a command###
Listen to a port -  3005 and execute /usr/bin/w command when client connects:
`$ nc -l -p 3005 -e /usr/bin/w`

Later just do:
`telnet localhost 3005`


## socat (SOcket CAT) ##

It allows to establish two bidirectional byte streams that can be used for many
purposes.

More info: http://www.cyberciti.biz/faq/linux-unix-tcp-port-forwarding/
Snippets: http://www.dest-unreach.org/socat/doc/socat.html#EXAMPLES

###TCP proxy Port Forwarder###
To redirect all connections on port 80 to a remote host in port 22:
`sudo socat TCP-LISTEN:80,fork TCP:192.168.0.2:22`

Then you can access to the remote host via ssh using local connection:
`ssh -p 80 localhost`

###Listen mode###
Accept all connections in port 5555 and execute ls command in a sandbok with sandbox as user.
Use pty to communicate between socat and ls; redirect the stderr to stdout so that the
error can be transferred via socat.
`
socat TCP4-LISTEN:5555,fork \
    EXEC:/bin/usr/ls,chroot=/home/sandbox,su-d=sandbox,pty,stderr
`

Accept all connections and the data sent by the clients are appended to /tmp/in.log.
Allow immediate restart of the server process (reuseaddr):
`
socat -u TCP4-LISTEN:3334,reuseaddr,fork \
    OPEN:/tmp/in.log,creat,append
`

An OpenSSL server:
`socat SSL-LISTEN:4443,reuseaddr,pf=ip4,fork,cert=server.pem,cafile=client.crt PIPE`

###Connect to service###
Transfer data between stdin and local port 8080:
`echo ciao | socat - TCP4:localhost:8080`

Transfer data with readline and store them in ~/.http\_history. The option -d -d
will print the progress and crnl will correct line termination char instead of NL:
`socat -d -d READLINE,history=$HOME/.http_history TCP4:localhost:8080,crnl`

Connect to ssh server. Uses pty for communication between socat and ssh,
control the ssh terminal tty (ctty) and makes the pty the owner of the new process group (setsid),
so ssh accepts the password from socat:
`(sleep 5; echo oneone; sleep 5; echo ls; sleep 1) | socat - EXEC:'ssh -l feel 192.168.0.23',pty,setsid,ctty`

A OpenSSL client that tries to connect to a SSL server. In case of client authentication,
the cert is used to specify the client certificate.
The first address ('-') can be replaced by almost any other socat address:
`socat - SSL:server:4443,cafile=server.crt,cert=client.pem`

Unidirectional data transfer (-u). Socat transfers data from file /tmp/readdata,
starting at its current end (seek-end=0 lets socat start reading at current end of file;
use seek=0 or no seek option to first read the existing data) in a "tail -f" like mode (ignoreeof). The "file" might also be a listening UNIX domain socket (do not use a seek option then):
`socat -u /tmp/readdata,seek-end=0,ignoreeof -`


## curl ##

In generale, consente di trasferire documenti HTML request di tipo GET o POST e ricevere dal server response.
I parametri generali sono:

`-v` Estremamente utile per fare debug. Mostra i messaggi che vengono trasferiti dal client al server e viceversa.

`-i` Mostra i campi dell'header nascosti

`-I` Mostra solo l'header.

`-X "type"` Definisci il tipo di request (GET, POST, PUT...)

`-u "user":"pass"` Permette l'autenticazione. Nel caso in cui non funziona provare con queste altre opzioni --ntlm, --digest, --negotiate o --anyauth (in base alla risposta che da il server)

`-A "string"` Consente di cambiare il campo User-Agent dell'intestazione. A volte conviene mettere user-agent di un browser.

`-L` Opzione molto utile. Specifica a curl di seguire l'url contenuto nel campo Location.

`-H "string"` Personalizzazione dell'header. Ad esempio -H "Destination: http://moo.com/nowhere"

`-b "name=string/file"` Consente di leggere i cookies

`-c "file"` Scrive i cookies dopo l'operazione

`-D "file"` Scrive gli header in questo file

`-d "string"` Corpo di una richiesta POST. Conviene mandare i dati nello stesso ordine con cui un browser li manda.

`-e "string"` Imposta un valore al campo Referer dell'intestazione

`-G` Non molto utile. Serve solo per specificare che i dati contenuti in -d vengano usati per fare un HTTP GET piuttosto che un HTTP POST


I campi di una form che sono nascosti (ad esempio input type=hidden) vengono gestiti allo stesso modo degli altri. Gestisce automaticamente SSL.

HEAD Request (to get the info about the file and the server):
`curl -I http://s0.cyberciti.org/images/misc/static/2012/11/ifdata-welcome-0.png`

GET Request:
`curl -v -c cookies.txt -b cookies.txt -L "www.hotmail.com/when/junk.cgi?birthyear=1905&amp;press=OK"`

POST Request:
`curl -v -c cookies.txt -b cookies.txt -L -d "birthyear=1905&amp;press=%20OK%20" www.hotmail.com/when/junk.cgi`
 dove l'indirizzo url lo si trova nella form nell'attributo action

POST REquest with automatic data encode:
`curl -c cookies.txt -b cookies.txt -L --data-urlencode "name=I am Daniel" www.example.com`

PUT Request:
`curl -v -L -c cookies.txt -b cookies.txt -T uploadfile www.uploadhttp.com/receive.cgi`

Quando nella form è presente l'oggetto per uplodare file(ad esempio due oggetti nella form: input type=file name=upload e altro input type=submit name=press value=OK), esso può essere fatto tramite il seguente comando curl:
`curl -v -c cookies.txt -b cookies.txt -L -F upload=@localfilename -F press=OK [URL]`

To know the public IP of your machine:
`curl ifconfig.me`

To know the public IP and other more info:
`curl http://freegeoip.net/json/`

To know the timezone:
`curl http://freegeoip.net/tz/json/US/10`

Resume a previous download partially completed:
`curl -L -O -C - http://ftp.ussg.iu.edu/linux/centos/6.5/isos/x86_64/CentOS-6.5-x86_64-bin-DVD1.iso`

To download the first 20000 bytes and complete the remaining download later:
`curl -o file.png --header "Range: bytes=0-20000" http://s0.cyberciti.org/images/misc/static/2012/11/ifdata-welcome-0.png`

Or:
`curl -r 0-20000 -o file.png http://s0.cyberciti.org/images/misc/static/2012/11/ifdata-welcome-0.png`

`curl -o file.png -C 20001 http://s0.cyberciti.org/images/misc/static/2012/11/ifdata-welcome-0.png`

### Using Telnet ###

Use the '-v' option from curl you get the HTTP request can be used in *telnet*

```
telnet s0.cyberciti.org 80
GET /images/misc/static/2012/11/ifdata-welcome-0.png HTTP/1.1
Host: s0.cyberciti.org
Range: bytes=0-1024
```


## arp ##

Consente di ricavare l'indirizzo MAC a partire dall'indirizzo IP:
`arp 192.168.1.1`




## nmap ##


Host discovery (ping scan):
`nmap -sP -n 192.168.1.0-255`


PORTS SCAN:
Using SYN packets:
`sudo nmap -sS -n 192.168.1.\*`

Using ACK packets:
`sudo nmap -sA -n -A 192.168.1.1`

Using NULL:
`sudo nmap -sN -n -A 192.168.1.1`

Detect remote services version number(sV) and OS (A):
`sudo nmap -A -sV 192.168.1.1`

When protected by firewall:
`sudo nmap -PN 192.168.1.1`

Scan specific port (with Tcp or Udp):
`sudo nmap -p U:53,111,137,T:21-25,80,139,8080 192.168.1.1`


To read a list of host in a file and scan them:
`sudo nmap -iL /tmp/file.txt`


Show interface list and routes:
`sudo nmap --iflist`


MAC spoof:
`sudo nmap --spoof-mac MAC-ADDRESS-HERE 192.168.1.1`


Awesome GUI interface is zenmap

### NSE (Nmap Security Engine) scripts ###



## macof ##

consente di fare flooding su uno switch per facilitare lo sniffing!




## lynx

browser web su SHELL!!!!




## ipcalc

da info sull'ind IP. con -h trova il nome dell'host a partire dall' IP




## route

permette di visualizzare/manipolare la tabella di routing di un interfaccia di rete. -n premette di visualizzare la tabella. Es route add default gw 192.168.0.1 permette di aggiungere un regola della tabella, route add -host server.it reject permette di rifiutare un indirizzo




## etherape

programma che visualizza il traffico di rete. simile a wireshark




## apachectl

serve a start/stop apache




## atftpd

server FTP




## slattach -p cslip -s 38400 ttyS1

permette di creare un collegamento tra un interfaccia di rete e una linea seriale. -p "prot" indica il protocollo, -s "speed" indica la velocità




## vncserver

permette di attivare VNCServer è necessario specificare la password per l'accesso




## minicom

è una applicazione per la connessione telefonica ad un sistema,
permettendo cosi di accedere ad un terminale del tipo ttyS0.
Basta semplicemente inserire il numero di telefono dell'abitazione, username e password.
Per accedere come root ricordare di abilitare l'accesso remoto sul terminale nel file /etc/securetty




## ftp host port

è un CLient FTP




## ssh

versione sicura di telnet
To access with enabling compression
`ssh -C user@host`


X11 Forwarding
Per comprimere i dati trasmessi e abilitare l'inoltro X11:
`ssh -X -C user@host`

It's possible to use the option -Y the X11 forward 
`ssh -Y -C user@host`

The X11 forward automatically set the DISPLAY variable environment in order to have the right forward.
So, it's not necessary to set the DISPLAY variable.
Se si vuole avviare un'applicazione specificando un dato terminale:
`export DISPLAY=localhost:0.0`

Per mostrare i DISPLAY degli altri terminali attivi basta usare il comando who.

### ssh tunnelling (TCP forwarding) ###

For define a ssh tunnel:
`ssh -f -N -L localhost:24800:server:24800 user@server`

Options:

- **-N** No remote command will be execute
- **-f** Set the ssh to background
- **-L** *port* define the local and remote socket which set the tunnel

Additional options:

- **-p** *port* Port to connect to on the remote host

#### reverse ssh tunnelling ####

In order to connect to a firewalled box (natbox) from an internet reachable box (openbox),
establish a reverse tunnel in the natbox:

`ssh -p1234 -R 5555:localhost:22 openboxuser@OPENbox.example.com`

Options:

- **-R** *port* Specifies that the given port on the remote (server) host is
         to be forwarded to the given host and port on the local side.

This will create a reverse tunnel at port 22 for the remote party to connect and get in.

Type the following command on OPENbox:

`ssh -p5555 natboxuser@localhost`

## telnet [- l utente] [host [port]]

telnet. -e [char] specifichi il carattere di escape per uscire dalla connessione




## mail

permette di spedire e ricevere posta da un utente ad un altro del sistema. mail -s "oggetto" -u "utente" invia un msg all utente, -f permette di visualizzare la casella di posta
Send the output of a command:
`echo test | mail -s ASubject $USER@mail.com`





## talk utente@host opp talk pts/0

permette di comunicare (non ho capito cm funziona). pts/0 specifica il terminale anziche l'utente




## write utente-locale [tty]

simile a talk ma unidirezionale, manda un messaggio ad un utente di un sistema. tty indica il terminale su cui spedire il messaggio




## mutt

client di posta elettronica




## irc [nick] server.it

chat. /join - canale permette di entrare in un canale, /leave - canale permette di lasciarlo, /list -MIN 5 -MAX 20 -PUBLIC -NAME lista i canali con un min di partecipanti 5 e un max 20, di tipo publico e ordinati per nome, /help lista di comandi, /quit esci. Esiste anche una chat migliore per console bitchx




## netstat 

Shows all the connections active on the system.
Shows all connection UDP, TCP and Unix:
`netstat -a`

Only TCP/UDP connections:
`netstat -aut`

Doesn't make a DNS resolution (more efficient):
`netstat -an`

Shows the list Lista delle porte in ascolto:
`netstat -l`

Continue monitoring of connection:
`netstat -c`

Shows the processes with PID (use also lsof -i):
`netstat -pa`

List of network interfaces:
`netstat -i`

Kernel routing table:
`nestat -r`


Esiste un ulteriore comando denominato ss che consente di controllare i socket attivi sulla propria macchina




## ipchains -A input -j REJECT -s XXX.XXX.XXX.XXX -d 0/0 -p all

inibisce le connessione al sistema da parte XXX.XXX.XXX.XXX, applicando una regola.




## Client per dhcp con dhclient

Per richiedere al server dhcp un indirizzo IP invocare il seguente comando:
`dhclient`




## tcpdchk

controlla la configurazione di TCP\_WRAPPER segnalando config errate sui file /etc/hosts.deny /etc/hosts.allow




## tcpdump

Sniff packets from the interface eth0 and read the filtering rule from file:
`tcpdump -i eth0 -F file`


Display traffic from a particular host(-p avoid promiscous mode of the interface):
`tcpdump -p -nv host 192.168.1.1`


Display traffic about DNS:
`tcpdump -i eth1 'udp port 53'`

Display all FTP session to 202.54.1.5:
`tcpdump -i eth1 'dst 202.54.1.5 and (port 21 or 20)'`

Display all HTTP session to 192.168.1.5:
`tcpdump -ni eth0 'dst 192.168.1.5 and tcp and port http'`

Use wireshark to view detailed information about files (-s 0 allow to get all the bytes of the packages):
`tcpdump -n -i eth1 -s 0 -w output.txt src or dst port 80`


To display all IPv4 HTTP packets to and from port 80,
i.e. print only packets that contain data, not,
for example, SYN and FIN packets and ACK-only packets, enter:

```tcpdump 'tcp port 80 and (((ip[2:2] - ((ip[0]&amp;0xf)<<2)) - ((tcp[12]&amp;0xf0)<<2)) != 0)'```




## ifconfig eth0 192.168.0.1/24

può configurare una interfaccia di rete in caso di assenza del dhcp per esempio. 192.168.0.1 è indIP, /24 indica la netmask




## /etc/inetd.conf

(deprecata)permette di abilitare/disabilitare servizi in rete, andando a commentare con -  le righe che nn interessano. è importante che qst file sia protetto e quindi conviene applicare il comando -  chown root /etc/inetd.conf. inoltre può essere reso immutevole con -  chattr +i /etc/inetd.conf. una volta apportate le modifiche al file di conf si aggiorna il demone con il comando -  killall -HUP inetd




## /etc/rc.d/rc.intet1

script per l'avvio delle periferiche e interfacce di rete inet1.conf è il file di config dei parametri GW DHCP ecc si usa start (o restart) per avviarlo.




## /etc/rc.d/rc.inet2

script per l'avvio dei servizi di rete es ssh, telnet





## /etc/rc.d/rc.wireless

script per il wireless. Vi è inoltre il file wireless.conf





## /etc/hosts.allow

TCP\_WRAPPERS Es. sshd: 193.207.49.111 host.server.org permette al sistema con ip 193.207.49.111 di connettersi al proprio sistema utilizzando il demone sshd



## /etc/hosts.deny

TCP\_WRAPPERS  Es. - Accesso vietato a chiunque, in quanto i servizi sono bloccati, basta aggiungere ALL:ALL@ALL, PARANOID




## /etc/aliases

file che contiene alias di sistema, e permette di abilitare/disabilitare dei comandi. è necessario invocare il comando -  /usr/bin/newaliases dopo




## /etc/hosts

effettue il mapping nome host->indIP. ES. 127.0.0.1localhost





## hostname nuovo nome

consente (temporaneamente) di cambiare il nome del computer(host). Se lo si vuole rendere permanente cambiare il contenuto di /etc/hostname in "nuovo nome" e sostituire il contenuto di /etc/hosts con il nuovo nume, infine avviare /etc/init.d/hostname.sh




## gpg

GESTIONE CHIAVI:

Creare la directory di config in home in cui si inseriranno le chiavi:
`gpg`

Generare le chiavi:
`gpg --gen-key`

Esportare la kiave pubblica in formato ascii:
`gpg --export -a -o rsa\_key`

Importare una chiave per esempio di un altro utente:
`gpg --import new\_key`

Generare un certificato di revoca. E' consigliabile farlo non appena si genera una chiave e conservarlo in luogo sicuro:
`gpg --gen-revoke`



Lista chiavi del portachiavi:
`gpg --list-keys`

Lista firme:
`gpg --list-sigs`

Lista impronte digitali:
`gpg --fingerprint`

Lista chiavi private:
`gpg --list-secret-keys`



Cancellare una chiave pubblica:
`gpg --delete-key UID`

Cancellare una chiave privata:
`gpg --delete-secret-key UID`

Modificare una chiave:
`gpg --edit-key UID`


Firma di un certificato serve a garantire l'autenticità del certificato:
Per firmare una chiave modificarla con --edit-key e eseguire il comando sign.

CIFRARE E DECIFRARE:
Due opzioni possono essere usate per entrambe:
-u UID/--local-user UID per indicare la kiave privata.
-r/--recipient per modificare il destinatario.

Cifrare un testo in formato ascii:
`gpg -a -e destinatario msg.txt`

Decifrare un testo in stdout(usare -o file per stamparlo su file):
`gpg -d msg.txt.asc`

To use a symmetric key to encrypt the document (and make it portable!):
`gpg --output doc.asc --symmetric doc`

To decrypt the document with the symmetric encrypt:
`gpg --output doc --decrypt doc.asc`


AUTENTICAZIONE (firmare e verificare le firme):
Firmare testo:
`gpg -s (o --sign) msg.txt`

Firmare senza fare compressione:
`gpg --clearsign msg.txt`

Firmare in un file separato (utile per file binari) puo' essere utile anche l'opzione --armor:
`gpg -b (o --detach-sign) msg.txt`


Verifica di una firma (ovviamente e' necessaria la chiave pubblica del mittente):
`gpg --verify msg.txt.asc`


CIFRATURA E FIRMA:
Cifrare e firmare nello stesso tempo:
`gpg [-u mittente] [-r destinatario] [--armor] --sign -e msg.txt`

NOTA: In ricezione, la firma deve essere verificata solo dopo aver decifrato il messaggio.




## -  grep Connect time" /var/log/messages > | awk '{min = $8} END {print min  minuti di connessione"}'

permette di conoscere il tempo di connessione




## iwconfig

analogo di ifconfig, serve a settare i parametri citati prima.



## iwlist

fa uno scan per i peer o gli AP, o elenca le funzionalit? del driver



## iwspy

colleziona statistiche su un peer remoto della LAN



## iwpriv

parametri specifici del driver



## iwevent

monitor di eventi sull'interfaccia




## wlanconfig 





## airodump-ng

sniffa pacchetti. --ivs specifica solo pacchetti ivs, -w "file" scrive i pacchetti in un file, -c "chan" indica il canale nel quale sniffare, -bssid "AP" indica l'AP in cui sniffare
Sniffa i pacchetti contenti IV:
`airodump-ng -c $chan -w capturefile --ivs ath1`




## aircrack-ng opts file\_dump

Programma per trovare la kiave:
`aircrack-ng -a 1 -e $AP -b final\_dump.pcap`


Serve per crakkare una kiave, -e essid, -b bssid, -a algoritmo ad es. 1 per WEP o 2 per WPA, -n num si usa per specificare il num di bit della kiave se si conosce, -f num es 3 o 4 piu' e' piccolo e piu' il tempo diminuisce ma le possibilit? di trovare la kiave diminuiscono, -w file serve per la WPA per un dizionario che puo' essere scaricato opp generato da JohnTheRipper



## ivstools --merge <ivs file 1> <ivs file 2> .. <output file>

Fonde in un singolo file tanti dump diversi



## mergecap [options] -w <outfile|-> <infile> ...

simile a ivstools. fa parte di wireshark. es: mergecap -T ieee-802-11 -w final_dump.pcap dump1.pcap dump2.pcap dump3.pcap





## airdecap-ng

decritta un pacchetto WEP/WPA data una chiave valida.




## kstats

data una chiave valida, ed un dump, dice quale attacco statistico funziona meglio.



## makeivs

genera un file pcap di test per provare il cracking con aircrack-ng.




## packetforge-ng

Forgia un pacchetto in modo da poterlo usare con aireplay-ng.
Genera un pacchetto da essere utilizzato con aireplay -2 per iniettare pacchetti di tipo
arp-request nella rete, e fare l'airodump:

`packetforge-ng -0 -a $AP -h $WIFI -k 255.255.255.255 -l 255.255.255.255 -y ilFile.xor -w file`




## airmon-ng

mette la scheda wireless in monitor mode. es airmon-ng start ath1




## aireplay

Inietta del traffico artificiale verso la rete.

Fake Authentication Serve per individuare se AP risponde come tempo mettere es 10 opp 0 sec.
Se AP non risponde, pu? darsi ci sia firewall MAC, in ogni caso non funzionera' airodump:

`aireplay-ng -e - ssid rete-  -a - macAP-  -h - mioMAC-  --fakeauth - tempo-  - nomescheda- `


Questo programma funziona similmente ad uno sniffer, andando alla ricerca dei pacchetti ARP request,
ovvero i pacchetti interessanti al fine del crakkaggio. Una volta ottenuto,
inizia a rimandarlo all'AP che risponder? con degli IV che verranno sniffati da airodump:

`aireplay-ng --arpreplay -b - macAP-  -h -- mioMAC-  - nomescheda- `


Attacco di deautenticazione, Questo attacco puo' essere usato per recuperare un SSID nascosto
(cioe' che non e'broadcast), catturare una handshake WPA a 4 vie o lanciare un attacco
di tipo Denial of Service. Lo scopo dell'attacco ? di obbligare il client a ri-autenticarsi che,
consente all'aggressore di falsare gli indirizzi MAC:

`aireplay-ng -0 $numVolte -a $AP -c $client ath0`


Decriptare pacchetti WEP senza conoscere la chiave. Vengono creati due file pcap:
uno per il pacchetto decifrato e l'altro per il relativo keystream. il file .cap puo' essere
letto da un lettore (es. tcpdump); mentre il file .xor puo' essere utilizzato per falsare
pacchetti e inviarli:
`aireplay-ng -4 -h $client ath0`


Permette di ricavare il keystream con la tecnica del fragment:
`aireplay-ng -5 -b $AP -h $WIFI ath1`


Ritrasmissione di un pacchetto alterato con arpforge:
`aireplay -2 -r forge-arp.cap ath0`


tcpdump per leggere un plaintext ottenuto con aireplay-ng -4:

`tcpdump -s 0 -n -e -r replay\_dec-0916-114019.cap`





## arpforge replay\_dec-0916-114019.xor 1 $manDest $macSource $ipSource $ipDest forge-arp.cap

Falsifica i pacchetti da un host all'altro. si puo recuperare il keystream con aireplay-ng -4



