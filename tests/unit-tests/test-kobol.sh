#!/usr/bin/env bash
source "$(dirname $0)/../utils/utils.sh"

KOBOL_LOCATION="$(dirname $0)/../.."

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
    assertCommandFailOnStatus 1 $KOBOL_LOCATION/bin/kobol
}

function test_kobol_no_kobol_vardir_directory(){
    export KOBOL_VARDIR="not-a-directory"
    assertCommandFailOnStatus 2 $KOBOL_LOCATION/bin/kobol
}

function test_kobol_no_kobol_manpath_defined(){
    unset KOBOL_MANPATH
    assertCommandFailOnStatus 1 $KOBOL_LOCATION/bin/kobol
}

function test_cmd_kobol(){
    assertCommandSuccess $KOBOL_LOCATION/bin/kobol -w
}

source $(dirname $0)/../utils/shunit2
