
-  JavaScript



## le funzioni built-in

Le finestre di dialogo:
Sono tutti metodi dell'oggetto window (window.alert() etc ...)
Da un messaggio di allerta:

alert('Messaggio di allerta')


Da una finestra di dialogo restituendo true o false:

confirm('Sei sicuro di...?')


Ad esempio puo' essere adoperata nel caso si voglia segnalare qualcosa all'utente prima di aprire un link:

<![CDATA[<a href="link.htm" onclick="return(confirm('Sei sicuro'))
]]>


Il prompt è una finestra che domanda e consente all'utente di dare la risposta che vuole.

 var nomeUtente=prompt("domanda","risposta predefinita");


Aprire finestre personalizzate:

window.open('percorso_file_html','nome finestra','width=300,height=300 ,toolbar, location=no,status=,menubar=yes');


Vediamo nel dettaglio quali sono le principali caratteristiche che possono essere attribuite alla finestra:
caratteristica	valore	    spiegazione	esempio

width	        numerico	la larghezza della finestra in pixel	width=400
height	        numerico	l'altezza della finestra in pixel	height=200
left	        numerico	la distanza dalla sinistra del monitor	left=300
top	                numerico	la distanza dal lato superiore del monitor	top=350
resizable	        yes / no	indica se la finestra può essere ridimensionata o no	resizable=no
fullscreen	        yes / no	indica se la finestra va aperta a tutto schermo	fullscreen=no
channelmode	        yes / no	indica se la finestra deve essere aperta "in modalità canale" (solo per ie)	channelmode=no
menubar	        yes / no	la barra del menu (quella con scritto "file", "modifica", ecc.)	menubar=no
toolbar 	        yes / no	la barra degli strumenti del browser (con i pulsanti "indietro", "avanti")	toolbar=no
location	        yes / no	la barra degli indirizzi del browser	location=no
scrollbars	        yes / no	le barre di scorrimento laterali	scrollbars=no
status	        yes / no	la barra di stato (quella in basso)	status=no


Javascript può elaborare sequenze escape anche all'interno dei propri script mediante i comandi escape:

escape("Ecco qui")


diventa "Ecco%20qui" o con unescape per rendere la situazione contraria:

unescape("Ecco%20qui")

 diventa "Ecco qui"


Per quanto riguarda la conversione di un valore contenuti in una variabile:



// Conversione numero->stringa
miastringa = String(num);
// Conversione stringa -> numero.Il secondo parametro indica la base numerica
parseInt("39 gradi", 10)==39 // Estrae il numero dalla stringa
// Conversione stringa -> numero in virgola mobile
parseFloat(38.4 gradi) == 38.4
// eval calcola espressioni numeriche
x=10; y=20; z=30; eval("x+y+z+900")=960;




Per verificare il tipo di una variabile si usa l'operatore typeof


x=69;
typeof 69



Per controllare se una variabile non è un numero:

isNaN(variabile)


indexOf: è un metodo delle stringhe e si utilizza per verificare se una determinata stringa contiene o meno una sottostringa.

indexOf(sotto_stringa)

Se la sottostringa cercata non c'è, il metodo restituisce -1


La Temporizzazione avviene tramite setTimeout() e setInterval(). Consentono rispettivamente di ritardare e ripetere una funzione, passata come primo parametro, di una quantità di millisecondi, passata come secondo parametro. Uno dei problemi è l'impossibilità di passare parametri a questa funzione ritardata rendendola di fatto poco usabile. Esiste una soluzione tramite le closure:


<![CDATA[
<script type="text/javascript

var nameManager = function(name) {
this.name = name;

this.execute = function() {
var manager = this;

return function() {
alert("parametro: " + manager.name + "\nthis.name: " + this.name);
}
}
}

var nm = new nameManager("Alberto");

window.onload = function() {
window.setTimeout(nm.execute(), 1000);
}
</script>]]>







## modi di esecuzione del codice
<![CDATA[
I modi per eseguire codice JavaScript sono:
1. all'interno degli script, individuati dai tag <SCRIPT>, in maniera sequenziale, per cui l'esecuzione è automatica;
2. caricandoli da file esterni;
3. in seguito all'attivazione di un evento (handler) come un click del mouse o la pressione di un tasto (si vedranno in seguito gli eventi);
4. in luogo di un link (a partire da Netscape 3.0) nella forma: <A href="Javascript:comando

5. valori Javascript possono essere richiamati dinamicamente dall'HTML includendoli tra i caratteri &amp;{ e };% ad esempio la larghezza di una tabella può essere ricavata in rapporto ad un valore javascript nella forma width="&amp;{barWidth};%"
]]>




## gli eventi

Il seguente codice mostra un rollover:

<![CDATA[<A HREF="- " onmouseover="document.images[num].src='immagine.gif'" onmouseout=document.images[num].src='immagine1.gif'
]]>




Evento onchange su select:

<![CDATA[<select name="prova" onchange="if(this.options[1].selected) alert('Hai selezionato il secondo'); else if(this.options[2].selected) alert('Hai selezionato il terzo') 

<option selected="selected
primo</option>
<option>secondo</option>
<option>terzo</option>
</select>]]>





Questo esempio mostra il caricamento di immagini in successione. Sarebbe preferibile un timer che ci consenta per qualche secondo di mostrare l'immagine:


<![CDATA[
<script type="text/javascript


var whichImage = 0;
var maxImages  = 5;

function changeAnimation(theImage)
{
++whichImage;

if (whichImage < maxImages) {
var imageName="numbers/number" + whichImage + ".jpg";
theImage.src = imageName;
}
else { whichImage = -1; }
}
</script>


<img id="changingAnimation" src="numbers/number0.jpg"
onLoad="changeAnimation(this)
]]>




Molto più spesso utilizziamo l'evento onLoad per essere sicuri di lanciare altri script solo al termine del caricamento della pagina:


<![CDATA[<script type="text/javascript

function pageLoaded()
{
// da fare alla fine del caricamento
}

windows.onload = pageLoaded;

</script>]]>




L'evento onError puo' essere usato per sopprimere i messaggi di errore che il debugger mostrerebbe oppure se il codice è espresso nella sezione <![CDATA[<head>]]>, diventa attivo per tutta la finestra e per tutti gli eventi di errore attivati dagli oggetti ivi contenuti


<![CDATA[
<img src="corrupt.gif" onError="null

<head>
<script>window.onerror=null</script>
</head>]]>







## gli oggetti

Oggetto window e l'oggetto che rappresenta tutta la finestra. Eccco alcuni metodi:


<![CDATA[
win2 = window.open('','window2','scrollbars=yes');
try{
win2.document.writeln('<strong>Error Report</strong> <p>');
for (var i=0; i < msgArray.length; i++) {
win2.document.writeln('<strong>Error in file:</strong> ' + urlArray[i] + '<br /> ');
win2.document.writeln('<strong>Line number:</strong> ' + lnoArray[i] + '<br />');
win2.document.writeln('<strong>Message:</strong> ' + msgArray[i] + '</p>');
}
}
catch(e){
alert(e.message)
}
finally{
win2.document.close();
}]]>




Esiste anche la possibilità di recuperare dei dati contenuti nella finestra che ha aperto la finestra corrente in questo modo:

window.opener.nome_variabiles



I frame di una window sono ottenuti così:

window.frames


Il documento HTML è chiamato document. Per identificare un elemento nel documento:

document.getElementById


Le form di un documento sono ottenute così:

document.forms['nome_form']


Le immagini invece:

document.images['nome_immagine']


I cookie:

document.cookie['nome_cookie']


L'oggetto navigator è il browser
Le applet 

document.applets["nome_applet"]


La barra degli indirizzi 

this.location.href='- '

.Questo ultimo esempio serve per ricaricare la pagina.
La barra di stato, nella parte bassa del browser 

status


Esiste l'oggetto history che contiene la storia della navigazione dell'utente per quel che riguarda una finestra. Ad esempio per tornare alla pagina precedente:

<![CDATA[<a href="- " onClick="history.back()
torna indietro</a>]]>




I livelli sono ottenuti a partire dall'id. Supponiamo che esiste un livello di questo tipo:


<![CDATA[
<div id="mioLiv" style="position:absolute;background-color:red;color:white;
mio livello</div>]]>



Può essere nascosto attaverso il seguente metodo:


<![CDATA[
<script type="text/javascript


function nascondi() {
//document.all["mioLiv"].style.visibility="hidden";
/*per Internet Explorer*/

document.getElementById("mioLiv").style.visibility= "hidden";
/*per IE 5/6 e NN 6*/
}
</script>]]>



E il metodo verrebbe richiamato così:

<![CDATA[<a href="- " onclick="nascondi()
nascondi</a>]]>



Per conoscere la lunghezza di una casella di testo contenuta in una form:

document.mia_form.casella_testo.value.lenght




Per conoscere informazioni sulla risoluzione dello schermo si usa screen:

screen.width; screen.height








## gli array

Ecco un esempio di uso di array:


alunni = new Array();
alunni["Mario"] = 5;
alunni[0]="Mario";


Alcuni metodi sugli array:
Metodo o proprietà  	        Descrizione
length 	                        Conoscere la lunghezza di un array
push(elemento) 	                Aggiungere un elemento in coda all’array e restituire la nuova lunghezza
concat (elementi da aggiungere) Aggiungere elementi ad un array e restituire la nuova lunghezza. Restituisce un nuovo array formato dalla somma degli elementi
pop() 	                        Eliminare un elemento dalla fine dell’array e restituisre il nome dell’elemento eliminato.
shift() 	                Eliminare un elemento dall’inizio dell’array e restituire il nome dell’elemento eliminato
reverse() 	                Invertire l’ordine degli elementi di un array
slice(inizio,fine)              Dividere l’array in un array più piccolo e restituire il nuovo array





## passaggio di dati tra finestre

Ci sono due casi:
1. di voler trasmettere i dati ad una finestra che viene aperta;
La finestra chiamante ha per esempio questo script:

<![CDATA[
<script type="text/javascript

var tasto=null;
</script>]]>


La finestra chiamata ottiene il valore in questo modo:

window.opener.tasto


2. di trasmettere i dati ad una pagina linkata.
Si aggiungono dati al URL:

<![CDATA[<a id="link" href="http://html.it/esempio28.html?" onclick="link.href+=tasto" target="_blank
I dati verranno ricevuti dalla pagina successiva</a>]]>


La pagina chiamata legge il dato nel seguente modo:

var ausilio = String(this.location); var tasto = ausilio.charAt(ausilio.lastIndexOf("?")+1); 






## il tag noscript

Può capitare che javascript sia disabilitato nel browser. Per segnalare che la visualizzazione corretta della pagina necessita di javascript si usa il tag noscript:



<![CDATA[<noscript>
<div align="center

<h3><font face="Verdana,Arial,Helvetica,sans-serif

Per visualzzare correttamente il contenuto della
pagina occorre avere JavaScript abilitato.
</font></h3>
</div>
</noscript>]]>






## oggetto Function e i metodi call() e apply()

I metodi call() e apply() consentono l'esecuzione di una funzione definendo quale sarà lo scope (in maniera da definire chi è l'oggetto this) passandolo come primo parametro (può essere anche omesso nel caso si voglia solo l'esecuzione nel medesimo scope). La differenza tra apply() e call() è che apply() oltre all'oggetto scope accetta un vettore di parametri, mentre call() accetta un numero indefinito di parametri. Un esempio:



<![CDATA[<script type="text/javascript


var persona = {
nome: "Alberto",
eta: 25
}

var cane = {
nome: "Pluto",
eta: 4
}

function stampaNomeEdEta(moltiplicatore) {
alert(this.nome + ":\n" + (this.eta*moltiplicatore) + " anni");
}


// un anno di un cane corrisponde a sette anni uomo giusto??
stampaNomeEdEta.call(cane, 7);
</script>]]>







