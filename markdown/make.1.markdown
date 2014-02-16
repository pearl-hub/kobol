
#  MAKE



## make

Una opzione di make e' -f che consente di specificare il Makefile da utilizzare:
`make -f Mafile-1`

Un Makefile ha una struttura del genere:



<![CDATA[
target: dependencies
[tab]   compilation command
]]>




Special variables are:
$^     -> Prerequisites of the rule
$<  -> First prerequisite
$@     -> The target of the rule
$?     -> All out-of-data prerequisites

To include makefiles inside the same makefile we can use:
include <config.mk>

Ecco un esempio in cui si vede il contenuto di un Makefile



<![CDATA[
-  This is a comment. The variable CC will be the compiler to use.
CC=g++
-  CFLAGS will be the options I'll pass to the compiler.
CFLAGS=-c -Wall

all: hello

hello: main.o factorial.o hello.o
$(CC) main.o factorial.o hello.o -o hello

main.o: main.cpp
$(CC) $(CFLAGS) main.cpp

clean:
rm -rf *o hello
]]>



Un esempio ancora più generale è il seguente:



<![CDATA[
CC=g++
CFLAGS=-c -Wall
LDFLAGS=
SOURCES=main.cpp hello.cpp factorial.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=hello

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
$(CC) $(CFLAGS) $< -o $@
]]>






