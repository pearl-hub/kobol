if not contains $PEARL_PKGDIR/bin $PATH
    set PATH $PATH $PEARL_PKGDIR/bin
end

if not contains $PEARL_PKGDIR/man $MANPATH
    set MANPATH $MANPATH $PEARL_PKGDIR/man
end

# vim: ft=sh
