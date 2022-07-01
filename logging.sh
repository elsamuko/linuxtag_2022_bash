#!/usr/bin/env bash

function _log {
    local LOG_LEVEL="$1"
    local NOW
    NOW="$(date +'%F %T')"
    shift # remove first argument
    local PREFIX
    PREFIX=$(printf "[${LOG_LEVEL:0:1}] $NOW %20s L%3s %20s : " "${BASH_SOURCE[2]##*/}" "${BASH_LINENO[1]}" "${FUNCNAME[2]}")
    local COLOR_GREEN="\033[1;32m"
    local COLOR_YELLOW="\033[1;33m"
    local COLOR_RED="\033[1;31m"
    local COLOR_GRAY="\033[38;5;245m"
    local COLOR_NEUTRAL="\033[0m"


    case "$LOG_LEVEL" in
        D*)
            echo -e "$COLOR_GRAY$PREFIX$*$COLOR_NEUTRAL"
            ;;
        I*)
            echo -e "$COLOR_GREEN$PREFIX$*$COLOR_NEUTRAL"
            ;;
        W*)
            echo -e "$COLOR_YELLOW$PREFIX$*$COLOR_NEUTRAL"
            ;;
        E*)
            echo -e "$COLOR_RED$PREFIX$*$COLOR_NEUTRAL"
            ;;
        *)
            echo -e "$COLOR_GREEN$PREFIX$*$COLOR_NEUTRAL"
            ;;
    esac
}

function log_debug {
    _log "DEBUG" "$@"
}

function log_info {
    _log "INFO" "$@"
}

function log_warning {
    _log "WARNING" "$@"
}

function log_error {
    _log "ERROR" "$@"
}
