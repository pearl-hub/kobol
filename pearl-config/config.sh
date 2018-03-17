
export KOBOL_VARDIR="$PEARL_PKGVARDIR"

mkdir -p ${KOBOL_VARDIR}/markdown
mkdir -p ${KOBOL_VARDIR}/mans/man1

if [[ $KOBOL_MANPATH != *"${PEARL_PKGVARDIR}/mans"* ]]
then
    export KOBOL_MANPATH="$PEARL_PKGVARDIR/mans:$KOBOL_MANPATH"
fi

if [[ $MANPATH != *"${PEARL_PKGDIR}/man"* ]]
then
    export MANPATH=$MANPATH:$PEARL_PKGDIR/man
fi

# vim: ft=sh
