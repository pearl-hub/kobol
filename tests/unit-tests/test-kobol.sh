#!/bin/bash
source "$(dirname $0)/../utils/utils.sh"

pearlSetUp
kobolSetUp
KOBOL_LOCATION="$(dirname $0)/../.."

# Disable the exiterr
set +e

function oneTimeSetUp(){
    setUpUnitTests
}

function oneTimeTearDown(){
    kobolTearDown
    pearlTearDown
}

function setUp(){
    :
}

function tearDown(){
    :
}

function test_kobol_no_pearl_root_defined(){
    OLD_PEARL_ROOT=$PEARL_ROOT
    unset PEARL_ROOT
    assertCommandFailOnStatus 1 $KOBOL_LOCATION/bin/kobol
    PEARL_ROOT=$OLD_PEARL_ROOT
}

function test_kobol_no_pearl_root_directory(){
    OLD_PEARL_ROOT=$PEARL_ROOT
    export PEARL_ROOT="not-a-directory"
    assertCommandFailOnStatus 2 $KOBOL_LOCATION/bin/kobol
    PEARL_ROOT=$OLD_PEARL_ROOT
}

function test_kobol_no_kobol_vardir_defined(){
    OLD_KOBOL_VARDIR=$KOBOL_VARDIR
    unset KOBOL_VARDIR
    assertCommandFailOnStatus 1 $KOBOL_LOCATION/bin/kobol
    KOBOL_VARDIR=$OLD_KOBOL_VARDIR
}

function test_kobol_no_kobol_vardir_directory(){
    OLD_KOBOL_VARDIR=$KOBOL_VARDIR
    export KOBOL_VARDIR="not-a-directory"
    assertCommandFailOnStatus 2 $KOBOL_LOCATION/bin/kobol
    KOBOL_VARDIR=$OLD_KOBOL_VARDIR
}

function test_cmd_kobol(){
    assertCommandSuccess $KOBOL_LOCATION/bin/kobol --help
}

source $(dirname $0)/../utils/shunit2
