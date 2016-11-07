#!/bin/bash
source "$(dirname $0)/../utils/utils.sh"

pearlSetUp
source $PEARL_ROOT/lib/utils/utils.sh

# Disable the exiterr
set +e

function oneTimeSetUp(){
    setUpUnitTests
}

function oneTimeTearDown(){
    pearlTearDown
}

function setUp(){
    source "$(dirname $0)/../../lib/core.sh"
    kobolSetUp
}

function tearDown(){
    kobolTearDown
}

function ronn_command(){
    echo "generated manual"
}

function test_make_man_null_md_file(){
    assertCommandFailOnStatus 11 make_man
}

function test_make_man_md_file_not_existing(){
    OLD_RONN=$RONN
    RONN=ronn_command
    assertCommandFailOnStatus 2 make_man no-file
    RONN=$OLD_RONN
}

function test_make_man_with_md_file(){
    OLD_RONN=$RONN
    RONN=ronn_command
    touch $KOBOL_VARDIR/markdown/test.md
    assertCommandSuccess make_man $KOBOL_VARDIR/markdown/test.md
    assertEquals "generated manual" "$(cat $KOBOL_VARDIR/mans/man1/test.1)"
    RONN=$OLD_RONN
}

function test_make_man_with_md_file2(){
    OLD_RONN=$RONN
    RONN=ronn_command
    touch $KOBOL_VARDIR/markdown/test.1.md
    assertCommandSuccess make_man $KOBOL_VARDIR/markdown/test.1.md
    assertEquals "generated manual" "$(cat $KOBOL_VARDIR/mans/man1/test.1)"
    RONN=$OLD_RONN
}

function test_make_man_with_markdown_file(){
    OLD_RONN=$RONN
    RONN=ronn_command
    touch $KOBOL_VARDIR/markdown/test.markdown
    assertCommandSuccess make_man $KOBOL_VARDIR/markdown/test.markdown
    assertEquals "generated manual" "$(cat $KOBOL_VARDIR/mans/man1/test.1)"
    RONN=$OLD_RONN
}

function test_make_man_with_markdown_file2(){
    OLD_RONN=$RONN
    RONN=ronn_command
    touch $KOBOL_VARDIR/markdown/test.1.markdown
    assertCommandSuccess make_man $KOBOL_VARDIR/markdown/test.1.markdown
    assertEquals "generated manual" "$(cat $KOBOL_VARDIR/mans/man1/test.1)"
    RONN=$OLD_RONN
}

function test_make_user_mans_for_null_md_file(){
    assertCommandFailOnStatus 11 make_user_mans_for
}

function test_make_user_mans_for_no_files(){
    make_man(){
        echo "making $@"
    }

    assertCommandSuccess make_user_mans_for $KOBOL_VARDIR/markdown/*.markdown

    assertEquals "" "$(cat $STDOUTF)"
}

function test_make_user_mans_for(){
    make_man(){
        echo "making $@"
    }
    touch $KOBOL_VARDIR/markdown/test1.markdown
    touch $KOBOL_VARDIR/markdown/test2.markdown
    assertCommandSuccess make_user_mans_for $KOBOL_VARDIR/markdown/*.markdown

    assertEquals "$(echo -e "making $KOBOL_VARDIR/markdown/test1.markdown\nmaking $KOBOL_VARDIR/markdown/test2.markdown")" "$(cat $STDOUTF)"
}

function test_make_user_mans_for_one_file_not_existing(){
    make_man(){
        echo "making $@"
    }
    touch $KOBOL_VARDIR/markdown/test.markdown

    assertCommandSuccess make_user_mans_for $KOBOL_VARDIR/markdown/test.markdown $KOBOL_VARDIR/markdown/test2.markdown

    assertEquals "making $KOBOL_VARDIR/markdown/test.markdown" "$(cat $STDOUTF)"
}

function test_make_user_mans(){
    make_user_mans_for(){
        echo "making for $@"
    }
    touch ${KOBOL_VARDIR}/mans/man1/test.1
    assertCommandSuccess make_user_mans
    assertEquals "$(echo -e "making for $KOBOL_VARDIR/markdown/*.md\nmaking for $KOBOL_VARDIR/markdown/*.markdown")" "$(cat $STDOUTF)"
    assertEquals "" "$(ls -A ${KOBOL_VARDIR}/mans/man1)"
}

source $(dirname $0)/../utils/shunit2
