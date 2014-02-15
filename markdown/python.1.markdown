
-  python


## PYTHONPATH

Contiene i percorsi in cui Python va alla ricerca di moduli. A livello di codice si puo' intervenire alla variabile, per esempio aggiungendo nuovi percorsi tramite la lista:

sys.path




## pickle

E' un modulo che consente di serializzare un oggetto in un file.
Il metodo dump(obj, file) serve a serializzare l'oggetto obj nel file.
Per caricare l'oggetto si invoca il metodo load




-  x = [1, "asdfg"]
-  f = open("/home/feel/prova", "w")
-  pickle.dump(x, f)
-  f = open("/home/feel/prova", "r")
-  x = pickle.load(f)





## Formattazione avanzata dell'output

La funzione str() restituisce la rappresentazione del valore in termini umanamente comprensibili.
La funzione repr() genera la rappresentazione del valore comprensibile dall’interprete (mostrando per esempio \n o altri caratteri speciali)
La stampa in stile sprintf di C puo' essere fatta in tal modo:



print ’%2d %3d %4d’ % (x, x*x, x*x*x)



Dove i numeri 2,3,4 equivalgono all'allineamento a destra di una certa quantità. si usa %s per la conversione in stringa o %.3f per i float con 3 posizioni decimali.
Questo può essere fatto equivalentemente con:



print repr(x).rjust(2), repr(x*x).rjust(3), repr(x*x*x).rjust(4)






## Operazioni su liste

funzione 

filter(func, seq)

): Restituisce una sequenza di elementi che soddisfano la funzione avente un parametro.

funzione

map(func, seq1, seq2,...)

: Restituisce una sequenza di elementi ottenuti da 'funzione' avente come parametri il generico elemento di ogni sequenza

funzione 

reduce(func, seq, elemento_iniziale)"

: Restituisce un valore ottenuto tramite la funzione binaria partendo dall'elemento iniziale

funzione 

sum(sequenza)

: Applica una somma sugli elementi

Esempi di costruzione di liste:



>>> vec = [2, 4, 6]
>>> [3*x for x in vec if x > 3]
[12, 18]


>>> vec1 = [2, 4, 6]
>>> vec2 = [4, 3, -9]
>>> [vec1[i]*vec2[i] for i in range(len(vec1))]
[8, 12, -54]
>>> [x+y for x in vec1 for y in vec2]
[6, 5, -7, 8, 7, -5, 10, 9, -3]






L'istruzione del consente di eliminare un elemento o porzioni in una lista o dizionario:



>>>del a[0]
>>>del a[2:4]






## Operazioni su insiemi

Due modi per costruire un insieme:



>>> frutta = set(['mela', 'pera', 'banana', 'mela'])
>>> frutta
set(['mela', 'pera', 'banana'])

>>> a = set(’abracadabra’)
>>> a
set([’a’, ’r’, ’b’, ’c’, ’d’])



Le operazioni sono le seguenti:



>>> a - b       -  Operazione differenza
>>> a | b       -  Operazione unione
>>> a &amp; b   -  Operazione intersezione
>>> a ^ b       -  Operazione equivalente a: (a | b) - (a &amp; b)





## Tecniche sui cicli

Per ricavare chiave e valore su un dizionario si usa i metodo iteritems():



>>> knights = {’gallahad’: ’the pure’, ’robin’: ’the brave’}
>>> for k, v in knights.iteritems():
...     print k, v




Per ricavare la coppia (indice, valore) si usa enumerate('list'):



>>> for i, v in enumerate([’tic’, ’tac’, ’toe’]):
...     print i, v



Per accoppiare due sequenze si usa zip():



>>> domande = [’nome’, ’scopo’, ’colore preferito’]
>>> risposte = [’lancillotto’, ’il santo graal’, ’il blu’]
>>> for q, a in zip(domande, risposte):
...     print ’Qual’e‘ il tuo %s? E‘ il %s.’ % (q, a)
Qual’e‘ il tuo nome? E‘ lancillotto.
Qual’e‘ il tuo scopo? E‘ il santo graal.
Qual’e‘ il tuo colore preferito? E‘ il blu.



Invertire il ciclo di una sequenza con reversed(seq):



>>> for i in reversed(xrange(1,10,2)):
...     print i



Ciclo di una sequenza ordinata con sorted(seq):



>>> basket = [’apple’, ’orange’, ’apple’, ’pear’, ’orange’, ’banana’]
>>> for f in sorted(set(basket)):
...     print f



Altri esempi interessanti:



for elemento in [1, 2, 3]:
print elemento
for elemento in (1, 2, 3):
print elemento
for chiave in {’uno’:1, ’due’:2}:
print chiave
for carattere in "123":
print carattere
for line in open("myfile.txt"):
print line





## Iteratori e generatori

E' semplice aggiungere un comportamento iteratore alle proprie classi, basta definire un metodo __iter__() che restituisca un oggetto con un metodo next():



>>> class Reverse:      -  Iteratore per eseguire un ciclo al contrario su una sequenza
def __init__(self, data):
self.data = data
self.index = len(data)
def __iter__(self):
return self
def next(self):
if self.index == 0:
raise StopIteration
self.index = self.index - 1
return self.data[self.index]

>>> for carattere in Reverse(’spam’):
print carattere
m
a
p
s



La stessa cosa può essere fatta in un solo metodo attrverso la parola chiave yield che automaticamente genera i metodi __iter__() e next():



>>> def reverse(data):
for index in range(len(data)-1, -1, -1):
yield data[index]

>>> for char in reverse(’golf’):
print char
f
l
o
g






