
-  bash


## history

Permette di visualizzare lo storico dei comandi.
-c cancella tutto, num indica il num di comandi da visualizzare.
Il file è denominato .bash_history ed è localizzato nella dir home dell'utente:

`history [-c] [num]`


The most recent command containing the "string":
`!?string`


Take the command that either is in the row "num" (it can be negative) or has "string" as prefix:

`!n`
 or 
`!string`

Substitute string1 with string2 in the previous command:
`^string1^string2^`




## multitasking

Stop the execution of the script until all the background jobs have finished or until
the specified job has finished:
`wait %job`


Bring the process as foreground:
`fg %job`


Execute directly a job in background:
`comando &amp; `


Execute a job in background:
`bg %job`


Kill a background job:
`kill %job`


List all the current jobs:
`jobs`


ctrl+c kill the current job, ctrl+z suspend the current job:

`ctrl+c e ctrl+z`





## redirection i/o and pipe

Il ; consente l'esecuzione sequenziale dei comandi:
`comand1 ; comand2`

Esegue comand2 solo se comand1 è stato eseguito con successo:
`comand1 &amp;&amp; comand2`

Esegue comand2 solo se comand1 ha generato un errore:
`comand1 || comand2`

Permette l'esecuzione simultanea:
`comand1 &amp; comand2 &amp; comand3`



`:> file opp >file`


Redirige e accoda lo stdOut nel file "file".
0=stdIn, 1=stdOut, 2=stdErr.
&amp;>"file" redirige stdErr e stdOut in "file":

`comando 1>>file`


Sopprime l'output:
`comando 1>/dev/null`

Legge le righe contenute nel file con descittore 3:

`while read riga <&amp;3 do {echo riga}`





## bash binding

To get the list of the current bindings:
`bind -p`

To bind an action with a key:
`bind '"\C-p": beginning-of-line'`

To unset a bind:
`bind '"\C-a": '`

To list all input sequences associated with the action:
`bind -p | grep beginning-of-line`



## bash shortcuts

Ctrl-a          Move to the start of the line.
Ctrl-e          Move to the end of the line.
Ctrl-b          Move back one character.
Alt-b           Move back one word.
Ctrl-f          Move forward one character.
Alt-f           Move forward one word.
Ctrl-] x        Where x is any character, moves the cursor forward to the next occurance of x.
Alt-Ctrl-] x    Where x is any character, moves the cursor backwards to the previous occurance of x.
Ctrl-u          Delete from the cursor to the beginning of the line.
Ctrl-k          Delete from the cursor to the end of the line.
Ctrl-w          Delete from the cursor to the start of the word.
Esc-Del         Delete previous word (may not work, instead try Esc followed by Backspace)
Ctrl-y          Pastes text from the clipboard.
Ctrl-l          Clear the screen leaving the current line at the top of the screen.
Ctrl-x Ctrl-u   Undo the last changes. Ctrl-_ does the same
Alt-r           Undo all changes to the line.
Alt-Ctrl-e      Expand command line.
Ctrl-r          Incremental reverse search of history.
Alt-p           Non-incremental reverse search of history.
!!              Execute last command in history
!abc            Execute last command in history beginning with abc
!abc:p          Print last command in history beginning with abc
!n              Execute nth command in history
!$              Last argument of last command
!^              First argument of last command
^abc^xyz        Replace first occurance of abc with xyz in last command and execute it



## array

To define an array:



-  One value array
array[0]=value
-  Empty array
declare -a arrayB
-  Another declaration
declare -a array=('valore' 'valore' 'valore')
-  Again another declaration
array=('valore' 'valore' 'valore')



To assign a value to the array:



arrayB[$i]=10



To iterate among the elements:



for v in ${arrayA[@]};do
echo $v
done




To define an ASSOCIATIVE ARRAY:



declare -A userpass
userpass=( ["Ennio"]="123456" ["Pippo"]="1q2w3e4r" ["Luigi"]="B0sc0l4nd14" )




Other possible options of declare:
*  -i Declare an array with only integers.
*  -r Declare an array read-only.
*  -u Convert the values of the array in uppercase.
*  -l Convert the values of the array in lowercase.

To get the lenght of the array:

echo "${- array[@]}"



To extract the elements of an array:



echo ${array[@]:3} -  Extract the elements beginning to the third elements
echo ${array[@]:0:3} -  Extract the first three elements.
echo ${array[-1]} -  Extract the last element




To change elements inside an array:



echo ${array[@],} -  i primi caratteri di ogni parola si visualizzeranno in minuscolo
echo ${array[@],,} -  tutti i caratteri di ogni parola saranno in minuscolo
echo ${array[@]^} -  i primi caratteri di ogni parola si visualizzeranno in maiuscolo
echo ${array[@]^^} -  tutti i caratteri di ogni parola saranno in maiuscolo

echo ${array[@]/uno/} -  Delete the first occurrence on every element.
echo ${array[@]//uno/} -  Delete all the occurrences on every element.

echo ${array[@]/t/a} -  Substitute the first occurrence "t" with "a".
echo ${array[@]//t/a} -  Substitute all the occurrences "t" with "a".






## Variables

$@: Array variable of the parameters
$- : Number of parameters
${FUNCNAME}: Array variable containing the function in the execution call stack



## compgen

Provides completion generation.
To get the list of pearl function: 
`compgen -abck pearl_`




