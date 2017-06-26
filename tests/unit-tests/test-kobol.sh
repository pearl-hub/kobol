#!/usr/bin/env bash
PKG_LOCATION="$(dirname $0)/../.."
source "$PKG_LOCATION/tests/bunit/utils/utils.sh"
source "$PKG_LOCATION/tests/test-utils/utils.sh"
source "$PKG_LOCATION/tests/utils/utils.sh"

# Disable the exiterr
set +e

function oneTimeSetUp(){
    setUpUnitTests
}

function oneTimeTearDown(){
    :
}

function setUp(){
    pearlSetUp
    kobolSetUp
}

function tearDown(){
    kobolTearDown
    pearlTearDown
}

function test_kobol_no_kobol_vardir_defined(){
    unset KOBOL_VARDIR
    assertCommandFailOnStatus 1 $PKG_LOCATION/bin/kobol
}

function test_kobol_no_kobol_vardir_directory(){
    export KOBOL_VARDIR="not-a-directory"
    assertCommandFailOnStatus 2 $PKG_LOCATION/bin/kobol
}

function test_kobol_no_kobol_manpath_defined(){
    unset KOBOL_MANPATH
    assertCommandFailOnStatus 1 $PKG_LOCATION/bin/kobol
}

function test_cmd_kobol(){
    assertCommandSuccess $PKG_LOCATION/bin/kobol -w
}

source $PKG_LOCATION/tests/bunit/utils/shunit2
