#!/bin/bash

PEARL_MAN_ROOT="${PEARL_ROOT}/mods/pearl/man"

if [ ! -d $PEARL_MAN_ROOT ]; then
    echo "Error: The directory $PEARL_MAN_ROOT does not exist."
    return 1
fi
[ -z $PEARL_HOME ] && PEARL_HOME=~/.config/pearl

mkdir -p ${PEARL_HOME}/markdown
mkdir -p ${PEARL_HOME}/mans/man/man1

function pearl_load_man(){
    local PEARL_MAN_MARKDOWN="${PEARL_HOME}/markdown"
    [ "$(ls -A $PEARL_MAN_MARKDOWN )" ] || return 0

    # Empty the content of the man folder
    rm -rf "${PEARL_HOME}/mans/man/man1/*"

    for md_file in $(ls ${PEARL_MAN_MARKDOWN}/*.{markdown,md} 2> /dev/null)
    do
        man_name=$(echo ${md_file} | sed -e 's/^.*\///g' \
            -e 's/\.1.markdown//' -e 's/\.markdown//' \
            -e 's/\.1.md//' -e 's/\.md//')
        man_file="${man_name}.1.gz"

        ${PEARL_MAN_ROOT}/mods/ronn/bin/ronn --roff --pipe --manual="${man_name}" \
            --organization="${USER}" "${md_file}" | \
            gzip -f -c > "${PEARL_HOME}/mans/man/man1/${man_file}"

        echo "Wrote ${man_file}"
    done
}

