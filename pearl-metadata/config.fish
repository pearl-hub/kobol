
set -x KOBOL_VARDIR $PEARL_PKGVARDIR

mkdir -p $KOBOL_VARDIR/markdown
mkdir -p $KOBOL_VARDIR/mans/man1

if not contains $PEARL_PKGDIR/man $MANPATH
    set -x MANPATH $MANPATH $PEARL_PKGDIR/man
end

# vim: ft=sh
