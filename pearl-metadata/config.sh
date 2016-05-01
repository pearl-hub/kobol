
if [[ $PATH != *"${PEARL_PKGDIR}/bin"* ]]
then
    PATH=$PATH:$PEARL_PKGDIR/bin
fi

if [[ $MANPATH != *"${PEARL_PKGDIR}/man"* ]]
then
    MANPATH=$MANPATH:$PEARL_PKGDIR/man
fi

# vim: ft=sh
