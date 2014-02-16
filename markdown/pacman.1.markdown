
#  pacman and makepkg


## pacman

To install package:
`pacman -S pack`

Download a package without install it:
`pacman -Sw pack`


To install a package from file:
`pacman -U file.pkg.tar.xz or http://file.pkg.tar.xz`


To remove package:
`pacman -R pack`

To remove package and its dipendencies:
`pacman -Rs pack`

To remove package and its dipendencies and config files:
`pacman -Rns pack`


To upgrade with the repository:
`pacman -Syu`

If you don't want to upgrade a particular package:
`pacman -Syu --ignore linux`


To search in the database repository (both name and description):
`pacman -Ss string`

to display extensive information:
`pacman -Si pack`



To search in already installed package:
`pacman -Qs string`

to display extensive information:
`pacman -Qi pack`

to list all the files installed by a package:
`pacman -Ql pack`


To know the list of packages explictly installed:
`pacman -Qeq`

To know the whole list od packages installed:
`pacman -Qq`


To know which package a file belongs to:
`pacman -Qo path/to/file`


To list all the packages orphans:
`pacman -Qdt`

To remove recursively all the orphans:
`pacman -Rs $(pacman -Qtdq)`


Clean the package cache (/var/cache/pacman/pkg/) of packages that are not
currently installed.
Useful to do periodically:
`pacman -Sc`




## makepkg

To clean up the folder:
`makepkg -c`

To install needed dependencies automatically:
`makepkg -s`



## install package from aur

Installing packages from the AUR (aka the [unsupported] repository) is a relatively simple process. Essentially:

1. Acquire the tarball which contains the PKGBUILD and possibly other required files
2. Extract the tarball (preferably in a folder set aside just for builds from the AUR)
3. Run makepkg in the directory where the files are saved ("makepkg -s" will auto-resolve dependencies with pacman)
4. Install the resulting package with pacman -U



## local repository repo-add repo-remove

1. Create a directory of repository:
`mkdir /home/feel/repo`

2. Make a repository:
`repo-add custom.db.tar.gz *.pkg.tar.gz`

3. In file pacman.conf put:



[custom]
Server = /home/feel/repo



4. Upgrade:
`pacman -Syu`




## Backing up and retrieving a list of installed packages

Get the list of installed packages:
`comm -23 <(pacman -Qeq) <(pacman -Qmq) > pkglist`

Restore:
`sudo pacman -S $(< pkglist)`


Look https://wiki.archlinux.org/index.php/Pacman_Tips- Custom_local_repository for more details.




