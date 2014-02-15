
-  vim


## lezione 1 - movimento

Lezione 1 SOMMARIO


1. Il cursore si muove usando i tasti con le frecce o i tasti hjkl.
h (sinistra)	j (giù)       k (su)	    l (destra)

2. Per eseguire Vim dal PROMPT della Shell batti:  vim NOMEFILE INVIO

3. Per uscire da Vim batti: <ESC> :q! <INVIO> per uscire senza salvare.
oppure batti: <ESC> :wq <INVIO> per uscire salvando modifiche.

4. Per cancellare il carattere sotto al cursore batti: x

5. Per inserire testo subito prima del cursore batti:
i     batti testo inserito	<ESC	inserisci prima del cursore
A     batti testo aggiunto	<ESC>	aggiungi a fine linea

NOTA: premendo <ESC> ritornerai in Modalità Normale o annullerai
un comando errato che puoi aver inserito in parte.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


## lezione 2 - cancellazione

Lezione 2 SOMMARIO


1. Per cancellare dal cursore fino alla parola seguente batti:      dw
2. Per cancellare dal cursore fino alla fine della linea batti:     d$
3. Per cancellare un'intera linea batti:    dd
4. Per eseguire più volte un movimento, mettici davanti un numero:  2w
5. Il formato per un comando di modifica è:

operatore   [numero]   movimento
dove:
operatore - indica il da farsi, ad es.  d  per [delete] cancellare
[numero]  - contatore facoltativo di ripetizione del movimento
movimento - spostamento nel testo su cui operare, ad es.
w [word] parola, $ (fino a fine linea), etc.

6. Per andare a inizio linea usate uno zero:	0
7. Per annullare i comandi precedenti, batti:	 	    u (u minuscola)
Per annullare tutte le modifiche a una linea batti:    U (U maiuscola)
Per annullare l'annullamento ["redo"]  	  batti:    CTRL-r



## lezione 3 - paste, replace, change

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Lezione 3 SOMMARIO


1. Per reinserire del testo appena cancellato, batti   p   .  Questo
inserisce [pone] il testo cancellato DOPO il cursore (se era stata tolta
una linea intera, questa verrà messa nella linea SOTTO il cursore).

2. Per rimpiazzare il carattere sotto il cursore, batti   r   e poi il
carattere che vuoi sostituire.

3. L'operatore change ti permette di cambiare dal cursore fino a dove
arriva il movimento.  Ad es. Batti  ce  per cambiare dal cursore
fino alla fine della parola,  c$  per cambiare fino a fine linea.

4. Il formato di  change  è:

c   [numero]   movimento



## lezione 4 - sostituzione, match, %, goto

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Lezione 4 SOMMARIO


1. CTRL-G  visualizza a che punto sei nel file e la situazione del file.
G  [G Maiuscolo] ti porta all'ultima linea del file.
numero G  ti porta alla linea con quel numero.
gg  ti porta alla prima linea del file.

2. Battendo  /  seguito da una frase ricerca IN AVANTI quella frase.
Battendo  ?  seguito da una frase ricerca ALL'INDIETRO quella frase.
DOPO una ricerca batti    n   per trovare la prossima occorrenza nella
stessa direzione, oppure  N   per cercare in direzione opposta.
CTRL-O ti porta alla posizione precedente, CTRL-I a quella più nuova.

3. Battendo  %  mentre il cursore si trova su  (,),[,],{, oppure }
ti posizioni sulla corrispondente parentesi.

4. Per sostituire "nuovo" al primo "vecchio" in 1 linea batti :s/vecchio/nuovo
Per sostituire "nuovo" ad ogni  "vecchio" in 1 linea batti :s/vecchio/nuovo/g
Per sostituire frasi tra 2 numeri di linea [- ]  batti   :- ,- s/vecchio/nuovo/g
Per sostituire tutte le occorrenze nel file batti	     :%s/vecchio/nuovo/g
Per chiedere conferma ogni volta aggiungi 'c'	    :%s/vecchio/nuovo/gc



## lezione 5 - esecuzione comandi, selezione, leggere altri file

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Lezione 5 SOMMARIO


1.  :!comando  esegue un comando esterno.

Alcuni esempi utili sono [in MSDOS]:
:!dir		     -	visualizza lista directory
:!del NOMEFILE     -	cancella file NOMEFILE.

2.  :w NOMEFILE  scrive su disco il file che stai editando con nome NOMEFILE.

3.  v movimento :w NOMEFILE  salva le linee selezionate in maniera
visuale nel file NOMEFILE.

4.  :r NOMEFILE  legge il file NOMEFILE da disco e lo inserisce nel file
che stai modificando, dopo la linea in cui è posizionato il cursore.

5.  :r !dir  legge l'output del comando  dir  e lo inserisce dopo la
linea in cui è posizionato il cursore.


## lezione 6 - inserimento, copia incolla, set opzioni

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Lezione 6 SOMMARIO

1. Batti  o  per aggiungere una linea SOTTO il cursore ed entrare in
Modalità Inserimento.
Batti  O  per aggiungere una linea SOPRA il cursore.

2. Batti  a  per inserire testo DOPO il cursore.
Batti  A  per inserire testo alla fine della linea.

3. Il comando   e  sposta il cursore alla fine di una parola.

4. L'operatore  y  copia del testo,  p  incolla del testo.

5. Batti  R  per entrare in Modalità Replace, e ne esci premendo <ESC>.

6. Batti ":set xxx" per impostare l'opzione "xxx". Alcun opzioni sono:
'ic' 'ignorecase'	ignorare maiuscole/minuscole nella ricerca
'is' 'incsearch'	mostra occorrenze parziali durante una ricerca
'hls' 'hlsearch'	evidenzia tutte le occorrenze di una ricerca
Puoi usare sia il nome completo di un'opzione che quello abbreviato.

7. Usa il prefisso "no" per annullare una opzione:   :set noic



## lezione 7 - 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Lezione 7 Sommario


1. Batti  :help  o premi <F1> o <Help>  per aprire una finestra di aiuto.

2. Batti  :help comando  per avere aiuto su  comando .

3. Batti  CTRL-W CTRL-W  per saltare alla prossima finestra.

4. Batti  :q  per chiudere la finestra di aiuto.

5. Crea uno script iniziale vimrc contenente le tue impostazioni preferite.

6. Mentre batti un comando  : , premi CTRL-D per vedere i possibili
completamenti.  Premi <TAB> per usare il completamento desiderato.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



