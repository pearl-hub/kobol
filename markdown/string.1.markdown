# String Manipulation #

This manual contains the main commands for string manipulation
Reference: http://www.techdarting.com/2015/05/linux-commands-for-text-manipulating.html

## comm ##

comm compares two sorted files FILE1, FILE2 line by line.

Arguments:

- 1 -- Suppress lines unique to the left file
- 2 -- Suppress lines unique to the right file
- 3 -- Suppress lines that appear in both the files

Print only lines present in both file1 and file2:

    comm -12 file1 file2

Print lines in file1 not in file2, and vice versa:

    comm -3   file1 file2

## cut ##

Select the first two fields:
`echo "name,surname,age,sex,city" | cut -f -2 -d ","`

Select the first 4 chars/bytes:
`echo "name and surname" | cut -b=1-4`
`echo "name and surname" | cut -c=1-4`

Complement the result:
`echo "name,surname,age,sex,city" | cut -b=1-4 --complement`

## diff ##
Compares differecnes between files.

Few essential arguments:

- -a --   Treat all files as text and compare them line-by-line, even if they do not seem to be text.
- -b --   Ignore changes in amount of white space.
- -c --   Use the context output format.

## fold ##

To wrap lines of a file at column 80 and break at spaces (-s):

    fold -sw 80 myfile

## uniq ##

Essential arguments:

- -c  --   Prefix lines with a number representing how many times they occurred.
- -d  --   Only print duplicate lines
- -i  --   Enable case-insensitive comparisons.
- -u  --   Only print unique lines

To count repetitions:

```
echo -e "ciao\nbla\nciao\nciao" | uniq -c
    1 ciao
    1 bla
    2 ciao
```

To count repetitions sorted first:

```
echo -e "ciao\nbla\nciao\nciao" | sort | uniq -c
    1 bla
    3 ciao
```

To count repetitions printing only the duplicates :

```
echo -e "ciao\nbla\nciao\nciao" | uniq -c
    2 ciao
```

## xargs ##

Limit the output with two elements per line (-n 2) using comma as delimiter (-d,)
and prompt the whole command to stderr first:
`echo "1,2,3,4" | xargs -t -n 2 -d,`

To remove files with space (use the null char to identify the end of the filename):
`find . -name "*.c" -print0 | xargs -0 rm -rf`

Use placeholder {} to identify the line and ask to proceed with the mv command (-p):
`find . -name "*.bak" -print0 | xargs -p -0 -I {} mv {} ~/old.files`

Show the limit of the OS:
`xargs --show-limits`

### Multiprocessing ###

Grep all files containing "string" using 8 processes excluding the blank lines (-r):
`time find ./ -print0 | xargs -r -0 -n1 -P8 grep -H "string" > /dev/null`

Use pipe in xargs command:
`echo {0..$count} | xargs -d " " --max-procs=$count -I {} bash -c 't0=$(date +%s); cat $requests | nc localhost 33; t1=$(date +%s) echo process: {} time: $[$t1 - $t0];'`

Use the option -i to keep use your own aliases and functions with xargs:
`echo "{0..5}" | xargs -I {} bash -ic "my_function"`


## grep ##

- `-i`        Ignore case
- `-m "num"`  Max matches number
- `-n`        Print line
- `-f FILE`   Match on the FILE
- `--color`   Enable color
- `-l`        Just print the files that match the pattern.
- `-R , -r`   Read all files within a directory recursively.
- `-w`        Select only those lines containing matches that form whole words.

To invert match:
`grep -v python f.txt`

Select the exact match on the whole line:
`grep -x python.* f.txt`

Show only the match and not the whole line:
`echo "m1ao" | grep -o "^.[[:digit:]][^b-d]"`

Match a fixed string:
`echo "This is a sample" | grep -F "is a"`

Get count of a word in a file:
`echo -e "apple\napple" | grep -c "apple"`

To read a file as binary:
`grep -a xyz abc.txt`

## head ##

Print the first 10 lines:

    head -n 10 file1

## nl ##

Numbers the non empty lines of the given file.

## paste ##

Merge lines of files delimited by a space char:
`paste -s -d ' ' file.txt`


## tr ##

Convert to upper:
`echo "abc" | tr [:lower:] [:upper:]`

## sort ##
Sort a file.

Essential arguments:

- -g --  Compare according to general numerical value.
- -R --  Sort by random hash of keys.
- -r --  Reverse the result of comparisons.
- -f --  Ignore case.
- -n --  Compare according to string numerical value.

To shuffle lines in a file:

    sort -R myfile

## tail ##

Prints last 10 line and output the appended data as the file grows:

    tail -f -n 10

## tee ##

Send output to stdout and multiple files:

    ls | tee file1.txt file2.txt file3.txt

## sed ##

The delimiters can be: @:,;% instead of / if we want.

###Substitute###

Substitute all occurences (since g keyword) and place the changes to the same file (since option -i):

    sed -i -e 's/dog/cat/g' -e 's/cat/elephant/g' file

The substitution is only applied to lines matching the regular expression "not":

    sed -e '/not/s/black/white/g' file

It matches the regular expression ^line.\*one:

    sed -e '/^line.*one/s/line/LINE/' file

Only the lines that matches (option -n suppress the other lines) will be displayed
by "p" and written in changes.txt

    sed -n 's/While/Whereas/gpw changes.txt' sedtest.txt

Make substitution only on the second occurrence only:

    sed 's/is/XX/2' sedtest.txt

###Delete###

The lines are deleted if they match with the regular expression "line":

    sed -e '/line/d' file

Delete from the first up to the third line:

    sed -e '1,3d' file

Delete last line:

    sed '$d' file

Delete every alternate line starting from the second one:

    sed '2~2 d' file

Delete the line from the first match with "hello" to the line that matches with "goodbye":

    sed -e '/hello/,/goodbye/d' file

Delete all line that do NOT include the pattern:

    sed '/PATTERN/ !d' file

Delete lines that match one of the two patterns:

    sed '/PATTERN1\|PATTERN2/ d' FILE.txt

Remove commented and empty lines in /tmp/file and create a backup file.origin:

    sed -i.origin -e '/^#/d;/^$/d' /tmp/file

###Print lines###

It is exaclty the same use as delete action.
Use the action "p" instead of "d" in the **Delete** section.


###Append and insert###

Append a comment after the first line:

    sed '1 a #This is just a commented line' sedtest.txt

Insert a comment in line four:

    sed '4 i #This is the extra line' sedtest.txt


## awk ##

Basic syntax is:

```
    pattern1 {action1}
    pattern2 {action2}
```

*BEGIN* and *END* are special pattern that specify the action to apply
before and after processing each line:

`awk 'BEGIN { print "File\tOwner"} { print $8, "\t", $3} END{ print "DONE" }'`

The option -v specify a variable:
`awk -v q=0 'BEGIN{} $1==q {print $0 }END{}'`

The built-in variables are:

INPUT:

- FS -- The input field separator; defaults to whitespace and is reset by the -F command line parameter
- RS -- The record separator; by default is newline
- OFS -- The output field separator; default is space.
- FILENAME -- Name of the file (see below for an example to use it for joining two files!)
- FNR -- Same as NR but with multiple files it restart counting from 1 for each file while NR continue incrementing
- IGNORECASE -- If assigned the regex ignores the upper and lower case.

OUTPUT:

- NR -- The current line's sequential number
- NF -- The number of fields in the current line
- ARGC, ARGV -- Allow to access to the awk arguments
- ENVIRON -- Associative array for accessing to the environ variables
- FIELDWIDTHS -- comma separated list to specify the width size of each field


Variables don't need dollar char!
Example:
`awk '{print $1,NF,NR,FS }'`

Print if the line starts with "this" ignore case:
`awk 'BEGIN {IGNORECASE=1} /^this/ {print $2}'`

Print if $2 begin with J:
`awk '($2~/^J/) { print $1 }'`

To use several separator (it's also possible to change it at runtime using FS):
`awk -F "[,;.]" '{print $4}'`

Print if the lenght of $1 is greater than 6:
`awk '(length($2)>6) {print $2}'`

Count number of lines where col3 > col1:
`awk '$3 > $1 {print i + "1"; i++}'`

Print the maximum value:
`awk 'BEGIN{} $1>x {x=$1} END{print x}'`

To delete all words ending with a letter g:
`awk '{gsub("[a-zA-Z0-9]\*[g|G]", "");print}' input`

Avoid lines beginning with either Never or root:
`lastlog | awk '!(/^Never/ || /^root/)' {print}`


To change the record separator:
`echo "mela pera; cane gatto; Milano bari" | awk 'BEGIN { RS=";" } {print NR}'`

Use another output field separator:
`echo "banane;pere;ciliegie;fragole" | awk -F";" 'BEGIN { OFS="\_" } {print $1,$2,$3}'`

Null char output separator. USEFUL in order to use pipe with xargs -0:
`echo "berry,banana,pineapple,apple" | awk 'BEGIN{RS=","} {printf "%s\000",$1}'`

Null char input separator:
`du -0 -b | awk 'BEGIN{RS="\x00"}{print $0}'`

Traspose a column into row:
`echo -e "a\nb\nc\n" | awk 'BEGIN {RS="\n"; ORS=" ";print "\n"}  {print $0} END{print "\n\n"}'`

Use of arrays:
`$ awk 'BEGIN{ortolano["banana"]=20; print ortolano["banana"]}'`

Use the comma as decimal floating separator:
`$ awk -N '/^Dry/ {tot=$2*$4} END{print tot}'`

### REDIRECT ###

Redirect the output on different files:
`$ awk '$2>=10 {print $3 > "big-items"}; $2<5 {print $3 > "small-items"}'`

### SORTING AN ARRAY ###
To sort an array according its values (makes a copy):

```
    size = asort(arr_input, arr_output);
```

To sort an array according its indexes (makes a copy):

```
    size = asorti(arr_input, arr_output);
```

To sort the array without making a copy set the PROCINFO array.
For sort by index:

```
    PROCINFO["sorted\_in"] = "@ind\_num\_asc"
```

For sort by value:

```
    PROCINFO["sorted\_in"] = "@val\_type\_asc"
```


### AWK Examples ###

*Use of an array as a dictionary of <IP,Number of access>*

```
    {ip[$1]++}
    END {
        for (i in ip)
            print i, " has accessed ", ip[i], " times"}
    }
```

*Math example*

```
    #!/usr/bin/awk -f
    BEGIN {
        count1=0
        count2=0
        print "\fRISULTATI STATISTICI"
    }

    $4 ~ /promosso/ {count1++}
    $4 ~ /respinto/ {count2++}

    {media+=$2/9}

    END {
        promossi=(count1/NR)*100
        respinti=(count2/NR)*100

        print "\fnumero candidati:", NR
        print "numero dei promossi:", count1
        print "percentuale dei promossi", promossi "%"
        print "numero dei respinti", count2
        print "percentuale dei respinti:", respinti "%"
        print "punteggio medio di tutti i candidati:", media
        print ".........................."
    }

```

*Count word,rows and chars in a file*

```
#!/usr/bin/awk -f
{nc += length($0); np += NF }

END {
    print "Il file",FILENAME " contains:", NR " rows,", np " words,", nc " chars"
}
```


*Example of arrays*

```
#!/usr/bin/awk -f
BEGIN {
    print "\n\n"
    geo["Francia"] = "Parigi"
    geo["Angola"] = "Luanda"
    geo["Bhutan"] = "Thimphu"
    for (i in geo) {
        printf "%8s %06s\n", i, geo[i]
    }

    print "\n\n"

    delete geo["Francia"]
    for (i in geo) {
        print i, geo[i]
    }

    print "\n\n"
    # Gives 0, Francia key doesn't exist
    print "Francia " ( "Francia" in geo )
    # Gives 1, Bhutan key exists
    print "Bhutan " ( "Bhutan" in geo )"\n"
}
```




*Example of using two files doing a join in one table!*

```
#!/usr/bin/awk -f

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
```

## wc ##
Count and print the lines, words, chars and bytes of a file.






