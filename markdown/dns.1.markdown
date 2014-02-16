
#  dns lookup


## overview

The DNS lookup commands will allow to get answer to various dns queries
such as:
* the IP address (A)
* mail exchanges (MX)
* name servers (NS)
* canonical name (cname)
* text annotations (TXT)
* ANY (all) type.


## host command

To get IP address:
`host -t a cyberciti.biz`

To find out the Domain Mail Server:
`host -t mx cyberciti.biz`

To find Out the Domain Name Servers:
`host -t ns cyberciti.biz`

To find Out the Domain SOA Record:
`host -t soa cyberciti.biz`

To find Out the CNAME:
`host -t cname cyberciti.biz`


To get all the Domain Records:
`host -a cyberciti.biz`


To query Particular Name Server:
`host cyberciti.biz ns2.nixcraft.net`


Test your dns lookup using IPv6 query transport:
`host -6 cyberciti.biz`


Reverse IP lookup:
`host 75.126.153.206`

Get TTL Information:
`host -v -t a cyberciti.biz`



## dig command

IT is more powerful than host command.
Usage:
`dig @ns.example.com example.com TYPE`


To trace for resolving the name:
`dig +trace cyberciti.biz`


To get short answer:
`dig +short cyberciti.biz txt`

To display all Domain Records:
`dig +noall +answer cyberciti.biz any`



Reverse IP lookup:
`dig -x 75.126.153.206 +short`


To get the TTL:
`dig +nocmd +noall +answer cyberciti.biz a`


A good command is:
`dig +nocmd +noall +answer +ttlid aaaa www.cyberciti.biz`

Few important options are:
* +nocmd    Toggles the printing of the initial comment in the output
identifying the version of dig and the query options that
have been applied. This comment is printed by default.
* +noall    Set or clear all display flags.
* +answer   Display [do not display] the answer section of a reply.
The default is to display it.
* +ttlid    Display [do not display] the TTL when printing the record.
* +short    Display only the value of the query
* +tcp      Use TCP protocol instead of UDP

To discover the real TTL from the authoritative server:
`dig +trace +nocmd +noall +answer +ttlid aaaa www.cyberciti.biz`




