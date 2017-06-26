# This module contains all functionalities needed for
# handling the kobol core.
#
# Dependencies:
# - [buava] $PKG_ROOT/buava/lib/utils.sh
#
# vim: ft=sh

RONN=ronn

#######################################
# Make a manual from the given markdown file.
#
# Globals:
#   RONN (RO)          :  The ronn command for generating the man.
#   USER (RO)          :  The current user.
#   KOBOL_VARDIR (RO)  :  The directory containing the kobol
#                         manuals and markdown directories.
# Arguments:
#   md_file ($1)       : The markdown file.
# Returns:
#   0
#   $NULL_EXCEPTION    : Null md_file.
# Output:
#   Logging messages.
#######################################
function make_man(){
    local md_file=$1
    check_not_null $md_file

    [[ ! -e $md_file ]] && die_on_status 2 "The file $md_file does not exist."

    local md_name="$(echo ${md_file} | sed -e 's/^.*\///g')"
    local man_name="$(echo ${md_name} | sed \
        -e 's/\.1\.markdown//' -e 's/\.markdown//' \
        -e 's/\.1\.md//' -e 's/\.md//').1"

    $RONN --roff --pipe --manual="${man_name}" \
        --organization="${USER}" "${md_file}" > "${KOBOL_VARDIR}/mans/man1/${man_name}"
    echo "Generated ${man_name} from ${md_name}"

    return 0
}

#######################################
# Make manuals from the given markdown files.
#
# Globals:
#   None
# Arguments:
#   md_files ($@)       : The markdown files.
# Returns:
#   0
#   $NULL_EXCEPTION     : Null md_files.
# Output:
#   None
#######################################
function make_user_mans_for() {
    local md_files=$@
    check_not_null $md_files

    for md_file in $md_files
    do
        if [[ -e $md_file ]]
        then
            make_man $md_file
        fi
    done

    return 0
}

#######################################
# Make manuals from the user markdown files.
#
# Globals:
#   KOBOL_VARDIR (RO)  :  The directory containing the kobol
#                         manuals and markdown directories.
# Arguments:
#   None
# Returns:
#   0
# Output:
#   None
#######################################
function make_user_mans() {
    # Empty the content of the man folder
    [ "$(ls -A ${KOBOL_VARDIR}/mans/man1)" ] && rm -rf "${KOBOL_VARDIR}"/mans/man1/*

    make_user_mans_for ${KOBOL_VARDIR}/markdown/*.md
    make_user_mans_for ${KOBOL_VARDIR}/markdown/*.markdown

    return 0
}
