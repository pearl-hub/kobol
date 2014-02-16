
#  emacs


## Help

Info-browser:
`C-h i`

General help:
`Cntrl-h Cntrl-h`

Tutorial:
`Cntrl-h t`

Manual:
`Cntrl-h r`

Documentation with any key:
`Cntrl-h k`

Documentation for command by name:
`Cntrl-h f`

Search fo commands by keyword:
`Cntrl-h a`




## Files

File chooser:

`M-x dired`
 or

`C-x C-f`

Save file:
`C-x C-s`

Save file as:
`C-x C-w`




## Misc

To apply Cntrl-c to the shell:
`C-q C-c RET`

To wrap line:
`M-q`




## Movement

Forward one char:
`C-f`

Back one char:
`C-b`

Next line:
`C-n`

Previous line:
`C-p`


Move one word:
`C-left or C-right`

Move one paragraph:
`C-up or C-down`


Beginning of line:
`C-a`

End of line:
`C-e`


Beginning of buffer:
`M-<`

End of buffer:
`M->`


Go to line:
`C-g g`


Switch buffers:
`C-x b`

List buffers:
`C-x C-b`

Move between buffers:
`C-x right or C-x left`

Kill buffer:
`C-x k`


To recovery from a crash or to erase a
keybindings sequence:
`C-g`




## Search and replace

Incermental search forward:
`C-s`

Go to next:
`C-s`

Return the cursor back:
`C-r`

Incermental search backward:
`C-r`


Search and Replace:
`M-%`


REGULAR EXPRESSION:
Apply a re:
`C-M-s`

Interactive:
`M-x re-builder`

List occurrences:
`M-x occur`

Replace with re:

`M-x replace-regexp`

Then typing 

\(\w+\) \(\w+\) with \,(upcase \2), \1


Exchange the words and the second one become uppercased.




## Keyboard macro

Start record:
`F3`

Stop record:
`F4`

Play macro:
`F4`




## Mark Yank kill undo

Set Mark:
`C-SPC`


Cut line:
`C-k`

Cut region:
`C-w`

Copy region:
`M-w`


Paste line or region:
`C-y`

Undo:
`C-x u`
 or 
`C-_`





## Programming

Debugger:
`M-x gdb`

Shell:
`M-x shell`

For both shell and gdb use 
`M-n`
 or 
`M-p`
 to browse the history
Terminal:
`M-x term`

Shell Command:
`M-!`
 or

`M-x shell-command`

Man:
`M-x man`

Grep:
`M-x grep`

Calculator:
`M-x calculator`

Calendar:
`M-x calendar`



## Version Control

Commit:
`C-x v v`

Displays diff you have made:
`C-x v =`

Prompts for a version number:
`C-x v ~`

Displays for each line the relative commit:

`C-x v g`

Then, press L to know the log message for that commit
or press D to show the diff


## Major minor modes

List of major modes:

`M-x java-mode`


`M-x python-mode`


`M-x text-mode`


`M-x fundamental-mode`


`M-x org-mode`


`M-x flyspell-mode`


List of minor modes:

`M-x auto-fill-mode`


`M-x flyspell-mode`


`M-x follow-mode`




## Manage windows

Leave the current window:
`C-x 1`

Change window:
`C-x o`

Create a window vertically:
`C-x 2`

Create a window horizontally:
`C-x 3`

Create a window and apply operation:
`C-x 4 ...`

For example to send an email:
`C-x 4 m`


Enlarge horizontally:
`C-x }`

Shrink horizontally:
`C-x {`

Enlarge vertically:
`C-x +`

Shrink vertically:
`C-x -`



## Dired

Open Dired:
`C-x d`

Mark and Unmark:
`m u`

Flag deletion file:
`d`

Undo deletion file:
`u`

Delete the files:
`x`

Open on other window:
`o`

Rename file:
`R`

Copy file:
`C`

Delete file:
`D`

Change mode file:
`M`

Change owner file:
`O`

Change group file:
`G`

Touch file:
`T`

Compress file:
`Z`

Apply a shell command on a file:
`!`

Diff files:
`=`

Update Dired buffer:
`g`



## org-mode

Change priority:
`S-up or S-down`

Change state:
`S-left or S-right`


Move task:
`M-up or M-down`

Change outline level:
`M-left or M-right`

Add new line:
`M-RET`


Cycle subtree:
`Tab`

Global cycle:
`S-Tab`


Markups are:
*bold*
/italic/
_underline_
+strike+
=code=
~verbatim~

Create links: [[link]][[description]]
To go to the link:
`C-c C-o`


To set the TODO types
(place it at the beginning of the file and reload in the same line
with C-c C-c):

`- +TODO: TODO IN-PROGRESS WAITING DONE`


CHECKBOXES:
To add a checkobox to a list:
`- [ ]`

To check the box:
`C-c C-c`

Add new checkbox:
`M-S-RET`

To get mandatory the check of the box in sequence:

`C-c C-x o`


TABLE:
Just use the sequence:
`|WORD`

To set a separator:
`|- or C-c -`

Convert a selection of CSV in table:
`C-c |`

Move column/row around:
`M-(up/down/left/right)`

Add/remove column/row:
`M-S-(up/down/left/right)`

New line:
`C-c RET`



AGENDA:
To open agenda command:
`C-c a`

To set a time to an item:
`C-c .`

and then S-left or S-right to choose the day.
To add/remove a org file as agenda file:
`C-c [ or C-c ]`


CLOCKING:
Clock in:
`C-c C-x C-i`

Clock out:
`C-c C-x C-o`

Reload a clock:
`C-c C-c`

Cancel clock:
`C-c C-x C-q`

Displat a summary:
`C-c C-x C-d`

Report table:
`C-c C-x C-r`


DEADLINE and SCHEDULE:
Create deadline:
`C-c C-d`

Create schedule:
`C-c C-s`


GTD (Get Things Done):
To add a task to an item:
`C-c C-q`

To predefine some set of tags (at the beginning of the file):

`- +TAGS: { @OFFICE(o) @HOME(h) } COMPUTER(c) PHONE(p) READING(r)`


EXPORT:

`C-x C-e`





