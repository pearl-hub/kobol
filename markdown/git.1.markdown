
#  git


## config

To set user information:

`git config --global user.name "John Doe"`


`git config --global user.email johndoe@example.com`

To set editor:
`git config --global core.editor emacs`

To set diff editor:
`git config --global merge.tool vimdiff`

To set color:
`git config color.diff auto`


To check config:
`git config --list`



## init a project

Existing project:
`git init`

Cloning project:
`git clone git://github.com/schacon/grit.git`

To create a repository without a working directory: 
`git init --bare --shared myproject.git`

To clone a repository without a working directory: 
`git init --bare --shared remoterepo myproject.git`

The last two commands above are useful for a shared repository.


## fundamental commands

To track a file in git or to stage a file to be candidate for a commit:
`git add file`

Note: Every time you change a file it will not be in a stage area and to get the last changes in stage you have to retype
git add on that file.
The interctive tool for manage untracked or unstaged files:
`git add -i`


`git mv fileold filenew`


`git status`

To commit and skip the staged phase:
`git commit -am 'message'`


To remove file:
`git rm file`

To remove from the tracker but not from disk:
`git rm --cached file`


To see what you've changed but not yet staged:
`git diff`

To compares your staged changes to your last commit:
`git diff --staged`

To show the diff and log message of a commit/branch or whatever object:
`git show name_object`



To take track of your past commit:
`git log`

And using diff too of the last one:
`git log -p -1`

To use the graph:
`git log --graph`

To get statistics:
`git log --stat`

For a concise list of commits:
`git log --pretty=oneline`

To log only a branch but not the commit of master:
`git log name_branch --not master`

For a detailed use of log see:http://progit.org/book/ch2-3.html
For searching inside the repository (it has the same interface of POSIX):
`git grep -i -v -n KEYWORD`




## ignoring files

Just create a file .gitignore like this:



-  a comment - this is ignored
*.a       -  no .a files
!lib.a    -  but do track lib.a, even though you're ignoring .a files above
/TODO     -  only ignore the root TODO file, not subdir/TODO
build/    -  ignore all files in the build/ directory
doc/*.txt -  ignore doc/notes.txt, but not doc/server/arch.txt





## undoing things

To replace a commit with another
(because you forgot to add somethings in your message):

`git commit --amend`


To unstaging a staged file:

`git reset HEAD file`


Unmodify a modified file up to the last commit:
`git checkout -- file.rb`



## other stuffs

To create an alias:
`git config --global alias.co checkout`

So, you can type:
`git co`

To run an external command with alias:
`git config --global alias.visual "!gitk"`

There are two important gui tools (do not forget to install tk package first):
`gtk gui; gitk`



## working with remote

To know the remotes:
`git remote -v`

To add a remote repository:
`git remote add [shortname] [url]`

To get data from a remote repo (but it don't merge):
`git fetch [shortname]`

To fetch a specific branch and merge it into your current local branch:
`git pull (remote) (branchname)`


To push a local branch to remote repo:
`git push (remote) (branch)`

For example:
`git push origin master`

If you want to change the name of the remote branch:
`git push origin serverfix:awesomebranch`

Note: This command works only if you cloned and if nobody has pushed in the meantime.

To see info about a remote:
`git remote show origin`


To remove a remote:
`git remote rm dav`

To rename a remote:
`git remote rename joe feel`



## tagging and archive

List available tags:
`git tag`

To look for some tags:
`git tag -l 'v1.4.2.*'`


To create an annotated tag:
`git tag -a v1.2.0 -m 'my version'`

To create a Lightweight Tags:
`git tag v1.4.2-lw`

To create and sign a tag with you private key:
`git tag -s `

To verify sign of a tag:
`git tag -v v1.4.2`

To show information about the tag:
`git show v1.4.2`


To add tag to past commit:
`git tag -a v1.3 [checksum]`

You can see the checksum typing log command.

To transfer to remote a tag:
`git push v1.2`

To transfer to remote all tags:
`git push --tags`


To give a unique and human readable release number to the current commit:
`git describe master`

To create an archive:
`git archive master | gzip > `git describe master`.tar.gz`


Example of Changelog:

`git shortlog 0.18.1...0.17.5 --no-merges`


`git log 0.18.1...0.17.5 --no-merges --pretty=format:"%ci %an <%ae>%n    * %s" | awk 'BEGIN{ldate=0}{msg=$0; if((NR-1)%2==0){msg=$1; for(i=4;i<=NF;i++)msg=msg" "$i;} if($1!=ldate){print msg}; if((NR-1)%2==0){ldate=$1}}'`




## branching and merge

To create a branch:
`git branch new_branch`

HEAD is a pointer to the current active branch.
To switch between branchs:
`git checkout other_branch`

To create and switch at the same time:
`git checkout -b n_branch`


To merge back into the master commit starting from another branch:
Switch:
`git checkout master`

Merge:
`git merge hotfix`


To manage merging conflicts with a graphical tool:
`git mergetool`

To delete a branch:
`git branch -d hotfix`

To delete a remote branch locally:
`git branch -rd origin/remotebranch`

To see the last commit on each branch:
`git branch -v`

To see merged or no-merged branchs:
`git branch [--merged|--no-merged]`

To move/rename a branch:
`git branch -m oldbranch newbranch`


WITH REMOTE:
To get changes from a remote you can do two things (after doing "remote add" command):
*    Fetch and then merge the current local branch:
*    Create a new branch from the remote one:
`git checkout -b local_branch remote/remote_branch`

To delete a remote branch:
`git push origin :remote_branch`

To create/rename another branch from local to remote:

`git push origin local_branch:remote_branch`


The local branch will automatically push to and pull from remote/remote_branch:

`git checkout --track remote/remote_branch`


`git checkout -b local_branch remote/remote_branch`




## deploying using git on server

The best way is create a working directory on remote sever.
SERVER SIDE
To disable the control from git:

`git config --global receive.denyCurrentBranch ignore`

Create a work tree:

`git init`

Create the hook:

`touch .git/hooks/post-receive`

Write the following:



- !/bin/sh
cd ..
GIT_DIR='.git'
umask 002 &amp;&amp; git reset --hard



Exec permissions:

`chmod a+x .git/hooks/post-receive`


CLIENT SIDE:
Add the remote:

`git remote add production user@ssh.domain.com:~/my_project/.git`




## Contributing to a project

To check whitespaces before commiting:
`git diff --check`

Before pushing to the remote is important to remember the following steps:
1) fetch the changes in order to get the remote (usually origin/master) up to date
locally:
`git fetch orign`

2) merge the two versions(master and origin/master).
You need to be in the master branch:
`git merge origin/master`

3) Push the new snapshot in remote:
`git push orign master`


To check what commits are needed to merge use:
`git log --no-merges`


To request pull from a remote public repo:
`git request-pull origin/master myfork`


MANAGE PATCHES:
Create a Patch:
From your commits it is possible to create a patch:
`git format-patch -M origin/master`

Send email with patches (first use git config to set the email account):
`git send-email *.patch`


Apply a patch:
For applying a new patch is a good practice to create a temporary branch first.
To apply a patch that come from git diff or diff commands:
`git apply name_patch.patch`

Before apply it is good idea to check first:
`git apply --check name_patch.patch`


To apply a patch from format-patch(it is the best way):
`git am name_patch.patch`

In case of error you can edit the conflict file and type:
`git am --resolved`

Or in case of abort of skip:
`git am --skip`

`git am --abort`


If the patch doesn't work, it is possible to apply using a three-way merge:
`git am -3 name_patch.patch`

The interactive mode is:
`git am -i name_patch.patch`


DETERMINE THE DIFFERENCES:
It is important to know that using the classic:
`git diff master`
 is not always a good idea,
in particular when the branches diverges a lot.
To see truly the difference we need to find the common ancestor:
`git merge-base name_branch master`

and later use that ancestor to diff:
`git diff 367cd`

Git provides an awesome command to do that directly!
`git diff name_branch...master`




## miscelaneous to be a git master!

To get the commit from the branch name:
`git rev-parse branch_name`

REFLOG:
Git records all the operations done in a history:
`git reflog`

To show what is going on yesterday on master:
`git show master@{yesterday}`

And two months ago on HEAD:
`git show HEAD@{2.months.ago}`


ANCESTRY REFS:
There are two specification ^ or ~. ^ is used to traverse ancestors with more than one parent
and ~ is used to traverse depth in the history.
To get the second parent:
`git show HEAD^2`
 or 
`git show HEAD^^`

To get the grandparent:
`git shoe HEAD~2`


COMMIT RANGES:
What is in experiment branch that hasn’t yet been merged into master branch?
`git show master..experiment`

Or to get a log for the commits that has to be merged in a remote:
`git log origin/master..HEAD`

To get the commits that are reachable by either of two references but not by both of them showing the sides too:

`git log --left-right master...experiment`


DETECT BUGGY COMMITS:
In case of having hundreds of commits in order to detect a buggy commit:
1) Start the binary search algorithm:
`git bisect start`

2) Specify that the current commit is buggy:
`git bisect bad`

3) Specify the last known good commit:
`git bisect good v1.0`

bisect start to evaluate the middle commits and after you test the commit,
you can judge the commit as bad o good:
`git bisect good/bad`

Until you get the first bad commit.
To reset the HEAD to the original commit:
`git bisect reset`


If you have a script that return zero in case the commit is good and non-zero otherwise,
you can easily automate as follows:
1) Indicate the good and bad commit:
`git bisect start HEAD v1.0`

2) Run the process:
`git bisect run test-error.sh`

bisect continue until finds the first broken commit.

BUG ANNOTATION:
If you detect a bug and want to know when it was introduced and why:

`git blame -L 12,22 name_file`

To check also if the file was renamed and so on:
`git blame -C -L 143,160 file_name`


REWRITNG THE HISTORY:
In order to split, merge, change multiple messages in previous commit see
http://git-scm.com/book/en/Git-Tools-Rewriting-History

SUBMODULES:
Allows to keep a Git repo as a subdirectory of another Git repo.
To add a git project into the 'rack' directory:
`git submodule add git://github.com/chneukirchen/rack.git rack`

To clone a project with submodules:
1) git clone:
`git clone ....`

2) init the submodules:
`git submodule init`

3) fetch the modules:
`git submodule update`

The info of the submodules will be stored in .gitmodules
Submodules is sometimes odd to use. Check out the doc for any problem: http://git-scm.com/book/en/Git-Tools-Submodules

SUBTREE MERGING:
Is a substitution of the submodules method.
Instead of creating a submodule the method creates a branch:
1) Create a remote:
`git remote add rack_remote git@github.com:schacon/rack.git`

2) Fetch:
`git fetch rack_remote`

3) Read the root tree of the branch and put the content into 'rack' dir:
`git read-tree --prefix=rack/ -u rack_branch`

4) After any changes from the rack_branch, merge it using:
`git merge --squash -s subtree --no-commit rack_branch`


To see the diff between the 'rack' directory and rack_branch:
`git diff-tree -p rack_branch`






## stashing

Stashing is useful when you have started a work that you still don't want to commit but you have also to switch branch.
To store the changes:
`git stash`

To list the stashs:
`git stash list`

To apply a stash:
`git stash apply stash@{1}`

Even better apply and delete a stash:
`git stash pop stash@{1}`

To drop a stash:
`git drop stash@{1}`

To show the diff:
`git stash show -p stash@{1}`

After changes it is possible to unapply the work from a stash:
`git stash show -p stash@{0} | git apply -R`

To create a branch from a stash:
`git stash branch branch_name`






