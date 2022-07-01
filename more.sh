#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=logging.sh
source "$SCRIPT_DIR/logging.sh"

# logging
function a_func {
    log_info "Logging from a function"
}

log_info "Starting"
log_debug "Debug info"
log_warning "Just a warning"
log_error "Sth bad happend"
a_func
echo

# networking
# cryptography
# zenity
# auto completion
