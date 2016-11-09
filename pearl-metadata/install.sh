
function post_install(){
    [ -e "${PEARL_PKGDIR}/bin/kobol" ] && pre_remove
    ln -s "${PEARL_PKGDIR}/bin/kobol" ${PEARL_HOME}/bin

    info "ronn command is required for kobol:"
    info "> gem install ronn"
}

function post_update(){
    post_install
}

function pre_remove(){
    rm -f ${PEARL_HOME}/bin/kobol
}
