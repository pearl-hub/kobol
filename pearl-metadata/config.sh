
if [[ $MANPATH != *"${PEARL_PKGDIR}/man"* ]]
then
    MANPATH=$MANPATH:$PEARL_PKGDIR/man
fi

# vim: ft=sh
