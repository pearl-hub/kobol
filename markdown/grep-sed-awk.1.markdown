
#  Grep Sed Paste &amp; Awk


## grep '\< [a-z0-9-]\+\>' doc.txt

ricerca su un file dati. -i ignora il case, -m "num" num massimo di abbinamenti, -n stampa il numero della linea, -f="FILE" per specificare che il Pattern si trova in File, --colour per il colore. per comandi avanzati sed oppure awk(molto difficile)

To invert match:
`grep -v python f.txt`

To check an exact match:
`grep -x python.* f.txt`



## paste

Merge lines of files delimited by a space char:
`paste -s -d ' ' file.txt`



## sed

The delimiters can be: @:,;% instead of / if we want.
*  Substitution
Apply all occurences (because of g) of two substitutions:
`sed -e 's/dog/cat/g' -e 's/cat/elephant/g' file`

The substitution is only applied to lines matching the regular expression "not":
`sed -e '/not/s/black/white/g' file`

It matches the regular expression ^line.*one:
`sed -e '/^line.*one/s/line/LINE/' file`


*  Delete
The lines are deleted if they match with the regular expression "line":
`sed -e '/line/d' file`

Delete the first and second line:
`sed -e '1,2d' file`

Delete the line from the first match with "hello" to the line that matches with "goodbye":
`sed -e '/hello/,/goodbye/d' file`




## awk

Basic syntax is "pattern {action}".
BEGIN and END specify the action to apply before and after process each line of stdin:

`awk 'BEGIN { print "File\tOwner"} { print $8, "\t", $3} END{ print "DONE" }'`

The option -v specify a variable:
`awk -v q=0 'BEGIN{} $1==q {print $0 }END{}'`


The built-in variables are:
*   NR -- The current line's sequential number
*   NF -- The number of fields in the current line
*   FS -- The input field separator; defaults to whitespace and is reset by the -F command line parameter
*   RS -- The record separator; by default is newline
*   OFS -- The output field separator; default is space. See example below
*   FILENAME -- name of the file (see below for an example to use it for joining two files!)
*   FNR -- same as NR but with multiple files it restart counting from 1 for each file while NR continue incrementing

Variables don't need dollar char!
Example:
`awk '{print $1,NF,NR,FS }'`


Print if $1 begin with J:
`awk '($1~/^J/) { print $1 }'`

To use several separator (it's also possible to change it at runtime using FS):
`awk -F "[,;.]" '{print $4}'`

Print if the lenght of $1 is greater than 6:
`awk '(length($2)>6) {print $2}'`

Count number of lines where col3 > col1:
`awk '$3 > $1 {print i + "1"; i++}'`

Print the maximum value: 
`awk 'BEGIN{} $1>x {x=$1} END{print x}'`

To delete all words ending with a letter g:
`awk '{gsub("[a-zA-Z0-9]*[g|G]", "");print}' input`


To change the record separator: 
`echo "mela pera; cane gatto; Milano bari" | awk 'BEGIN { RS=";" } {print NR}'`

Use another output field separator:
`echo "banane;pere;ciliegie;fragole" | awk -F";" 'BEGIN { OFS="_" } {print $1,$2,$3}'`

Null char output separator. USEFUL in order to use pipe with xargs -0:
`echo "berry,banana,pineapple,apple" | awk 'BEGIN{RS=","} {printf "%s\000",$1}'`

Null char input separator:
`du -0 -b | awk 'BEGIN{RS="\x00"}{print $0}'`

Traspose a column into row:
`echo -e "a\nb\nc\n" | awk 'BEGIN {RS="\n"; ORS=" ";print "\n"}  {print $0} END{print "\n\n"}'`

Use of arrays:
`$ awk 'BEGIN{ortolano["banana"]=20; print ortolano["banana"]}'`


SORTING AN ARRAY:
To sort an array according its values (makes a copy):

A = asort(squadra,alta);"


To sort an array according its indexes (makes a copy):

A = asorti(squadra,alta);"


To sort the array without making a copy set the PROCINFO array.
For sort by index:

PROCINFO["sorted_in"] = "@ind_num_asc"


For sort by value:

PROCINFO["sorted_in"] = "@val_type_asc"



Examples:



- !/usr/bin/awk -f
- calcolare la media dei voti con relativi giudizi.
BEGIN {
print "     \fESITO DELLE PROVE\n"
print " \fNome\tMedia\tGiudizio\n";
}
{
totale=$2+$3+$4+$5+$6;
media=totale/5
if (media>18) {giudizio="promosso";}
else if (media<18) {giudizio="respinto";}
print $1,media,"=>",giudizio;
}
END {
print "------------------------"
}






- !/usr/bin/awk -f
BEGIN {
count1=0
count2=0
print "\fRISULTATI STATISTICI"
}
- conto i candidati promossi
$4 ~ /promosso/ {count1++}
- conto i candidati respinti
$4 ~ /respinto/ {count2++}
- calcolo la percentuale dei promossi
{promossi=(count1/NR)*100}
- calcolo la percentuale dei respinti
{respinti=(count2/NR)*100}
- calcolo il punteggio medio tra tutti i candidati
{media+=$2/9}
END {
print "\fnumero candidati:", NR
print "numero dei promossi:", count1
print "percentuale dei promossi", promossi "%"
print "numero dei respinti", count2
print "percentuale dei respinti:", respinti "%"
print "punteggio medio di tutti i candidati:", media
print ".........................."
}






- !/usr/bin/awk -f
-  Count word,rows and chars in a file
{
nc += length($0); np += NF
}
END { print "Il file",FILENAME " contiene:", NR " righe,", np " parole,", nc " caratteri."
}








- !/usr/bin/awk -f
BEGIN {
print " \f- - - - - - - - - - RETRIBUZIONE TOTALE- - - - - - - - - - - \n"
}
{
i=2; totale=0
while (i<=NF) {
totale=totale+$i;
i++
}
print "\nil Signor",$1, "in sette mesi ha guadagnato", totale, "euro"
}







- !/usr/bin/awk -f

-  Example of arrays

BEGIN {
print "\n\n"
- L'array geo ha come chiavi tre Stati e, come valori, le rispettive capitali.
geo["Francia"] = "Parigi"
geo["Angola"] = "Luanda"
geo["Bhutan"] = "Thimphu"
for (i in geo) {
printf "%8s %06s\n", i, geo[i] - su printf ci ritorneremo
}
-  Eliminiamo la chiave "Francia" con il comando delete.
print "\n\n"
delete geo["Francia"]
for (i in geo) {
print i, geo[i] - Controlliamo se ha eliminato la chiave Francia col suo relativo valore.
}
-  cerca se la chiave Francia esiste
print "\n\n"
print "Francia " ( "Francia" in geo )   - Dà 0, la chiave Francia non esiste
print "Bhutan " ( "Bhutan" in geo )"\n"  - Dà 1, la chiave Bhutan esiste
}







-  Example of using two files doing a joing in one table!
- !/usr/bin/awk -f

BEGIN {
print "\n\t.............START....................\n"
FORMAT="\t%-12s%-12s%-8s%s\n"
printf FORMAT,"ALUNNI","MATRICOLE","VOTI","MATERIE"
}
{
if (FILENAME == "tabella1.txt") {
matricole[$1] = $2
}
if (FILENAME == "tabella2.txt") {
printf FORMAT, $1,matricole[$1],$2,$3
}
}
END {
print "\n\t.................END..................\n"
}








