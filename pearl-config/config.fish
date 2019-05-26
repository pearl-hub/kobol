
set -x KOBOL_VARDIR $PEARL_PKGVARDIR

mkdir -p $KOBOL_VARDIR/markdown
mkdir -p $KOBOL_VARDIR/mans/man1


switch "$KOBOL_MANPATH"
case "*$PEARL_PKGVARDIR/mans*"
    # The path already exists. No action required
    echo > /dev/null
case '*'
    set -x KOBOL_MANPATH "$PEARL_PKGVARDIR/mans:$KOBOL_MANPATH"
end

if not contains $PEARL_PKGDIR/man $MANPATH
    set -x MANPATH $MANPATH $PEARL_PKGDIR/man
end

# vim: ft=sh
