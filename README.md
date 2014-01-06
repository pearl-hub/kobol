# pearl(1) #

## Name ##
pearl-man - A Pearl module used for getting snippet from the open source world

## Description ##

pearl-man is a minimal manual to get essentials snippet information about all the
important linux commands, programming language, and much much more.
It contains the command *man2* that is able to scan manuals in a xml format
that are stored in both '$PEARL\_ROOT/mods/pearl-man/mans/' and '$PEARL\_HOME/mans/'
directories.
You can create your own manual xml file for storing all the information
you need. Just copy the manual xml template file from
'$PEARL\_ROOT/mods/pearl-man/mans/mans\_example.xml'
to '$PEARL\_HOME/mans/your\_man.xml'.
Type *man2 --help* to see all the available options.

## Installation ##
This module can be used only installing ``pearl`` framework
(https://github.com/fsquillace/pearl). After installing pearl type
the following:

    $ pearl_module_install_update pearl-man

## Usage ##
- To search for a "keyword" into the file:
  ``man2 keyword``
- To list all the manuals:
  ``man2 -d``

## Help ##
Just type one of the manuals you need in:

    man pearl.<TAB>

## Copyright ##

    Copyright  (C) 2008-2014 Free  Software Foundation, Inc.

    Permission  is  granted to make and distribute verbatim copies
    of this document provided the copyright notice and  this  per‐
    mission notice are preserved on all copies.

    Permission is granted to copy and distribute modified versions
    of this document under the conditions  for  verbatim  copying,
    provided that the entire resulting derived work is distributed
    under the terms of a permission notice identical to this one.

    Permission is granted to copy and distribute  translations  of
    this  document  into  another language, under the above condi‐
    tions for  modified  versions,  except  that  this  permission
    notice  may  be  stated  in a translation approved by the Free
    Software Foundation.

## Bugs ##
Of course there is no bug in pearl. But there may be unexpected behaviors.
Go to 'https://github.com/fsquillace/pearl-man/issues' you can report directly
this unexpected behaviors.

## Authors ##
Filippo Squillace <feel.squally@gmail.com>.

## WWW ##
https://github.com/fsquillace/pearl
https://github.com/fsquillace/pearl-man

## Last words ##

    Consider your origins:
    You were not born to live like brutes
    but to follow virtue and knowledge.
    [verse, Dante Alighieri, from Divine Comedy]

