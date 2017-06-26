unset KOBOL_VARDIR

function kobolSetUp(){
    export KOBOL_VARDIR=$(TMPDIR=/tmp mktemp -d -t kobol-vardir.XXXXXXX)
    export KOBOL_ROOT=$(dirname $0)/../../
    export KOBOL_MANPATH="$KOBOL_VARDIR/mans"

    mkdir -p $KOBOL_VARDIR/markdown
    mkdir -p $KOBOL_VARDIR/mans/man1
}

function kobolTearDown(){
    rm -rf $KOBOL_VARDIR
    unset KOBOL_VARDIR KOBOL_ROOT
}
