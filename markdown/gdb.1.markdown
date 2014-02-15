
-  GDB - GNU DEBUGGER



## gdb - gnu debugger

Step1)La prima operazione da compiere e' specificare al compilatore di applicare i simboli di debug al oggetto compilato:
`gcc/gfortran -g file[.c/.f90]`

Step 2) lancia dbg:
`dbg file[.c/.f90]`

Step 3) Comandi all'interno di dbg sono:
* break[b] num - applica un breakpoint ad un numero
or you can use break[b] filename.c:num
* run[r] - Esegue il programma
* print[p] var - Stampa una variabile
* continue[c] - Esegue fino al prossimo breakpoint
* next[n] - Esegue fino alla prossima linea
* step[s] - Come n però va anche all'interno della funzione
* list[l] - Lista la porzione di codice corrente da eseguire
* backtrack[bt] - Stampa lo stack di esecuzione
* help - Aiuto
* quit[q] - Esci


## gdb - gnu debugger avanzato

I comandi avanzati sono:
* x/nfu addr - consente di esaminare dettagliatamente la memoria specificando l'indirizzo addr. Addr può anche essere un registro del processore ad es. per mostrare il contenuto di quattro byte in esadecimale sullo stack pointer x/4wx $sp
Le opzioni sono:
*   u - Indica la unità minima da visualizzare (es. x/ub per visualizzare un byte). I possibili valori sono: b(byte), h(halfwords,due bytes),w(word,quattro bytes)
*   n - Indica la quantità di unità espresse in u da visualizzare (es. x/8ub)
*   f - Indica il formato che può essere: s (stringa), i (traduce il codice in istruzione macchina) e x (esadecimale)
* disassemble addr_in addr_fin - Traduce un range di memoria nel corrispondente codice macchina. Utile quando si vuole conoscere il codice macchina di un intero programma.
Per maggiori dettagli su come esaminare i dati di un programma visitare: http://www.it.uom.gr/teaching/gcc_manuals/onlinedocs/gdb_9.html


Come determinare gli indirizzi a partire dai simboli del programma:
* info - comando indispensabile.
info address "symb" - Determina l'indirizzo di symb
info symbol "addr" - Stampa il simbolo memorizzato in addr
info variables "regex" - Stampa le variabili eccetto quelle locali
info scope "location" - Stampa tutte le variabili locali di uno scope. location può essere una funzione, indirizzo, linea di codice.
info source - Fornisce informazioni su file sorgente: linguaggio, numero linee, etc..
Per maggiori informazioni sul comando info visitare: http://www.it.uom.gr/teaching/gcc_manuals/onlinedocs/gdb_14.html- SEC152



## cuda-gdb

IMPORTANT: thing is that you have to specify the device in the code
you want to test with 

cudaSetDevice(0)

.

GET FOCUS:
To get or set a focus use:
`cuda thread [num]`
.
The same you can do with other target: kernel, grid, block, device, warp, ...
GET INFO:
To know information use: 
`info cuda target [filter]`

target can be devices, sms, warps, lanes, kernels, blocks, threads.
the most important filter are device n, warp n, block x[,y], thread x[,y]

AUTOSTEP:
To apply an auto step on a section of code:
`autostep [num] for length lines`
.
The rest of the program will be executed normally.

TIPS:
Apply breakpoint on every kernel:
`set cuda break_on_launch application`

Disable memcheck:
`set cuda memcheck off`

Disable coalescing:
`set cuda coalescing off`




