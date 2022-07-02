#!/usr/bin/env bash
# add auto completion for more.sh and basics.sh

function complete_basic {
    local CUR_COMP="${COMP_WORDS[COMP_CWORD]}"

    # add default args
    COMPREPLY=($(compgen -W "--help --version --verbose" -- "$CUR_COMP"))

    # add another if starts with alnum
    if grep '^[a-zA-Z0-9]' <<< "$CUR_COMP" > /dev/null; then
        COMPREPLY+=("Hase")
    fi

    # add files + folders
    local IFS=$'\n'
    COMPREPLY+=($(compgen -o default -- "$CUR_COMP"))
}

complete -W "first second third --help" "./more.sh"
complete -F complete_basic "./basics.sh"
