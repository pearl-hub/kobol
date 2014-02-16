
#  compressori convertitori


## unrar

To UNRAR a compress file:
`unrar e file.rar path/to/dir`



## tar -zcvf  archivio.tar.gz Directory/

Decomprimere un file comp_file.tar.gz:
`tar -vxzf comp-file.tar.gz`

Usa -p per preservare i permessi ai file.

Comprimere i file in:
`tar -vzcf comp-file.tar.gz BLASSM MATGEN/MISC`


To change the starting directory you can use -C option:
`tar -vczf foo.tar.gz -C /etc passwd hosts -C /lib libc.a`


Per listare il contenuto di file-comp.tar.gz:
`tar -tf comp-file.tar.gz`


Per appendere nuovi file:
`tar -rf comp-file.tar.gz`


Per permette di creare a partire da archivio più volumi compressi da inserire su floppy:
`tar -cvfM /dev/fd0H1440 archivio/`

Per riunire nuovamente i volumi:
`cat 1.tar 2.tar > archivio.tar.gz`




## convert jpg to pdf

With imagemagick:
`convert -verbose *.jpg salida.pdf`



## join pdf files

With ghostscript:
`gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=finished.pdf file1.pdf file2.pdf`




## compress pdf files

With ghostscript:

`gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf`

Possible values are:
-dPDFSETTINGS=/screen   (qualità da schermo, 72 dpi)
-dPDFSETTINGS=/ebook    (bassa qualità, 150 dpi )
-dPDFSETTINGS=/printer  (alta qualità, 300 dpi )
-dPDFSETTINGS=/prepress (alta qualità, preserva i colori, 300 dpi)
-dPDFSETTINGS=/default  (quasi identico a /screen)




## zip file.zip file

comprime un file in file.zip. è possibile decomprimere con -  unzip file.zip




## bzip2 file / bunzip2 file

Comprime/Decomprime un file





## compress 

comprime un file in tipo .Z Con -d lo decomprime




## cpio

un'altro ennesimo compressore





## gzip file /gunzip file.gz

comprime/decomprime file




## catdoc file.doc

fornisce in stdout il documento word .doc




## pdftops .pdf .txt

converte in .ps




## pdftotext .pdf .txt

converte in testo




## dvipdfm -o file.pdf file.dvi

converte da .dvi a .pdf




## dvips -o file.ps file.dvi

converte da .dvi .ps. Le opzioni -A -B permettono di creare un .ps con le pagine pari o con le pagine dispari.




## enscript

converte un file .txt in .ps o .rtf o .html




## latex

converte da .tex a .dvi che è un formato per la stampa




## mencoder

mencoder -idx out-1.ogv -ovc lavc -oac mp3lame -o output.avi converte un file .ogv in .avi





