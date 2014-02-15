
-  fugitive


## :Git

To type any git command: 
`:Git <command>`

To remove current file:
`:Git rm %`
 or 
`:Gremove`

To move current file:
`:Git mv % target`
 or 
`:Gmove`


To add for the new commit (overwrite the index copy):
`:Git add %`
 or 
`:Gwrite`

To revert on the last commit (also called index copy):
`:Git checkout %`
 or 
`:Gread`


To commit the changes:
`:Gitcommit`

To view blame:
`:Gitblame`




## :Gstatus

Show the status:
`:Git status`

Chars to type:
-       -> to a file (or multi selected files) to be added or reset
p       -> to a file to see the diff (same as git add --patch)
C       -> to make a commit
Enter   -> to view the selected file
cntrl-p -> to go to the previous file
cntrl-n -> to go to the next file



## :Gdiff

See the diff between the index file and the working copy of the same file:
`:Gdiff`

You can use :Gread and :Gwrite to read or write the index copy or you can use a finer grained diff with
:diffget and :diffput
Use :diffupdate to update the diff buffers.

If you merge with conflict and type :Gdiff you will get three buffers representing respectively:
targert branch (namely the master), working copy, merge branch.

Use 
`:diffget //2 or //3 | diffupdate`
 to choose what change accept to the working copy.
Also, you can use dp that is a diffput and diffupdate.

If you want to pick one of the file in target or merge branch go to the corresponding buffer and type 
`:Gwrite!`





## :Gedit and :Gbrowse

To view a file from whatever branch:
`:Gedit master:path/to/file`


There are four kind of object it is possible to inspect:

COMMIT and TAG - 
`:Gedit sha_commit`

Contains blob and tree
Navigate between the object of the commit pressing 'Enter'.
Press 'Enter' to the diff line to see the diff of the file.

TREE (directory)
When inspect a tree object type 'a' to see the SHA for each object.
Type 'C' to return to the current commit.

BLOB (file)
Type 'C' to return to the current commit.

Typing 
`:Gedit`
 allow you to return to the tree working version of the active file.

For every git object type 
`:Gbrowse`
 and it will redirect to the github page. You can even select lines and you will see the lines highlighted in github page.

To view the index version of the current file:
`:Gedit :0`




## :Glog and :Ggrep

To inspect only the last 10 commits:
`:Glog -10`

Type 
`:cnext`
 or 
`:cprev`
 to navigate among the commits
To open the quickfix list of commits:
`:copen`


To search a particular string on branch demo:
`:Ggrep 'word he' demo`

Use 
`:cnext`
, 
`:cprev`
 or 
`:copen`
 to navigate.

To search inside commit messages:
`:Glog --grep=word --`

To search text even for added/removed files:
`:Glog -Sword --`





