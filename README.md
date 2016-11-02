# Kobol #

## Name ##
kobol - Snippet-based manuals

## Description ##

kobol is a minimal system used to get essentials snippet information about all the
important linux commands, programs, and much much more.
It contains the command `kobol` that is a wrapper of the famous `man`.

The Pearl manuals are all located in `$PEARL_PKGDIR/mans/`.

You can create your own markdown manuals just place them to the directory
`~/.config/pearl/markdown`.

## Installation ##
`kobol` is a [*pearl*](https://github.com/fsquillace/pearl).

After installing pearl type just the following:

    $ pearl install kobol

## Usage ##
- To search for a "keyword" among all themans: `man3 -K keyword`
- To see a specific "manual": `man3 manual_name`
- To create your own markdown document *mydoc*, just save it in `~/.config/pearl/markdown` and then:`man3 mydoc`

## Help ##
Just type one of the manuals you need in:

    man pearl.kobol

## Copyright ##

    Copyright (C) 2008-2016 Free Sofware Foundation, Inc.

    Permission is granted to make and distribute verbatim copies
    of this document provided the copyright notice and this per
    missing notice are preserved on all copies.

    Permission is grante to copy and distribute modified versions
    of this document under the conditions for verbatim copying,
    provided that the entire resulting derived work is distributed
    under the terms of a permission notice identical to this one.

    Permsision is granted to copy and distribute translations of
    this document into another language, under the above conditions
    fo modified versions, except that this permission notice may be
    stated in a translation approved by the Free Sofware Foundation.

## Bugs ##
Of course there is no bug in pearl. But there may be unexpected behaviors.
Go to 'https://github.com/pearl-hub/kobol/issues' you can report directly
this unexpected behaviors.

## Authors ##
Filippo Squillace <feel.sqoox@gmail.com>.

## WWW ##
https://github.com/pearl-core/pearl
https://github.com/pearl-hub/kobol

## Last words ##

    Consider your origins:
    You were not born to live like brutes
    but to follow virtue and knowledge.
    [verse, Dante Alighieri, from Divine Comedy]

