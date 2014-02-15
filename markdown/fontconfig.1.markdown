
-  Fontconfig



## fontconfig 

E' la nuova versione di gestione dei font di sistema (la versione X11 che utilizza xset e' deprecata).
E' possibile aggiungere i propri font nella cartella home ~/.fonts/ oppure nella directory globale /usr/share/fonts/.
Per la configurazione considerare i seguenti files:
*   /etc/fonts/local.conf                           Per config globali
*   ~/.fonts.conf o la directory ~/.fonts.conf.d/   Per config utente
NOTA: Non modificare il file in /etc/fonts/fonts.conf
NOTA!: Per rendere visibile il file di config utente aggiungere:
if it doesn't exist
-->
<include ignore_missing="yes
~/.fonts.conf</include>]]>


Per visualizzare i font disponibili sul sistema:
`fc-list | sed 's,:.*,,' | sort -u`

Per controllare i font presenti sulla cache (che facilità l'accesso ai font):
`fc-cache -vf`






