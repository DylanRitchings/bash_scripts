bind 'TAB:menu-complete'
bind Space:magic-space




emacs_location=C:/Users/dylan.ritchings/scoop/apps/emacs/current/bin/emacsclientw.exe

function e {
    $emacs_location -c -n -a C:/Users/dylan.ritchings/scoop/apps/emacs/current/bin/runemacs.exe $1
}

function ec {
    $emacs_location -n $1
}

function ef {
    $emacs_location -n $(fzf)
}


function sw {
    export AWS_PROFILE=$1
}

export MSYS=enable_pcon
