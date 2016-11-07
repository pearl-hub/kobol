
export KOBOL_VARDIR="$PEARL_PKGVARDIR"

mkdir -p ${KOBOL_VARDIR}/markdown
mkdir -p ${KOBOL_VARDIR}/mans/man1

if [[ $MANPATH != *"${PEARL_PKGDIR}/man"* ]]
then
    export MANPATH=$MANPATH:$PEARL_PKGDIR/man
fi

# vim: ft=sh
