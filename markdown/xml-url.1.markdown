
#  Codifica caratteri speciali in XML e URL



## codifica caratteri in XML

Carattere	=>	Corrispondente XML
"		=>	&quot;
& 		=>	&amp;
&apos;		=>	&apos;
<		=>	&lt;
>		=>	&amp;gt;


Per ulteriori caratteri andare su: http://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
Nel caso si voglia evitare di codificare i caratteri speciali perchè si potrebbe ritenere poco leggibile il documento si può usare il costrutto CDATA




## codifica caratteri in URL


Ecco la lista dei caratteri che necessitano di una codifica particolare :
Carattere 	Codifica URL
Tabulazione 	%09
Spazio 	        %20
" 	        %22
-  	        %23
% 	        %25
&amp; 	        %26
( 	        %28
) 	        %29
+ 	        %2B
, 	        %2C
. 	        %2E
/ 	        %2F
: 	        %3A
; 	        %3B
< 	        %3C
= 	        %3D
> 	        %3E
? 	        %3F
@ 	        %40
[ 	        %5B
\ 	        %5C
] 	        %5D
^ 	        %5E
' 	        %60
{ 	        %7B
| 	        %7C
} 	        %7D
~ 	        %7E



